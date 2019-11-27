--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE heartleafweb;
ALTER ROLE heartleafweb WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md58b2508ebc5f65908ad4a65f37b661165';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
ALTER ROLE heartleafweb SET client_encoding TO 'utf8';
ALTER ROLE heartleafweb SET default_transaction_isolation TO 'read committed';
ALTER ROLE heartleafweb SET "TimeZone" TO 'UTC';






--
-- Database creation
--

CREATE DATABASE heartleaf WITH TEMPLATE = template0 OWNER = postgres;
GRANT ALL ON DATABASE heartleaf TO heartleafweb;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect heartleaf

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE account (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(355) NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_login timestamp without time zone
);


ALTER TABLE account OWNER TO heartleafweb;

--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_user_id_seq OWNER TO heartleafweb;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE account_user_id_seq OWNED BY account.user_id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO heartleafweb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO heartleafweb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO heartleafweb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO heartleafweb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO heartleafweb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO heartleafweb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO heartleafweb;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO heartleafweb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO heartleafweb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO heartleafweb;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO heartleafweb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO heartleafweb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: credit_account; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE credit_account (
    credit_account_id integer NOT NULL,
    user_id integer NOT NULL,
    credit_account_name character varying(32) NOT NULL
);


ALTER TABLE credit_account OWNER TO heartleafweb;

--
-- Name: credit_account_credit_account_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE credit_account_credit_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE credit_account_credit_account_id_seq OWNER TO heartleafweb;

--
-- Name: credit_account_credit_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE credit_account_credit_account_id_seq OWNED BY credit_account.credit_account_id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO heartleafweb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO heartleafweb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO heartleafweb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO heartleafweb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO heartleafweb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO heartleafweb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO heartleafweb;

--
-- Name: mb_category; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE mb_category (
    mb_category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE mb_category OWNER TO heartleafweb;

--
-- Name: mb_category_mb_category_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE mb_category_mb_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mb_category_mb_category_id_seq OWNER TO heartleafweb;

--
-- Name: mb_category_mb_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE mb_category_mb_category_id_seq OWNED BY mb_category.mb_category_id;


--
-- Name: mb_receipt; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE mb_receipt (
    mb_receipt_id integer NOT NULL,
    user_id integer NOT NULL,
    mb_store_id integer NOT NULL,
    purchase_total numeric NOT NULL,
    subpurchase_total numeric NOT NULL,
    tax_total numeric NOT NULL,
    total_items integer NOT NULL,
    trace_no integer NOT NULL,
    credit_account_id integer,
    receipt_created_on timestamp without time zone DEFAULT CURRENT_DATE NOT NULL,
    purchase_date timestamp without time zone
);


ALTER TABLE mb_receipt OWNER TO heartleafweb;

--
-- Name: mb_receipt_item; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE mb_receipt_item (
    mb_receipt_item_id integer NOT NULL,
    mb_category_id integer,
    mb_receipt_id integer NOT NULL,
    label character varying(50),
    description character varying(50),
    price numeric NOT NULL,
    taxable boolean NOT NULL,
    deposit numeric,
    expiration date,
    usda_food_id integer
);


ALTER TABLE mb_receipt_item OWNER TO heartleafweb;

--
-- Name: mb_receipt_item_mb_receipt_item_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE mb_receipt_item_mb_receipt_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mb_receipt_item_mb_receipt_item_id_seq OWNER TO heartleafweb;

--
-- Name: mb_receipt_item_mb_receipt_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE mb_receipt_item_mb_receipt_item_id_seq OWNED BY mb_receipt_item.mb_receipt_item_id;


--
-- Name: mb_receipt_mb_receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE mb_receipt_mb_receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mb_receipt_mb_receipt_id_seq OWNER TO heartleafweb;

--
-- Name: mb_receipt_mb_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE mb_receipt_mb_receipt_id_seq OWNED BY mb_receipt.mb_receipt_id;


--
-- Name: mb_store; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE mb_store (
    mb_store_id integer NOT NULL,
    mb_store_number character varying(50) NOT NULL,
    mb_store_address character varying(50) NOT NULL,
    mb_store_city character varying(50) NOT NULL,
    mb_store_state character varying(50) NOT NULL,
    mb_store_zip integer NOT NULL,
    mb_store_phone character varying(50) NOT NULL
);


ALTER TABLE mb_store OWNER TO heartleafweb;

--
-- Name: mb_store_mb_store_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE mb_store_mb_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mb_store_mb_store_id_seq OWNER TO heartleafweb;

--
-- Name: mb_store_mb_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE mb_store_mb_store_id_seq OWNED BY mb_store.mb_store_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: heartleafweb
--

CREATE TABLE role (
    role_id integer NOT NULL,
    role_name character varying(255) NOT NULL
);


ALTER TABLE role OWNER TO heartleafweb;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: heartleafweb
--

CREATE SEQUENCE role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO heartleafweb;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heartleafweb
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- Name: account user_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY account ALTER COLUMN user_id SET DEFAULT nextval('account_user_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: credit_account credit_account_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY credit_account ALTER COLUMN credit_account_id SET DEFAULT nextval('credit_account_credit_account_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: mb_category mb_category_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_category ALTER COLUMN mb_category_id SET DEFAULT nextval('mb_category_mb_category_id_seq'::regclass);


--
-- Name: mb_receipt mb_receipt_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt ALTER COLUMN mb_receipt_id SET DEFAULT nextval('mb_receipt_mb_receipt_id_seq'::regclass);


--
-- Name: mb_receipt_item mb_receipt_item_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt_item ALTER COLUMN mb_receipt_item_id SET DEFAULT nextval('mb_receipt_item_mb_receipt_item_id_seq'::regclass);


--
-- Name: mb_store mb_store_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_store ALTER COLUMN mb_store_id SET DEFAULT nextval('mb_store_mb_store_id_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY account (user_id, username, password, email, created_on, last_login) FROM stdin;
1	dpkimball	lotsofwork123!	dpkimball@gmail.com	2017-11-11 19:13:28.10956	2017-11-11 19:13:28.10956
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add grocery brand	1	add_grocerybrand
2	Can change grocery brand	1	change_grocerybrand
3	Can delete grocery brand	1	delete_grocerybrand
4	Can add grocery upc	2	add_groceryupc
5	Can change grocery upc	2	change_groceryupc
6	Can delete grocery upc	2	delete_groceryupc
7	Can add mb category	3	add_mbcategory
8	Can change mb category	3	change_mbcategory
9	Can delete mb category	3	delete_mbcategory
10	Can add mb receipt	4	add_mbreceipt
11	Can change mb receipt	4	change_mbreceipt
12	Can delete mb receipt	4	delete_mbreceipt
13	Can add mb receipt item	5	add_mbreceiptitem
14	Can change mb receipt item	5	change_mbreceiptitem
15	Can delete mb receipt item	5	delete_mbreceiptitem
16	Can add mb store	6	add_mbstore
17	Can change mb store	6	change_mbstore
18	Can delete mb store	6	delete_mbstore
19	Can add usda food	7	add_usdafood
20	Can change usda food	7	change_usdafood
21	Can delete usda food	7	delete_usdafood
22	Can add usda food measure	8	add_usdafoodmeasure
23	Can change usda food measure	8	change_usdafoodmeasure
24	Can delete usda food measure	8	delete_usdafoodmeasure
25	Can add usda food nutrient	9	add_usdafoodnutrient
26	Can change usda food nutrient	9	change_usdafoodnutrient
27	Can delete usda food nutrient	9	delete_usdafoodnutrient
28	Can add log entry	10	add_logentry
29	Can change log entry	10	change_logentry
30	Can delete log entry	10	delete_logentry
31	Can add permission	11	add_permission
32	Can change permission	11	change_permission
33	Can delete permission	11	delete_permission
34	Can add group	12	add_group
35	Can change group	12	change_group
36	Can delete group	12	delete_group
37	Can add user	13	add_user
38	Can change user	13	change_user
39	Can delete user	13	delete_user
40	Can add content type	14	add_contenttype
41	Can change content type	14	change_contenttype
42	Can delete content type	14	delete_contenttype
43	Can add session	15	add_session
44	Can change session	15	change_session
45	Can delete session	15	delete_session
46	Can add food ingredient	16	add_foodingredient
47	Can change food ingredient	16	change_foodingredient
48	Can delete food ingredient	16	delete_foodingredient
49	Can add usda food ingredient	17	add_usdafoodingredient
50	Can change usda food ingredient	17	change_usdafoodingredient
51	Can delete usda food ingredient	17	delete_usdafoodingredient
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$ZH0CbOWHuiIP$gsSW5oPlvjdq2XV7IFY4eChozE/48y2UK4ZCB0vKWg8=	2017-12-31 12:51:48.87255+00	t	dpkimball	Darin	Kimball	dpkimball@gmail.com	t	t	2017-11-11 18:34:50+00
2	pbkdf2_sha256$36000$zjrz2v8x8TPq$f7XYasCCIEP8Rb/4AdT28/KHSWKSq9s01MlrpKs+7Bo=	2017-12-09 18:46:17+00	f	tester	Don	Juan	dpkimball@gmail.com	f	t	2017-12-09 11:24:19+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: credit_account; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY credit_account (credit_account_id, user_id, credit_account_name) FROM stdin;
1	1	XXXXXXXXXXXX2502
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
6	2017-12-31 12:52:10.483481+00	4	dpkimball02	3		13	1
7	2017-12-31 12:52:46.9959+00	2	dpkimball0	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	13	1
8	2017-12-31 12:53:26.052161+00	2	dpkimball0	2	[{"changed": {"fields": ["password"]}}]	13	1
9	2017-12-31 12:56:21.323258+00	2	tester	2	[{"changed": {"fields": ["username", "is_staff", "is_superuser"]}}]	13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	heartleaf	grocerybrand
2	heartleaf	groceryupc
3	heartleaf	mbcategory
4	heartleaf	mbreceipt
5	heartleaf	mbreceiptitem
6	heartleaf	mbstore
7	heartleaf	usdafood
8	heartleaf	usdafoodmeasure
9	heartleaf	usdafoodnutrient
10	admin	logentry
11	auth	permission
12	auth	group
13	auth	user
14	contenttypes	contenttype
15	sessions	session
16	heartleaf	foodingredient
17	heartleaf	usdafoodingredient
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-11 18:26:55.683129+00
2	auth	0001_initial	2017-11-11 18:26:56.983289+00
3	admin	0001_initial	2017-11-11 18:26:57.230983+00
4	admin	0002_logentry_remove_auto_add	2017-11-11 18:26:57.613236+00
5	contenttypes	0002_remove_content_type_name	2017-11-11 18:26:57.716373+00
6	auth	0002_alter_permission_name_max_length	2017-11-11 18:26:57.750473+00
7	auth	0003_alter_user_email_max_length	2017-11-11 18:26:57.771566+00
8	auth	0004_alter_user_username_opts	2017-11-11 18:26:57.791769+00
9	auth	0005_alter_user_last_login_null	2017-11-11 18:26:57.816556+00
10	auth	0006_require_contenttypes_0002	2017-11-11 18:26:57.827438+00
11	auth	0007_alter_validators_add_error_messages	2017-11-11 18:26:57.846012+00
12	auth	0008_alter_user_username_max_length	2017-11-11 18:26:57.939766+00
14	sessions	0001_initial	2017-11-11 18:26:58.24135+00
16	heartleaf	0001_initial	2017-11-19 13:23:01.649929+00
17	heartleaf	0002_foodingredient_usdafoodingredient	2017-11-19 13:23:02.267363+00
18	heartleaf	0003_auto_20171119_1339	2017-11-20 12:35:54.180748+00
19	heartleaf	0004_auto_20171120_1243	2017-11-20 12:43:15.916039+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
iscbqv3qdyq02r28ekknzw76wdrmru3z	OTdlMDcwZWZkZjYwY2IxYWZiODkxYzRlNzM1NWJiMGE2ZGQ0YjE3MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MjlhM2ZkMmQwZjI5ZDA3MzRiZjA1Yzk2NWVlNzU3ZjRjOGEzNTNhIn0=	2017-11-25 18:35:17.770551+00
40p6b3kjrmtu1flu5okc64z2vk2yzyeu	MDllMTQ3MjIzYTk3N2EyNjE5Y2Y2OTM5ZDk4M2M5NGNiZDAzZmQ0ODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMWNjNzIxMzJiNmY4ZmY2ZGNkOGRmYmVjMjljMzEzZGIxOGQ3YzcyIn0=	2017-12-23 12:33:02.077581+00
rjq33lou5dywb94jo50mq9gnyddch7a6	MDIwYTI4NzcyMDcxMzMwYTE4Njk3NzlkZmFjYjhjNjc0YWM4YjhjMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MDMwZTY5NTQ5NDA3MTYyZDY2ZTljZjJiMWVmYzhhZjI0Y2FhNTM2In0=	2018-01-14 12:53:26.085822+00
\.


--
-- Data for Name: mb_category; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY mb_category (mb_category_id, category_name) FROM stdin;
1	Meat
2	Deli
3	Produce
4	Dairy
5	Bakery
6	Grocery
\.


--
-- Data for Name: mb_receipt; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY mb_receipt (mb_receipt_id, user_id, mb_store_id, purchase_total, subpurchase_total, tax_total, total_items, trace_no, credit_account_id, receipt_created_on, purchase_date) FROM stdin;
\.


--
-- Data for Name: mb_receipt_item; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY mb_receipt_item (mb_receipt_item_id, mb_category_id, mb_receipt_id, label, description, price, taxable, deposit, expiration, usda_food_id) FROM stdin;
117	5	5	4PCK EVERYTHING BAGEL		2.49	f	\N	\N	\N
118	6	5	SNY MINIS PNDR	1 @ 2/ 6.00	3.00	f	\N	\N	\N
119	6	5	G/BND UL DAILY LOTN		5.99	f	\N	\N	\N
120	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
121	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
122	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
123	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
124	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
125	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
126	6	5	SWIFFER WET CITR REF		4.39	t	\N	\N	\N
127	6	5	ENDNGR ALMND CRANBRY	1 @ 2/ 4.00	2.00	f	\N	\N	20433
128	6	5	ENDNGR DRK CHOCOLATE	1 @ 2/ 4.00	2.00	f	\N	\N	20437
129	6	5	OSPRAY CRAN POMEG		3.99	f	\N	\N	\N
130	6	5	PASTENE MARN ARTICHK		3.49	f	\N	\N	\N
131	6	5	BUMBEE SOLID WHITE	1 @ 2/ 3.00	1.50	f	\N	\N	9956
132	6	5	BUMBEE SOLID WHITE	1 @ 2/ 3.00	1.50	f	\N	\N	9956
133	6	5	BUMBEE SOLID WHITE	1 @ 2/ 3.00	1.50	f	\N	\N	9956
134	6	5	BUMBEE SOLID WHITE	1 @ 2/ 3.00	1.50	f	\N	\N	9956
135	6	5	BUMBEE SOLID WHITE	1 @ 2/ 3.00	1.50	f	\N	\N	9956
50	1	5	MB AB CHICKENTENDER		4.75	f	\N	\N	\N
51	1	5	MB AB CHICKENTENDER		4.50	f	\N	\N	\N
52	1	5	AL FRESCO IT CHICKEN		2.99	f	\N	\N	\N
53	2	5	ITALIAN HERB HAM		10.19	f	\N	\N	\N
54	2	5	SPICY/SALMON/TUNA		6.49	t	\N	\N	\N
55	2	5	HADDOCK SCROD FILLET		6.29	f	\N	\N	\N
56	2	5	HOFFMAN SHARP		5.09	f	\N	\N	\N
57	3	5	32OZ DRIED CRANBERRY		5.99	f	\N	\N	\N
58	3	5	BACKYARD GRHS TOMATO	1.67 LB @ 1 LB / 2.49	4.16	f	\N	\N	\N
59	3	5	BRUSSEL SPROUTS	1.12 LB @ 1 LB / 1.99	2.23	f	\N	\N	\N
60	3	5	LG CAL PEACH PANTA	2.47 LB @ 1 LB / 1.69	4.17	f	\N	\N	\N
61	3	5	GREEN BEANS	1.14 LB @ 1 LB / 1.99	1.93	f	\N	\N	\N
62	3	5	LETTUCE ROMAINE		1.49	f	\N	\N	\N
63	3	5	1LB DANDY RADISHES		1.29	f	\N	\N	\N
64	3	5	TOTE MCINTOSH APPLES	3.60 LB @ 1 LB / .99	3.56	f	\N	\N	\N
65	3	5	TOTE GALA APPLES	5.33 LB @ 1 LB / .99	5.28	f	\N	\N	\N
66	3	5	LOOSE YELLOW ONIONS	1.35 LB @ 1 LB / .99	1.34	f	\N	\N	\N
67	3	5	CUT BEETS	0.97 LB @ 1 LB / .99	0.96	f	\N	\N	\N
68	4	5	FLA NO PULP OJ 60	1 @ 2/ 5.00	2.50	f	\N	\N	\N
69	4	5	FARMER MEDIUM ORG 15	1 @ 3/ 5.00	1.67	f	\N	\N	\N
70	4	5	KATES BUTTER QTRS		3.99	f	\N	\N	\N
71	4	5	MB 2% RD FAT ORGANIC		3.69	f	\N	\N	\N
72	4	5	JOE TABOULE SALAD		2.99	f	\N	\N	\N
73	4	5	JOE GRAPE LEAVES		2.99	f	\N	\N	\N
74	4	5	SARG MEX RDF SHRD		2.69	f	\N	\N	\N
75	4	5	SARG 6 ITALIAN SHRD		2.69	f	\N	\N	\N
76	4	5	NEWMAN GORILLA GRAPE		1.89	f	\N	\N	\N
77	5	5	TUSCAN PANE		3.29	f	\N	\N	\N
78	5	5	TUSCAN PANE		3.29	f	\N	\N	\N
79	5	5	4PCK EVERYTHING BAGEL		2.49	f	\N	\N	\N
80	6	5	SNY MINIS PNDR	1 @ 2/ 6.00	3.00	f	\N	\N	\N
81	6	5	G/BND UL DAILY LOTN		5.99	f	\N	\N	\N
82	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
83	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
84	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
85	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
86	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
87	6	5	POLAR SLT CRL 2L PMA	1 @ 5/ 5.00	1.00	f	0.05	\N	\N
88	6	5	SWIFFER WET CITR REF		4.39	t	\N	\N	\N
91	6	5	OSPRAY CRAN POMEG		3.99	f	\N	\N	\N
92	6	5	PASTENE MARN ARTICHK		3.49	f	\N	\N	\N
\.


--
-- Data for Name: mb_store; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY mb_store (mb_store_id, mb_store_number, mb_store_address, mb_store_city, mb_store_state, mb_store_zip, mb_store_phone) FROM stdin;
1	77	301 Constitution Ave	Littleton	MA	1460	1-978-486-0828
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: heartleafweb
--

COPY role (role_id, role_name) FROM stdin;
1	Admin
2	Customer
\.


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('account_user_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('auth_user_id_seq', 6, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: credit_account_credit_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('credit_account_credit_account_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 9, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('django_migrations_id_seq', 19, true);


--
-- Name: mb_category_mb_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('mb_category_mb_category_id_seq', 18, true);


--
-- Name: mb_receipt_item_mb_receipt_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('mb_receipt_item_mb_receipt_item_id_seq', 135, true);


--
-- Name: mb_receipt_mb_receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('mb_receipt_mb_receipt_id_seq', 1, false);


--
-- Name: mb_store_mb_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('mb_store_mb_store_id_seq', 2, true);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heartleafweb
--

SELECT pg_catalog.setval('role_role_id_seq', 2, true);


--
-- Name: account account_email_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_email_key UNIQUE (email);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id);


--
-- Name: account account_username_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: credit_account credit_account_credit_account_name_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY credit_account
    ADD CONSTRAINT credit_account_credit_account_name_key UNIQUE (credit_account_name);


--
-- Name: credit_account credit_account_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY credit_account
    ADD CONSTRAINT credit_account_pkey PRIMARY KEY (credit_account_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mb_category mb_category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_category
    ADD CONSTRAINT mb_category_category_name_key UNIQUE (category_name);


--
-- Name: mb_category mb_category_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_category
    ADD CONSTRAINT mb_category_pkey PRIMARY KEY (mb_category_id);


--
-- Name: mb_receipt_item mb_receipt_item_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt_item
    ADD CONSTRAINT mb_receipt_item_pkey PRIMARY KEY (mb_receipt_item_id);


--
-- Name: mb_receipt mb_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt
    ADD CONSTRAINT mb_receipt_pkey PRIMARY KEY (mb_receipt_id);


--
-- Name: mb_store mb_store_mb_store_number_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_store
    ADD CONSTRAINT mb_store_mb_store_number_key UNIQUE (mb_store_number);


--
-- Name: mb_store mb_store_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_store
    ADD CONSTRAINT mb_store_pkey PRIMARY KEY (mb_store_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: role role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_role_name_key UNIQUE (role_name);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: heartleafweb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mb_receipt account_mb_receipt_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt
    ADD CONSTRAINT account_mb_receipt_user_id_fkey FOREIGN KEY (user_id) REFERENCES account(user_id);


--
-- Name: credit_account account_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY credit_account
    ADD CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES account(user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mb_receipt_item mb_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt_item
    ADD CONSTRAINT mb_category_id_fkey FOREIGN KEY (mb_category_id) REFERENCES mb_category(mb_category_id);


--
-- Name: mb_receipt mb_receipt_credit_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt
    ADD CONSTRAINT mb_receipt_credit_account_id_fkey FOREIGN KEY (credit_account_id) REFERENCES credit_account(credit_account_id);


--
-- Name: mb_receipt mb_receipt_mb_receipt_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heartleafweb
--

ALTER TABLE ONLY mb_receipt
    ADD CONSTRAINT mb_receipt_mb_receipt_store_id_fkey FOREIGN KEY (mb_store_id) REFERENCES mb_store(mb_store_id);


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

