Oxbow - HeartLeaf Web Application
=====

To run in dev mode:
```
cd into project directory
bin/run_dev.sh
```

##Working on oxbow
Oxbow targets [Python 3.6.2](https://www.python.org/downloads/release/python-362/)


### Getting Started
#### Setting up a dev environment on Ubuntu 18.04
1. Clone this repo
2. Install system dependencies, `sudo apt-get install build-essential`
3. cd into root repo directory and run `bin/install_dev.sh`

#### Setting up a dev environment on OSX
1. Install [Homebrew](http://brew.sh/)
2. Install a proper python 3.6.1 `brew install python3` (at this time, this will install 3.6.1 + pip.  Do not use OSX's included python dist)
3. Clone this repo
4. cd into root repo directory and run `bin/install_dev.sh`


### Running Oxbow
#### From the command line (dev mode)
* from the project root: `bin/run_dev.sh`


#### From PyCharm
##### Add System Environment Variables for all processes
      <envs>
        <env name="PYTHONUNBUFFERED" value="1" />
        <env name="TWIN_PEAKS_PORT" value="8090" />
        <env name="HEARTLEAF_POSTGRES_USER" value="heartleaf" />
        <env name="TWIN_PEAKS_VERSION" value="v1" />
        <env name="HEARTLEAF_POSTGRES_PASSWORD" value="xxxxxxx" />
        <env name="TWIN_PEAKS_HOST" value="localhost" />
        <env name="HEARTLEAF_POSTGRES_NAME" value="heartleaf" />
        <env name="HEARTLEAF_POSTGRES_PORT" value="9001" />
        <env name="HEARTLEAF_POSTGRES_HOST" value="localhost" />
      </envs>
##### Run Django Web Site
* Create a runtime configuration pointed at `manage.py` in the root project directory
* Ensure the selected interpreter is the project's 3.6.1 virtualenv
* Script parameters: `runserver 0.0.0.0:8002` (or create your own settings file and specify it here)

##### Seed 1 - USDA Barcodes into TwinPeaks System (This is spider USDA API database feed data to the TwinPeaks API)
* Create a runtime configuration pointed at `manage.py` in the root project directory
* Ensure the selected interpreter is the project's 3.6.1 virtualenv
* Script parameters: `seed_usda_twinpeaks 0` (or create your own settings file and specify it here)

##### Seed 2 - USDA Substance into TwinPeaks System (This is scrape USDA website and feed data to the TwinPeaks API)
* Create a runtime configuration pointed at `manage.py` in the root project directory
* Ensure the selected interpreter is the project's 3.6.1 virtualenv
* Script parameters: `scrape_fda_html` (or create your own settings file and specify it here)

##### Create User to log into web site
* Create a runtime configuration pointed at `manage.py` in the root project directory
* Ensure the selected interpreter is the project's 3.6.1 virtualenv
* Script parameters: `create_user <username> <email> <password> <first name> <last name>` (or create your own settings file and specify it here)

![Pycharm](https://github.com/david12daniel/miles/heartleaf/blob/master/pycharm.png)

### Docker Set Up Dependencies
To run all container:
```
cd into project directory
docker-compose up
```
```
darin@Miles:~/miles/oxbow$ docker ps
CONTAINER ID        IMAGE                                                 COMMAND                  CREATED             STATUS                          PORTS                              NAMES
f83b8af0cc5a        oxbow_heartleaf_web                                   "python3 manage.py r…"   7 days ago          Up 31 minutes                   0.0.0.0:8000->8000/tcp             heartleaf--web
31a3fa6257f5        com.miles/twinpeaks:0.0.2-SNAPSHOT                    "/usr/bin/java -jar …"   7 days ago          Up 31 minutes                   8080/tcp, 0.0.0.0:8090->8090/tcp   twinpeaks--web
96b8b1277328        docker.elastic.co/elasticsearch/elasticsearch:5.5.3   "/bin/bash bin/es-do…"   3 weeks ago         Up 4 hours                                                         oxbow_watatic_search_test_1
a9deaee0087b        heartleaf:postgres                                    "/usr/lib/postgresql…"   5 weeks ago         Up 31 minutes                   0.0.0.0:9001->5432/tcp             heartleaf--postgres
ee0d5944c249        docker.elastic.co/elasticsearch/elasticsearch:5.5.3   "/bin/bash bin/es-do…"   5 weeks ago         Restarting (1) 48 seconds ago                                      oxbow_watatic_search_1
e846a00954d3        docker.elastic.co/kibana/kibana:5.5.3                 "/bin/sh -c /usr/loc…"   5 weeks ago         Up 4 hours                                                         oxbow_watatic_kibana_1
1c0eba30760d        twinpeaks:postgres

darin@Miles:~/miles/oxbow$ docker images
REPOSITORY                                      TAG                 IMAGE ID            CREATED             SIZE
com.miles/twinpeaks                             0.0.2-SNAPSHOT      9d1b59b2971e        2 weeks ago         174MB
openjdk                                         8-jre-alpine        7e72a7dcf7dc        5 weeks ago         83.1MB
heartleaf                                       postgres            514d91316468        5 weeks ago         393MB
oxbow_heartleaf_web                             latest              1a982951cfc9        6 weeks ago         851MB
twinpeaks                                       postgres            8edddc435b53        12 months ago       400MB
ubuntu                                          latest              00fd29ccc6f1        14 months ago       111MB
python                                          3                   79e1dc9af1c1        15 months ago       691MB
docker.elastic.co/kibana/kibana                 5.5.3               f37f1630a918        17 months ago       630MB
docker.elastic.co/elasticsearch/elasticsearch   5.5.3               60503d5b81fb        17 months ago       510MB

```
![Docker Containers](https://github.com/david12daniel/miles/heartleaf/blob/master/docker-compose.png)

![Heartleaf Receipt Items](https://github.com/david12daniel/miles/heartleaf/blob/master/receipt_items.png)