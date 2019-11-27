import json
import sys
from django.conf import settings
import urllib

from heartleaf.service.exceptions.TwinPeaksException import TwinPeaksService404
from heartleaf.service.twinpeaks import TwinPeaks, TwinPeakActions


class USDAManager:

    def __init__(self, logger):
        self.logger = logger
        # load the twin peaks api
        self.rest_api = TwinPeaks(settings)

    def _send_request(self, url):
        try:
            with urllib.request.urlopen(url) as response:
                html = response.read()
                data = json.loads(html)
                return data
        except urllib.error.HTTPError as e:
            self.logger.error(e.code)
            self.logger.error(e.read())
            raise e

    @staticmethod
    def _create_food_dict():
        item = dict()
        item["barcodetype"] = None
        item["barcodevalue"] = None
        item["db_offset"] = None
        item["ndbno"] = None
        item["name"] = None

        return item

    def seed_index_usda_db(self, current_offset=0):

        run = True
        while run:
            fetch_food = 'http://api.nal.usda.gov/ndb/list?format=json&lt=f&sort=n&' \
                         'api_key=EvozxfrgZOgiZ0fu9d0z99B5v2XRzb4yltkMscfr&offset={}&max=500'.format(current_offset)
            self.logger.debug("Fetched {}".format(fetch_food))
            try:
                self.logger.debug("Requesting food with offset {}".format(current_offset))
                json_response = self._send_request(fetch_food)
            except Exception as e:
                self.logger.error("Unable to parse data from USDA {}".format(str(e)))
                sys.exit("Unable to parse data from USDA")

            if len(json_response['list']['item']):

                for j in json_response['list']['item']:
                    current_offset = j['offset']
                    try:
                        info = j['name'].split(', UPC: ')
                        if len(info) == 2:
                            name = info[0].strip()
                            barcode_value = info[1].strip()
                            barcode_type = 1
                        else:
                            info = j['name'].split(', GTIN: ')
                            if len(info) == 2:
                                name = info[0].strip()
                                barcode_value = info[1].strip()
                                barcode_type = 2
                            else:
                                barcode_value = ''
                                barcode_type = 0
                                name = j['name']

                        if not barcode_value.isdigit():
                            barcode_value = ''
                            barcode_type = 4
                            name = j['name']

                        food = USDAManager._create_food_dict()
                        food["barcodetype"] = barcode_type
                        food["barcodevalue"] = barcode_value
                        food["db_offset"] = current_offset
                        food["ndbno"] = j['id']
                        food["name"] = name

                        try:
                            self.rest_api.post_data(
                                TwinPeakActions.POST_USDA_FOOD,
                                post_data=food)
                        except TwinPeaksService404:
                            sys.exit(1)
                        except Exception as e:
                            self.logger.error(
                                "Unable to post foods from TwinPeaks API {}".format(
                                    str(e)))
                            sys.exit()

                    except Exception as e:
                        self.logger.error("Unable to insert food- {}".format(str(e)))
                        sys.exit()

                # see if there are more records
                if json_response['list']['total'] != 500:
                    run = False
            else:
                self.logger.info("USDA API returned no food")

            current_offset += 1
        return run

    def populate_search_db(self, current_offset=0):
        run = True
        while run:
            # get food from database
            foods = self._get_food_by_offset(current_offset, count=10000)
            for f in foods:
                try:
                    food_html = self.rest_api.get_data(
                        TwinPeakActions.GET_USDA_FOOD_INFO_BY_UPC,
                        barcodevalue=f.barcodevalue)
                    self.logger.debug("Fetched {}-{}".format(f, food_html))
                except Exception as e:
                    raise Exception("Unable to retrieve foods from Twinpeaks API {}".format(str(e)))
