--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO fareed;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO fareed;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO fareed;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    course_title character varying,
    course_code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.courses OWNER TO fareed;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO fareed;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.enrollments (
    id bigint NOT NULL,
    section_id bigint NOT NULL,
    student_id bigint NOT NULL,
    semester_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    grade_id bigint DEFAULT 1
);


ALTER TABLE public.enrollments OWNER TO fareed;

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_id_seq OWNER TO fareed;

--
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.enrollments_id_seq OWNED BY public.enrollments.id;


--
-- Name: expertises; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.expertises (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    teacher_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.expertises OWNER TO fareed;

--
-- Name: expertises_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.expertises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expertises_id_seq OWNER TO fareed;

--
-- Name: expertises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.expertises_id_seq OWNED BY public.expertises.id;


--
-- Name: grades; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.grades (
    id bigint NOT NULL,
    grade_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.grades OWNER TO fareed;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO fareed;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO fareed;

--
-- Name: sections; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.sections (
    id bigint NOT NULL,
    section_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    semester_id bigint,
    teacher_id bigint,
    course_id bigint
);


ALTER TABLE public.sections OWNER TO fareed;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO fareed;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: semesters; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.semesters (
    id bigint NOT NULL,
    semester_type character varying,
    semester_no integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.semesters OWNER TO fareed;

--
-- Name: semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.semesters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semesters_id_seq OWNER TO fareed;

--
-- Name: semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.semesters_id_seq OWNED BY public.semesters.id;


--
-- Name: student_semesters; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.student_semesters (
    id bigint NOT NULL,
    student_id bigint,
    semester_id bigint,
    enroll_year character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.student_semesters OWNER TO fareed;

--
-- Name: student_semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.student_semesters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_semesters_id_seq OWNER TO fareed;

--
-- Name: student_semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.student_semesters_id_seq OWNED BY public.student_semesters.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    semester integer,
    first_name character varying,
    last_name character varying,
    "Date_of_Birth" date,
    roll_no integer
);


ALTER TABLE public.students OWNER TO fareed;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO fareed;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: fareed
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    "Date_of_Birth" date
);


ALTER TABLE public.teachers OWNER TO fareed;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: fareed
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO fareed;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fareed
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: enrollments id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN id SET DEFAULT nextval('public.enrollments_id_seq'::regclass);


--
-- Name: expertises id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.expertises ALTER COLUMN id SET DEFAULT nextval('public.expertises_id_seq'::regclass);


--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: semesters id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.semesters ALTER COLUMN id SET DEFAULT nextval('public.semesters_id_seq'::regclass);


--
-- Name: student_semesters id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.student_semesters ALTER COLUMN id SET DEFAULT nextval('public.student_semesters_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	admin@lms.com	$2a$12$RQj6KKNPCIai/cFrDaWvZOGHDWckTNGc/L58Y1LWjnfo17Yue56aG	\N	\N	\N	2023-01-04 08:07:43.298578	2023-01-04 08:07:43.298578
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-01-04 08:06:59.166855	2023-01-04 08:06:59.166855
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.courses (id, course_title, course_code, created_at, updated_at) FROM stdin;
1	Linear Algebra	CS-1202	2023-01-09 13:17:51.296716	2023-01-09 13:17:51.296716
3	PF	CS-1233	2023-01-10 07:30:21.718417	2023-01-10 07:30:21.718417
4	OOP	CS-5400	2023-01-10 07:33:18.404265	2023-01-10 07:33:18.404265
9	Web Engineering	CS-6700	2023-01-13 06:03:17.524518	2023-01-13 06:03:17.524518
7	Theory of Atomata	CS-5604	2023-01-10 08:47:54.747923	2023-01-13 06:03:32.450662
6	Artificial Intelligence	CS-2344	2023-01-10 08:47:28.388863	2023-01-13 06:03:40.854251
5	Operating System	CS-2333	2023-01-10 08:46:57.512525	2023-01-13 06:03:48.306539
10	Social Studies	CS-2211	2023-01-16 06:23:06.177839	2023-01-16 06:23:06.177839
11	Islamic Studies	CS-2233	2023-01-16 06:23:30.614156	2023-01-16 06:23:30.614156
12	ITC	CS-2244	2023-01-16 06:23:49.450258	2023-01-16 06:23:49.450258
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.enrollments (id, section_id, student_id, semester_id, created_at, updated_at, grade_id) FROM stdin;
37	2	85	16	2023-01-16 07:05:09.172183	2023-01-16 07:14:54.764256	2
38	11	90	1	2023-01-16 07:16:03.436102	2023-01-16 07:22:12.570458	2
39	12	90	1	2023-01-16 07:27:38.181317	2023-01-16 07:27:38.181317	1
40	13	90	1	2023-01-16 07:27:48.90096	2023-01-16 07:27:48.90096	1
42	5	91	11	2023-01-16 09:37:23.424633	2023-01-16 09:37:23.424633	1
43	7	91	11	2023-01-16 09:37:40.929774	2023-01-16 09:37:40.929774	1
41	3	91	11	2023-01-16 09:36:54.849049	2023-01-16 10:15:07.259469	3
\.


--
-- Data for Name: expertises; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.expertises (id, course_id, teacher_id, created_at, updated_at) FROM stdin;
1	4	29	2023-01-12 13:47:11.228041	2023-01-12 13:47:11.228041
2	5	29	2023-01-12 13:47:11.232405	2023-01-12 13:47:11.232405
3	6	29	2023-01-12 13:47:11.234948	2023-01-12 13:47:11.234948
4	4	30	2023-01-13 06:19:33.972153	2023-01-13 06:19:33.972153
5	4	31	2023-01-16 08:43:29.00274	2023-01-16 08:43:29.00274
6	6	31	2023-01-16 08:43:29.007224	2023-01-16 08:43:29.007224
7	5	31	2023-01-16 08:43:29.009731	2023-01-16 08:43:29.009731
8	12	31	2023-01-16 08:43:29.012056	2023-01-16 08:43:29.012056
9	1	32	2023-01-16 08:48:36.009876	2023-01-16 08:48:36.009876
10	3	32	2023-01-16 08:48:36.011426	2023-01-16 08:48:36.011426
11	4	32	2023-01-16 08:48:36.012759	2023-01-16 08:48:36.012759
12	1	33	2023-01-16 08:57:17.685246	2023-01-16 08:57:17.685246
13	3	33	2023-01-16 08:57:17.689998	2023-01-16 08:57:17.689998
14	4	33	2023-01-16 08:57:17.693365	2023-01-16 08:57:17.693365
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.grades (id, grade_type, created_at, updated_at) FROM stdin;
1	pending	2023-01-12 08:17:14.520292	2023-01-12 08:17:14.520292
2	A+	2023-01-12 08:23:49.818967	2023-01-12 08:23:49.818967
3	A	2023-01-12 08:23:54.467448	2023-01-12 08:23:54.467448
4	B+	2023-01-12 08:24:00.823273	2023-01-12 08:24:00.823273
5	B	2023-01-12 08:24:04.539823	2023-01-12 08:24:04.539823
6	B-	2023-01-12 08:24:08.78289	2023-01-12 08:24:08.78289
7	C+	2023-01-12 08:24:18.629286	2023-01-12 08:24:18.629286
8	C	2023-01-12 08:24:23.180431	2023-01-12 08:24:23.180431
9	F	2023-01-12 08:24:30.277832	2023-01-12 08:24:30.277832
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.schema_migrations (version) FROM stdin;
20230104075005
20230104075014
20230104075021
20230104081653
20230109063716
20230104082139
20230109065713
20230109071747
20230109063929
20230109124527
20230109125744
20230109130654
20230106131450
20230112081330
20230112081510
20230112133849
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.sections (id, section_name, created_at, updated_at, semester_id, teacher_id, course_id) FROM stdin;
2	B	2023-01-10 08:43:10.89	2023-01-10 08:43:10.89	3	15	4
3	B	2023-01-10 08:56:09.926293	2023-01-10 08:56:09.926293	4	15	5
5	B	2023-01-10 08:56:37.135557	2023-01-10 08:56:37.135557	6	17	7
6	B	2023-01-10 08:56:47.915934	2023-01-10 08:56:47.915934	7	18	7
7	A	2023-01-12 10:26:10.536554	2023-01-12 10:26:10.536554	1	21	6
9	D	2023-01-12 13:02:07.362942	2023-01-12 13:02:07.362942	1	22	5
10	E1	2023-01-13 06:04:22.901346	2023-01-13 06:04:22.901346	8	24	9
11	A	2023-01-16 06:24:26.930633	2023-01-16 06:24:26.930633	1	17	10
12	A	2023-01-16 06:24:40.224157	2023-01-16 06:24:40.224157	1	18	11
13	A	2023-01-16 06:24:50.854446	2023-01-16 06:24:50.854446	1	19	12
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.semesters (id, semester_type, semester_no, created_at, updated_at) FROM stdin;
1	Fall	1	2023-01-09 07:31:00.210875	2023-01-09 07:31:00.210875
2	Fall	2	2023-01-09 07:31:00.216134	2023-01-09 07:31:00.216134
3	Fall	3	2023-01-09 07:31:00.219798	2023-01-09 07:31:00.219798
4	Fall	4	2023-01-09 07:31:00.222907	2023-01-09 07:31:00.222907
5	Fall	5	2023-01-09 07:31:00.226133	2023-01-09 07:31:00.226133
6	Fall	6	2023-01-09 07:31:00.229269	2023-01-09 07:31:00.229269
7	Fall	7	2023-01-09 07:31:00.232191	2023-01-09 07:31:00.232191
8	Fall	8	2023-01-09 07:31:00.235179	2023-01-09 07:31:00.235179
9	Spring	1	2023-01-09 07:31:00.238005	2023-01-09 07:31:00.238005
10	Spring	2	2023-01-09 07:31:00.240957	2023-01-09 07:31:00.240957
11	Spring	3	2023-01-09 07:31:00.243898	2023-01-09 07:31:00.243898
12	Spring	4	2023-01-09 07:31:00.246683	2023-01-09 07:31:00.246683
13	Spring	5	2023-01-09 07:31:00.249534	2023-01-09 07:31:00.249534
14	Spring	6	2023-01-09 07:31:00.25255	2023-01-09 07:31:00.25255
15	Spring	7	2023-01-09 07:31:00.255444	2023-01-09 07:31:00.255444
16	Spring	8	2023-01-09 07:31:00.258331	2023-01-09 07:31:00.258331
\.


--
-- Data for Name: student_semesters; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.student_semesters (id, student_id, semester_id, enroll_year, created_at, updated_at) FROM stdin;
1	84	12	2014	2023-01-09 07:56:23.657997	2023-01-09 07:56:23.657997
2	85	16	2009	2023-01-09 08:02:04.695851	2023-01-09 08:02:04.695851
3	86	7	1990	2023-01-09 08:46:56.671542	2023-01-09 08:46:56.671542
4	87	7	1993	2023-01-09 12:11:30.226081	2023-01-09 12:11:30.226081
5	88	15	1982	2023-01-10 07:01:30.747492	2023-01-10 07:01:30.747492
6	89	4	1977	2023-01-10 08:06:32.359226	2023-01-10 08:06:32.359226
7	90	1	{"{}"=>"2018"}	2023-01-16 06:21:31.794057	2023-01-16 06:21:31.794057
8	91	11	{"{}"=>"2004"}	2023-01-16 08:46:43.642123	2023-01-16 08:46:43.642123
9	92	14	{"{}"=>"1974"}	2023-01-16 15:08:52.185828	2023-01-16 15:08:52.185828
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.students (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, semester, first_name, last_name, "Date_of_Birth", roll_no) FROM stdin;
85	zutebatax@mailinator.com	$2a$12$o7lCFxWCYNzyDCNXCDfatORPtgYSkWJ5mhbCPvkEos5bK9fpTBNY.	\N	\N	\N	2023-01-09 08:02:04.668007	2023-01-09 08:02:04.668007	\N	Grant	Roberson	1996-10-27	54
86	za@lms.com	$2a$12$O1miQymSq31ahw16VKcIaOSDqbSuWBq.WT3dTcNaxLaIE/BcQXwUW	\N	\N	\N	2023-01-09 08:46:56.654736	2023-01-09 08:46:56.654736	\N	Laurel	Snyder	2001-02-13	12
87	mevih@mailinator.com	$2a$12$Lpx1U99ckYJ8.yoZLLt1oeGhbBbA5fnJdU3M707y/OLKDhRCFhRru	\N	\N	\N	2023-01-09 12:11:30.180289	2023-01-09 12:11:30.180289	\N	Christine	Espinoza	2001-05-20	54
88	gary@mailinator.com	$2a$12$jFG1ZmmJc2SnDjJnjV11.ONQbfjVvsXJf1IxGtRRVvss.5DlHF/T.	\N	\N	\N	2023-01-10 07:01:30.734159	2023-01-10 07:01:30.734159	\N	Shelly	Mathis	2021-12-12	78
89	vasym@mailinator.com	$2a$12$DwKUWhupuyUeWEtamHRM0uS4wH/8qwoQ.69OVfbchO25hYeuClqRK	\N	\N	\N	2023-01-10 08:06:32.336192	2023-01-10 08:06:32.336192	\N	Jasper	Ewing	2002-08-08	2
90	ali@lms.com	$2a$12$hesiKHleoPVyXBMoXFSquOWJVwcQb9KJRMZNQyd7FdCLc4IPvs8iK	\N	\N	\N	2023-01-16 06:21:31.736276	2023-01-16 06:21:31.736276	\N	Ali	Ahmad	1999-06-16	28
91	abd@lms.com	$2a$12$N7HO.EoGM89AtWvskDsqVu5bpUmWh1EfJ8n1AUUoWVHxJlIS0Ds2G	\N	\N	\N	2023-01-16 08:46:43.622753	2023-01-16 08:46:43.622753	\N	Abdullah	Jutt	2015-01-06	21
92	vycidawyk@mailinator.com	$2a$12$LpFqA0lfTOgrPIAVVeyBoOD57YVc2YQYo0pCMnJNakK3trk4rGGYW	\N	\N	\N	2023-01-16 15:08:52.168763	2023-01-16 15:08:52.168763	\N	Risa	Chang	2011-05-24	84
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: fareed
--

COPY public.teachers (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, first_name, last_name, "Date_of_Birth") FROM stdin;
15	bukaze@mailinator.com	$2a$12$trzfu8hDH0ZXfkLB8D7RNutVyGlGebpbW6OTNT4fnSoTkKISGfoEy	\N	\N	\N	2023-01-10 08:05:44.336851	2023-01-10 08:05:44.336851	Linus	Robinson	2017-01-02
17	fuhe@mailinator.com	$2a$12$4x9LH092xAZfzmppnWBz0OcT5lIgY5L7XUJmv5O6ABJ4FzFmqPxKe	\N	\N	\N	2023-01-10 08:54:50.397202	2023-01-10 08:54:50.397202	Trevor	Pittman	2006-05-18
18	rykariho@mailinator.com	$2a$12$0OUmIgXvxpuZ02wZjAsuFu9r3..5kQGSnwfDymE.Foo4.OW1JW1rC	\N	\N	\N	2023-01-10 08:54:59.6893	2023-01-10 08:54:59.6893	Zachary	Velazquez	2004-02-28
19	gybirivu@mailinator.com	$2a$12$92naxqpRmtx1W/Gt0AAjUeUqp09FgDNsovUAXliVQAVQNnZihjH8S	\N	\N	\N	2023-01-10 08:59:27.394849	2023-01-10 08:59:27.394849	Deanna	Stafford	2007-05-10
21	kejif@mailinator.com	$2a$12$oyFb0vHs6D03jkvgz5yP2u.hfCbiuU4/vwPZFT9h.Cc.EjQ1z.jyS	\N	\N	\N	2023-01-12 08:45:18.45449	2023-01-12 08:45:18.45449	Jonas	Baxter	1997-07-17
22	fudiqomode@mailinator.com	$2a$12$LSIZHYvAngtZJyLK7FzUSuLFTTZSBs85SlQ7r1QfSxLgskpB8G3d.	\N	\N	\N	2023-01-12 10:37:04.675604	2023-01-12 10:37:04.675604	Josiah	Mcfadden	1998-10-17
23	mamujus@mailinator.com	$2a$12$WL1B/6lk7uv5ugBC5zGJOOII0ju1.2Rnbdx0ph9lpgqJKHXnl43c.	\N	\N	\N	2023-01-12 11:05:44.153227	2023-01-12 11:05:44.153227	Kiayada	Gross	2010-11-26
24	redi@mailinator.com	$2a$12$AysLyKCrQCikbhojmclEmOLUbciS31SXuYBWrHjWLoUf5f8HCgrHS	\N	\N	\N	2023-01-12 11:10:15.581654	2023-01-12 11:10:15.581654	Doris	Hess	1993-11-20
27	losetuwa@mailinator.com	$2a$12$ETSML7LUJuX6LjF/XTem5uyG14buTLoA090PBVaSwFRqYBEbWvniK	\N	\N	\N	2023-01-12 12:58:40.775795	2023-01-12 12:58:40.775795	Garrett	Dickson	2020-10-20
28	dyjyjufyl@mailinator.com	$2a$12$3WWdM8xPZ6gIHPPl.jiPyOmu0eLwYrQRuWhBCxpoulY5J6uCl55q.	\N	\N	\N	2023-01-12 12:58:47.261889	2023-01-12 12:58:47.261889	Hamilton	Villarreal	1990-09-26
29	hirorucut@mailinator.com	$2a$12$HWKYRylqhdneqo9CXbt40O/JPiV1VK6NnlsMzPfLMJWWauGuXFaJ.	\N	\N	\N	2023-01-12 13:47:11.224508	2023-01-12 13:47:11.224508	Camille	Ellison	2006-04-20
30	hizotuqyv@mailinator.com	$2a$12$j9V7MWTaHrcx43/jjMYYmu5Jlfqtw8e3YPVTosRHWDyJKDJ5sZG4q	\N	\N	\N	2023-01-13 06:19:33.968383	2023-01-13 06:19:33.968383	August	Hensley	2008-09-22
31	bosig@mailinator.com	$2a$12$iOwQGt3sSKcpKROv84FhceWsL3dwCHy7eU6LDvGssx7yXEuqvzlPq	\N	\N	\N	2023-01-16 08:43:29.000019	2023-01-16 08:43:29.000019	Matthew	Hammond	2007-10-22
32	teach11@lms.com	$2a$12$MW58JH.EIczUWFasKW65uexn/mXsRajmDcZP5fXSdiPePSj75tcta	\N	\N	\N	2023-01-16 08:48:36.008327	2023-01-16 08:48:36.008327	Teacher	one	2023-01-16
33	teach22@lms.com	$2a$12$O1vWTdb3XaCBD3MlAwtmYOuKe4oAYz.DC5Zvri130vLHCJU1vQ8sG	\N	\N	\N	2023-01-16 08:57:17.681692	2023-01-16 08:57:17.681692	Teacher	Two	2023-01-16
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.courses_id_seq', 12, true);


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.enrollments_id_seq', 43, true);


--
-- Name: expertises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.expertises_id_seq', 14, true);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.grades_id_seq', 9, true);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.sections_id_seq', 13, true);


--
-- Name: semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.semesters_id_seq', 16, true);


--
-- Name: student_semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.student_semesters_id_seq', 9, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.students_id_seq', 92, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fareed
--

SELECT pg_catalog.setval('public.teachers_id_seq', 33, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- Name: expertises expertises_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.expertises
    ADD CONSTRAINT expertises_pkey PRIMARY KEY (id);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: semesters semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);


--
-- Name: student_semesters student_semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.student_semesters
    ADD CONSTRAINT student_semesters_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: fareed
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: fareed
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_enrollments_on_grade_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_enrollments_on_grade_id ON public.enrollments USING btree (grade_id);


--
-- Name: index_enrollments_on_section_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_enrollments_on_section_id ON public.enrollments USING btree (section_id);


--
-- Name: index_enrollments_on_semester_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_enrollments_on_semester_id ON public.enrollments USING btree (semester_id);


--
-- Name: index_enrollments_on_student_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_enrollments_on_student_id ON public.enrollments USING btree (student_id);


--
-- Name: index_expertises_on_course_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_expertises_on_course_id ON public.expertises USING btree (course_id);


--
-- Name: index_expertises_on_teacher_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_expertises_on_teacher_id ON public.expertises USING btree (teacher_id);


--
-- Name: index_sections_on_course_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_sections_on_course_id ON public.sections USING btree (course_id);


--
-- Name: index_sections_on_semester_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_sections_on_semester_id ON public.sections USING btree (semester_id);


--
-- Name: index_sections_on_teacher_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_sections_on_teacher_id ON public.sections USING btree (teacher_id);


--
-- Name: index_student_semesters_on_semester_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_student_semesters_on_semester_id ON public.student_semesters USING btree (semester_id);


--
-- Name: index_student_semesters_on_student_id; Type: INDEX; Schema: public; Owner: fareed
--

CREATE INDEX index_student_semesters_on_student_id ON public.student_semesters USING btree (student_id);


--
-- Name: index_students_on_email; Type: INDEX; Schema: public; Owner: fareed
--

CREATE UNIQUE INDEX index_students_on_email ON public.students USING btree (email);


--
-- Name: index_students_on_reset_password_token; Type: INDEX; Schema: public; Owner: fareed
--

CREATE UNIQUE INDEX index_students_on_reset_password_token ON public.students USING btree (reset_password_token);


--
-- Name: index_teachers_on_email; Type: INDEX; Schema: public; Owner: fareed
--

CREATE UNIQUE INDEX index_teachers_on_email ON public.teachers USING btree (email);


--
-- Name: index_teachers_on_reset_password_token; Type: INDEX; Schema: public; Owner: fareed
--

CREATE UNIQUE INDEX index_teachers_on_reset_password_token ON public.teachers USING btree (reset_password_token);


--
-- Name: enrollments fk_rails_58e9545e48; Type: FK CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_rails_58e9545e48 FOREIGN KEY (semester_id) REFERENCES public.semesters(id);


--
-- Name: enrollments fk_rails_6e4789b133; Type: FK CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_rails_6e4789b133 FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- Name: expertises fk_rails_a511120e12; Type: FK CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.expertises
    ADD CONSTRAINT fk_rails_a511120e12 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: expertises fk_rails_d4ad82ade2; Type: FK CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.expertises
    ADD CONSTRAINT fk_rails_d4ad82ade2 FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: enrollments fk_rails_f01c555e06; Type: FK CONSTRAINT; Schema: public; Owner: fareed
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_rails_f01c555e06 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

