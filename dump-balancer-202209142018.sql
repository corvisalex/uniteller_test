--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

-- Started on 2022-09-14 20:18:02 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 208 (class 1259 OID 49528)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 49526)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 207
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 203 (class 1259 OID 49498)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 49496)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 202
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 211 (class 1259 OID 49555)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    amount numeric,
    currency character varying,
    user_id bigint,
    type character varying,
    status character varying,
    referenece_order_id character varying,
    terminal character varying,
    country_iso character varying,
    merchant_id integer,
    shop_id character varying,
    description character varying,
    params jsonb,
    pan6 integer,
    pan4 integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49561)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 49519)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 49542)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 49540)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 209
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 213 (class 1259 OID 49563)
-- Name: user_balance_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_balance_history (
    id bigint NOT NULL,
    amount numeric NOT NULL,
    trans_date timestamp without time zone NOT NULL,
    trans_type character varying NOT NULL,
    user_id bigint NOT NULL,
    params jsonb,
    currency character varying
);


ALTER TABLE public.user_balance_history OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49569)
-- Name: user_balance_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_balance_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_balance_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 49632)
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    id integer NOT NULL,
    user_id integer,
    verified boolean DEFAULT false,
    business_name character varying(255),
    legal_address character varying(255),
    actual_address character varying(255),
    first_name character varying(255),
    middle_name character varying(255),
    last_name character varying(255),
    ip character varying(255),
    user_agent character varying(255),
    time_zone character varying(255),
    register_email character varying(255)
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 49630)
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_id_seq OWNER TO postgres;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;


--
-- TOC entry 205 (class 1259 OID 49506)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 49504)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2883 (class 2604 OID 49531)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 49501)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 49545)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 49635)
-- Name: user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 49509)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3059 (class 0 OID 49528)
-- Dependencies: 208
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3054 (class 0 OID 49498)
-- Dependencies: 203
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);


--
-- TOC entry 3062 (class 0 OID 49555)
-- Dependencies: 211
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (1, '2022-09-09 00:00:00', '2022-09-09 00:00:00', 340, 'EUR', 1, 'init', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (2, '2022-09-09 00:02:51', '2022-09-09 00:02:52', 340, 'EUR', 1, 'pay', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (3, '2022-09-09 00:00:00', '2022-09-09 00:00:00', 210, 'EUR', 1, 'init', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (4, '2022-09-09 00:02:51', '2022-09-09 00:02:52', 210, 'EUR', 1, 'pay', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (5, '2022-09-09 00:00:00', '2022-09-09 00:00:00', 146, 'EUR', 1, 'init', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (6, '2022-09-09 00:02:51', '2022-09-09 00:02:52', 146, 'EUR', 1, 'pay', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (7, '2022-09-09 00:00:00', '2022-09-09 00:00:00', 20, 'EUR', 1, 'init', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (8, '2022-09-09 00:02:51', '2022-09-09 00:02:52', 20, 'EUR', 1, 'pay', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (9, '2022-09-09 00:00:00', '2022-09-09 00:00:00', 500, 'EUR', 1, 'init', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (10, '2022-09-09 00:02:51', '2022-09-09 00:02:52', 500, 'EUR', 1, 'pay', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (11, '2022-09-09 00:00:00', '2022-09-09 00:00:00', 80, 'EUR', 1, 'init', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (12, '2022-09-09 00:02:51', '2022-09-09 00:02:52', 80, 'EUR', 1, 'pay', 'success', '34637', '4674366', 'FRA', 2351, '324', 'From France with Love', NULL, NULL, NULL);


--
-- TOC entry 3057 (class 0 OID 49519)
-- Dependencies: 206
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3061 (class 0 OID 49542)
-- Dependencies: 210
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3064 (class 0 OID 49563)
-- Dependencies: 213
-- Data for Name: user_balance_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_balance_history OVERRIDING SYSTEM VALUE VALUES (1, 340, '2022-09-09 00:00:00', 'PAYIN', 1, NULL, 'EUR');
INSERT INTO public.user_balance_history OVERRIDING SYSTEM VALUE VALUES (2, 12, '2022-09-09 00:00:00', 'PAYOUT', 1, NULL, 'EUR');


--
-- TOC entry 3067 (class 0 OID 49632)
-- Dependencies: 216
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3056 (class 0 OID 49506)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, NULL, 'night_devil_2006@mail.ru', 'corvus', NULL, '$2y$10$6RFajt8LyQnuipdc8YjzMeNaNLGWEMjfXSC0RXafqOaFzZngcW1xa', NULL, '2022-09-13 14:00:19', '2022-09-13 14:00:19');


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 207
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 202
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 212
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 209
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_balance_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_balance_history_id_seq', 2, true);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_details_id_seq', 1, false);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 2898 (class 2606 OID 49537)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 49539)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2889 (class 2606 OID 49503)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 49582)
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 49550)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 49553)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2917 (class 2606 OID 49584)
-- Name: user_balance_history user_balance_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_balance_history
    ADD CONSTRAINT user_balance_history_pk PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 49641)
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 49516)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2893 (class 2606 OID 49514)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 49518)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 2921 (class 1259 OID 49642)
-- Name: index_user_details_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_details_on_user_id ON public.user_details USING btree (user_id);


--
-- TOC entry 2906 (class 1259 OID 49588)
-- Name: orders_merchant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_merchant_id_idx ON public.orders USING btree (merchant_id);


--
-- TOC entry 2907 (class 1259 OID 49589)
-- Name: orders_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_id_idx ON public.orders USING btree (referenece_order_id);


--
-- TOC entry 2910 (class 1259 OID 49590)
-- Name: orders_shop_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_shop_id_idx ON public.orders USING btree (shop_id);


--
-- TOC entry 2911 (class 1259 OID 49591)
-- Name: orders_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_status_idx ON public.orders USING btree (status);


--
-- TOC entry 2912 (class 1259 OID 49592)
-- Name: orders_terminal_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_terminal_idx ON public.orders USING btree (terminal);


--
-- TOC entry 2913 (class 1259 OID 49593)
-- Name: orders_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_type_idx ON public.orders USING btree (type);


--
-- TOC entry 2914 (class 1259 OID 49594)
-- Name: orders_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_user_id_idx ON public.orders USING btree (user_id);


--
-- TOC entry 2896 (class 1259 OID 49525)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2905 (class 1259 OID 49551)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 2915 (class 1259 OID 49595)
-- Name: user_balance_history_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_balance_history_id_idx ON public.user_balance_history USING btree (id);


--
-- TOC entry 2918 (class 1259 OID 49596)
-- Name: user_balance_history_trans_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_balance_history_trans_date_idx ON public.user_balance_history USING btree (trans_date);


--
-- TOC entry 2919 (class 1259 OID 49598)
-- Name: user_balance_history_trans_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_balance_history_trans_type_idx ON public.user_balance_history USING btree (trans_type);


--
-- TOC entry 2920 (class 1259 OID 49599)
-- Name: user_balance_history_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_balance_history_user_id_idx ON public.user_balance_history USING btree (user_id);


--
-- TOC entry 2924 (class 2606 OID 49648)
-- Name: orders orders_ser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ser_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2925 (class 2606 OID 49625)
-- Name: user_balance_history user_balance_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_balance_history
    ADD CONSTRAINT user_balance_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2926 (class 2606 OID 49643)
-- Name: user_details user_details_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2022-09-14 20:18:03 MSK

--
-- PostgreSQL database dump complete
--

