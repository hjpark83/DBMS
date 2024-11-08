--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-10-10 13:28:11

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
-- TOC entry 15 (class 2615 OID 17850)
-- Name: sample1; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA s_2021088304;
SET search_path TO s_2021088304;


--
-- TOC entry 243 (class 1259 OID 17851)
-- Name: classify; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE classify (
    m_id integer NOT NULL,
    gr_id integer NOT NULL
);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN classify.m_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN classify.m_id IS '영화 식별자';


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN classify.gr_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN classify.gr_id IS '장르 식별자';


--
-- TOC entry 251 (class 1259 OID 17904)
-- Name: comment_to; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE comment_to (
    m_id integer NOT NULL,
    c_id integer NOT NULL,
    rating numeric,
    comment character varying NOT NULL,
    write_date timestamp without time zone
);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN comment_to.m_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN comment_to.m_id IS '영화 식별자';


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN comment_to.c_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN comment_to.c_id IS '사용자 식별자';


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN comment_to.rating; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN comment_to.rating IS '사용자 점수';


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN comment_to.comment; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN comment_to.comment IS '사용자 코멘트';


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN comment_to.write_date; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN comment_to.write_date IS '코멘트 작성날짜';


--
-- TOC entry 250 (class 1259 OID 17897)
-- Name: customer; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE customer (
    c_id integer NOT NULL,
    c_name character varying,
    email character varying,
    pwd character varying,
    gender character varying,
    phone character varying
);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN customer.c_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN customer.c_id IS '사용자 식별자';


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN customer.c_name; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN customer.c_name IS '사용자 이름';


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN customer.email; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN customer.email IS '사용자 이메일';


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN customer.pwd; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN customer.pwd IS '사용자 비밀번호';


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN customer.gender; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN customer.gender IS '사용자 성별';


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN customer.phone; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN customer.phone IS '사용자 전화번호';


--
-- TOC entry 244 (class 1259 OID 17856)
-- Name: genre; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE genre (
    gr_id integer DEFAULT nextval('genre'::regclass) NOT NULL,
    gr_name character varying
);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN genre.gr_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN genre.gr_id IS '장르 식별자';


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN genre.gr_name; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN genre.gr_name IS '장르명';


--
-- TOC entry 245 (class 1259 OID 17864)
-- Name: movie; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE movie (
    m_id integer NOT NULL,
    m_type character varying NOT NULL,
    m_name character varying NOT NULL,
    is_adult boolean,
    start_year date,
    end_year date,
    runtimes integer,
    m_rating numeric,
    votes integer
);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.m_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.m_id IS '영화 식별자';


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.m_type; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.m_type IS '영화 타입';


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.m_name; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.m_name IS '영화 이름';


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.is_adult; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.is_adult IS '영화 성인등급 여부';


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.start_year; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.start_year IS '영화 상영시작년도';


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.end_year; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.end_year IS '영화 상영종료년도';


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.runtimes; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.runtimes IS '영화 러닝타임';


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.m_rating; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.m_rating IS '영화 평점';


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN movie.votes; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN movie.votes IS '영화 평점 투표수';


--
-- TOC entry 246 (class 1259 OID 17871)
-- Name: occupation; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE occupation (
    ocu_id integer NOT NULL,
    ocu_name character varying NOT NULL
);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN occupation.ocu_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN occupation.ocu_id IS '직업 식별자';


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN occupation.ocu_name; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN occupation.ocu_name IS '직업 이름';


--
-- TOC entry 247 (class 1259 OID 17878)
-- Name: participant; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE participant (
    p_id integer NOT NULL,
    p_name character varying,
    major_work character varying
);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN participant.p_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participant.p_id IS '참여자 식별자';


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN participant.p_name; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participant.p_name IS '참여자 이름';


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN participant.major_work; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participant.major_work IS '대표작';


--
-- TOC entry 248 (class 1259 OID 17885)
-- Name: participate; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE participate (
    m_id integer NOT NULL,
    p_id integer NOT NULL,
    ordering integer NOT NULL,
    role character varying,
    casting character varying
);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN participate.m_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participate.m_id IS '영화 식별자';


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN participate.p_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participate.p_id IS '참여자 식별자';


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN participate.ordering; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participate.ordering IS '오더링';


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN participate.role; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participate.role IS '역할';


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN participate.casting; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN participate.casting IS '배역';


--
-- TOC entry 252 (class 1259 OID 17916)
-- Name: prefer; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE prefer (
    c_id integer NOT NULL,
    gr_id integer NOT NULL
);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN prefer.c_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN prefer.c_id IS '사용자 식별자';


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN prefer.gr_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN prefer.gr_id IS '장르 식별자';


--
-- TOC entry 249 (class 1259 OID 17892)
-- Name: profession; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE profession (
    p_id integer NOT NULL,
    ocu_id integer NOT NULL
);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN profession.p_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN profession.p_id IS '참여자 식별자';


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN profession.ocu_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN profession.ocu_id IS '직업 식별자';


--
-- TOC entry 265 (class 1259 OID 18175)
-- Name: watch; Type: TABLE; Schema: sample1; Owner: -
--

CREATE TABLE watch (
    m_id integer NOT NULL,
    c_id integer NOT NULL,
    watch_date timestamp without time zone,
    pause_time integer
);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN watch.m_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN watch.m_id IS '영화 식별자';


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN watch.c_id; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN watch.c_id IS '사용자 식별자';


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN watch.watch_date; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN watch.watch_date IS '시청날짜';


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN watch.pause_time; Type: COMMENT; Schema: sample1; Owner: -
--

COMMENT ON COLUMN watch.pause_time IS '시청종료시점';


--
-- TOC entry 4937 (class 0 OID 17851)
-- Dependencies: 243
-- Data for Name: classify; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO classify (m_id, gr_id) VALUES (1244386, 12);
INSERT INTO classify (m_id, gr_id) VALUES (1244386, 27);
INSERT INTO classify (m_id, gr_id) VALUES (14731794, 5);
INSERT INTO classify (m_id, gr_id) VALUES (14731794, 18);
INSERT INTO classify (m_id, gr_id) VALUES (14731794, 27);
INSERT INTO classify (m_id, gr_id) VALUES (71002, 8);
INSERT INTO classify (m_id, gr_id) VALUES (71002, 16);
INSERT INTO classify (m_id, gr_id) VALUES (71002, 18);
INSERT INTO classify (m_id, gr_id) VALUES (7956274, 12);
INSERT INTO classify (m_id, gr_id) VALUES (7956274, 13);
INSERT INTO classify (m_id, gr_id) VALUES (7956274, 27);
INSERT INTO classify (m_id, gr_id) VALUES (289036, 2);
INSERT INTO classify (m_id, gr_id) VALUES (289036, 5);
INSERT INTO classify (m_id, gr_id) VALUES (289036, 19);
INSERT INTO classify (m_id, gr_id) VALUES (1578250, 17);
INSERT INTO classify (m_id, gr_id) VALUES (81901, 8);
INSERT INTO classify (m_id, gr_id) VALUES (81901, 12);
INSERT INTO classify (m_id, gr_id) VALUES (27391405, 16);
INSERT INTO classify (m_id, gr_id) VALUES (27391405, 18);
INSERT INTO classify (m_id, gr_id) VALUES (27391405, 19);
INSERT INTO classify (m_id, gr_id) VALUES (5189670, 8);
INSERT INTO classify (m_id, gr_id) VALUES (5189670, 17);
INSERT INTO classify (m_id, gr_id) VALUES (9426290, 8);
INSERT INTO classify (m_id, gr_id) VALUES (9426290, 12);
INSERT INTO classify (m_id, gr_id) VALUES (9426290, 18);
INSERT INTO classify (m_id, gr_id) VALUES (341833, 2);
INSERT INTO classify (m_id, gr_id) VALUES (7349078, 7);
INSERT INTO classify (m_id, gr_id) VALUES (7349078, 10);
INSERT INTO classify (m_id, gr_id) VALUES (7349078, 22);
INSERT INTO classify (m_id, gr_id) VALUES (12661338, 8);
INSERT INTO classify (m_id, gr_id) VALUES (12661338, 11);
INSERT INTO classify (m_id, gr_id) VALUES (12661338, 12);
INSERT INTO classify (m_id, gr_id) VALUES (316613, 5);
INSERT INTO classify (m_id, gr_id) VALUES (316613, 13);
INSERT INTO classify (m_id, gr_id) VALUES (316613, 16);
INSERT INTO classify (m_id, gr_id) VALUES (63919, 3);
INSERT INTO classify (m_id, gr_id) VALUES (1528871, 23);
INSERT INTO classify (m_id, gr_id) VALUES (4680240, 5);
INSERT INTO classify (m_id, gr_id) VALUES (4680240, 12);
INSERT INTO classify (m_id, gr_id) VALUES (4680240, 20);
INSERT INTO classify (m_id, gr_id) VALUES (5422000, 5);
INSERT INTO classify (m_id, gr_id) VALUES (26238728, 5);
INSERT INTO classify (m_id, gr_id) VALUES (490714, 2);
INSERT INTO classify (m_id, gr_id) VALUES (490714, 5);
INSERT INTO classify (m_id, gr_id) VALUES (490714, 15);
INSERT INTO classify (m_id, gr_id) VALUES (9914700, 5);
INSERT INTO classify (m_id, gr_id) VALUES (71048, 5);
INSERT INTO classify (m_id, gr_id) VALUES (2196757, 5);
INSERT INTO classify (m_id, gr_id) VALUES (2196757, 10);
INSERT INTO classify (m_id, gr_id) VALUES (2196757, 19);
INSERT INTO classify (m_id, gr_id) VALUES (6800902, 2);
INSERT INTO classify (m_id, gr_id) VALUES (6800902, 5);
INSERT INTO classify (m_id, gr_id) VALUES (6800902, 19);
INSERT INTO classify (m_id, gr_id) VALUES (98802, 5);
INSERT INTO classify (m_id, gr_id) VALUES (98802, 15);
INSERT INTO classify (m_id, gr_id) VALUES (1352421, 5);
INSERT INTO classify (m_id, gr_id) VALUES (1352421, 12);
INSERT INTO classify (m_id, gr_id) VALUES (1352421, 19);
INSERT INTO classify (m_id, gr_id) VALUES (292870, 4);
INSERT INTO classify (m_id, gr_id) VALUES (292870, 16);
INSERT INTO classify (m_id, gr_id) VALUES (4012658, 5);
INSERT INTO classify (m_id, gr_id) VALUES (4012658, 23);
INSERT INTO classify (m_id, gr_id) VALUES (5861134, 8);
INSERT INTO classify (m_id, gr_id) VALUES (5861134, 16);
INSERT INTO classify (m_id, gr_id) VALUES (5861134, 18);
INSERT INTO classify (m_id, gr_id) VALUES (1606854, 24);
INSERT INTO classify (m_id, gr_id) VALUES (10506510, 5);
INSERT INTO classify (m_id, gr_id) VALUES (10506510, 12);
INSERT INTO classify (m_id, gr_id) VALUES (103359, 16);
INSERT INTO classify (m_id, gr_id) VALUES (103359, 18);
INSERT INTO classify (m_id, gr_id) VALUES (103359, 19);
INSERT INTO classify (m_id, gr_id) VALUES (1492219, 12);
INSERT INTO classify (m_id, gr_id) VALUES (1492219, 14);
INSERT INTO classify (m_id, gr_id) VALUES (2390334, 12);
INSERT INTO classify (m_id, gr_id) VALUES (2390334, 18);
INSERT INTO classify (m_id, gr_id) VALUES (2390334, 27);
INSERT INTO classify (m_id, gr_id) VALUES (14578626, 14);
INSERT INTO classify (m_id, gr_id) VALUES (12683972, 5);
INSERT INTO classify (m_id, gr_id) VALUES (1508179, 18);
INSERT INTO classify (m_id, gr_id) VALUES (1508179, 19);
INSERT INTO classify (m_id, gr_id) VALUES (54544, 5);
INSERT INTO classify (m_id, gr_id) VALUES (31409842, 9);
INSERT INTO classify (m_id, gr_id) VALUES (31409842, 17);
INSERT INTO classify (m_id, gr_id) VALUES (31409842, 28);
INSERT INTO classify (m_id, gr_id) VALUES (4479780, 24);
INSERT INTO classify (m_id, gr_id) VALUES (96985, 27);
INSERT INTO classify (m_id, gr_id) VALUES (1288869, 17);
INSERT INTO classify (m_id, gr_id) VALUES (10605414, 12);
INSERT INTO classify (m_id, gr_id) VALUES (13800178, 12);
INSERT INTO classify (m_id, gr_id) VALUES (4196822, 16);
INSERT INTO classify (m_id, gr_id) VALUES (4196822, 18);
INSERT INTO classify (m_id, gr_id) VALUES (4196822, 19);
INSERT INTO classify (m_id, gr_id) VALUES (439402, 1);
INSERT INTO classify (m_id, gr_id) VALUES (439402, 2);
INSERT INTO classify (m_id, gr_id) VALUES (269541, 5);
INSERT INTO classify (m_id, gr_id) VALUES (1856010, 12);
INSERT INTO classify (m_id, gr_id) VALUES (98891, 2);
INSERT INTO classify (m_id, gr_id) VALUES (98891, 16);
INSERT INTO classify (m_id, gr_id) VALUES (98891, 19);
INSERT INTO classify (m_id, gr_id) VALUES (843196, 10);
INSERT INTO classify (m_id, gr_id) VALUES (843196, 12);
INSERT INTO classify (m_id, gr_id) VALUES (398443, 11);
INSERT INTO classify (m_id, gr_id) VALUES (398443, 17);
INSERT INTO classify (m_id, gr_id) VALUES (399943, 8);
INSERT INTO classify (m_id, gr_id) VALUES (399943, 13);
INSERT INTO classify (m_id, gr_id) VALUES (121002, 2);
INSERT INTO classify (m_id, gr_id) VALUES (121002, 15);
INSERT INTO classify (m_id, gr_id) VALUES (121002, 19);
INSERT INTO classify (m_id, gr_id) VALUES (15156212, 8);
INSERT INTO classify (m_id, gr_id) VALUES (15156212, 12);
INSERT INTO classify (m_id, gr_id) VALUES (15156212, 27);
INSERT INTO classify (m_id, gr_id) VALUES (1298725, 10);
INSERT INTO classify (m_id, gr_id) VALUES (1298725, 12);
INSERT INTO classify (m_id, gr_id) VALUES (91618, 8);
INSERT INTO classify (m_id, gr_id) VALUES (91618, 12);
INSERT INTO classify (m_id, gr_id) VALUES (91618, 13);
INSERT INTO classify (m_id, gr_id) VALUES (108916, 8);
INSERT INTO classify (m_id, gr_id) VALUES (108916, 12);
INSERT INTO classify (m_id, gr_id) VALUES (3018178, 18);
INSERT INTO classify (m_id, gr_id) VALUES (3018178, 19);
INSERT INTO classify (m_id, gr_id) VALUES (15151564, 17);
INSERT INTO classify (m_id, gr_id) VALUES (15151564, 28);
INSERT INTO classify (m_id, gr_id) VALUES (78651, 12);
INSERT INTO classify (m_id, gr_id) VALUES (6133034, 11);
INSERT INTO classify (m_id, gr_id) VALUES (6133034, 17);
INSERT INTO classify (m_id, gr_id) VALUES (784920, 2);
INSERT INTO classify (m_id, gr_id) VALUES (784920, 16);
INSERT INTO classify (m_id, gr_id) VALUES (784920, 18);
INSERT INTO classify (m_id, gr_id) VALUES (11597332, 2);
INSERT INTO classify (m_id, gr_id) VALUES (11597332, 5);
INSERT INTO classify (m_id, gr_id) VALUES (11597332, 19);
INSERT INTO classify (m_id, gr_id) VALUES (13415620, 12);
INSERT INTO classify (m_id, gr_id) VALUES (27688981, 10);
INSERT INTO classify (m_id, gr_id) VALUES (27688981, 12);
INSERT INTO classify (m_id, gr_id) VALUES (90524, 12);
INSERT INTO classify (m_id, gr_id) VALUES (331381, 2);
INSERT INTO classify (m_id, gr_id) VALUES (331381, 3);
INSERT INTO classify (m_id, gr_id) VALUES (331381, 4);
INSERT INTO classify (m_id, gr_id) VALUES (14099968, 8);
INSERT INTO classify (m_id, gr_id) VALUES (14099968, 10);
INSERT INTO classify (m_id, gr_id) VALUES (14099968, 12);
INSERT INTO classify (m_id, gr_id) VALUES (98841, 2);
INSERT INTO classify (m_id, gr_id) VALUES (4343788, 19);
INSERT INTO classify (m_id, gr_id) VALUES (238794, 5);
INSERT INTO classify (m_id, gr_id) VALUES (238794, 10);
INSERT INTO classify (m_id, gr_id) VALUES (15460842, 17);
INSERT INTO classify (m_id, gr_id) VALUES (27622290, 2);
INSERT INTO classify (m_id, gr_id) VALUES (63916, 3);
INSERT INTO classify (m_id, gr_id) VALUES (63916, 5);
INSERT INTO classify (m_id, gr_id) VALUES (3437610, 4);
INSERT INTO classify (m_id, gr_id) VALUES (3437610, 17);
INSERT INTO classify (m_id, gr_id) VALUES (6213220, 2);
INSERT INTO classify (m_id, gr_id) VALUES (6213220, 7);
INSERT INTO classify (m_id, gr_id) VALUES (6213220, 19);
INSERT INTO classify (m_id, gr_id) VALUES (199026, 8);
INSERT INTO classify (m_id, gr_id) VALUES (199026, 12);
INSERT INTO classify (m_id, gr_id) VALUES (199026, 13);
INSERT INTO classify (m_id, gr_id) VALUES (7263380, 5);
INSERT INTO classify (m_id, gr_id) VALUES (7263380, 19);
INSERT INTO classify (m_id, gr_id) VALUES (7263380, 20);
INSERT INTO classify (m_id, gr_id) VALUES (247851, 2);
INSERT INTO classify (m_id, gr_id) VALUES (247851, 5);
INSERT INTO classify (m_id, gr_id) VALUES (247851, 12);
INSERT INTO classify (m_id, gr_id) VALUES (1815022, 11);
INSERT INTO classify (m_id, gr_id) VALUES (1815022, 17);
INSERT INTO classify (m_id, gr_id) VALUES (1815022, 20);
INSERT INTO classify (m_id, gr_id) VALUES (1002892, 8);
INSERT INTO classify (m_id, gr_id) VALUES (1002892, 12);
INSERT INTO classify (m_id, gr_id) VALUES (1002892, 27);
INSERT INTO classify (m_id, gr_id) VALUES (28516985, 13);
INSERT INTO classify (m_id, gr_id) VALUES (28516985, 27);
INSERT INTO classify (m_id, gr_id) VALUES (15852584, 5);
INSERT INTO classify (m_id, gr_id) VALUES (15852584, 12);
INSERT INTO classify (m_id, gr_id) VALUES (8118934, 17);
INSERT INTO classify (m_id, gr_id) VALUES (96546, 5);
INSERT INTO classify (m_id, gr_id) VALUES (96546, 12);
INSERT INTO classify (m_id, gr_id) VALUES (80253, 5);
INSERT INTO classify (m_id, gr_id) VALUES (4110246, 12);
INSERT INTO classify (m_id, gr_id) VALUES (4110246, 28);
INSERT INTO classify (m_id, gr_id) VALUES (2372238, 17);
INSERT INTO classify (m_id, gr_id) VALUES (245022, 12);
INSERT INTO classify (m_id, gr_id) VALUES (380869, 12);
INSERT INTO classify (m_id, gr_id) VALUES (380869, 15);
INSERT INTO classify (m_id, gr_id) VALUES (380869, 18);
INSERT INTO classify (m_id, gr_id) VALUES (14758812, 17);
INSERT INTO classify (m_id, gr_id) VALUES (826211, 12);
INSERT INTO classify (m_id, gr_id) VALUES (8232658, 5);
INSERT INTO classify (m_id, gr_id) VALUES (3804114, 13);
INSERT INTO classify (m_id, gr_id) VALUES (3804114, 16);
INSERT INTO classify (m_id, gr_id) VALUES (3804114, 18);
INSERT INTO classify (m_id, gr_id) VALUES (6519032, 5);
INSERT INTO classify (m_id, gr_id) VALUES (63866, 3);
INSERT INTO classify (m_id, gr_id) VALUES (63866, 5);
INSERT INTO classify (m_id, gr_id) VALUES (4339188, 17);
INSERT INTO classify (m_id, gr_id) VALUES (29390842, 5);
INSERT INTO classify (m_id, gr_id) VALUES (211878, 10);
INSERT INTO classify (m_id, gr_id) VALUES (211878, 12);


--
-- TOC entry 4945 (class 0 OID 17904)
-- Dependencies: 251
-- Data for Name: comment_to; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (14731794, 4037, 6.0, 'mid', '2024-04-14 20:15:01');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (14731794, 5654, 5.5, 'mid', '2022-10-23 04:27:41');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (14731794, 7704, 4.0, 'mid', '2024-08-25 21:17:36');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (71002, 6019, 8.0, 'high', '2022-04-03 14:55:38');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (7956274, 5416, 8.0, 'high', '2022-07-23 04:35:41');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (7956274, 9422, 2.5, 'low', '2022-03-28 18:36:35');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (289036, 176, 9.5, 'high', '2021-10-07 10:09:31');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (81901, 1530, 7.0, 'high', '2022-01-27 16:41:07');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (81901, 1700, 9.5, 'high', '2022-08-07 12:52:15');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (81901, 9276, 6.0, 'mid', '2021-12-29 02:32:15');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (27391405, 1013, 4.0, 'mid', '2023-05-08 05:30:22');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (5189670, 2596, 8.0, 'high', '2021-06-07 03:38:39');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (5189670, 9615, 7.0, 'high', '2022-01-22 11:19:59');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (9426290, 2185, 6.0, 'mid', '2020-03-11 18:47:42');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (9426290, 7103, 6.5, 'mid', '2021-08-15 04:30:59');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (9426290, 7741, 1.0, 'low', '2021-06-18 20:22:44');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (341833, 9672, 9.5, 'high', '2023-10-29 05:21:50');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (7349078, 7422, 8.5, 'high', '2022-10-31 11:16:41');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (12661338, 776, 8.5, 'high', '2022-06-22 05:28:39');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (316613, 6460, 9.0, 'high', '2023-12-21 22:46:49');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (316613, 9654, 9.0, 'high', '2023-03-29 07:30:00');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (5422000, 1754, 6.0, 'mid', '2024-02-22 22:26:04');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (490714, 6575, 6.0, 'mid', '2020-03-17 10:29:23');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (71048, 2068, 7.5, 'high', '2022-07-24 04:49:14');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (2196757, 1087, 5.5, 'mid', '2023-11-29 03:07:19');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (2196757, 1615, 1.0, 'low', '2024-02-10 14:48:35');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (6800902, 3935, 4.5, 'mid', '2024-07-09 20:03:29');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (98802, 1614, 7.0, 'high', '2024-02-03 19:08:43');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (98802, 3004, 8.0, 'high', '2020-02-26 06:53:44');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (98802, 5982, 9.0, 'high', '2024-05-05 22:13:50');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1352421, 4220, 9.5, 'high', '2023-09-07 21:09:42');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1352421, 5839, 7.0, 'high', '2021-03-12 21:36:00');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1352421, 6481, 3.5, 'low', '2023-01-03 07:08:38');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (5861134, 1319, 5.0, 'mid', '2022-12-08 18:31:27');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (5861134, 3344, 8.5, 'high', '2021-12-23 13:10:04');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (103359, 4383, 6.5, 'mid', '2021-03-04 22:48:37');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (103359, 6287, 8.0, 'high', '2021-04-07 01:36:41');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (103359, 6793, 8.0, 'high', '2022-11-14 00:37:56');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (2390334, 9323, 1.5, 'low', '2021-11-19 08:49:36');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1508179, 9555, 8.5, 'high', '2021-06-29 18:38:40');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (31409842, 6735, 3.5, 'low', '2020-10-09 02:39:48');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (31409842, 7055, 7.0, 'high', '2021-02-13 03:48:04');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (4196822, 1387, 2.5, 'low', '2022-08-16 20:11:52');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (4196822, 9705, 7.5, 'high', '2021-12-11 05:07:38');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1856010, 855, 6.5, 'mid', '2022-02-26 00:38:14');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (98891, 1106, 6.0, 'mid', '2023-05-15 06:46:59');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (98891, 7542, 3.0, 'low', '2023-04-23 20:01:16');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (399943, 4755, 2.5, 'low', '2024-06-22 10:28:50');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (121002, 2520, 6.0, 'mid', '2022-01-07 19:11:54');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (121002, 5105, 8.0, 'high', '2023-07-01 11:48:47');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (15156212, 2580, 2.5, 'low', '2024-03-07 19:31:17');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (15156212, 9879, 1.0, 'low', '2020-06-02 09:33:53');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1298725, 5000, 5.0, 'mid', '2024-04-24 08:36:43');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1298725, 8091, 9.5, 'high', '2024-08-02 14:54:50');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (91618, 8094, 10.0, 'high', '2021-03-29 08:31:05');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (91618, 8799, 8.5, 'high', '2023-09-29 07:49:54');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (3018178, 6747, 4.5, 'mid', '2022-09-03 01:19:35');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (3018178, 9514, 5.5, 'mid', '2022-12-17 06:14:30');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (15151564, 7761, 7.5, 'high', '2022-01-23 17:03:29');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (784920, 6369, 5.0, 'mid', '2023-01-16 00:10:44');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (784920, 7768, 9.0, 'high', '2023-03-29 06:17:00');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (784920, 9217, 1.0, 'low', '2023-02-27 03:10:13');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (13415620, 869, 10.0, 'high', '2024-09-27 00:58:49');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (27688981, 742, 3.0, 'low', '2022-10-02 05:57:03');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (27688981, 3908, 8.0, 'high', '2024-04-18 02:41:06');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (27688981, 8274, 6.5, 'mid', '2022-05-18 10:57:20');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (90524, 2949, 9.5, 'high', '2020-11-03 03:51:36');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (90524, 5064, 7.5, 'high', '2024-04-18 01:45:54');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (90524, 7384, 8.5, 'high', '2024-01-19 15:05:42');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (331381, 9778, 7.5, 'high', '2020-07-29 11:46:45');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (14099968, 2459, 7.0, 'high', '2022-05-07 08:07:01');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (14099968, 4999, 6.5, 'mid', '2020-11-09 20:33:43');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (238794, 4194, 10.0, 'high', '2020-12-30 07:18:10');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (3437610, 2921, 1.0, 'low', '2020-09-04 04:12:23');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (6213220, 2055, 8.5, 'high', '2021-01-31 11:38:50');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (199026, 1725, 6.5, 'mid', '2020-04-17 02:16:51');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (199026, 3085, 3.5, 'low', '2024-03-28 01:54:35');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (7263380, 9859, 6.5, 'mid', '2023-05-11 07:57:51');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (247851, 291, 8.0, 'high', '2022-03-12 06:43:20');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1002892, 3358, 7.0, 'high', '2022-03-12 05:35:31');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1002892, 3575, 1.0, 'low', '2021-07-20 08:51:02');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (1002892, 9298, 8.0, 'high', '2022-07-30 19:07:27');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (28516985, 4987, 3.5, 'low', '2022-09-23 15:38:39');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (15852584, 7740, 6.0, 'mid', '2021-11-11 17:04:45');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (96546, 8089, 5.0, 'mid', '2024-07-09 11:27:12');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (96546, 9176, 5.0, 'mid', '2020-02-03 03:00:17');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (4110246, 2372, 6.0, 'mid', '2022-09-25 22:02:29');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (4110246, 2949, 4.5, 'mid', '2021-10-22 16:06:26');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (4110246, 6391, 5.5, 'mid', '2021-11-27 13:19:46');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (4110246, 8456, 2.0, 'low', '2024-08-10 09:31:53');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (380869, 9878, 8.0, 'high', '2021-12-15 09:05:30');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (14758812, 8046, 10.0, 'high', '2024-01-02 15:33:24');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (826211, 9272, 8.0, 'high', '2023-06-30 23:36:05');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (3804114, 1718, 10.0, 'high', '2021-04-30 15:57:53');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (3804114, 3629, 7.5, 'high', '2021-10-12 03:56:32');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (3804114, 9566, 6.0, 'mid', '2023-06-16 01:48:11');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (63866, 9637, 8.0, 'high', '2024-08-21 00:52:41');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (29390842, 8459, 9.5, 'high', '2024-03-24 00:58:24');
INSERT INTO comment_to (m_id, c_id, rating, comment, write_date) VALUES (211878, 8154, 10.0, 'high', '2021-08-30 03:18:11');


--
-- TOC entry 4944 (class 0 OID 17897)
-- Dependencies: 250
-- Data for Name: customer; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (176, 'Kelsey Becker', 'q7Tf479@yahoo.com', '(BReg1Gj*9i', 'F', '+1 679-685-7236');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (291, 'Stephen Tucker', 'Stephen8565@yahoo.com', '(7RD74n4t_', 'M', '+1 531-069-6582');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (742, 'Chelsea Copeland', 's9VdH493@hotmail.com', '*lYy19!t4j', 'F', '+1 963-781-4447');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (776, 'Paul Dunn', 's7Goq29@outlook.com', '#mRSrpi8B6', 'M', '+1 298-579-0603');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (855, 'Sarah Chapman', 'Sarah92@google.com', '^GqDmdx$uR4', 'F', '+1 144-555-8515');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (869, 'Michelle Roberts', 'Michelle883@yahoo.com', '9@$Ej0nV)$', 'F', '+1 439-414-4036');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1013, 'Stephen Greene', '0MBhb4223@hotmail.com', ')8VIsylkV5xO', 'M', '+1 347-330-3861');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1087, 'Jessica Clarke', 'Jessica924@yahoo.com', 'R99VxU1E!#', 'F', '+1 335-309-1103');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1106, 'David Payne', 'David2506@google.com', '*clS&h2T*6)', 'M', '+1 897-319-0338');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1319, 'Oscar Howard', '8NNZf396@hotmail.com', 'zQ92Hz%d_', 'M', '+1 165-158-2795');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1387, 'Rebecca Hodges', 'Rebecca243@hotmail.com', 'kj5Xm4qk&M1Z', 'F', '+1 897-324-6899');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1530, 'Billy Jackson', '18881Billy@yahoo.com', 'yzHUzFml&53', 'M', '+1 696-730-6067');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1614, 'Kim Wade', 'Kim210@yahoo.com', 'g^6Fim$M!', 'F', '+1 331-351-7123');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1615, 'Amanda Williams', '9HENx1526@yahoo.com', '(z0LPHt1I', 'F', '+1 690-802-1921');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1700, 'Angela Brandt', '2HjLs919@hotmail.com', '^0N@0gtv', 'F', '+1 411-864-9454');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1718, 'Angela Munoz', 'l1Ipv2886@yahoo.com', '%$#9XUpni%', 'F', '+1 963-411-9793');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1725, 'Lauren Rodriguez', 'C0Lfq56948@yahoo.com', 'p(9DmLd0r*', 'F', '+1 837-204-3029');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (1754, 'Brian Tate', '6Q6Pe2@yahoo.com', 'Q$5YwSny0E', 'M', '+1 106-980-8285');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2055, 'Nicholas Johnson', 'Nicholas9345@hotmail.com', 's&T1FJ&u', 'M', '+1 251-362-0393');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2068, 'Zachary Lopez', 'Zachary183@hotmail.com', '__15$IrdulG', 'M', '+1 088-402-2065');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2185, 'Colleen Jackson', '8JWPa6@outlook.com', '%6Gu!TaOcZX', 'F', '+1 220-050-4884');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2372, 'Jose Stewart', 'Jose2272@outlook.com', '+cV7Ce3qMbb', 'M', '+1 652-031-0450');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2459, 'Donna Pearson', 'Donna18@google.com', 'Mz!$Sw1P#e4', 'F', '+1 776-199-3756');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2520, 'David Powell', 'David4099@outlook.com', 'k#&!wKQszp6', 'M', '+1 855-072-6786');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2580, 'David Silva', 'V4Xsz159@yahoo.com', 'Z5G#uNDa$', 'M', '+1 659-746-3735');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2596, 'Nathan Phillips', 'Nathan60873@hotmail.com', 'BPN4Zrpe6+%', 'M', '+1 467-873-3317');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2921, 'Carol Mitchell', 'Carol523@yahoo.com', '*YR4RfRqf', 'F', '+1 054-353-1028');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (2949, 'Mary Baker', '3zGPu345@hotmail.com', '+qqLw^Sj64U', 'F', '+1 680-656-2547');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3004, 'Michael Miller', 'Michael48@google.com', 'j4hn)0Kzn_', 'M', '+1 672-496-1888');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3085, 'Nicholas Bryant', 'P2EfT9721@google.com', '(1PDfYh)v9', 'M', '+1 744-698-7006');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3344, 'Emma Lynch', 'Emma273@hotmail.com', '*50VN)Ew@', 'F', '+1 044-999-8109');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3358, 'Victoria Ellis', 'E9XQy553@google.com', '@pTG1#n!1JgB', 'F', '+1 452-832-3651');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3575, 'Lori Morales', 'Lori9369@hotmail.com', '1zz+JqNY2neO', 'F', '+1 457-843-9301');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3629, 'Tyler Berry', '5CXSz30@hotmail.com', 'o6MqlR@wT(F_', 'M', '+1 517-030-3986');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3908, 'Elizabeth Miller', 'Elizabeth5@google.com', 'zc0VgJ%!#f', 'F', '+1 086-406-7324');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (3935, 'Mark Martin', 'Mark3@google.com', '*4Qkkw1#u', 'M', '+1 647-987-9252');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4037, 'Sharon King', 'Sharon49046@hotmail.com', '_4BHyKhz', 'F', '+1 220-320-8221');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4194, 'Crystal Carrillo', 'Crystal5@outlook.com', 'A9m_%Iln@', 'F', '+1 564-113-0041');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4220, 'Douglas Taylor', '0ZoGM8@hotmail.com', 'Q6#5!$xu%_Nk', 'M', '+1 846-171-5813');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4383, 'Christopher Bell', '2EGYh99746@yahoo.com', 'E!9HJATs$I', 'M', '+1 791-203-8575');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4755, 'Richard Vasquez', 'Richard4@yahoo.com', 'D@C59V(x', 'M', '+1 733-792-9052');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4987, 'Stephanie Guerrero', '8IgFr8@hotmail.com', 'x6FmOnrQ(F^1', 'F', '+1 179-037-7627');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (4999, 'Rachael Baker', 'Rachael914@google.com', '9!jfbYEu##', 'F', '+1 167-721-8837');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5000, 'Nichole Smith', '92IwE490@google.com', '^3xM*sdhyD', 'F', '+1 029-549-9660');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5064, 'James Cook', 'James59@google.com', '8bfOoIYq*', 'M', '+1 591-534-9756');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5105, 'Jennifer Murphy', 'Jennifer7425@hotmail.com', '%lC^c9JwX7cq', 'F', '+1 896-533-5090');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5416, 'Heather White', '5Veyj12@outlook.com', 'WR6W0lmv@%6', 'F', '+1 361-060-2829');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5654, 'Allison Roberts', '954Allison@outlook.com', '&ClZdXhy4', 'F', '+1 863-953-0919');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5839, 'Valerie Allison', 'Valerie3810@google.com', 'f6w&$3Ru)G', 'F', '+1 706-756-3120');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (5982, 'Linda Lucas', 'Linda96@yahoo.com', '*DHJobba0', 'F', '+1 809-443-7517');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6019, 'Sean Adams', '7Vok85940@google.com', '!Ppk3OkgK', 'M', '+1 788-776-2751');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6287, 'Donna Clark', '7XrDq8737@google.com', '(&C5PTpuyK', 'F', '+1 959-184-5301');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6369, 'Clinton Wise', '8E8Uo2724@google.com', '3lt!%H0r_)t', 'M', '+1 342-551-6825');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6391, 'Kelly Obrien', 'Kelly62841@hotmail.com', '+M123VFr', 'M', '+1 211-789-5869');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6460, 'Jason Bradley', 'Jason153@google.com', 'kZ9sX9Yl!J', 'M', '+1 576-208-4386');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6481, 'Deanna Becker', '3EmQA6490@google.com', 'd7S&!pob&Z#', 'F', '+1 749-877-3875');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6575, 'Christopher Nguyen', 'Christopher60@hotmail.com', 'iVLU7M#u^S', 'M', '+1 083-160-6844');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6735, 'Jason Perez', 'Jason774@google.com', 'nKVlRBx7^(1k', 'M', '+1 550-852-7724');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6747, 'Ariana Austin', 'Ariana307@hotmail.com', 'Q11Fs7V!^s', 'F', '+1 732-893-9695');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (6793, 'Shannon Sanders', 'Y9aBx69@google.com', '!_6Wv7NhwTLe', 'M', '+1 620-849-5664');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7055, 'Melinda Richardson', '56494Melinda@google.com', 'TkZ#4YBx0w', 'F', '+1 983-231-0394');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7103, 'Amy Sanford', 'Amy78@google.com', '&i25R01tv0I', 'F', '+1 073-973-9511');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7384, 'Erika Watkins', 'Erika539@google.com', '&VVkVsNq8n', 'F', '+1 071-489-8139');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7422, 'Juan Newman', 'Juan82@yahoo.com', 'C6a4J59e))t', 'M', '+1 856-435-9874');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7542, 'Shelby Lawrence', 'C2Hbw10@yahoo.com', '^r75ZXhm', 'F', '+1 746-137-0372');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7704, 'Tyler Sanchez', '4Tyler@google.com', 'yxCMSll*+12r', 'M', '+1 347-124-6090');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7740, 'Jodi Kramer', 'Jodi6051@google.com', 'GH1rUQagC+', 'F', '+1 608-073-4610');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7741, 'Katherine Warren', '29Katherine@yahoo.com', 'NLUb9Yyk!7', 'F', '+1 932-453-5166');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7761, 'Kimberly Hernandez', 'Kimberly231@google.com', 'v1LjV7qH!', 'F', '+1 059-479-5068');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (7768, 'Frank Moran', 'Frank53636@yahoo.com', '*3CDt&YyZ', 'M', '+1 616-221-0755');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8046, 'Jenny Joseph', 'Jenny65@yahoo.com', '!bx(6YvJVC', 'F', '+1 755-179-3436');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8089, 'Sheila Norris', '54665Sheila@outlook.com', 'a9(FvYtx#a', 'F', '+1 494-740-3174');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8091, 'Curtis Bryant', 'Curtis2@hotmail.com', '$jC3O$kECo', 'M', '+1 080-321-1008');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8094, 'Brian Barajas', 'Brian615@hotmail.com', 'qZ9UKkVaP!jO', 'M', '+1 306-532-0902');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8154, 'Donna Reid', '1xHxT646@yahoo.com', '@9LOq8lm', 'F', '+1 465-271-3405');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8274, 'Jonathan Pollard', 'Jonathan5368@hotmail.com', 'S21IuH$x_f(', 'M', '+1 876-431-4086');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8456, 'Michael Cortez', '4Michael@google.com', '29*#TgkJ$n', 'M', '+1 527-550-1131');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8459, 'Kerry Johnson', 'Kerry18@hotmail.com', '_sJ^2SpCT0', 'M', '+1 118-258-6823');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (8799, 'Clayton Wallace', 'Clayton52642@outlook.com', '@q529#GrgT', 'M', '+1 724-439-7799');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9176, 'Anthony Carr', '0CvAv196@google.com', 'Si^2*O&l+CH', 'M', '+1 985-690-5903');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9217, 'Amanda Martinez', 'Amanda7048@yahoo.com', '(2THXAb)f8y', 'F', '+1 845-681-3551');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9272, 'Jill Terry', 'Jill8@yahoo.com', 'b4FK6A@b!', 'F', '+1 525-791-9397');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9276, 'Allison Pope', 'Allison992@yahoo.com', 'o)B#0IVlrH', 'F', '+1 527-722-9603');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9298, 'Kelsey Thomas', 'Kelsey9898@hotmail.com', 'bM*6OIlJ3', 'F', '+1 669-602-5077');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9323, 'Timothy Barnett', 'Timothy9628@google.com', '!1+7f0Vidk', 'M', '+1 695-997-4577');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9422, 'Daniel West', '0cDDl383@google.com', '#SzBi5K%89J', 'M', '+1 871-100-5916');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9514, 'Daniel Long', 'Daniel938@google.com', 'G8MfUffC#u', 'M', '+1 580-193-2550');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9555, 'Dennis Sutton', 'Dennis81796@google.com', '_ImrDtcc)7', 'M', '+1 772-637-3957');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9566, 'Joel Clark', '0Joel@outlook.com', '(Y2tdx&q%%', 'M', '+1 623-735-5132');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9615, 'Jasmine Lopez', '1Jd0O7@hotmail.com', '#(oNpTGm0', 'F', '+1 611-246-5816');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9637, 'Matthew Grimes', 'Matthew73@hotmail.com', '!Z$!N7TdO2', 'M', '+1 634-080-0200');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9654, 'Stephen Leon', 'N7DDk39@hotmail.com', '5)19OQzvz', 'M', '+1 845-894-2745');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9672, 'Kevin Huff', 'Kevin613@yahoo.com', '8YMk)c@R*6', 'M', '+1 953-407-5682');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9705, 'Daniel Villarreal', 'Daniel107@hotmail.com', '77(N2rGu', 'M', '+1 868-568-9693');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9778, 'Angela Robinson', '6GXit88@outlook.com', '$i2rTfLtQT', 'F', '+1 710-350-5960');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9859, 'David Garner', '9Agxq8@hotmail.com', 'lZu9XWoF#', 'M', '+1 683-074-5106');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9878, 'Elizabeth Patterson', 'm9LNj88@google.com', '*99RTDZfO', 'F', '+1 339-198-7501');
INSERT INTO customer (c_id, c_name, email, pwd, gender, phone) VALUES (9879, 'Maria Gardner', 'Maria490@google.com', '_j0p(ITk(7l', 'F', '+1 974-953-9290');


--
-- TOC entry 4938 (class 0 OID 17856)
-- Dependencies: 244
-- Data for Name: genre; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO genre (gr_id, gr_name) VALUES (1, 'Game-Show');
INSERT INTO genre (gr_id, gr_name) VALUES (2, 'Family');
INSERT INTO genre (gr_id, gr_name) VALUES (3, 'Music');
INSERT INTO genre (gr_id, gr_name) VALUES (4, 'Reality-TV');
INSERT INTO genre (gr_id, gr_name) VALUES (5, 'Comedy');
INSERT INTO genre (gr_id, gr_name) VALUES (6, 'Western');
INSERT INTO genre (gr_id, gr_name) VALUES (7, 'Short');
INSERT INTO genre (gr_id, gr_name) VALUES (8, 'Crime');
INSERT INTO genre (gr_id, gr_name) VALUES (9, 'War');
INSERT INTO genre (gr_id, gr_name) VALUES (10, 'Romance');
INSERT INTO genre (gr_id, gr_name) VALUES (11, 'Biography');
INSERT INTO genre (gr_id, gr_name) VALUES (12, 'Drama');
INSERT INTO genre (gr_id, gr_name) VALUES (13, 'Mystery');
INSERT INTO genre (gr_id, gr_name) VALUES (14, 'Sci-Fi');
INSERT INTO genre (gr_id, gr_name) VALUES (15, 'Fantasy');
INSERT INTO genre (gr_id, gr_name) VALUES (16, 'Adventure');
INSERT INTO genre (gr_id, gr_name) VALUES (17, 'Documentary');
INSERT INTO genre (gr_id, gr_name) VALUES (18, 'Action');
INSERT INTO genre (gr_id, gr_name) VALUES (19, 'Animation');
INSERT INTO genre (gr_id, gr_name) VALUES (20, 'Sport');
INSERT INTO genre (gr_id, gr_name) VALUES (21, 'Horror');
INSERT INTO genre (gr_id, gr_name) VALUES (22, 'Adult');
INSERT INTO genre (gr_id, gr_name) VALUES (23, 'News');
INSERT INTO genre (gr_id, gr_name) VALUES (24, 'Talk-Show');
INSERT INTO genre (gr_id, gr_name) VALUES (25, 'Film-Noir');
INSERT INTO genre (gr_id, gr_name) VALUES (26, 'Musical');
INSERT INTO genre (gr_id, gr_name) VALUES (27, 'Thriller');
INSERT INTO genre (gr_id, gr_name) VALUES (28, 'History');


--
-- TOC entry 4939 (class 0 OID 17864)
-- Dependencies: 245
-- Data for Name: movie; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1244386, 'tvSeries', 'El Señor de la Querencia', false, '2008-01-01', '2008-01-01', 30, 8.4, 172);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (14731794, 'tvSeries', 'Gukyeongi', false, '2021-01-01', '2021-01-01', 70, 7.1, 1119);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (71002, 'tvSeries', 'Kodiak', false, '1974-01-01', '1974-01-01', 30, 7.2, 57);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (7956274, 'tvSeries', 'Edha', false, '2018-01-01', '2018-01-01', 40, 4.9, 699);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (289036, 'tvSeries', 'What''s with Andy?', false, '2001-01-01', '2007-01-01', 30, 7.6, 3833);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1578250, 'tvSeries', 'What''s That About?', false, '2005-01-01', '2007-01-01', 60, 7.4, 6);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (81901, 'tvSeries', 'McClain''s Law', false, '1981-01-01', '1982-01-01', 60, 7.6, 89);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (27391405, 'tvSeries', 'Isekai Shoukan wa Nidome desu', false, '2023-01-01', '2023-01-01', 24, 5.4, 443);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (5189670, 'tvSeries', 'Making a Murderer', false, '2015-01-01', '2018-01-01', 60, 8.5, 103526);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (9426290, 'tvSeries', 'Queen Sono', false, '2020-01-01', '2020-01-01', 43, 6.1, 1399);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (341833, 'tvSeries', 'Kaninlandet', false, '1999-01-01', '2002-01-01', 20, 7.8, 6);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (7349078, 'tvMiniSeries', 'Double Timing Wife', true, '2014-01-01', '2015-01-01', 38, 5.6, 10);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (12661338, 'tvMiniSeries', 'A Friend of the Family', false, '2022-01-01', '2022-01-01', 53, 7.3, 7133);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (316613, 'tvSeries', 'Los simuladores', false, '2002-01-01', '2004-01-01', 60, 9.2, 5988);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (63919, 'tvSeries', 'The Johnny Cash Show', false, '1969-01-01', '1971-01-01', 60, 8.6, 283);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1528871, 'tvSeries', '86-60-86', false, '1994-01-01', '1998-01-01', 25, 5.8, 9);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4680240, 'tvSeries', 'Club de Cuervos', false, '2015-01-01', '2019-01-01', 40, 8.2, 6312);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (5422000, 'tvSeries', 'Mister Brau', false, '2015-01-01', '2018-01-01', 40, 6.3, 93);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (26238728, 'tvSeries', 'Bednyye Abramovichi', false, '2023-01-01', '2023-01-01', 30, 7.2, 54);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (490714, 'tvSeries', 'Booh!', false, '2005-01-01', '2008-01-01', 30, 8.7, 17);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (9914700, 'tvSeries', 'Aunty Donna: Best Content Ever!!1!', false, '2017-01-01', '2017-01-01', 5, 8.2, 27);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (71048, 'tvSeries', 'Second Time Around', false, '1974-01-01', '1975-01-01', 30, 7.0, 7);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (2196757, 'tvSeries', 'Inu x Boku SS', false, '2012-01-01', '2012-01-01', 24, 7.0, 1805);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (6800902, 'tvMiniSeries', 'My Little Pony: Equestria Girls Specials', false, '2017-01-01', '2017-01-01', 22, 6.8, 739);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (98802, 'tvSeries', 'Get a Life', false, '1990-01-01', '1992-01-01', 30, 8.1, 3029);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1352421, 'tvSeries', 'Natsume yûjinchô', false, '2008-01-01', '2017-01-01', 24, 8.1, 2568);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (292870, 'tvSeries', 'Wild On...', false, '1997-01-01', '2009-01-01', 60, 6.2, 179);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4012658, 'tvMiniSeries', 'Comic Splash: The web-series', false, '2014-01-01', '2014-01-01', 10, 8.8, 6);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (5861134, 'tvSeries', 'Encantadia', false, '2016-01-01', '2017-01-01', 30, 6.7, 215);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1606854, 'tvSeries', '1 Girl 5 Gays', false, '2009-01-01', '2014-01-01', 30, 7.8, 303);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (10506510, 'tvSeries', 'Das letzte Wort', false, '2020-01-01', '2020-01-01', 40, 7.1, 1195);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (103359, 'tvSeries', 'Batman: The Animated Series', false, '1992-01-01', '1995-01-01', 23, 9.0, 118762);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1492219, 'tvSeries', 'Telerop 2009 - Es ist noch was zu retten', false, '1974-01-01', '1974-01-01', 25, 7.2, 13);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (2390334, 'tvSeries', 'Chosen', false, '2013-01-01', '2014-01-01', 22, 7.3, 3906);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (14578626, 'tvSeries', 'Star Wars Vehicle Flythroughs', false, '2021-01-01', '2021-01-01', 4, 6.2, 481);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (12683972, 'tvSeries', 'Cheverísimo', false, '1992-01-01', '2002-01-01', 60, 6.3, 6);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1508179, 'tvSeries', 'Shonen ninja Kaze no Fujimaru', false, '1964-01-01', '1965-01-01', 30, 8.4, 40);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (54544, 'tvSeries', 'The Hathaways', false, '1961-01-01', '1962-01-01', 30, 7.1, 68);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (31409842, 'tvMiniSeries', 'Osama Bin Laden: The Inside Story', false, '2021-01-01', '2021-01-01', 140, 7.8, 11);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4479780, 'tvSeries', 'Söndagsöppet', false, '1990-01-01', '2003-01-01', 60, 5.5, 30);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (96985, 'tvMiniSeries', 'Brotherhood of the Rose', false, '1989-01-01', '1989-01-01', 240, 6.7, 933);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1288869, 'tvMiniSeries', 'The Genius of Photography', false, '2007-01-01', '2007-01-01', 352, 8.5, 352);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (10605414, 'tvMiniSeries', 'Lia', false, '2018-01-01', '2018-01-01', 45, 7.1, 8);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (13800178, 'tvSeries', 'V tihom omute...', false, '2021-01-01', '2021-01-01', 30, 7.0, 31);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4196822, 'tvSeries', 'Danger Mouse', false, '2015-01-01', '2019-01-01', 22, 7.1, 721);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (439402, 'tvSeries', 'Talk About', false, '1988-01-01', '1990-01-01', 30, 8.1, 35);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (269541, 'tvSeries', 'Mesa de noticias', false, '1983-01-01', '1987-01-01', 45, 7.9, 51);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1856010, 'tvSeries', 'House of Cards', false, '2013-01-01', '2018-01-01', 50, 8.6, 534134);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (98891, 'tvSeries', 'Peter Pan and the Pirates', false, '1990-01-01', '1991-01-01', 30, 7.2, 730);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (843196, 'tvSeries', 'Haetbit ssodajida', false, '2004-01-01', '2004-01-01', 60, 6.3, 29);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (398443, 'tvMiniSeries', 'Cronkite Remembers', false, '1997-01-01', '1997-01-01', 360, 8.4, 35);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (399943, 'tvSeries', '07 zglos sie', false, '1976-01-01', '1987-01-01', 60, 7.3, 346);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (121002, 'tvSeries', 'Noggin the Nog', false, '1959-01-01', '1965-01-01', 10, 8.5, 121);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (15156212, 'tvMiniSeries', 'Crossfire', false, '2022-01-01', '2022-01-01', 55, 5.8, 2781);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1298725, 'tvSeries', 'Contrato de amor', false, '2008-01-01', '2009-01-01', 60, 8.4, 14);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (91618, 'tvMiniSeries', 'Miss Marple: Nemesis', false, '1987-01-01', '1987-01-01', 54, 7.8, 2608);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (108916, 'tvSeries', 'Schwarz greift ein', false, '1994-01-01', '1999-01-01', 88, 6.3, 25);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (3018178, 'tvSeries', 'Riddler', false, '2013-01-01', '2013-01-01', 1, 6.2, 60);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (15151564, 'tvMiniSeries', 'Ian Hislop: Trains That Changed the World', false, '2021-01-01', '2021-01-01', 60, 7.2, 23);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (78651, 'tvSeries', 'Married: The First Year', false, '1979-01-01', '1979-01-01', 60, 6.4, 7);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (6133034, 'tvMiniSeries', 'TIME: The Kalief Browder Story', false, '2017-01-01', '2017-01-01', 43, 8.4, 2923);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (784920, 'tvSeries', 'Power Rangers Operation Overdrive', false, '2007-01-01', '2007-01-01', 22, 5.5, 1691);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (11597332, 'tvSeries', 'An Egg''s Guide to Minecraft', false, '2012-01-01', '2020-01-01', 7, 8.9, 45);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (13415620, 'tvSeries', 'Zdrady', false, '2013-01-01', '2020-01-01', 44, 4.0, 24);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (27688981, 'tvMiniSeries', 'Absolutni debiutanci', false, '2023-01-01', '2023-01-01', 48, 7.2, 1401);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (90524, 'tvSeries', 'Sivi dom', false, '1984-01-01', '1986-01-01', 50, 8.8, 968);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (331381, 'tvSeries', 'Brandy: Special Delivery', false, '2002-01-01', '2002-01-01', 30, 5.9, 18);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (14099968, 'tvMiniSeries', 'Ten', false, '2018-01-01', '2018-01-01', 180, 4.2, 5);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (98841, 'tvSeries', 'Kurt Olssons julkalender', false, '1990-01-01', '1990-01-01', 15, 6.3, 117);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4343788, 'tvSeries', 'The URL with Phred Show', false, '2001-01-01', '2002-01-01', 60, 7.7, 38);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (238794, 'tvSeries', 'Pa heeft een lief', false, '2000-01-01', '2000-01-01', 30, 4.2, 8);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (15460842, 'tvSeries', 'How America Works', false, '2021-01-01', '2022-01-01', 60, 8.8, 46);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (27622290, 'tvSeries', 'Baking with the Reys', false, '2023-01-01', '2023-01-01', 24, 8.9, 8);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (63916, 'tvSeries', 'Jimmy Durante Presents the Lennon Sisters', false, '1969-01-01', '1970-01-01', 60, 7.5, 34);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (3437610, 'tvSeries', 'Blood Sweat and Heels', false, '2014-01-01', '2015-01-01', 60, 6.2, 65);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (6213220, 'tvSeries', 'Ernest et Célestine, la collection', false, '2017-01-01', '2021-01-01', 13, 7.8, 202);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (199026, 'tvMiniSeries', 'Shroud for a Nightingale', false, '1984-01-01', '1984-01-01', 50, 7.5, 398);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (7263380, 'tvMiniSeries', 'Keppeki danshi! Aoyama-kun', false, '2017-01-01', '2017-01-01', 24, 6.5, 366);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (247851, 'tvSeries', 'Aprender a volar', false, '1994-01-01', '1995-01-01', 60, 7.8, 15);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1815022, 'tvMiniSeries', 'Destination One', false, '2011-01-01', '2011-01-01', 13, 7.2, 12);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1002892, 'tvMiniSeries', 'Kodenavn Hunter', false, '2007-01-01', '2008-01-01', 60, 6.8, 345);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (28516985, 'tvSeries', 'Istorik', false, '2021-01-01', '2023-01-01', 53, 7.0, 14);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (15852584, 'tvSeries', 'UP UP', false, '2021-01-01', '2022-01-01', 104, 7.5, 10);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (8118934, 'tvMiniSeries', 'Divided States', false, '2018-01-01', '2018-01-01', 45, 7.0, 57);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (1088753, 'tvSeries', 'Subtext', false, '2006-01-01', '2007-01-01', 120, 8.6, 20);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (96546, 'tvSeries', 'A Bit of a Do', false, '1989-01-01', '1989-01-01', 60, 7.1, 235);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (80253, 'tvSeries', 'Not the Nine O''Clock News', false, '1979-01-01', '1982-01-01', 25, 7.9, 2820);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4110246, 'tvSeries', 'Mata Hari', false, '2016-01-01', '2017-01-01', 60, 6.0, 525);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (2372238, 'tvSeries', 'New Zealand from Above', false, '2012-01-01', '2012-01-01', 43, 8.4, 55);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (245022, 'tvSeries', 'Breaking News', false, '2002-01-01', '2002-01-01', 60, 6.2, 52);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (380869, 'tvSeries', 'The Collector', false, '2004-01-01', '2006-01-01', 60, 6.6, 831);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (14758812, 'tvSeries', 'O Dia Depois da Eleição', false, '2018-01-01', '2018-01-01', 27, 4.6, 61);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (826211, 'tvSeries', 'Hollywood Babylon', false, '1992-01-01', '1993-01-01', 30, 7.5, 28);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (8232658, 'tvSeries', 'Ingen Retur', false, '2018-01-01', '2018-01-01', 18, 8.0, 10);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (3804114, 'tvMiniSeries', 'Halo: Nightfall', false, '2014-01-01', '2014-01-01', 30, 5.5, 5778);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (6519032, 'tvSeries', 'Grazhdanskiy brak', false, '2017-01-01', '2017-01-01', 21, 6.3, 36);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (63866, 'tvSeries', 'The Andy Williams Show', false, '1969-01-01', '1971-01-01', 60, 7.9, 104);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (4339188, 'tvSeries', 'The Inca: Masters of the Clouds', false, '2015-01-01', '2015-01-01', 60, 7.5, 49);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (29390842, 'tvMiniSeries', 'Nepsyt toimistossa', false, '2023-01-01', '2023-01-01', 3, 6.5, 8);
INSERT INTO movie (m_id, m_type, m_name, is_adult, start_year, end_year, runtimes, m_rating, votes) VALUES (211878, 'tvSeries', 'La usurpadora', false, '1998-01-01', '1998-01-01', 60, 7.7, 2652);


--
-- TOC entry 4940 (class 0 OID 17871)
-- Dependencies: 246
-- Data for Name: occupation; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO occupation (ocu_id, ocu_name) VALUES (1, 'accountant');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (2, 'actor');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (3, 'actress');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (4, 'animation_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (5, 'archive_footage');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (6, 'archive_sound');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (7, 'art_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (8, 'art_director');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (9, 'assistant');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (10, 'assistant_director');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (11, 'camera_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (12, 'casting_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (13, 'casting_director');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (14, 'choreographer');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (15, 'cinematographer');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (16, 'composer');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (17, 'costume_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (18, 'costume_designer');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (19, 'director');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (20, 'editor');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (21, 'editorial_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (22, 'electrical_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (23, 'executive');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (24, 'legal');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (25, 'location_management');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (26, 'make_up_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (27, 'manager');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (28, 'miscellaneous');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (29, 'music_artist');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (30, 'music_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (31, 'podcaster');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (32, 'producer');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (33, 'production_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (34, 'production_designer');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (35, 'production_manager');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (36, 'publicist');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (37, 'script_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (38, 'set_decorator');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (39, 'sound_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (40, 'soundtrack');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (41, 'special_effects');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (42, 'stunts');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (43, 'talent_agent');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (44, 'transportation_department');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (45, 'visual_effects');
INSERT INTO occupation (ocu_id, ocu_name) VALUES (46, 'writer');


--
-- TOC entry 4941 (class 0 OID 17878)
-- Dependencies: 247
-- Data for Name: participant; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO participant (p_id, p_name, major_work) VALUES (53, 'Robert Mitchum', '0039689');
INSERT INTO participant (p_id, p_name, major_work) VALUES (92, 'John Cleese', '0095159');
INSERT INTO participant (p_id, p_name, major_work) VALUES (100, 'Rowan Atkinson', '0274166');
INSERT INTO participant (p_id, p_name, major_work) VALUES (228, 'Kevin Spacey', '0119488');
INSERT INTO participant (p_id, p_name, major_work) VALUES (231, 'Oliver Stone', '0091763');
INSERT INTO participant (p_id, p_name, major_work) VALUES (282, 'Scott Bairstow', '0119925');
INSERT INTO participant (p_id, p_name, major_work) VALUES (317, 'Clancy Brown', '0111161');
INSERT INTO participant (p_id, p_name, major_work) VALUES (347, 'Tim Curry', '0073629');
INSERT INTO participant (p_id, p_name, major_work) VALUES (348, 'Tony Curtis', '0053291');
INSERT INTO participant (p_id, p_name, major_work) VALUES (410, 'Stephen Fry', '0280707');
INSERT INTO participant (p_id, p_name, major_work) VALUES (434, 'Mark Hamill', '0076759');
INSERT INTO participant (p_id, p_name, major_work) VALUES (535, 'Rose McGowan', '1077258');
INSERT INTO participant (p_id, p_name, major_work) VALUES (638, 'William Shatner', '0098382');
INSERT INTO participant (p_id, p_name, major_work) VALUES (705, 'Robin Wright', '0109830');
INSERT INTO participant (p_id, p_name, major_work) VALUES (722, 'Joss Ackland', '0099810');
INSERT INTO participant (p_id, p_name, major_work) VALUES (790, 'James Arness', '0047736');
INSERT INTO participant (p_id, p_name, major_work) VALUES (993, 'Carol Burnett', '0061240');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1464, 'Kay Lenz', '0091223');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1486, 'Sidney Lumet', '0050083');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1513, 'Tim Matheson', '0077975');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1556, 'David Morse', '0120689');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1593, 'Anna Paquin', '0107822');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1654, 'Ronald Reagan', '0034946');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1813, 'Dick Van Dyke', '0058331');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1826, 'M. Emmet Walsh', '0083658');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1883, 'Jenna von Oÿ', '0101050');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1957, 'Lloyd Bochner', '0102510');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2051, 'Jimmy Durante', '0057193');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2079, 'Steve Forrest', '0082766');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2083, 'Carl Franklin', '0102592');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2554, 'Claudette Nevins', '0102945');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3162, 'Marc Summers', '5649144');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3944, 'Ian James Corlett', '0214341');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4170, 'Bob Kane', '1877830');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4847, 'Walter Cronkite', '0337550');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4916, 'Conchata Ferrell', '0369179');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4988, 'Colin Hanks', '0360717');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5189, 'Jason Marsden', '0105958');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5275, 'Brandy Norwood', '0130018');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5318, 'Carly Pope', '1535108');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5471, 'Peter Strauss', '0084649');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6219, 'Michael Nyman', '0107822');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11882, 'Paul Adelstein', '0138524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (15924, 'Mari Devon', '0347149');
INSERT INTO participant (p_id, p_name, major_work) VALUES (17167, 'Tony Alcantar', '2802850');
INSERT INTO participant (p_id, p_name, major_work) VALUES (18746, 'Sharon Alexander', '0108903');
INSERT INTO participant (p_id, p_name, major_work) VALUES (19212, 'John Alford', '0282744');
INSERT INTO participant (p_id, p_name, major_work) VALUES (21596, 'Chris M. Allport', '7780024');
INSERT INTO participant (p_id, p_name, major_work) VALUES (23524, 'Suzana Alves', '0290113');
INSERT INTO participant (p_id, p_name, major_work) VALUES (25953, 'Chantal Andere', '0213343');
INSERT INTO participant (p_id, p_name, major_work) VALUES (31973, 'Sofia Aparício', '24634274');
INSERT INTO participant (p_id, p_name, major_work) VALUES (33312, 'Taís Araújo', '2372755');
INSERT INTO participant (p_id, p_name, major_work) VALUES (35277, 'Gisken Armand', '0119375');
INSERT INTO participant (p_id, p_name, major_work) VALUES (35602, 'Alexander Armstrong', '1130073');
INSERT INTO participant (p_id, p_name, major_work) VALUES (39583, 'Jules Asner', '5439796');
INSERT INTO participant (p_id, p_name, major_work) VALUES (40125, 'Dmitriy Astrakhan', '0101946');
INSERT INTO participant (p_id, p_name, major_work) VALUES (40739, 'Jayne Atkinson', '0106965');
INSERT INTO participant (p_id, p_name, major_work) VALUES (43389, 'Alejandro Awada', '5121816');
INSERT INTO participant (p_id, p_name, major_work) VALUES (45209, 'Michael Bacall', '0361748');
INSERT INTO participant (p_id, p_name, major_work) VALUES (48083, 'Anna Banshchikova', '2700194');
INSERT INTO participant (p_id, p_name, major_work) VALUES (52218, 'Morwenna Banks', '5839960');
INSERT INTO participant (p_id, p_name, major_work) VALUES (63527, 'Brian Beacock', '5050342');
INSERT INTO participant (p_id, p_name, major_work) VALUES (64086, 'Carmen Beato', '0247196');
INSERT INTO participant (p_id, p_name, major_work) VALUES (70355, 'Pepe Ruiz', '0324727');
INSERT INTO participant (p_id, p_name, major_work) VALUES (73388, 'Eric Bercovici', '0080274');
INSERT INTO participant (p_id, p_name, major_work) VALUES (80867, 'Abner Biberman', '0032599');
INSERT INTO participant (p_id, p_name, major_work) VALUES (80892, 'Allison Bibicoff', '2064865');
INSERT INTO participant (p_id, p_name, major_work) VALUES (89603, 'Brady Bluhm', '0109686');
INSERT INTO participant (p_id, p_name, major_work) VALUES (89982, 'Allan Blye', '0061296');
INSERT INTO participant (p_id, p_name, major_work) VALUES (89984, 'Margaret Blye', '0064505');
INSERT INTO participant (p_id, p_name, major_work) VALUES (91144, 'Door van Boeckel', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (91286, 'Earl Boen', '0103064');
INSERT INTO participant (p_id, p_name, major_work) VALUES (94951, 'Beatriz Bonnet', '0188971');
INSERT INTO participant (p_id, p_name, major_work) VALUES (98120, 'Uke Bosse', '2146896');
INSERT INTO participant (p_id, p_name, major_work) VALUES (103071, 'Richard Bradford', '0094226');
INSERT INTO participant (p_id, p_name, major_work) VALUES (103120, 'Ben Bradlee', '0106466');
INSERT INTO participant (p_id, p_name, major_work) VALUES (103722, 'Scott Brady', '0087363');
INSERT INTO participant (p_id, p_name, major_work) VALUES (104113, 'Patricia Brake', '0224505');
INSERT INTO participant (p_id, p_name, major_work) VALUES (104405, 'Isabel Branco', '20259142');
INSERT INTO participant (p_id, p_name, major_work) VALUES (104561, 'Lars Brandeby', '0092388');
INSERT INTO participant (p_id, p_name, major_work) VALUES (110036, 'Valeria Britos', '0227942');
INSERT INTO participant (p_id, p_name, major_work) VALUES (110518, 'Daniel Brochu', '0118972');
INSERT INTO participant (p_id, p_name, major_work) VALUES (118840, 'Zbigniew Buczkowski', '0162053');
INSERT INTO participant (p_id, p_name, major_work) VALUES (120662, 'Umberto Buonocuore', '0370168');
INSERT INTO participant (p_id, p_name, major_work) VALUES (122184, 'Daniel Burman', '13587032');
INSERT INTO participant (p_id, p_name, major_work) VALUES (127382, 'Luc Caals', '0227917');
INSERT INTO participant (p_id, p_name, major_work) VALUES (130282, 'K Callan', '8946378');
INSERT INTO participant (p_id, p_name, major_work) VALUES (130324, 'Charlie Callas', '0076538');
INSERT INTO participant (p_id, p_name, major_work) VALUES (132616, 'Karen Campbell', '2083582');
INSERT INTO participant (p_id, p_name, major_work) VALUES (133936, 'Mary Grace Canfield', '0058808');
INSERT INTO participant (p_id, p_name, major_work) VALUES (137262, 'Adam Carl', '0103060');
INSERT INTO participant (p_id, p_name, major_work) VALUES (138612, 'Roberto Carnaghi', '0497154');
INSERT INTO participant (p_id, p_name, major_work) VALUES (139910, 'Gloria Carrá', '4413338');
INSERT INTO participant (p_id, p_name, major_work) VALUES (141745, 'June Carter Cash', '0063919');
INSERT INTO participant (p_id, p_name, major_work) VALUES (143599, 'Johnny Cash', '0063919');
INSERT INTO participant (p_id, p_name, major_work) VALUES (143918, 'Peggy Cass', '0051383');
INSERT INTO participant (p_id, p_name, major_work) VALUES (144269, 'Alex Cassiers', '0238794');
INSERT INTO participant (p_id, p_name, major_work) VALUES (147310, 'Stephanie Cayo', '10308928');
INSERT INTO participant (p_id, p_name, major_work) VALUES (147689, 'Derek Cecil', '1856010');
INSERT INTO participant (p_id, p_name, major_work) VALUES (149942, 'Garry Chalk', '0138959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (152839, 'Tara Strong', '4853102');
INSERT INTO participant (p_id, p_name, major_work) VALUES (154000, 'Christine Chatelain', '0243736');
INSERT INTO participant (p_id, p_name, major_work) VALUES (154811, 'Al Checco', '0062765');
INSERT INTO participant (p_id, p_name, major_work) VALUES (156078, 'Helen Cherry', '0044711');
INSERT INTO participant (p_id, p_name, major_work) VALUES (159609, 'Joe Chrest', '4574334');
INSERT INTO participant (p_id, p_name, major_work) VALUES (162159, 'Bronislaw Cieslak', '0096494');
INSERT INTO participant (p_id, p_name, major_work) VALUES (164800, 'Jacqueline Clarke', '27158093');
INSERT INTO participant (p_id, p_name, major_work) VALUES (169212, 'Andy Cohen', '0476916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (170789, 'Stephanie Cole', '0970468');
INSERT INTO participant (p_id, p_name, major_work) VALUES (173268, 'Marshall Colt', '0089360');
INSERT INTO participant (p_id, p_name, major_work) VALUES (173393, 'Fernando Colunga', '0233092');
INSERT INTO participant (p_id, p_name, major_work) VALUES (175834, 'Kevin Conroy', '4853102');
INSERT INTO participant (p_id, p_name, major_work) VALUES (177532, 'Jon Cooksey', '0380869');
INSERT INTO participant (p_id, p_name, major_work) VALUES (182456, 'Robert Costanzo', '0100802');
INSERT INTO participant (p_id, p_name, major_work) VALUES (185286, 'Wayne Cox', '1173707');
INSERT INTO participant (p_id, p_name, major_work) VALUES (185954, 'Michael Craig', '0096592');
INSERT INTO participant (p_id, p_name, major_work) VALUES (186717, 'Caprice Crawford', '1144825');
INSERT INTO participant (p_id, p_name, major_work) VALUES (188041, 'Myndy Crist', '0268695');
INSERT INTO participant (p_id, p_name, major_work) VALUES (192271, 'Colin Cunningham', '1462059');
INSERT INTO participant (p_id, p_name, major_work) VALUES (194143, 'Zoran Cvijanovic', '22054934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (194159, 'Zeljka Cvjetan', '2561882');
INSERT INTO participant (p_id, p_name, major_work) VALUES (195627, 'Federico D''Elía', '0316613');
INSERT INTO participant (p_id, p_name, major_work) VALUES (195639, 'Jorge D''Elía', '1235548');
INSERT INTO participant (p_id, p_name, major_work) VALUES (200615, 'Dingdong Dantes', '28152455');
INSERT INTO participant (p_id, p_name, major_work) VALUES (203524, 'William Davidson', '0105695');
INSERT INTO participant (p_id, p_name, major_work) VALUES (210034, 'Brigitte De Man', '0252793');
INSERT INTO participant (p_id, p_name, major_work) VALUES (211139, 'Ruud De Ridder', '0227879');
INSERT INTO participant (p_id, p_name, major_work) VALUES (211140, 'Sven De Ridder', '8829128');
INSERT INTO participant (p_id, p_name, major_work) VALUES (211482, 'Damián de Santo', '0447578');
INSERT INTO participant (p_id, p_name, major_work) VALUES (212402, 'Ann De Winne', '0149534');
INSERT INTO participant (p_id, p_name, major_work) VALUES (212818, 'Jimmy Dean', '0066995');
INSERT INTO participant (p_id, p_name, major_work) VALUES (220635, 'Debi Derryberry', '6154272');
INSERT INTO participant (p_id, p_name, major_work) VALUES (225191, 'George DiCenzo', '0088763');
INSERT INTO participant (p_id, p_name, major_work) VALUES (227704, 'Paul Dini', '0147746');
INSERT INTO participant (p_id, p_name, major_work) VALUES (227831, 'Bruce Dinsmore', '0169414');
INSERT INTO participant (p_id, p_name, major_work) VALUES (227885, 'Pasta Dioguardi', '18984314');
INSERT INTO participant (p_id, p_name, major_work) VALUES (231942, 'Elinor Donahue', '0100405');
INSERT INTO participant (p_id, p_name, major_work) VALUES (236519, 'Brian Doyle-Murray', '0080487');
INSERT INTO participant (p_id, p_name, major_work) VALUES (238046, 'Patricia Driscoll', '0047706');
INSERT INTO participant (p_id, p_name, major_work) VALUES (238635, 'Karen Drury', '0108687');
INSERT INTO participant (p_id, p_name, major_work) VALUES (238739, 'Robert Dryer', '0088044');
INSERT INTO participant (p_id, p_name, major_work) VALUES (239294, 'Ellen Dubin', '1160419');
INSERT INTO participant (p_id, p_name, major_work) VALUES (245364, 'Nina Dvorzhetskaya', '0108012');
INSERT INTO participant (p_id, p_name, major_work) VALUES (246705, 'Paty Díaz', '0211878');
INSERT INTO participant (p_id, p_name, major_work) VALUES (249731, 'Sara Edvardsson', '0099959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (250004, 'Geoff Edwards', '0116147');
INSERT INTO participant (p_id, p_name, major_work) VALUES (251705, 'Åsmund Brede Eike', '6076172');
INSERT INTO participant (p_id, p_name, major_work) VALUES (253126, 'Kevin Eldon', '0425112');
INSERT INTO participant (p_id, p_name, major_work) VALUES (254177, 'Cass Elliot', '6264654');
INSERT INTO participant (p_id, p_name, major_work) VALUES (254387, 'Bob Elliott', '0100449');
INSERT INTO participant (p_id, p_name, major_work) VALUES (254402, 'Chris Elliott', '0107048');
INSERT INTO participant (p_id, p_name, major_work) VALUES (255281, 'Daniel Ellsberg', '1319726');
INSERT INTO participant (p_id, p_name, major_work) VALUES (255837, 'Rosalyn Elvin', '0075592');
INSERT INTO participant (p_id, p_name, major_work) VALUES (256529, 'Chris Emmett', '0127369');
INSERT INTO participant (p_id, p_name, major_work) VALUES (257023, 'Elisabeth Engdahl', '0099959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (257237, 'Anke Engelke', '1176729');
INSERT INTO participant (p_id, p_name, major_work) VALUES (258012, 'Nick Enright', '0118735');
INSERT INTO participant (p_id, p_name, major_work) VALUES (258321, 'Gary Epp', '0158622');
INSERT INTO participant (p_id, p_name, major_work) VALUES (260234, 'Ann Esch', '0238794');
INSERT INTO participant (p_id, p_name, major_work) VALUES (262530, 'Andree Evans', '0088503');
INSERT INTO participant (p_id, p_name, major_work) VALUES (263582, 'Erik Everhard', '3983340');
INSERT INTO participant (p_id, p_name, major_work) VALUES (267977, 'Shawn Farquhar', '0160905');
INSERT INTO participant (p_id, p_name, major_work) VALUES (273253, 'Alberto Fernández de Rosa', '2171665');
INSERT INTO participant (p_id, p_name, major_work) VALUES (278442, 'Alejandro Fiore', '1568978');
INSERT INTO participant (p_id, p_name, major_work) VALUES (278920, 'Gisela Fischer', '0061107');
INSERT INTO participant (p_id, p_name, major_work) VALUES (282547, 'Gerald Flood', '0066206');
INSERT INTO participant (p_id, p_name, major_work) VALUES (283747, 'Frank Focketyn', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (285783, 'Melyssa Ford', '1621045');
INSERT INTO participant (p_id, p_name, major_work) VALUES (287515, 'Alejandra Fosalba', '1500561');
INSERT INTO participant (p_id, p_name, major_work) VALUES (287562, 'Wayne Foskett', '0944947');
INSERT INTO participant (p_id, p_name, major_work) VALUES (290475, 'Don Francks', '0082509');
INSERT INTO participant (p_id, p_name, major_work) VALUES (291217, 'Holly Gauthier-Frankel', '12235026');
INSERT INTO participant (p_id, p_name, major_work) VALUES (292187, 'Liz Fraser', '0052911');
INSERT INTO participant (p_id, p_name, major_work) VALUES (296791, 'Taylor Fry', '0113670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (299134, 'Jorge Furtado', '0367859');
INSERT INTO participant (p_id, p_name, major_work) VALUES (301925, 'Vincent Gale', '0408345');
INSERT INTO participant (p_id, p_name, major_work) VALUES (303853, 'Juan Pablo Gamboa', '0211878');
INSERT INTO participant (p_id, p_name, major_work) VALUES (305894, 'Leonardo García Vale', '0883625');
INSERT INTO participant (p_id, p_name, major_work) VALUES (312036, 'Claudia Geisler-Bading', '2177771');
INSERT INTO participant (p_id, p_name, major_work) VALUES (318027, 'Ed Gilbert', '0092106');
INSERT INTO participant (p_id, p_name, major_work) VALUES (318703, 'Michel Gill', '4158110');
INSERT INTO participant (p_id, p_name, major_work) VALUES (319308, 'Tabitha St. Germain', '1751105');
INSERT INTO participant (p_id, p_name, major_work) VALUES (320209, 'Vahina Giocante', '0424237');
INSERT INTO participant (p_id, p_name, major_work) VALUES (323177, 'Susan Glover', '0368794');
INSERT INTO participant (p_id, p_name, major_work) VALUES (323851, 'Willoughby Goddard', '0086746');
INSERT INTO participant (p_id, p_name, major_work) VALUES (324009, 'Patrick Godfrey', '0245844');
INSERT INTO participant (p_id, p_name, major_work) VALUES (326091, 'Jonathan Goldsmith', '6911608');
INSERT INTO participant (p_id, p_name, major_work) VALUES (329588, 'Laila Goody', '3616916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (329848, 'Mariusz Gorczynski', '0087542');
INSERT INTO participant (p_id, p_name, major_work) VALUES (332562, 'Alain Goulem', '1411254');
INSERT INTO participant (p_id, p_name, major_work) VALUES (336125, 'Ona Grauer', '0317676');
INSERT INTO participant (p_id, p_name, major_work) VALUES (340264, 'Rainer Grenkowitz', '0144061');
INSERT INTO participant (p_id, p_name, major_work) VALUES (344006, 'Cindy Grover', '0077766');
INSERT INTO participant (p_id, p_name, major_work) VALUES (344043, 'Stanley Grover', '0087332');
INSERT INTO participant (p_id, p_name, major_work) VALUES (345039, 'Kari Ann Grønsund', '2535202');
INSERT INTO participant (p_id, p_name, major_work) VALUES (346260, 'Sergio Guerrero', '0211878');
INSERT INTO participant (p_id, p_name, major_work) VALUES (346270, 'Álvaro Guerrero', '0245712');
INSERT INTO participant (p_id, p_name, major_work) VALUES (348297, 'Turid Gunnes', '7280898');
INSERT INTO participant (p_id, p_name, major_work) VALUES (348888, 'Aleksey Guskov', '1093383');
INSERT INTO participant (p_id, p_name, major_work) VALUES (350081, 'Magda Guzmán', '0214377');
INSERT INTO participant (p_id, p_name, major_work) VALUES (351758, 'Hilary Haag', '0160521');
INSERT INTO participant (p_id, p_name, major_work) VALUES (352313, 'Miguel Habud', '0189504');
INSERT INTO participant (p_id, p_name, major_work) VALUES (353362, 'Antje Hagen', '0073957');
INSERT INTO participant (p_id, p_name, major_work) VALUES (353588, 'Merle Haggard', '0120885');
INSERT INTO participant (p_id, p_name, major_work) VALUES (358772, 'Roger Hammond', '1504320');
INSERT INTO participant (p_id, p_name, major_work) VALUES (362691, 'Kim Hardy', '0187699');
INSERT INTO participant (p_id, p_name, major_work) VALUES (368561, 'Bob Hastings', '0069113');
INSERT INTO participant (p_id, p_name, major_work) VALUES (368610, 'Nigel Hastings', '0109831');
INSERT INTO participant (p_id, p_name, major_work) VALUES (369954, 'Keeley Hawes', '7493974');
INSERT INTO participant (p_id, p_name, major_work) VALUES (372553, 'Patricia Hearst', '0099329');
INSERT INTO participant (p_id, p_name, major_work) VALUES (373668, 'Alexander Hegarth', '0061305');
INSERT INTO participant (p_id, p_name, major_work) VALUES (379084, 'Klaus Herm', '0108916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (382995, 'Joan Hickson', '0091618');
INSERT INTO participant (p_id, p_name, major_work) VALUES (384494, 'Marianna Hill', '0068699');
INSERT INTO participant (p_id, p_name, major_work) VALUES (386810, 'Ian Hislop', '0108796');
INSERT INTO participant (p_id, p_name, major_work) VALUES (386944, 'Adolf Hitler', '0025913');
INSERT INTO participant (p_id, p_name, major_work) VALUES (390161, 'Arthur Holden', '0365929');
INSERT INTO participant (p_id, p_name, major_work) VALUES (390417, 'Joanna Hole', '1289403');
INSERT INTO participant (p_id, p_name, major_work) VALUES (391563, 'Sarah-Jane Holm', '0166450');
INSERT INTO participant (p_id, p_name, major_work) VALUES (391586, 'Vanja Holm', '0099959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (393222, 'James Hong', '6710474');
INSERT INTO participant (p_id, p_name, major_work) VALUES (395443, 'John Horsley', '0073990');
INSERT INTO participant (p_id, p_name, major_work) VALUES (395950, 'Sôichirô Hoshi', '1263228');
INSERT INTO participant (p_id, p_name, major_work) VALUES (396406, 'Adrian Hough', '6053512');
INSERT INTO participant (p_id, p_name, major_work) VALUES (400803, 'Mica Hughes', '0116414');
INSERT INTO participant (p_id, p_name, major_work) VALUES (401370, 'Pablo Huley', '0221726');
INSERT INTO participant (p_id, p_name, major_work) VALUES (408846, 'Lee Ingleby', '0304141');
INSERT INTO participant (p_id, p_name, major_work) VALUES (409287, 'Kazuhiko Inoue', '0409591');
INSERT INTO participant (p_id, p_name, major_work) VALUES (411879, 'Miki Itô', '2263944');
INSERT INTO participant (p_id, p_name, major_work) VALUES (412336, 'George Ives', '0138524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (413263, 'Andrew Jackson', '12327578');
INSERT INTO participant (p_id, p_name, major_work) VALUES (417712, 'Mihailo ''Misa'' Janketic', '0090524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (418959, 'Paul Jarrett', '1325004');
INSERT INTO participant (p_id, p_name, major_work) VALUES (419248, 'David Jason', '0081912');
INSERT INTO participant (p_id, p_name, major_work) VALUES (419650, 'Jay-Z', '10696784');
INSERT INTO participant (p_id, p_name, major_work) VALUES (419785, 'Michael Jayston', '0067483');
INSERT INTO participant (p_id, p_name, major_work) VALUES (423980, 'Karin Johansson', '0099959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (424527, 'Arte Johnson', '0062601');
INSERT INTO participant (p_id, p_name, major_work) VALUES (427379, 'Kristoffer Joner', '3616916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (429115, 'Rick Jones', '0118617');
INSERT INTO participant (p_id, p_name, major_work) VALUES (431262, 'Dubravko Jovanovic', '0844286');
INSERT INTO participant (p_id, p_name, major_work) VALUES (432823, 'Jessica Jurado', '0211878');
INSERT INTO participant (p_id, p_name, major_work) VALUES (433738, 'Niels Jørgensen', '10288566');
INSERT INTO participant (p_id, p_name, major_work) VALUES (435025, 'Helena Kaij', '0099959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (436778, 'Hiroshi Kamiya', '1480925');
INSERT INTO participant (p_id, p_name, major_work) VALUES (441972, 'Midori Katô', '0236924');
INSERT INTO participant (p_id, p_name, major_work) VALUES (446672, 'Michael Kelly', '1706593');
INSERT INTO participant (p_id, p_name, major_work) VALUES (455242, 'Rowena King', '0825232');
INSERT INTO participant (p_id, p_name, major_work) VALUES (458971, 'Sebastian Klein', '0806910');
INSERT INTO participant (p_id, p_name, major_work) VALUES (464674, 'Kiyoshi Komiyama', '0060038');
INSERT INTO participant (p_id, p_name, major_work) VALUES (467437, 'Mihajlo Kostic-Pljaka', '0179941');
INSERT INTO participant (p_id, p_name, major_work) VALUES (468865, 'Zdzislaw Kozien', '0075226');
INSERT INTO participant (p_id, p_name, major_work) VALUES (469475, 'Chris Kramer', '0380869');
INSERT INTO participant (p_id, p_name, major_work) VALUES (469671, 'Stepfanie Kramer', '0086734');
INSERT INTO participant (p_id, p_name, major_work) VALUES (476889, 'Daniel Kuzniecka', '0124312');
INSERT INTO participant (p_id, p_name, major_work) VALUES (476907, 'Ewa Florczak', '0399943');
INSERT INTO participant (p_id, p_name, major_work) VALUES (482840, 'Libertad Lamarque', '0211878');
INSERT INTO participant (p_id, p_name, major_work) VALUES (482936, 'Dave Lamb', '0227890');
INSERT INTO participant (p_id, p_name, major_work) VALUES (485183, 'Dieter Landuris', '10536638');
INSERT INTO participant (p_id, p_name, major_work) VALUES (486095, 'Christina Lange', '0233033');
INSERT INTO participant (p_id, p_name, major_work) VALUES (486413, 'Chris Langham', '0459159');
INSERT INTO participant (p_id, p_name, major_work) VALUES (487842, 'Ingeborg Lapsien', '0217225');
INSERT INTO participant (p_id, p_name, major_work) VALUES (489292, 'Ulf Larsson', '0101249');
INSERT INTO participant (p_id, p_name, major_work) VALUES (490704, 'Agnes Lauchlan', '0035586');
INSERT INTO participant (p_id, p_name, major_work) VALUES (491551, 'Zarko Lausevic', '3168940');
INSERT INTO participant (p_id, p_name, major_work) VALUES (493200, 'Denis Lawson', '0076759');
INSERT INTO participant (p_id, p_name, major_work) VALUES (496378, 'Philippe Lecuyer', '0109377');
INSERT INTO participant (p_id, p_name, major_work) VALUES (497525, 'Jessica Lee', '0212879');
INSERT INTO participant (p_id, p_name, major_work) VALUES (498472, 'Lee Yeong-ae', '0451094');
INSERT INTO participant (p_id, p_name, major_work) VALUES (499246, 'Anna Legchilova', '2094767');
INSERT INTO participant (p_id, p_name, major_work) VALUES (500398, 'Tina Leijonberg', '0108970');
INSERT INTO participant (p_id, p_name, major_work) VALUES (502035, 'Dianne Lennon', '0063916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (502043, 'Janet Lennon', '0063925');
INSERT INTO participant (p_id, p_name, major_work) VALUES (502051, 'Kathy Lennon', '0063925');
INSERT INTO participant (p_id, p_name, major_work) VALUES (502056, 'Peggy Lennon', '0063925');
INSERT INTO participant (p_id, p_name, major_work) VALUES (504489, 'Loren Lester', '0264235');
INSERT INTO participant (p_id, p_name, major_work) VALUES (507691, 'Robert Q. Lewis', '0068555');
INSERT INTO participant (p_id, p_name, major_work) VALUES (508877, 'Andrea Libman', '1751105');
INSERT INTO participant (p_id, p_name, major_work) VALUES (519296, 'Claudine Longet', '0063415');
INSERT INTO participant (p_id, p_name, major_work) VALUES (519933, 'Nuno Lopes', '4895668');
INSERT INTO participant (p_id, p_name, major_work) VALUES (526103, 'Gianni Lunadei', '0271718');
INSERT INTO participant (p_id, p_name, major_work) VALUES (527179, 'Valerie Lush', '0228526');
INSERT INTO participant (p_id, p_name, major_work) VALUES (528433, 'Richard Lynch', '0373883');
INSERT INTO participant (p_id, p_name, major_work) VALUES (530308, 'Patricia López', '0480459');
INSERT INTO participant (p_id, p_name, major_work) VALUES (531933, 'Shauna Macdonald', '0435625');
INSERT INTO participant (p_id, p_name, major_work) VALUES (537854, 'Fred Maire', '1492219');
INSERT INTO participant (p_id, p_name, major_work) VALUES (539197, 'Alejandra Maldonado', '10946934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (539687, 'Sasa Malinic', '0090524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (542603, 'Stephen Manley', '0088170');
INSERT INTO participant (p_id, p_name, major_work) VALUES (542652, 'Art Mann', '0449452');
INSERT INTO participant (p_id, p_name, major_work) VALUES (544718, 'Kate Mara', '1502712');
INSERT INTO participant (p_id, p_name, major_work) VALUES (550462, 'Roy Marsden', '0077078');
INSERT INTO participant (p_id, p_name, major_work) VALUES (551502, 'K.C. Martel', '0083866');
INSERT INTO participant (p_id, p_name, major_work) VALUES (553013, 'Rosemary Martin', '0080009');
INSERT INTO participant (p_id, p_name, major_work) VALUES (553436, 'A Martinez', '1836037');
INSERT INTO participant (p_id, p_name, major_work) VALUES (558520, 'Ali Marie Matheson', '0380869');
INSERT INTO participant (p_id, p_name, major_work) VALUES (559193, 'Andy Maton', '0250687');
INSERT INTO participant (p_id, p_name, major_work) VALUES (561841, 'Mark Maxwell-Smith', '0198071');
INSERT INTO participant (p_id, p_name, major_work) VALUES (561890, 'Charmian May', '0243155');
INSERT INTO participant (p_id, p_name, major_work) VALUES (562768, 'Judi Maynard', '0120514');
INSERT INTO participant (p_id, p_name, major_work) VALUES (563983, 'Jennifer McAllister', '0081485');
INSERT INTO participant (p_id, p_name, major_work) VALUES (565907, 'Leigh McCloskey', '0080923');
INSERT INTO participant (p_id, p_name, major_work) VALUES (566331, 'Rhys McConnochie', '0056751');
INSERT INTO participant (p_id, p_name, major_work) VALUES (579914, 'Scott Menville', '0343314');
INSERT INTO participant (p_id, p_name, major_work) VALUES (581536, 'Thorsten Merten', '0304126');
INSERT INTO participant (p_id, p_name, major_work) VALUES (581751, 'Edgardo Mesa', '0303536');
INSERT INTO participant (p_id, p_name, major_work) VALUES (581762, 'Juan Carlos Mesa', '0193784');
INSERT INTO participant (p_id, p_name, major_work) VALUES (583472, 'Joel Meyerowitz', '0133302');
INSERT INTO participant (p_id, p_name, major_work) VALUES (583701, 'Dirk Meynendonckx', '0162076');
INSERT INTO participant (p_id, p_name, major_work) VALUES (586528, 'Shin''ichirô Miki', '0156887');
INSERT INTO participant (p_id, p_name, major_work) VALUES (592400, 'David Mirkin', '0096697');
INSERT INTO participant (p_id, p_name, major_work) VALUES (592950, 'Cláudia Missura', '0279783');
INSERT INTO participant (p_id, p_name, major_work) VALUES (596959, 'Richard Moll', '0179116');
INSERT INTO participant (p_id, p_name, major_work) VALUES (599649, 'Eugenio Montessoro', '7312128');
INSERT INTO participant (p_id, p_name, major_work) VALUES (603800, 'Cris Morena', '1151030');
INSERT INTO participant (p_id, p_name, major_work) VALUES (606043, 'Sechaba Morojele', '0316826');
INSERT INTO participant (p_id, p_name, major_work) VALUES (612818, 'Rob Mungle', '0115263');
INSERT INTO participant (p_id, p_name, major_work) VALUES (614877, 'Chad Michael Murray', '0368530');
INSERT INTO participant (p_id, p_name, major_work) VALUES (617921, 'Jörgen Mörnbäck', '24655348');
INSERT INTO participant (p_id, p_name, major_work) VALUES (625899, 'Scott Nemes', '0090459');
INSERT INTO participant (p_id, p_name, major_work) VALUES (628606, 'Todd Newton', '1742341');
INSERT INTO participant (p_id, p_name, major_work) VALUES (628649, 'Michiko Neya', '0421357');
INSERT INTO participant (p_id, p_name, major_work) VALUES (634323, 'Matt Nolan', '1024648');
INSERT INTO participant (p_id, p_name, major_work) VALUES (640734, 'Charlie O''Donnell', '0109480');
INSERT INTO participant (p_id, p_name, major_work) VALUES (642601, 'Colleen O''Shaughnessey', '3794354');
INSERT INTO participant (p_id, p_name, major_work) VALUES (644740, 'Natalie Ogle', '0820333');
INSERT INTO participant (p_id, p_name, major_work) VALUES (645636, 'Ryôtarô Okiayu', '0247514');
INSERT INTO participant (p_id, p_name, major_work) VALUES (645806, 'Aleksander Okunev', '0300140');
INSERT INTO participant (p_id, p_name, major_work) VALUES (647434, 'Boy Olmi', '1313256');
INSERT INTO participant (p_id, p_name, major_work) VALUES (653626, 'Mads Ousdal', '1528769');
INSERT INTO participant (p_id, p_name, major_work) VALUES (656452, 'Nicola Pagett', '0112427');
INSERT INTO participant (p_id, p_name, major_work) VALUES (666547, 'Chris Patton', '0421357');
INSERT INTO participant (p_id, p_name, major_work) VALUES (668271, 'Bruce Payne', '0105104');
INSERT INTO participant (p_id, p_name, major_work) VALUES (673391, 'Diego Peretti', '0316613');
INSERT INTO participant (p_id, p_name, major_work) VALUES (673897, 'Carl Perkins', '1440129');
INSERT INTO participant (p_id, p_name, major_work) VALUES (674977, 'Barbara Perry', '0090192');
INSERT INTO participant (p_id, p_name, major_work) VALUES (675340, 'Ty Perry', '0043233');
INSERT INTO participant (p_id, p_name, major_work) VALUES (678070, 'Allison Petroff', '0826211');
INSERT INTO participant (p_id, p_name, major_work) VALUES (679984, 'Ulli Philipp', '0377896');
INSERT INTO participant (p_id, p_name, major_work) VALUES (685142, 'Paulo Pires', '0229881');
INSERT INTO participant (p_id, p_name, major_work) VALUES (692927, 'Oliver Postgate', '0070970');
INSERT INTO participant (p_id, p_name, major_work) VALUES (694619, 'Stefanie Powers', '0078622');
INSERT INTO participant (p_id, p_name, major_work) VALUES (695831, 'Doug Preis', '0187819');
INSERT INTO participant (p_id, p_name, major_work) VALUES (698444, 'Rajko Prodanovic', '0090524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (698512, 'Janos Prohaska', '0060028');
INSERT INTO participant (p_id, p_name, major_work) VALUES (700529, 'Julian Pulvermacher', '0348150');
INSERT INTO participant (p_id, p_name, major_work) VALUES (705779, 'Eric Radomski', '0103359');
INSERT INTO participant (p_id, p_name, major_work) VALUES (706709, 'Anki Rahlskog', '0098841');
INSERT INTO participant (p_id, p_name, major_work) VALUES (708698, 'Lázaro Ramos', '10395866');
INSERT INTO participant (p_id, p_name, major_work) VALUES (710884, 'David Rappaport', '0081633');
INSERT INTO participant (p_id, p_name, major_work) VALUES (710938, 'Kseniya Rappoport', '1379222');
INSERT INTO participant (p_id, p_name, major_work) VALUES (719535, 'Gino Renni', '0220195');
INSERT INTO participant (p_id, p_name, major_work) VALUES (720184, 'Ingrid Resch', '0772790');
INSERT INTO participant (p_id, p_name, major_work) VALUES (720304, 'Adam Resnick', '0266452');
INSERT INTO participant (p_id, p_name, major_work) VALUES (722619, 'Griff Rhys Jones', '0088475');
INSERT INTO participant (p_id, p_name, major_work) VALUES (722676, 'Monica Rial', '4644488');
INSERT INTO participant (p_id, p_name, major_work) VALUES (723218, 'Juan Carlos Ricci', '0494732');
INSERT INTO participant (p_id, p_name, major_work) VALUES (724656, 'Kevin Michael Richardson', '0113855');
INSERT INTO participant (p_id, p_name, major_work) VALUES (726167, 'Thure Riefenstein', '1740299');
INSERT INTO participant (p_id, p_name, major_work) VALUES (726315, 'Marikena Riera', '0370118');
INSERT INTO participant (p_id, p_name, major_work) VALUES (726939, 'Robin Riker', '0086677');
INSERT INTO participant (p_id, p_name, major_work) VALUES (728751, 'Gudrun Ritter', '0993842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (730168, 'Sam Robards', '0212720');
INSERT INTO participant (p_id, p_name, major_work) VALUES (730419, 'Marty Robbins', '3593684');
INSERT INTO participant (p_id, p_name, major_work) VALUES (746125, 'Brandon Routh', '0348150');
INSERT INTO participant (p_id, p_name, major_work) VALUES (748387, 'Ximena Gonzalez-Rubio', '3005242');
INSERT INTO participant (p_id, p_name, major_work) VALUES (749008, 'Álvaro Rudolphy', '1500561');
INSERT INTO participant (p_id, p_name, major_work) VALUES (752490, 'Daniel Ryan', '8425404');
INSERT INTO participant (p_id, p_name, major_work) VALUES (753486, 'Ryu Seung-beom', '1843120');
INSERT INTO participant (p_id, p_name, major_work) VALUES (760254, 'Jeffrey D. Sams', '11238096');
INSERT INTO participant (p_id, p_name, major_work) VALUES (761809, 'Martyn Sanderson', '0120737');
INSERT INTO participant (p_id, p_name, major_work) VALUES (762191, 'Nick Sandow', '2372162');
INSERT INTO participant (p_id, p_name, major_work) VALUES (771510, 'Lina Schiffer', '0341522');
INSERT INTO participant (p_id, p_name, major_work) VALUES (771706, 'Nikolaus Schilling', '1568967');
INSERT INTO participant (p_id, p_name, major_work) VALUES (773846, 'Helmi Schneider', '0806910');
INSERT INTO participant (p_id, p_name, major_work) VALUES (778081, 'Patricia Schäfer', '0108979');
INSERT INTO participant (p_id, p_name, major_work) VALUES (781493, 'Martín Seefeld', '5133308');
INSERT INTO participant (p_id, p_name, major_work) VALUES (782840, 'Tomokazu Seki', '1910272');
INSERT INTO participant (p_id, p_name, major_work) VALUES (783314, 'Connie Sellecca', '0081871');
INSERT INTO participant (p_id, p_name, major_work) VALUES (786465, 'Ninón Sevilla', '0136430');
INSERT INTO participant (p_id, p_name, major_work) VALUES (788958, 'Bo Sharon', '0098802');
INSERT INTO participant (p_id, p_name, major_work) VALUES (793892, 'Bill Shine', '0040725');
INSERT INTO participant (p_id, p_name, major_work) VALUES (797725, 'James Sikking', '0107798');
INSERT INTO participant (p_id, p_name, major_work) VALUES (797931, 'Malin Silbo', '0099959');
INSERT INTO participant (p_id, p_name, major_work) VALUES (798025, 'Marc Silk', '0120915');
INSERT INTO participant (p_id, p_name, major_work) VALUES (800219, 'Josette Simon', '0451279');
INSERT INTO participant (p_id, p_name, major_work) VALUES (803756, 'Bjørn Skagestad', '0205619');
INSERT INTO participant (p_id, p_name, major_work) VALUES (804887, 'Steve Skrovan', '0115167');
INSERT INTO participant (p_id, p_name, major_work) VALUES (809321, 'Mel Smith', '0093779');
INSERT INTO participant (p_id, p_name, major_work) VALUES (815071, 'Arleen Sorkin', '0058796');
INSERT INTO participant (p_id, p_name, major_work) VALUES (816828, 'Gabriela Spanic', '0211878');
INSERT INTO participant (p_id, p_name, major_work) VALUES (817043, 'Stephen Sparks', '1423894');
INSERT INTO participant (p_id, p_name, major_work) VALUES (827298, 'Pamela Stephenson', '0086393');
INSERT INTO participant (p_id, p_name, major_work) VALUES (827695, 'Gardner Stern', '0106079');
INSERT INTO participant (p_id, p_name, major_work) VALUES (828696, 'Ray Stevens', '0082136');
INSERT INTO participant (p_id, p_name, major_work) VALUES (828745, 'Ronnie Stevens', '0120783');
INSERT INTO participant (p_id, p_name, major_work) VALUES (829484, 'Jay Stewart', '0089114');
INSERT INTO participant (p_id, p_name, major_work) VALUES (833080, 'Günter Strack', '0061107');
INSERT INTO participant (p_id, p_name, major_work) VALUES (835292, 'Semyon Strugachyov', '0114055');
INSERT INTO participant (p_id, p_name, major_work) VALUES (839578, 'Fernando Sureda', '0316613');
INSERT INTO participant (p_id, p_name, major_work) VALUES (843955, 'Andrzej Szenajch', '2229201');
INSERT INTO participant (p_id, p_name, major_work) VALUES (845297, 'Jan Sælid', '0882285');
INSERT INTO participant (p_id, p_name, major_work) VALUES (848801, 'Yukari Tamura', '1910272');
INSERT INTO participant (p_id, p_name, major_work) VALUES (852438, 'Gwen Taylor', '0079470');
INSERT INTO participant (p_id, p_name, major_work) VALUES (853299, 'Vaughn Taylor', '0054215');
INSERT INTO participant (p_id, p_name, major_work) VALUES (857953, 'Gudrun Thielemann', '0453235');
INSERT INTO participant (p_id, p_name, major_work) VALUES (861726, 'Juan Carlos Thorry', '0200543');
INSERT INTO participant (p_id, p_name, major_work) VALUES (861830, 'Johan Thorén', '0083922');
INSERT INTO participant (p_id, p_name, major_work) VALUES (863192, 'Peter Tilbury', '0108723');
INSERT INTO participant (p_id, p_name, major_work) VALUES (863622, 'Bruce Timm', '0103359');
INSERT INTO participant (p_id, p_name, major_work) VALUES (864736, 'Sina Tkotsch', '1242543');
INSERT INTO participant (p_id, p_name, major_work) VALUES (864908, 'Zdzislaw Tobiasz', '0399943');
INSERT INTO participant (p_id, p_name, major_work) VALUES (865395, 'Ljubimir Todorovic', '0398442');
INSERT INTO participant (p_id, p_name, major_work) VALUES (879239, 'Margaret Tyzack', '0066921');
INSERT INTO participant (p_id, p_name, major_work) VALUES (887336, 'Fred Van Kuyk', '0227974');
INSERT INTO participant (p_id, p_name, major_work) VALUES (887625, 'Inge Van Olmen', '0243700');
INSERT INTO participant (p_id, p_name, major_work) VALUES (887931, 'Guy Van Sande', '5518944');
INSERT INTO participant (p_id, p_name, major_work) VALUES (891391, 'Ramiro Vayo', '3011894');
INSERT INTO participant (p_id, p_name, major_work) VALUES (891796, 'Antonio de la Vega', '1264787');
INSERT INTO participant (p_id, p_name, major_work) VALUES (893257, 'Milo Ventimiglia', '0813715');
INSERT INTO participant (p_id, p_name, major_work) VALUES (898905, 'John Vine', '0083987');
INSERT INTO participant (p_id, p_name, major_work) VALUES (899211, 'Gabriele Violet', '0108916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (903443, 'Gigi Vorgan', '0077766');
INSERT INTO participant (p_id, p_name, major_work) VALUES (905357, 'Steven Waddington', '1464335');
INSERT INTO participant (p_id, p_name, major_work) VALUES (907636, 'Clint Walker', '0061578');
INSERT INTO participant (p_id, p_name, major_work) VALUES (910076, 'Lisa Ann Walter', '0120783');
INSERT INTO participant (p_id, p_name, major_work) VALUES (915750, 'David Weatherley', '0120737');
INSERT INTO participant (p_id, p_name, major_work) VALUES (918805, 'Gustl Weishappel', '0806910');
INSERT INTO participant (p_id, p_name, major_work) VALUES (921044, 'Klaus Wennemann', '0082096');
INSERT INTO participant (p_id, p_name, major_work) VALUES (921699, 'Cathy Weseluck', '1751105');
INSERT INTO participant (p_id, p_name, major_work) VALUES (922967, 'Jack Weston', '0092890');
INSERT INTO participant (p_id, p_name, major_work) VALUES (923299, 'Eleonora Wexler', '1375688');
INSERT INTO participant (p_id, p_name, major_work) VALUES (925811, 'Thelma Whiteley', '0159857');
INSERT INTO participant (p_id, p_name, major_work) VALUES (928053, 'Hans Wiktorsson', '0094468');
INSERT INTO participant (p_id, p_name, major_work) VALUES (930023, 'Andy Williams', '7888964');
INSERT INTO participant (p_id, p_name, major_work) VALUES (930568, 'Eugene Williams', '0107286');
INSERT INTO participant (p_id, p_name, major_work) VALUES (932767, 'Hanne Willumsen', '0324870');
INSERT INTO participant (p_id, p_name, major_work) VALUES (941506, 'Jo Anne Worley', '0101414');
INSERT INTO participant (p_id, p_name, major_work) VALUES (943823, 'Tim Wylton', '0112130');
INSERT INTO participant (p_id, p_name, major_work) VALUES (946148, '''Weird Al'' Yankovic', '0098546');
INSERT INTO participant (p_id, p_name, major_work) VALUES (948985, 'Kazuko Yoshikawa', '0140346');
INSERT INTO participant (p_id, p_name, major_work) VALUES (949049, 'Hiroyuki Yoshino', '1334722');
INSERT INTO participant (p_id, p_name, major_work) VALUES (950725, 'Gareth Yuen', '0448011');
INSERT INTO participant (p_id, p_name, major_work) VALUES (954348, 'Johannes Zeiler', '2776900');
INSERT INTO participant (p_id, p_name, major_work) VALUES (956544, 'Efrem Zimbalist Jr.', '0062467');
INSERT INTO participant (p_id, p_name, major_work) VALUES (957372, 'Velimir ''Bata'' Zivojinovic', '0069452');
INSERT INTO participant (p_id, p_name, major_work) VALUES (961577, 'Frank Pugliese', '1856010');
INSERT INTO participant (p_id, p_name, major_work) VALUES (990444, 'Alberto Casanova', '1687984');
INSERT INTO participant (p_id, p_name, major_work) VALUES (991525, 'The Statler Brothers', '0114369');
INSERT INTO participant (p_id, p_name, major_work) VALUES (991810, 'Mahershala Ali', '12747748');
INSERT INTO participant (p_id, p_name, major_work) VALUES (997457, 'Kiko Mascarenhas', '2332518');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1001404, 'David Matranga', '5626028');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1005239, 'Luis Miranda', '0989007');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1009405, 'Sunshine Dizon', '0856128');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1014554, 'Shelley Calene-Black', '7738450');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1025967, 'Felipe Cardoso', '3094452');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1036361, 'Brooke Burke', '1597420');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1039941, 'Shannon Emerick', '0090248');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1040396, 'Jung Suk-yong', '5700672');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1045034, 'Yu-jeong Choi', '0469698');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1046845, 'Song Hye-kyo', '1462900');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1085519, 'Nina Gummich', '1210018');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1097221, 'Kelson Henderson', '0499549');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1110625, 'Wilmer Ramírez', '14090408');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1120190, 'Mick Blue', '13207736');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1120335, 'Kim Jeong-hak', '0306909');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1128564, 'Kitana Baker', '0138524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1138201, 'Song Jae-ho', '0353969');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1138942, 'Aidan Drummond', '0380869');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1142722, 'Keith Silverstein', '11585486');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1153052, 'Rob van Vuuren', '4761112');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1154160, 'Sheila Allen', '0314331');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1155055, 'Deanna Dezmari', '10280296');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1160233, 'Daisuke Sakaguchi', '0851578');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1167933, 'Damián Szifron', '3011894');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1168954, 'Mario Fernandez', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1169354, 'Alain Prost', '6758316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1176497, 'Sonya Salomaa', '0409459');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1192046, 'Mike Rowe', '0458259');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1197589, 'Alice Bah', '8060454');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1204639, 'Christopher Wehkamp', '5626028');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1206729, 'William J. Eggleston', '0119080');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1210304, 'Gitte Melgaard', '0319945');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1210922, 'Carolina Tejera', '0355090');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1223801, 'Xavier Fagnon', '2842418');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1236850, 'Cindy Taylor', '0396269');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1246394, 'Marc Graue', '1571573');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1256270, 'Joe Francis', '2100482');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1259826, 'Leticia Moreira', '0182918');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1266343, 'Birgitte Lillesø', '0341833');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1270699, 'Glaiza De Castro', '1097606');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1275273, 'Lashawn Daniels', '4218572');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1276077, 'Fred Jerkins', '0181316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1276078, 'Rodney Jerkins', '0181316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1276570, 'The Marquis Chimps', '0054390');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1281009, 'Jerzy Rogalski', '0399943');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1283558, 'Louise Lautrop', '0245027');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1284248, 'Tina Rosendahl', '0341833');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1284907, 'Fernanda de Freitas', '0861739');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1285135, 'Pavel Maykov', '0337898');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1293137, 'Andrzej Konopka', '5278832');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1293376, 'The Lennon Sisters', '0120669');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1296163, 'Roman Kosierkiewicz', '0087542');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1306481, 'Graziella Schimitt', '0144724');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1308423, 'Ryan Lewis', '6048930');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1315378, 'Kayvan Novak', '1341167');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1326574, 'Carlos Cerutti', '0312176');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1328076, 'Miyuki Sawashiro', '1473235');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1335221, 'Sheilah Pacete', '0292870');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1335996, 'Ane Dahl Torp', '3616916');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1350869, 'Józef Korzeniowski', '0091536');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1353833, 'Pavel Artemev', '3365734');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1362936, 'Sigrid Alegría', '0363292');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1372052, 'Kingsford Siayor', '19899752');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1390122, 'Kim Hae-sook', '0762073');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1410260, 'Víctor Carrasco', '0379108');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1416557, 'Matías Oviedo', '8565148');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1418935, 'Andrew Toth', '0374407');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1441167, 'Vuyo Dabula', '1057500');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1450227, 'Jo Hyeon-jae', '5010664');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1454130, 'Mother Maybelle Carter', '0190590');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1455618, 'Dmitriy Bykovskiy-Romashov', '2802154');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1456039, 'The Tennessee Three', '0065989');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1459783, 'Andrei Pavlovets', '0381781');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1459785, 'Olga Pavlovets', '4810954');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1460856, 'Dmitriy Isaev', '0414720');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1475685, 'Honório Torrealba', '0091643');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1478739, 'The Osmonds', '1196204');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1480633, 'Theo Becker', '0486791');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1486492, 'Lotta Engberg', '24655348');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1493168, 'Kristin Kaspersen', '0398468');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1493623, 'Julio Milostich', '1244386');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1495361, 'Gera Sandler', '1392882');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1502440, 'Martin Parr', '0399483');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1507995, 'Kim Byeong-chun', '13715448');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1521684, 'David McNally', '0826211');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1525194, 'Hisayoshi Suganuma', '1345450');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1552764, 'Jesús Zavala', '10648198');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1591496, 'Mike Colter', '3322314');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1596202, 'Leandro Lima', '0317248');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1617276, 'Noriaki Sugiyama', '0409591');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1621645, 'Ola Lindholm', '16227566');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1625839, 'Veikko Täär', '0459877');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1628056, 'Rhoda Montemayor', '0784920');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1645334, 'Luis Gerardo Méndez', '5033998');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1649880, 'James Ngcobo', '9426290');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1650932, 'Ali Liebert', '22296044');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1652223, 'Tommy Cash', '5664502');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1679609, 'Agneta Bolme Börjefors', '0221759');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1683003, 'Hiro Shimono', '11032374');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1690630, 'Rebecca Shoichet', '1751105');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1712157, 'Lara Spencer', '6264654');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1727356, 'Rasmus Hardiker', '1240982');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1739645, 'Adriana DeMeo', '6297682');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1739987, 'Luke Neal', '11656892');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1764351, 'Nicky Whelan', '0480687');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1767820, 'Samantha Hanratty', '11041332');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1784913, 'Kirill Taskin', '0435978');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1791970, 'Rickard Olsson', '24655348');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1814328, 'Blake Shepard', '3563898');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1835909, 'Viktoriya Isakova', '3005822');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1840982, 'Suzette Doctolero', '31229516');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1846255, 'Andrés Velencoso', '5089786');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1856035, 'Betty Hass', '0371461');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1868320, 'Ashleigh Ball', '1751105');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1890752, 'Gary Alazraki', '13249596');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1891021, 'Ireen Kennik', '0445736');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1907686, 'Antonia Santa María', '1725003');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1908654, 'Nelly Pujols', '0084615');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1931870, 'Brittney Karbowski', '3358020');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1938760, 'Veronica Goldstein', '0269541');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1947809, 'Marcelo Flores', '5422000');
INSERT INTO participant (p_id, p_name, major_work) VALUES (1958945, 'Jorge Tuero', '0470112');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2017335, 'James Beaufort', '11671006');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2064061, 'Marian Rivera', '28152455');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2080557, 'Nathan Darrow', '1856010');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2096872, 'Thomas Van Goethem', '1755138');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2096958, 'Alain Rinckhout', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2097384, 'Nina Eileen Sponnich', '0493298');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2097951, 'Priske Dehandschutter', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2102472, 'Tom Saeys', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2104765, 'Yann Van den Branden', '0490714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2105255, 'Sarah Roemer', '0486822');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2125592, 'The Carter Family', '0063919');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2126217, 'Nelson Riddle and his Orchestra', '0118789');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2157205, 'Gerald Urquhart', '0784920');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2197593, 'Samuell Benta', '2586996');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2206168, 'Ferdinand Hofer', '0780134');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2254468, 'Celine Reymond', '1434618');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2274179, 'Peter Galassi', '1587144');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2278073, 'Lydia Nelsen', '2091745');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2301857, 'Gabor Harrach', '1815022');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2315320, 'Paula Richard', '4855286');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2316240, 'Ryohei Kimura', '3011126');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2325042, 'Jonathan Harden', '13138834');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2351099, 'Oh Dae-gyoo', '7795286');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2354456, 'Ha-na Jung', '5690190');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2366973, 'Michelle Keffer', '1454705');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2392667, 'Aliya-Jasmine Sovani', '26458786');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2406892, 'Ben Ketai', '2390334');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2416210, 'Craig Alan Ries', '6371572');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2444889, 'Mariya Lugovaya', '8285216');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2470989, 'Jeong Jong-joon', '5057310');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2475153, 'Danielle Replogle', '3070022');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2512813, 'Andrea Trisdale', '0455960');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2542294, 'Matthew Elkins', '15222080');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2545508, 'Joey Luthman', '8129682');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2559633, 'Young-yu Lee', '4634542');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2564906, 'Caitlin Murphy', '0784920');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2614895, 'Bárbara Ruiz-Tagle', '1244386');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2617059, 'Judith Browne Dianis', '2347411');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2659916, 'Dmitriy Averin', '5030100');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2755953, 'Ed Gaughan', '1425933');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2757852, 'Christian Contreras', '3804114');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2761576, 'Maksim Bityukov', '8664988');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2765628, 'Tshaw Beyonce', '12402868');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2775491, 'Alia Al-Yafi', '1117539');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2779259, 'Shannon Wallschlaeger', '4083048');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2792327, 'Tommy Robinson', '0241108');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2802722, 'Beau Willimon', '1124035');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2807968, 'John Robinson', '1122577');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2811661, 'Kylie Padilla', '5861134');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2815503, 'George Sauma', '8591986');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2835675, 'Michael Lam', '4680240');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2844388, 'Keiran Lee', '4863792');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2858333, 'Justin Doescher', '4921338');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2894067, 'Sampei Shirato', '31566534');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2904398, 'German Regalado', '0078052');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2965079, 'Caitlin Carmichael', '5723286');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2969210, 'David Wald', '2560140');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2976444, 'Tomasz Knapik', '1499230');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2976492, 'Aoi Yûki', '5311514');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2983438, 'Katarzyna Warnke', '1901024');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2988465, 'Francisco Angelini', '1687984');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2997812, 'Nuno Gama', '1521184');
INSERT INTO participant (p_id, p_name, major_work) VALUES (2999303, 'Ana Salazar', '0129105');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3000270, 'Nayma', '4125568');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3006818, 'Lio Tipton', '2140619');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3025446, 'Brendan Rien', '1590825');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3090277, 'Drano', '11752776');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3105989, 'Nikki Cortez', '0134269');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3108867, 'Michael Ihnow', '5678308');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3117334, 'Jenner Furst', '6133034');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3125371, 'David Byrne', '1288869');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3141801, 'Andrew Dillon', '4707450');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3148346, 'Armando Torrea', '2265690');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3201579, 'Ava Addams', '12770344');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3220973, 'Jaime Alguersuari', '6758316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3270875, 'Carla Paterson', '0826211');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3271473, 'Austin Stowell', '3682448');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3323035, 'Mikhail Grushevskiy', '4419390');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3328412, 'Oisín Stack', '2404311');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3392665, 'Yoshiko Yamamoto', '8932048');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3413191, 'Pearl Thusi', '4180514');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3419179, 'Nathalie Frederick', '10863566');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3447129, 'Robert Adams', '0495556');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3454470, 'Sergey Pioro', '0176207');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3516424, 'Luísa Beirão', '1542799');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3520630, 'Tanya Zabarylo', '14297038');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3524843, 'Matt Santos', '0106053');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3531173, 'Anneika Rose', '2303687');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3544802, 'Maximilian Allgeier', '15852584');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3606341, 'Makiko Itô', '0059212');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3629180, 'Malena Villa', '7204348');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3631553, 'Bill Bailey', '1733291');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3637677, 'Jessica Kardos', '4016454');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3647085, 'Paula Jubé', '1353137');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3651589, 'Simen E. Waksvik', '1398033');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3680986, 'Aileen Burdock', '8772296');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3688478, 'Chi Mhende', '3296962');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3692666, 'Sébastien Buemi', '6758316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3703274, 'Sienna Bohn', '15730720');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3727250, 'Irina Chipizhenko', '7520532');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3738444, 'Jago Cooper', '7407950');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3749397, 'Julia Willoughby Nason', '26340238');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3820112, 'David Robert', '2709052');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3821405, 'Jake Lacy', '2402927');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3856456, 'Rocco Nacino', '1961180');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3866538, 'Aron Lehmann', '7776838');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3872143, 'Gisa Flake', '10116488');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3901455, 'Mariana Treviño', '7405458');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3907729, 'Stepan Devonin', '8845840');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3912020, 'Daniel Ricciardo', '21151384');
INSERT INTO participant (p_id, p_name, major_work) VALUES (3944581, 'Helmut Marko', '6758316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4013413, 'Joey Richter', '4459758');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4057338, 'Solenn Heussaff', '1886693');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4095201, 'Roberto Prieto', '2367785');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4096266, 'Alexander Le Bas', '9018886');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4117720, 'Tomás Sala', '4311498');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4166234, 'Danny McGinlay', '2332096');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4204713, 'Mark Alazraki', '8498114');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4211410, 'Sarah Armstrong', '4196776');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4219049, 'Jonathan Greenblatt', '8118934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4265826, 'Luisina Quarleri', '1219289');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4334345, 'Scott Stoked', '2508460');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4348131, 'Barbara Ricci', '0105785');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4377217, 'Shaun Blaney', '4577468');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4406070, 'Corinne Sudberg', '4869896');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4419194, 'Daniil Kvyat', '6758316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4419278, 'Jean-Éric Vergne', '6758316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4528537, 'Nick Antosca', '4820370');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4561542, 'Charlotte Thompson', '5373854');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4582537, 'Erik Scott Kimerer', '2425098');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4627007, 'Juan Manuel Gonzalez Calcaneo', '1606854');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4628079, 'Michael Yerxa', '5503490');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4629612, 'Jean-Paul Bevilacqua', '1606854');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4635210, 'Philip Tetro', '4073308');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4636726, 'Jonathan Morton-Schuster', '1606854');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4640074, 'Matt Barker', '1606854');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4647943, 'Mikhail Pshenichnyy', '11204154');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4651402, 'Dean McArthur', '1606854');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4695420, 'Ole Martin Aune Nilsen', '0905372');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4727722, 'Juri Winkler', '1679276');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4739645, 'Masayuki Akasaka', '6795336');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4829112, 'Oli White', '5838282');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4853585, 'Lyubava Greshnova', '8721954');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4856047, 'Demetria Lucas', '3437610');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4889703, 'Frans Limburg', '0784920');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4934471, 'Piotr Witkowski', '10131762');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4968004, 'Adrián Barraza', '0247851');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4982783, 'Van Jones', '6286152');
INSERT INTO participant (p_id, p_name, major_work) VALUES (4997747, 'Daisy Lewellyn', '1842155');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5018955, 'Eric Rodas', '9577654');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5040910, 'Agata Mutsenietse', '2394140');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5085683, 'Mckenna Grace', '4481414');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5222799, 'Sjoerd Oomen', '0784920');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5224688, 'Laura Nirider', '2130321');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5239239, 'Alyona Chekhova', '8032834');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5312818, 'Pauline Brunner', '1816518');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5401586, 'Seth Hendrickson', '2853120');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5413877, 'Lena Reinhold', '22213478');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5456331, 'Siv Torin Knudsen Petersen', '5759648');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5479260, 'Michael Shanks', '9335950');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5480739, 'Antonina Gerai', '2299954');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5492282, 'Zachary Ruane', '5034742');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5492696, 'Mark Samual Bonanno', '13316746');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5539110, 'Kate Liquorish', '2057392');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5545287, 'Ruru Madrid', '5861134');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5665787, 'Dan Lloyd', '6058886');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5665843, 'Wicked Shrapnel', '2903210');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5666084, 'Jason Sargeant', '6058886');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5700310, 'Kathleen Zellner', '4504438');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5701200, 'Sílvio Matos', '12917634');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5750227, 'Bruno Ahmed', '3914116');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5818461, 'Kingsley Anowi', '28455574');
INSERT INTO participant (p_id, p_name, major_work) VALUES (5991573, 'Leonardo Lima Carvalho', '0995868');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6004468, 'Sanya Lopez', '9105508');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6037256, 'Aaron Hilmer', '1016150');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6055366, 'Denis Kukoyaka', '4567186');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6072896, 'Broden Kelly', '13316746');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6094267, 'Bertie Gilbert', '6199068');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6100047, 'Vikash Bhai', '9138170');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6157905, 'Demi Lardner', '4582410');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6186922, 'Brie Bythewood', '3437610');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6186923, 'Geneva S. Thomas', '3437610');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6473286, 'Gabbi Garcia', '10965328');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6506497, 'Saori Ônishi', '9458372');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6507213, 'Ty Phoenix Simpson', '12817524');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6528013, 'Delfina Chaves', '6556846');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6565487, 'Sal Piacente', '2357410');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6626925, 'Anna Krotoska', '7419360');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6629365, 'Aldo Escalante Ochoa', '14961160');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6666382, 'Katherine Fitzpatrick', '4443856');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6671482, 'Alex Bhat', '11656892');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6709511, 'Siennah Buck', '3804114');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6748584, 'Rashid Shabazz', '14506278');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6791174, 'Codey Atiyeh', '4840214');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6836912, 'Evgeniy Aleksandrov', '0435978');
INSERT INTO participant (p_id, p_name, major_work) VALUES (6873940, 'Julian Swiezewski', '3893044');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7124125, 'Daiki Hamano', '15776622');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7142794, 'Josh Rhett Noble', '12682076');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7159778, 'Heinz K. Krattiger', '28098926');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7193193, 'Mariusz Weglowski', '11954606');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7256417, 'Chantelle Fraser', '2195045');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7275197, 'Donnell E. Smith', '3513178');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7320521, 'Heidi Beirich', '8118934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7478043, 'Irina Chesnokova', '5596046');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7490325, 'Shunichi Toki', '12555040');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7502145, 'Olle Eilestam', '4479780');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7523501, 'Shunsuke Takeuchi', '10233448');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7525352, 'Honor Wolff', '20244988');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7550362, 'Joaquín Ferreira', '4680240');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7550363, 'Said Sandoval', '4680240');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7559933, 'Francisco Alanís Sopitas', '4680240');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7591840, 'Arzo Anwar', '3437610');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7642779, 'Natalia del Riego', '11125634');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7724468, 'Paul David Everatt', '8194334');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7789161, 'Isabel Costa', '1521184');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7798190, 'Aaron Gocs', '8042512');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7804130, 'Steven Avery', '4662568');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7907002, 'Jerry Buting', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7907003, 'Ken Kratz', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7907011, 'Brendan Dassey', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7907012, 'Barb Tadych', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (7928530, 'Michelle Brasier', '8540808');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8002547, 'Anna Sergejeva', '2693552');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8013618, 'Kalief Browder', '6133034');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8013619, 'Venida Browder', '6133034');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8013623, 'Nicole Browder', '6133034');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8013624, 'Paul Prestia', '5622518');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8087970, 'Noah Leggott', '17921714');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8175918, 'Thomas Hayes', '5288312');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8229275, 'Jackie Jesko', '28787850');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8306681, 'Mikhail Kremer', '13144490');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8306682, 'Evgeniya Vays', '23805316');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8390567, 'Dolores Avery', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8525993, 'Shalisha James-Davis', '2328900');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8529582, 'Marisa Duran', '13103134');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8623936, 'Kim Hye-jun', '8991322');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8634162, 'Japhe Tejeda', '3152624');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8634163, 'Jackie Maser', '0331381');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8634164, 'Wanda Dennis', '0331381');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8743192, 'Samantha Hahn', '6415656');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8828374, 'Iain Sinclair', '0333817');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8902266, 'Hendrix Yancey', '4574334');
INSERT INTO participant (p_id, p_name, major_work) VALUES (8921993, 'Brunna Oliveira', '5422000');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9047728, 'Bruna Pazinato', '6971264');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9097681, 'Otto Nobela', '9426290');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9176319, 'Mila Harris', '7550014');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9208582, 'Anzu Haruno', '8948304');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9267585, 'Martyna Byczkowska', '1910645');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9304510, 'Jeff Robinson', '6133034');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9387920, 'Otto Henriksson', '15589688');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9472721, 'Rafal Majewski', '8176532');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9752945, 'Kristine Nordby Simonsen', '5759648');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9985811, 'Marcus Bessa', '7216954');
INSERT INTO participant (p_id, p_name, major_work) VALUES (9992506, 'Kwak Sun-young', '24640580');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10018495, 'Loyiso Madinga', '28532135');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10184096, 'Dina Bergsvåg Eskeland', '14772964');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10184851, 'Aunty Donna', '9609722');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10358573, 'Henry Rodriguez', '0426742');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10419411, 'Aleksandr Shuliko', '4567186');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10441655, 'Kaori Maeda', '13405764');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10503136, 'Bae Hae-sun', '14169960');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10532126, 'Khathu Ramabulana', '9426290');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10667764, 'Fairouz Ai', '2359704');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10743253, 'Paulina Krzyzanska', '11412892');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10825952, 'Ahn Eun-jin', '26228190');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10880801, 'Mário Matos Ribeiro', '13518012');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10952801, 'Charlotte Bergflødt', '8232658');
INSERT INTO participant (p_id, p_name, major_work) VALUES (10963893, 'Maria Assunção Avilez', '1528871');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11115129, 'Inkeri Raittila', '29390842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11186166, 'Hong Nae Lee', '14839424');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11280043, 'Gage Kimbrell', '11597332');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11399236, 'Karolina Kasperek', '13415620');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11401508, 'Krzysztof Lukowicz', '13607832');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11491384, 'Maciej Kosiacki', '19724192');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11557424, 'Satomi Amano', '12728856');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11697691, 'Damian Rabstain', '13415620');
INSERT INTO participant (p_id, p_name, major_work) VALUES (11956687, 'Zakiy Jogi', '15156212');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12022183, 'Yuliya Belyaeva', '29472327');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12036874, 'Big Bert', '0331381');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12044557, 'Marcin Zawadzki', '13415620');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12044708, 'Marcin Skiba', '13415620');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12044785, 'Iwona Wozniak', '13415620');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12044857, 'Adrianna Adamik', '13415620');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12064054, 'Stefaniya Maryana Gurskaya', '4793578');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12107532, 'Carlos V. Irmscher', '10506510');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12213063, 'Elina Masing', '19731008');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12213064, 'Miika Pihlak', '11317634');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12213065, 'Sofia Mihhaljova', '15732658');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12213066, 'Artemi Sotskov', '13800178');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12213067, 'Vadim Tronov', '13800178');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12213068, 'Karina Andrejeva', '13800178');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12307165, 'Baek Sung-Chul', '14731794');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12340880, 'Ilya Sintsov', '26422125');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12346893, 'Dean Strang', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12346894, 'Allan Avery', '5189670');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12401507, 'Darya Kovalevskaya', '20765194');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12416940, 'Thiago Braga de Oliveira', '15852584');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12699881, 'Oleg Milyakhovskiy', '22072954');
INSERT INTO participant (p_id, p_name, major_work) VALUES (12970116, 'Trevor Killian', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13017466, 'Samantha Moten', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13033660, 'Peni Dela Pena', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13060470, 'Darin Vanderpol', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13070622, 'Marita Guevara', '29390842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13096912, 'Joey Rukavina', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13102538, 'Brian Joseph', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13121634, 'Tracey McCaskill', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13138688, 'Denis Kotov', '13144490');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13160618, 'Raul Flores', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13165949, 'Mark Bell', '15460842');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13305489, 'Kristian Eros', '11261148');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13518170, 'Elle Lisic', '15257160');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13552036, 'Dennis Smith', '19392272');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13614223, 'Magdaleena Jakkila', '19860610');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13741860, 'Leandro Ruschel', '14758812');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13741861, 'Guilherme Macalossi', '14758812');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13880591, 'Bayastan Koldoshaly', '32203240');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13894433, 'Dean Hill', '0439402');
INSERT INTO participant (p_id, p_name, major_work) VALUES (13965437, 'Sy''rai Iman Smith', '0331381');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14064543, 'Skye Grimsey', '15156212');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14119155, 'Luc Sante', '1288869');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14153918, 'Jon-Luc MacLean', '8118934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14157300, 'Eric Best', '8118934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14157301, 'Asha Deliverance', '8118934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14157689, 'lan Grillot', '8118934');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14466229, 'Ekaterina Kuchma', '30474682');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14490628, 'Bartlomiej Deklewa', '26423839');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14796593, 'Holly Rey', '29144943');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14796594, 'Mimi Rey', '27622290');
INSERT INTO participant (p_id, p_name, major_work) VALUES (14829616, 'Jan Salasinski', '27688981');
INSERT INTO participant (p_id, p_name, major_work) VALUES (15906131, 'Kazuha Kishimoto', '27391405');


--
-- TOC entry 4942 (class 0 OID 17885)
-- Dependencies: 248
-- Data for Name: participate; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 287515, 7, 'actress', 'Mercedes de los Ríos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 530308, 4, 'actress', 'María Pradenas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 749008, 3, 'actor', 'Manuel Pradenas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 1362936, 2, 'actress', 'Leonor Amenábar');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 1410260, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 1416557, 5, 'actor', 'Ignacio Echenique');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 1493623, 1, 'actor', 'José Luis Echenique');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 1907686, 9, 'actress', 'Violeta Moreno');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 2254468, 8, 'actress', 'Teresita Echenique');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 2614895, 10, 'actress', 'Leontina Aguirre');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1244386, 4095201, 6, 'actor', 'Pedro Soto');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 498472, 1, 'actress', 'Koo Kyung-yi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 498472, 2, 'actress', 'Koo Kyeong Yi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 1040396, 13, 'actor', 'Department Head Kim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 1390122, 5, 'actress', 'Yong Sook');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 1390122, 6, 'actress', 'Director Yong');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 2470989, 11, 'actor', 'Na Jong-jun');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 8623936, 3, 'actress', 'K');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 8623936, 4, 'actress', 'Song Yi-kyung');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 9992506, 7, 'actress', 'Na Je-hee');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 9992506, 8, 'actress', 'Na Je Hui');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 10503136, 14, 'actress', 'Jung Jeong-yeon');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 10825952, 12, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 11186166, 9, 'actor', 'Gun Wook');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14731794, 12307165, 10, 'actor', 'Santa');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 638, 9, 'actor', 'Buzz Howard');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 1464, 11, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 2079, 14, 'actor', 'Samson Toey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 80867, 7, 'actor', 'Abraham Lincoln Imhook');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 80867, 8, 'actor', 'Mr. Imhook');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 89984, 4, 'actress', 'Maggie Farrow');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 89984, 5, 'actress', 'Mandy Farrow');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 103071, 6, 'actor', 'Brock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 384494, 10, 'actress', 'Julie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 553436, 12, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 694619, 13, 'actress', 'Helen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 907636, 1, 'actor', 'Cal ''Kodiak'' McKay');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 907636, 2, 'actor', 'Cal ''Kodiak'' McCay');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71002, 907636, 3, 'actor', 'Kodiak');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 63527, 1, 'actor', 'Antonio');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 122184, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 496378, 9, 'actor', 'Inversor Francés (2018)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 891391, 5, 'actor', 'Fiscal Molina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 1846255, 2, 'actor', 'Teo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 3629180, 8, 'actress', 'Delfina (2018)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 4117720, 6, 'actor', 'Asesor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 4265826, 7, 'actress', 'Asistente Italiana (2018)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 6528013, 10, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 7159778, 4, 'actor', 'Inversor Suizo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7956274, 13552036, 3, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 1883, 15, 'actress', 'Jen Larkin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 3944, 1, 'actor', 'Andy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 3944, 2, 'actor', 'Andy Larkin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 110518, 5, 'actor', 'Danny');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 110518, 6, 'actor', 'Danny Pickett');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 227831, 12, 'actor', 'Jervis Coltrane');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 227831, 13, 'actor', 'Mr.Hutchins');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 291217, 3, 'actress', 'Teri');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 291217, 4, 'actress', 'Terry');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 323177, 9, 'actress', 'Freida Larkin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 323177, 10, 'actress', 'Mom');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 323177, 11, 'actress', 'Freida Larka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 390161, 7, 'actor', 'Al Larkin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 390161, 8, 'actor', 'Dad');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 429115, 16, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 429115, 17, 'actor', 'Mayor Henry K. Roth');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 642601, 18, 'actress', 'Lori');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 642601, 19, 'actress', 'Lori Mackney');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (289036, 3637677, 14, 'actress', 'Jen Larkin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1578250, 332562, 1, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1578250, 2807968, 2, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1578250, 6565487, 3, 'self', 'Self - Author Poker Cheats Exposed');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 790, 1, 'actor', 'Det. Jim McClain');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 2083, 5, 'actor', 'Det. Cross');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 2083, 6, 'actor', 'Jerry Cross');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 4916, 7, 'actress', 'Vangie Cruise');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 73388, 13, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 103722, 11, 'actor', 'Capt. Scofield');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 173268, 2, 'actor', 'Det. Gates');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 173268, 3, 'actor', 'Harry Gates');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 225191, 4, 'actor', 'Lt. DeNisco');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 238739, 9, 'actor', 'Billy Monroe');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 326091, 10, 'actor', 'Dave Janoski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 528433, 8, 'actor', 'Ernie Neil');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (81901, 551502, 12, 'actor', 'Frankie Betts');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 586528, 4, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 848801, 7, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 1683003, 3, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 2976492, 1, 'actress', 'Tia Amulet');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 6506497, 5, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 7490325, 8, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 7523501, 6, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 10441655, 10, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 10667764, 2, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 11557424, 9, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27391405, 15906131, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 5224688, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 5224688, 5, 'self', 'Self - Brendan''s Postconviction Lawyer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 5700310, 14, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7804130, 1, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907002, 11, 'self', 'Self - Steven''s Defense Lawyer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907002, 12, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907002, 13, 'self', 'Self - Steven''s Lawyer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907003, 17, 'self', 'Self - Special Prosecutor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907003, 18, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907011, 19, 'self', 'Self - Steven''s Nephew');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907011, 20, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907012, 15, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 7907012, 16, 'self', 'Self - Brendan''s Mother');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 8390567, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 8390567, 3, 'self', 'Self - Steven''s Mother');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 12346893, 8, 'self', 'Self - Steven''s Defense Lawyer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 12346893, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 12346893, 10, 'self', 'Self - Steven''s Lawyer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 12346894, 6, 'self', 'Self - Steven''s Father');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5189670, 12346894, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 606043, 6, 'actor', 'Dr. Sid Isaacs');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 1153052, 2, 'actor', 'Viljoen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 1441167, 4, 'actor', 'Shandu Johnson Magwaza');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 1649880, 10, 'actor', 'President Jeziel Malunga');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 3413191, 1, 'actress', 'Queen Sono');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 3688478, 3, 'actress', 'Miri Dube');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 5539110, 9, 'actress', 'eKaterina Gromova');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 9097681, 8, 'actor', 'Bulabule');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 10018495, 7, 'actor', 'Fred');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9426290, 10532126, 5, 'actor', 'Wiliam');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 433738, 8, 'actor', 'Mester');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 458971, 4, 'actor', 'Far Kanin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 932767, 3, 'actress', 'Mor Kanin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 1210304, 1, 'actress', 'Fister');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 1266343, 5, 'actress', 'Perle');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 1283558, 2, 'actress', 'Snus');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 1284248, 6, 'actress', 'Olde');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (341833, 1284248, 7, 'actress', 'Oldemor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7349078, 263582, 5, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7349078, 1120190, 3, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7349078, 2844388, 4, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7349078, 3201579, 1, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7349078, 3631553, 2, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 1593, 4, 'actress', 'Mary Ann Broberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 4988, 2, 'actor', 'Bob Broberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 159609, 7, 'actor', 'Bishop Matthew Paulsen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 3006818, 3, 'actress', 'Gail Berchtold');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 3271473, 6, 'actor', 'Pete Welsh');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 3821405, 1, 'actor', 'Robert ''B'' Berchtold');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 4528537, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 5085683, 8, 'actress', 'Jan Broberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 8902266, 5, 'actress', 'Young Jan Broberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 9176319, 9, 'actress', 'Young Karen Broberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12661338, 13518170, 10, 'actress', 'Young Susan Broberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 43389, 10, 'actor', 'Molero');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 43389, 11, 'actor', 'Moreno');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 195627, 1, 'actor', 'Mario Santos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 195627, 14, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 195639, 5, 'actor', 'José Feller');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 227885, 7, 'actor', 'Martín Vanegas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 278442, 2, 'actor', 'Pablo Lamponne');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 278442, 15, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 647434, 8, 'actor', 'Sr. Sarasola');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 673391, 3, 'actor', 'Emilio Ravenna');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 673391, 13, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 723218, 6, 'actor', 'Gaona');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 781493, 4, 'actor', 'Gabriel Medina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 839578, 9, 'actor', 'Bonelli');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (316613, 1167933, 12, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 141745, 11, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 143599, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 143599, 2, 'self', 'Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 353588, 13, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 673897, 3, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 673897, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 730419, 14, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 991525, 5, 'self', 'Themselves - Singers');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 991525, 6, 'self', 'Themselves');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 991525, 7, 'self', 'Themselves - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 1454130, 16, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 1456039, 8, 'self', 'Themselves - Musicians');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 1456039, 9, 'self', 'Themselves');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 1456039, 10, 'self', 'Themselves - Singers');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 1652223, 15, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63919, 2125592, 12, 'self', 'Themselves - Singers');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 31973, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 104405, 11, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 685142, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 685142, 9, 'self', 'Clyde');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 685142, 10, 'self', 'Noivo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 2997812, 13, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 2999303, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 3000270, 2, 'actress', 'Manequim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 3000270, 3, 'actress', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 3516424, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 7789161, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 7789161, 5, 'self', 'Manequim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 10880801, 14, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1528871, 10963893, 12, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 147310, 12, 'actress', 'Mary Luz');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 147310, 13, 'actress', 'Mary Luz Solari');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 891796, 7, 'actor', 'Rafael Reyna');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 891796, 8, 'actor', 'Rafael');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 891796, 9, 'actor', 'Refael Reyna');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 1552764, 5, 'actor', 'Hugo Sánchez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 1552764, 6, 'actor', 'Hugo Sanchez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 1645334, 1, 'actor', 'Chava Iglesias');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 1645334, 2, 'actor', 'Chava');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 1645334, 3, 'actor', 'Salvador Iglesias Jr.');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 1890752, 21, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 2835675, 22, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 3901455, 4, 'actress', 'Isabel Iglesias');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 4204713, 14, 'actor', 'Comentarista 2');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 4204713, 15, 'actor', 'Sam');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 4204713, 16, 'actor', 'Cronista Malo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 6629365, 20, 'actor', 'Carmelo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 7550362, 11, 'actor', 'Potro');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 7550363, 10, 'actor', 'Cuau');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 7559933, 17, 'actor', 'Comentarista 1');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 7559933, 18, 'actor', 'Sopitas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4680240, 7559933, 19, 'actor', 'Cronista Bueno');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 33312, 3, 'actress', 'Michele Brau');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 299134, 14, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 592950, 9, 'actress', 'Catarina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 708698, 1, 'actor', 'Mister Brau');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 708698, 2, 'actor', 'Priscila');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 997457, 6, 'actor', 'Gomes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 1005239, 7, 'actor', 'Miranda');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 1005239, 8, 'actor', 'Lima');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 1284907, 4, 'actress', 'Andréia de Menezes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 1947809, 10, 'actor', 'Marques');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 1947809, 11, 'actor', 'Tenente Marques');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 2815503, 5, 'actor', 'Henrique de Menezes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 5991573, 12, 'actor', 'Egídio');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5422000, 8921993, 13, 'actress', 'Lia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 48083, 3, 'actress', 'Alla Abramovich - zhena Bori');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 245364, 6, 'actress', 'Dina Markovna Abramovich');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 835292, 2, 'actor', 'Khaim Abramovich');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 1285135, 9, 'actor', 'Pavel Voronov');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 1495361, 1, 'actor', 'Borya Abramovich');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 3727250, 5, 'actress', 'Musya Lvovna Abramovich');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 8306682, 7, 'actress', 'Yana Abramovich - doch Bori');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 13138688, 4, 'actor', 'David Abramovich - syn Bori');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 13880591, 8, 'actor', 'Elbek Abdurakhmanov - muzh Yany');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (26238728, 14466229, 10, 'actress', 'Sonya Voronova - doch Pavla');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 91144, 6, 'actor', 'Witte Jos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 283747, 3, 'actor', 'Makelaar Marcel Kronkel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 283747, 4, 'actor', 'Makelaar Kronkel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 887931, 14, 'actor', 'Colonel Miguel da Silva');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 1168954, 13, 'actor', 'Clandestino');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2096872, 1, 'actor', 'Jonas Kronkel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2096872, 2, 'actor', 'Jonas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2096958, 7, 'actor', 'Secundo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2097951, 12, 'actress', 'Aagje');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2102472, 5, 'actor', 'Don Carlos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2104765, 8, 'actor', 'Ridder Woeste');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2104765, 9, 'actor', 'Ridder Willem Woeste');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 2104765, 10, 'actor', 'Ridder Willem De Woeste');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (490714, 3520630, 11, 'actress', 'Charlotte McFeather');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 4166234, 10, 'actor', 'Prank Victim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 5479260, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 5492282, 1, 'actor', 'Zach');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 5492282, 2, 'actor', 'Broden''s Nana');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 5492696, 4, 'actor', 'Mark');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 6072896, 3, 'actor', 'Broden');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 6157905, 8, 'actress', 'Demi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 7525352, 12, 'actress', 'Prank Victim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 7798190, 11, 'actor', 'Pitmaster Jim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 7928530, 5, 'actress', 'Mark''s Girlfriend');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 7928530, 6, 'actress', 'Mark''s Nonna');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 7928530, 7, 'actress', 'Michelle');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (9914700, 10184851, 13, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 104113, 2, 'actress', 'Vicki');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 164800, 4, 'actress', 'Maggie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 185954, 1, 'actor', 'Harry');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 238046, 7, 'actress', 'Connie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 282547, 3, 'actor', 'Ronnie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 362691, 5, 'actress', 'Jenny');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 362691, 6, 'actress', 'Jennie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 490704, 9, 'actress', 'Grace');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 553013, 8, 'actress', 'Molly');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 561890, 10, 'actress', 'Joan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (71048, 793892, 11, 'actor', 'Francis');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 351758, 6, 'actress', 'Ririchiyo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 612818, 7, 'actor', 'Joe');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 666547, 4, 'actor', 'Soushi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 722676, 1, 'actress', 'Karuta');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 1001404, 3, 'actor', 'Kagerou');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 1014554, 8, 'actress', 'Nobara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 1039941, 10, 'actress', 'Additional Voices');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 1814328, 9, 'actor', 'Natsume');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 1931870, 2, 'actress', 'Chino');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2196757, 2969210, 5, 'actor', 'Sorinozuka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 18746, 18, 'actress', 'Sour Sweet');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 152839, 1, 'actress', 'Twilight Sparkle');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 319308, 5, 'actress', 'Rarity');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 319308, 6, 'actress', 'Patron');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 508877, 7, 'actress', 'Fluttershy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 508877, 8, 'actress', 'Pinkie Pie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 508877, 9, 'actress', 'Papparazzi #1');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 921699, 16, 'actress', 'Spike');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1418935, 13, 'actor', 'Canter Zoom');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1418935, 14, 'actor', 'Boss');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1418935, 15, 'actor', 'Nervous P.A.');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1650932, 17, 'actress', 'Juniper Montage');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1690630, 10, 'actress', 'Sunset Shimmer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1690630, 11, 'actress', 'Papparazzi #2');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1690630, 12, 'actress', 'Twilight Sparkle - singing');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1868320, 2, 'actress', 'Applejack');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1868320, 3, 'actress', 'Rainbow Dash');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 1868320, 4, 'actress', 'Child');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6800902, 3703274, 19, 'actress', 'Sugarcoat');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 89603, 9, 'actor', 'Bobby Potter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 91286, 12, 'actor', 'Dr. Kramer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 231942, 4, 'actress', 'Gladys Peterson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 236519, 7, 'actor', 'Gus Borden');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 236519, 8, 'actor', 'Ted Bains');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 254387, 2, 'actor', 'Fred Peterson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 254402, 1, 'actor', 'Chris Peterson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 254402, 13, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 296791, 6, 'actress', 'Amy Potter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 592400, 14, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 720304, 15, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 726939, 3, 'actress', 'Sharon Potter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 730168, 5, 'actor', 'Larry Potter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 788958, 10, 'actor', 'Billy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98802, 788958, 11, 'actor', 'Young Chris');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 409287, 4, 'actor', 'Madara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 409287, 5, 'actor', 'Nyanko Sensei Madara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 409287, 6, 'actor', 'Nyanko-sensei');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 411879, 10, 'actress', 'Toko Fujiwara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 436778, 2, 'actor', 'Natsume Takashi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 436778, 3, 'actor', 'Takashi Natsume');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 1204639, 7, 'actor', 'Madara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 1328076, 13, 'actress', 'Jun Sasada');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 1525194, 12, 'actor', 'Atsushi Kitamoto');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 2316240, 11, 'actor', 'Satoru Nishimura');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 2542294, 1, 'actor', 'Satoru Nishimura');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 8529582, 8, 'actress', 'Jun Sasada');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 8529582, 9, 'actress', 'Yokai');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 13305489, 14, 'actor', 'Additional');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 13305489, 15, 'actor', 'Additional Voices');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1352421, 13305489, 16, 'actor', 'Additional Characters');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 39583, 8, 'self', 'Self - Hostess');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 39583, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 497525, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 497525, 11, 'self', 'Self - Playboy Extreme Team');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 497525, 12, 'self', 'Self - Playmate');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 542652, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 542652, 2, 'self', 'Self - Guest Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 628606, 13, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 1036361, 3, 'self', 'Self - Hostess');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 1128564, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 1236850, 4, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 1256270, 5, 'actor', 'Case Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 1256270, 6, 'actor', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 1335221, 14, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (292870, 3105989, 15, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4012658, 6507213, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4012658, 6507213, 2, 'self', 'Self - Host (as Tyler Simpson)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4012658, 6507213, 4, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4012658, 6791174, 3, 'self', 'Self - Special Guest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 200615, 2, 'actor', 'Raquim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 1009405, 12, 'actress', 'Adhara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 1270699, 3, 'actress', 'Pirena');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 1840982, 13, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 2064061, 1, 'actress', 'Ynang Reyna Mine-a');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 2811661, 4, 'actress', 'Amihan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 3856456, 7, 'actor', 'Aquil');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 4057338, 10, 'actress', 'Cassiopea');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 4057338, 11, 'actress', 'Avria');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 5545287, 8, 'actor', 'Ybarro');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 5545287, 9, 'actor', 'Ybrahim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 6004468, 6, 'actress', 'Danaya');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (5861134, 6473286, 5, 'actress', 'Alena');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 2392667, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 3524843, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 3820112, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4627007, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4628079, 3, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4629612, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4635210, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4636726, 5, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4640074, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1606854, 4651402, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 257237, 1, 'actress', 'Karla Fazius');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 312036, 6, 'actress', 'Frauke Borowski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 581536, 2, 'actor', 'Andreas Borowski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 728751, 7, 'actress', 'Mina Dahlbeck');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 954348, 3, 'actor', 'Stefan Fazius');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 1085519, 4, 'actress', 'Judith Fazius');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 3866538, 12, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 4013413, 10, 'actor', 'Ronnie Borowski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 4727722, 5, 'actor', 'Tonio Fazius');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 6037256, 8, 'actor', 'Ronnie Borowski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 7642779, 9, 'actress', 'Judith Fazius');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10506510, 12107532, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 434, 17, 'actor', 'The Joker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 434, 18, 'actor', 'Jack Napier');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 434, 19, 'actor', 'Ferris Boyle');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 1957, 23, 'actor', 'Mayor Hamilton Hill');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 1957, 24, 'actor', 'Mayor Hill');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 4170, 27, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 15924, 15, 'actress', 'Summer Gleeson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 15924, 16, 'actress', 'Miss Perkins');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 175834, 1, 'actor', 'Batman');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 175834, 2, 'actor', 'Bruce Wayne');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 175834, 3, 'actor', 'Thomas Wayne');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 182456, 12, 'actor', 'Detective Bullock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 182456, 13, 'actor', 'Detective Harvey Bullock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 182456, 14, 'actor', 'Rocco');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 227704, 30, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 368561, 9, 'actor', 'Commissioner James Gordon');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 368561, 10, 'actor', 'Commissioner Gordon');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 368561, 11, 'actor', 'Gordon');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 504489, 4, 'actor', 'Robin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 504489, 5, 'actor', 'Dick Grayson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 596959, 20, 'actor', 'Two-Face');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 596959, 21, 'actor', 'Harvey Dent');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 596959, 22, 'actor', 'Bat Computer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 705779, 28, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 815071, 25, 'actress', 'Harley Quinn');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 815071, 26, 'actress', 'Dr. Harleen Quinzel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 863622, 29, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 956544, 6, 'actor', 'Alfred Pennyworth');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 956544, 7, 'actor', 'Alfred');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (103359, 956544, 8, 'actor', 'Antoine');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 278920, 6, 'actress', 'Fui Na');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 353362, 3, 'actress', 'Ruth Michaelis');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 373668, 10, 'actor', 'Ossip Schwarz');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 537854, 2, 'actor', 'Pierre van Floot');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 679984, 4, 'actress', 'Pats Crowly');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 720184, 1, 'actress', 'Jo Wismuth');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 771706, 9, 'actor', 'Tim Forrester');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 833080, 5, 'actor', 'Bob Crowly');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 857953, 8, 'actress', 'Bodil Hellrud');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1492219, 918805, 7, 'actor', 'Prof. Hugo de Streiss');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 535, 6, 'actress', 'Josie Acosta');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 614877, 2, 'actor', 'Jacob Orr');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 746125, 10, 'actor', 'Max Gregory');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 893257, 5, 'actor', 'Ian Mitchell');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 1308423, 12, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 1764351, 3, 'actress', 'Laura Mitchell');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 1767820, 8, 'actress', 'Megan Acosta');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 2105255, 4, 'actress', 'Avery');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 2406892, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 2545508, 7, 'actor', 'King Orr');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 2965079, 1, 'actress', 'Ellie Mitchell');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2390334, 4096266, 9, 'actor', 'Alex Acosta');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 70355, 15, 'actor', 'Various (1994)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 120662, 3, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1110625, 7, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1210922, 14, 'actress', 'Various (1994-2002)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1326574, 17, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1475685, 10, 'actor', 'Don Honorato');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1475685, 11, 'actor', 'Gregorita');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1475685, 12, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1856035, 8, 'actress', 'Barbarita');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1856035, 9, 'actress', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1908654, 1, 'actress', 'La Gaga');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1908654, 2, 'actress', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1958945, 4, 'actor', 'Baldomero');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1958945, 5, 'actor', 'Rico McRico');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 1958945, 6, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 2904398, 16, 'actor', 'Rastacuero (1996)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (12683972, 10358573, 13, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1508179, 441972, 1, 'actress', 'Midori');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1508179, 464674, 2, 'actor', 'Kaze no Fujimaru');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1508179, 948985, 3, 'actress', 'Daisuke');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1508179, 2894067, 6, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1508179, 3392665, 4, 'actress', 'Choro');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1508179, 3606341, 5, 'actress', 'Ponkichi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 133936, 6, 'actress', 'Amanda Allison');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 143918, 2, 'actress', 'Elinor Hathaway');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 154811, 12, 'actor', 'Al Jason');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 412336, 7, 'actor', 'Bert Brockwood');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 412336, 8, 'actor', 'George Brockwood');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 507691, 11, 'actor', 'Barney Holt');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 674977, 4, 'actress', 'Thelma Brockwood');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 674977, 5, 'actress', 'Thelma Blackwood');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 675340, 9, 'actor', 'Roy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 853299, 10, 'actor', 'Dr. Dorsey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 922967, 3, 'actor', 'Walter Hathaway');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (54544, 1276570, 1, 'self', 'Themselves');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 489292, 1, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 500398, 7, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 861830, 5, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1197589, 6, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1486492, 8, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1486492, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1493168, 4, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1621645, 10, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1679609, 2, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 1791970, 3, 'self', 'Self - Programledare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 7502145, 11, 'actor', 'Kapellmästare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4479780, 7502145, 12, 'actor', 'Self - Kapellmästare');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 53, 2, 'actor', 'John Eliot');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 1556, 4, 'actor', 'Remus');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 1826, 6, 'actor', 'Hardy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 5471, 1, 'actor', 'Romulus');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 258012, 9, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 393222, 7, 'actor', 'Col. Chan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 566331, 8, 'actor', 'Orlik');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 761809, 10, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 783314, 3, 'actress', 'Erika Bernstein');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96985, 797725, 5, 'actor', 'Felix');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 6219, 4, 'self', 'Self - Composer and Collector');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 493200, 1, 'self', 'Self - Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 583472, 5, 'self', 'Self - Photographer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 1206729, 7, 'self', 'Self - Photographer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 1502440, 2, 'self', 'Self - Photographer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 2274179, 9, 'self', 'Self - Chief Photography Curator, MoMA NY');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 3125371, 3, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 3447129, 10, 'self', 'Self - Photographer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 8828374, 6, 'self', 'Self - Writer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1288869, 14119155, 8, 'self', 'Self - Writer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 23524, 2, 'actress', 'Laila Paddan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 1025967, 6, 'actor', 'Jacó de Israel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 1306481, 4, 'actress', 'Raquel Paddan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 1480633, 3, 'actor', 'Labão Paddan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 1596202, 1, 'actor', 'Rúben de Israel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 2315320, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 3647085, 7, 'actress', 'Adinah');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 5701200, 10, 'actor', 'Isaque');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 5750227, 8, 'actor', 'Príncipe Siquém');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 9047728, 9, 'actress', 'Lia Paddan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (10605414, 9985811, 5, 'actor', 'Issacar de Israel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 645806, 7, 'actor', 'Arkadi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 1625839, 2, 'actor', 'Riho');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 1891021, 3, 'actress', 'Politseiuurija');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 8002547, 5, 'actress', 'Maria');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 12213063, 1, 'actress', 'Marianne');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 12213064, 4, 'actor', 'Joonas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 12213065, 8, 'actress', 'Darja');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 12213066, 9, 'actor', 'Dima');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 12213067, 6, 'actor', 'Vadim');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13800178, 12213068, 10, 'actress', 'Julia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 410, 10, 'actor', 'Colonel K');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 410, 11, 'actor', 'Colonel K.');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 410, 12, 'actor', 'Criminal K');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 35602, 1, 'actor', 'Danger Mouse');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 35602, 2, 'actor', 'Sinister Mouse');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 35602, 3, 'actor', 'Derek Mullard');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 52218, 22, 'actress', 'Danger Moth');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 52218, 23, 'actress', 'Dawn');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 52218, 24, 'actress', 'The Queen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 253126, 4, 'actor', 'Penfold');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 253126, 5, 'actor', 'Baron Silas Von Penfold');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 253126, 6, 'actor', 'Robo-Penfold');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 482936, 7, 'actor', 'The Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 482936, 8, 'actor', 'Stiletto');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 482936, 9, 'actor', 'Norman');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 531933, 13, 'actress', 'Professor Squawkencluck');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 531933, 14, 'actress', 'Big Head');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 531933, 15, 'actress', 'HEAD');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 798025, 19, 'actor', 'Nero');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 798025, 20, 'actor', 'Headless Postman');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 798025, 21, 'actor', 'Little boy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 1315378, 28, 'actor', 'Dr. Loocifer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 1315378, 29, 'actor', 'Megahurtz');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 1315378, 30, 'actor', 'Isambard King Kong Brunel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 1727356, 25, 'actor', 'Count Duckula');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 1727356, 26, 'actor', 'Ian');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 1727356, 27, 'actor', 'General E. Normus Schwartznut');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 2755953, 16, 'actor', 'Baron Greenback');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 2755953, 17, 'actor', 'Baron Silas von Greenback');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 2755953, 18, 'actor', 'Pandaminion');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4196822, 3141801, 31, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 3162, 5, 'self', 'Self - Celebrity Contestant');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 132616, 9, 'self', 'Self - Celebrity Talk About');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 149942, 7, 'self', 'Self - Contestant (1989)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 185286, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 250004, 3, 'self', 'Self - Celebrity Contestant');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 267977, 8, 'self', 'Self - Contestant (1989)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 561841, 10, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 625899, 6, 'self', 'Self - Celebrity Contestant');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 804887, 4, 'self', 'Self - Celebrity Contestant');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (439402, 13894433, 2, 'self', 'Self - Announcer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 94951, 5, 'actress', 'Beatriz Sanguedolce aka Tía Ñata');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 273253, 6, 'actor', 'Alberto Rosales');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 273253, 7, 'actor', 'Florinda Rosales');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 526103, 3, 'actor', 'Gianni de la Nata');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 526103, 4, 'actor', 'Dr. Verdugo Cadalso');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 581751, 14, 'actor', 'Edgardo Mesa');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 581762, 1, 'actor', 'Juan Carlos Mesa');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 581762, 2, 'actor', 'Juan Cartlos Mesa');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 581762, 15, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 603800, 12, 'actress', 'Cris');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 719535, 8, 'actor', 'Gino Foderone de la Salsiccia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 719535, 9, 'actor', 'Gino Foderone de la Salsicchia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 923299, 11, 'actress', 'Eleonora');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 1259826, 13, 'actress', 'Leticia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (269541, 1938760, 10, 'actress', 'Verónica');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 228, 1, 'actor', 'Francis Underwood');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 705, 4, 'actress', 'Claire Underwood');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 40739, 11, 'actress', 'Catherine Durant');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 147689, 10, 'actor', 'Seth Grayson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 318703, 2, 'actor', 'President Garrett Walker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 318703, 3, 'actor', 'Garrett Walker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 446672, 6, 'actor', 'Doug Stamper');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 544718, 5, 'actress', 'Zoe Barnes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 961577, 15, 'producer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 991810, 13, 'actor', 'Remy Danton');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 2080557, 12, 'actor', 'Edward Meechum');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 2802722, 14, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 2858333, 7, 'actor', 'Frank Underwood Security');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 2858333, 8, 'actor', 'Frank''s Secret Service');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1856010, 2858333, 9, 'actor', 'Secret Service');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 347, 9, 'actor', 'Captain Hook');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 347, 10, 'actor', 'Peter Pan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 347, 11, 'actor', 'King Kooh');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 5189, 6, 'actor', 'Peter Pan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 5189, 7, 'actor', 'D''Artagnan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 21596, 12, 'actor', 'Tootles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 45209, 4, 'actor', 'Short Twin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 137262, 15, 'actor', 'Nibs');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 137262, 16, 'actor', 'Athos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 220635, 5, 'actress', 'Tinker Bell');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 318027, 17, 'actor', 'Mr. Smee');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 318027, 18, 'actor', 'Captain Patch');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 318027, 19, 'actor', 'The Spirit of Christmas Present');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 486095, 1, 'actress', 'Wendy Darling');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 486095, 2, 'actress', 'Count De Chauvin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 486095, 3, 'actress', 'The Spirit of Christmas Past');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 579914, 13, 'actor', 'Slightly');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 579914, 14, 'actor', 'Aramis');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98891, 930568, 8, 'actor', 'Billy Jukes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 753486, 3, 'actor', 'Kim Min-ho');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 1045034, 4, 'actress', 'Lee Soo-ah');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 1046845, 1, 'actress', 'Ji Yeon-woo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 1120335, 6, 'actor', 'Jung Sang-kuk');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 1138201, 10, 'actor', 'Jung Seung-bum');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 1450227, 2, 'actor', 'Jung Eun-sup');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 1507995, 5, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 2351099, 9, 'actor', 'Oh Dal-jae');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 2354456, 8, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (843196, 2559633, 7, 'actress', '(2004)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 231, 8, 'archive_footage', 'Self (editing ''JFK'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 231, 9, 'self', 'Self (editing ''JFK'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 993, 10, 'archive_footage', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 993, 11, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 1486, 12, 'archive_footage', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 1486, 13, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 1654, 6, 'archive_footage', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 1654, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 1813, 4, 'archive_footage', 'Self (on ''The Dick Van Dyke Show'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 1813, 5, 'self', 'Self (on ''The Dick Van Dyke Show'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 4847, 1, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 103120, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 255281, 3, 'archive_footage', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 372553, 16, 'archive_footage', 'Self (in bank survellance footage)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 372553, 17, 'self', 'Self (in bank survellance footage)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 386944, 14, 'archive_footage', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (398443, 386944, 15, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 118840, 12, 'actor', 'Bodyguard ''Porter''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 118840, 13, 'actor', 'Drunkard');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 118840, 14, 'actor', 'Konorek');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 162159, 1, 'actor', 'Lt. Slawomir Borewicz');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 329848, 6, 'actor', 'Edward Gabor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 329848, 7, 'actor', 'Drunkard');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 329848, 8, 'actor', 'Kreczet''s Man');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 468865, 4, 'actor', 'Lt. Antoni Zubek');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 476907, 3, 'actress', 'Sierzant Ewa Olszanska');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 843955, 18, 'actor', 'Clerk');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 843955, 19, 'actor', 'Customs Officer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 843955, 20, 'actor', 'Militiaman Waldek');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 864908, 2, 'actor', 'Maj. Wolczyk');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1281009, 5, 'actor', 'Lt. Waldemar Jaszczuk');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1296163, 9, 'actor', 'Militiaman');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1296163, 10, 'actor', 'Drunkard');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1296163, 11, 'actor', 'Man in Restaurant');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1350869, 15, 'actor', 'Bartender');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1350869, 16, 'actor', 'Kazimierz Baginski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (399943, 1350869, 17, 'actor', 'Lison');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (121002, 692927, 1, 'actor', 'Told by');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (121002, 692927, 2, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (121002, 828745, 3, 'actor', 'Told by');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 369954, 1, 'actress', 'Jo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 408846, 2, 'actor', 'Jason');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 752490, 8, 'actor', 'Ben');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 800219, 4, 'actress', 'Miriam');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 3531173, 9, 'actress', 'Abhi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 6100047, 7, 'actor', 'Chinar');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 8087970, 3, 'actor', 'Adam');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 8525993, 5, 'actress', 'Amara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 11956687, 10, 'actor', 'Gatik');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15156212, 14064543, 6, 'actress', 'Kimberly');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 64086, 8, 'actress', 'Griselda');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 305894, 3, 'actor', 'Gabriel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 346270, 4, 'actor', 'Fernando');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 539197, 5, 'actress', 'Patricia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 599649, 7, 'actor', 'Alfredo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 748387, 1, 'actress', 'Ana Cristina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 990444, 6, 'actor', 'Isaías');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 2988465, 9, 'actor', 'Enrique');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 3148346, 10, 'actor', 'Apolo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1298725, 5018955, 2, 'actor', 'Guardia de Seguridad');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 156078, 3, 'actress', 'Miss Temple');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 324009, 9, 'actor', 'Mr. Schuster');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 358772, 7, 'actor', 'Mr. Broadribb');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 382995, 1, 'actress', 'Miss Jane Marple');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 390417, 6, 'actress', 'Madge');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 395443, 4, 'actor', 'Professor Wanstead');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 527179, 8, 'actress', 'Lavinia Glynne');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 668271, 5, 'actor', 'Michael Rafiel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 863192, 2, 'actor', 'Lionel Peel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (91618, 879239, 10, 'actress', 'Clothilde Bradbury-Scott');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 340264, 6, 'actor', 'Rainer Berg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 379084, 2, 'actor', 'Konrad Hellmann');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 485183, 4, 'actor', 'Albert Jakob');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 487842, 10, 'actress', 'Ma Becker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 726167, 7, 'actor', 'Jan Fischer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 726167, 8, 'actor', 'Makler Hanselmann');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 773846, 11, 'actress', 'Anna Luschek');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 778081, 3, 'actress', 'Erika Voss');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 899211, 5, 'actress', 'Ursula Weber');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 921044, 1, 'actor', 'Henning Schwarz');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (108916, 4348131, 9, 'actress', 'Gina Mancini');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3018178, 724656, 1, 'actor', 'Batman');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3018178, 946148, 2, 'actor', 'Riddler');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15151564, 386810, 1, 'self', 'Self - Presenter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 2554, 3, 'actress', 'Barbara Huffman');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 130282, 4, 'actress', 'Cathy Baker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 258321, 8, 'actor', 'Tom Liberatore');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 344006, 2, 'actress', 'Joanna Huffman Baker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 344043, 5, 'actor', 'Bert Baker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 469671, 7, 'actress', 'Sharon Kelly');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 542603, 9, 'actor', 'Donny Baker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 563983, 10, 'actress', 'Millie Baker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 565907, 1, 'actor', 'Billy Baker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (78651, 903443, 6, 'actress', 'Cookie Levin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 419650, 1, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 762191, 17, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 1739645, 7, 'actress', 'City Attorney');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 3117334, 15, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 3749397, 16, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 4982783, 8, 'actor', 'Activist');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 4982783, 9, 'actor', 'Self - Author');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 7142794, 10, 'actor', 'Public Defender');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 7275197, 11, 'actor', 'Kalief Browder');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013618, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013619, 3, 'self', 'Self - Kalief''s Mother');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013619, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013623, 13, 'self', 'Self - Kalief''s Sister');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013623, 14, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013624, 5, 'self', 'Self - Lawyer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 8013624, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6133034, 9304510, 12, 'self', 'Self - ACLU');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 915750, 11, 'actor', 'Spencer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 915750, 12, 'actor', 'Benglo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 950725, 9, 'actor', 'Blue Overdrive Ranger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 950725, 10, 'actor', 'Dax Lo');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 1097221, 13, 'actor', 'Norg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 1097221, 14, 'actor', 'Mig');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 1628056, 7, 'actress', 'Pink Overdrive Ranger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 1628056, 8, 'actress', 'Rose Ortiz');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2017335, 1, 'actor', 'Mack Hartford');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2017335, 2, 'actor', 'Red Overdrive Ranger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2157205, 15, 'actor', 'Flurious');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2157205, 16, 'actor', 'Datun');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2197593, 5, 'actor', 'Black Overdrive Ranger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2197593, 6, 'actor', 'Will Aston');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2564906, 3, 'actress', 'Ronny Robinson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 2564906, 4, 'actress', 'Yellow Overdrive Ranger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 4889703, 17, 'actor', 'Andrew Hartford');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 4889703, 18, 'actor', 'Florius');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 5222799, 19, 'actor', 'Mack Hartford');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (784920, 5222799, 20, 'actor', 'Red Overdrive Ranger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 4334345, 5, 'actor', 'Steve');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 4406070, 7, 'actress', 'Alex');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 4829112, 9, 'actor', 'Voice Inside of Jason''s Head');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5401586, 8, 'actor', 'Voice Inside of Jason''s Head');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5665787, 2, 'actor', 'Villagers');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5665787, 3, 'actor', 'Villager');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5665787, 4, 'actor', 'The Great and Powerful One');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5665787, 15, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5665843, 10, 'actor', 'Voice Inside of Jason''s Head');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5666084, 1, 'actor', 'Jason');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 5666084, 16, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 6094267, 6, 'actor', 'Voice Inside of Jason''s Head');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 7724468, 11, 'actor', 'George');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 7724468, 12, 'actor', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 7724468, 13, 'actor', 'Zombies');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (11597332, 11280043, 14, 'actor', 'George the Pig');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 2976444, 2, 'actor', 'Lector');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 7193193, 7, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 9472721, 10, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 11399236, 3, 'actress', 'Karolina Glowacka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 11401508, 4, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 11697691, 1, 'actor', 'Damian Petrov');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 12044557, 8, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 12044708, 9, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 12044785, 5, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (13415620, 12044857, 6, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 1293137, 7, 'actor', 'Pawel Maj');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 2983438, 5, 'actress', 'Tamara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 4934471, 8, 'actor', 'Dawid');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 6626925, 6, 'actress', 'Bogusia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 6873940, 9, 'actor', 'Coach Marcin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 9267585, 1, 'actress', 'Lena Glowacka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 10743253, 4, 'actress', 'Malwina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 11491384, 10, 'actor', 'Jacek');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 14490628, 2, 'actor', 'Niko');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27688981, 14829616, 3, 'actor', 'Igor Tymczenko');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 194143, 7, 'actor', 'Sojka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 194159, 5, 'actress', 'Savka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 417712, 4, 'actor', 'Beli');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 431262, 8, 'actor', 'Matic');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 467437, 6, 'actor', 'Sef obezbedjenja');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 491551, 3, 'actor', 'Silja');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 539687, 10, 'actor', 'Jezerkic');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 698444, 2, 'actor', 'Koske');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 865395, 9, 'actor', 'Petko');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (90524, 957372, 1, 'actor', 'Upravnik');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 5275, 1, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 1275273, 5, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 1276077, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 1276078, 3, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 3090277, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 8634162, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 8634163, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 8634164, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 12036874, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (331381, 13965437, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 1155055, 3, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 1455618, 5, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 1459783, 8, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 1459785, 1, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 1460856, 7, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 1784913, 10, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 4647943, 4, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 4853585, 2, 'actress', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 6836912, 9, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14099968, 12340880, 6, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 104561, 1, 'actor', 'Kurt Olsson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 104561, 2, 'actor', 'Olle Olsson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 249731, 11, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 257023, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 391586, 12, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 423980, 13, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 435025, 14, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 617921, 6, 'actor', 'Farfar Olsson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 617921, 7, 'actor', 'Härmfågel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 706709, 4, 'actress', 'Gudrun');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 706709, 5, 'actress', 'Asta Olsson');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 797931, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 797931, 9, 'self', 'Farmor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (98841, 928053, 3, 'actor', 'Arne Nyström');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4343788, 695831, 1, 'actor', 'Phred');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 127382, 2, 'actor', 'Fernand Van Bom');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 144269, 4, 'actor', 'Emiel Koeckelenberg');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 210034, 10, 'actress', 'Frieda');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 211139, 9, 'actor', 'Clement Verbiest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 211140, 1, 'actor', 'Francis De Doncker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 212402, 3, 'actress', 'Charlotte Verbiest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 260234, 8, 'actress', 'Betty Van Nuffelen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 583701, 5, 'actor', 'Jean-Paul De Doncker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 887336, 7, 'actor', 'Victor De Doncker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (238794, 887625, 6, 'actress', 'Rachel De Doncker');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 1192046, 1, 'actor', 'Narrated by');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 1192046, 2, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 1192046, 3, 'actor', 'Self & Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 12970116, 11, 'self', 'Self - Tree Cutter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13017466, 6, 'self', 'Self - Rear Loader Driver');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13033660, 7, 'self', 'Self - Electrician');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13060470, 4, 'self', 'Self - Captain');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13096912, 5, 'self', 'Self - Ride Engineering Supervisor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13102538, 10, 'self', 'Self - Baggage Technician');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13121634, 8, 'self', 'Self - Maintenance Technician');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13160618, 12, 'self', 'Self - Salt Harvester');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15460842, 13165949, 9, 'self', 'Self - Scrap Inspector');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27622290, 14796593, 1, 'actress', 'Holly Rey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (27622290, 14796594, 2, 'actress', 'Mimi Rey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 2051, 1, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 2051, 2, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 212818, 12, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 212818, 13, 'self', 'Self - Singer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 502035, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 502043, 5, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 502051, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 502056, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 640734, 10, 'self', 'Self - Announcer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 640734, 11, 'self', 'Announcer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 829484, 9, 'self', 'Self - Announcer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 1293376, 3, 'self', 'Themselves');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63916, 2126217, 8, 'self', 'Themselves');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 169212, 9, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 285783, 1, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 400803, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 1712157, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 4856047, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 4997747, 3, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 6186922, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 6186923, 5, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 7256417, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3437610, 7591840, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6213220, 1223801, 3, 'actor', 'Ernest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6213220, 3419179, 2, 'actress', 'Melusine');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6213220, 5312818, 4, 'actress', 'Célestine');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6213220, 8743192, 1, 'actress', 'Margotine');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 722, 2, 'actor', 'Stephen Courtney-Briggs');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 255837, 8, 'actress', 'Madeleine Goodall');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 262530, 6, 'actress', 'Sister Hilda Rolfe');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 292187, 4, 'actress', 'Sister Mavis Gearing');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 550462, 1, 'actor', 'Adam Dalgliesh');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 562768, 10, 'actress', 'Julia Pardoe');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 644740, 9, 'actress', 'Christine Dakers');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 898905, 7, 'actor', 'DS John Massingham');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 925811, 5, 'actress', 'Sister Ethel Brumfett');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (199026, 1154160, 3, 'actress', 'Matron Mary Taylor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 395950, 3, 'actor', 'Kazuma Sakai');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 628649, 11, 'actress', 'Miwa Takei');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 645636, 2, 'actor', 'Aoyama');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 782840, 1, 'actor', 'Kaoru Zaizen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 949049, 4, 'actor', 'Taichi Yoshioka');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 1160233, 5, 'actor', 'Jin Tsukamoto');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 1617276, 7, 'actor', 'Gaku Ishikawa');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 4739645, 12, 'actor', 'Keiji Kajiwara');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 4739645, 13, 'actor', 'Kirishima');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 4739645, 14, 'actor', 'God of Soccer');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 7124125, 8, 'actor', 'Kiyoshi Sato');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 7124125, 9, 'actor', 'Kirishima''s friend');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 7124125, 10, 'actor', 'Jinnai-sensei');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (7263380, 9208582, 6, 'actress', 'Moka Goto');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 110036, 4, 'actress', 'Ana ''Anita'' Bermúdez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 110036, 5, 'actress', 'Ana ''Anita''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 138612, 14, 'actor', 'Jefe Eugenia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 138612, 15, 'actor', 'Gutiérrez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 139910, 2, 'actress', 'Eugenia Bermúdez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 139910, 3, 'actress', 'Eugenia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 211482, 11, 'actor', 'Poli');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 352313, 12, 'actor', 'Carlos Sánchez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 352313, 13, 'actor', 'Carlos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 401370, 1, 'actor', 'Diego Bermúdez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 476889, 10, 'actor', 'Sebastián');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 726315, 6, 'actress', 'Rosario Bermúdez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 726315, 7, 'actress', 'Rosario');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 861726, 8, 'actor', 'Don Ramiro Bermúdez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 861726, 9, 'actor', 'Don Ramiro');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (247851, 4968004, 16, 'actor', 'Daniel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 1169354, 2, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 2301857, 8, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 3220973, 3, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 3692666, 5, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 3912020, 1, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 3944581, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 4419194, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1815022, 4419278, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 35277, 11, 'actress', 'Runa Schøll');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 251705, 12, 'actor', 'Geir Paulsen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 329588, 7, 'actress', 'Carina Bredesen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 345039, 9, 'actress', 'Vivian Bredesen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 348297, 10, 'actress', 'Gunhild Hauge');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 427379, 4, 'actor', '''Jonna''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 427379, 5, 'actor', 'Frode Muller');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 653626, 1, 'actor', 'Bjørn Rønningen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 803756, 8, 'actor', 'Cato Bredesen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 845297, 6, 'actor', 'Dan Wester');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 1335996, 2, 'actress', '''Kikki''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1002892, 1335996, 3, 'actress', 'Gisela Søderlund');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 1353833, 2, 'actor', 'Andrey Izvorin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 2444889, 1, 'actress', 'Anna Rybakova');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 2761576, 7, 'actor', 'Anton Grinko');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 3454470, 9, 'actor', 'Parfenov');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 5239239, 6, 'actress', 'Lena');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 5480739, 3, 'actress', 'Katya');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 8306681, 5, 'actor', 'Boris Lykov');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 12022183, 8, 'actress', 'Sofya Danilova');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 12401507, 4, 'actress', 'Filippova');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (28516985, 12699881, 10, 'actor', 'Detdomovets');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 98120, 9, 'actor', 'Jury Bob');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 186717, 3, 'actress', 'Jury Cindy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 864736, 1, 'actress', 'Nina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 2206168, 7, 'actor', 'Nico');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 3108867, 2, 'actor', 'Jury Johann');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 3544802, 6, 'actor', 'Arthur');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 3544802, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 3544802, 12, 'producer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 3872143, 5, 'actress', 'Frau Schneider');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 4561542, 8, 'actress', 'Rachel');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 5413877, 4, 'actress', 'Jeanne ''yoga teacher''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (15852584, 12416940, 10, 'actor', 'Mali');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 2617059, 3, 'self', 'Self - Executive Director, Advancement Project');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 2792327, 9, 'self', 'Self - Founder, English Defence League');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 4219049, 1, 'self', 'Self - CEO, Anti-Defamation League');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 6748584, 4, 'self', 'Self - Chief Storytelling and Marketing Officer, Color of Change');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 7320521, 2, 'self', 'Self - Intelligence Project Director, Southern Poverty Law Center');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 8229275, 5, 'self', 'Self - Reporter, ABC News');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 14153918, 6, 'self', 'Self - Student, Saucon Valley');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 14157300, 8, 'self', 'Self - Son of Ricky Best');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 14157301, 10, 'self', 'Self - Mother of Taliesin Namkai-Meche');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8118934, 14157689, 7, 'self', 'Self - Austins Shooting Survivor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2278073, 7, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2366973, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2416210, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2475153, 6, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2512813, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2765628, 2, 'self', 'Self (2006-2007)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2775491, 3, 'self', 'Self (2007)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 2779259, 5, 'self', 'Self (2007)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 3025446, 4, 'self', 'Self - Guest (2007)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (1088753, 3680986, 1, 'self', 'Self - Guest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 170789, 6, 'actress', 'Betty Sillitoe');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 238635, 12, 'actress', 'Carol Fordingbridge');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 287562, 9, 'actor', 'Elvis Simcock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 368610, 11, 'actor', 'Simon Rodenhurst');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 391563, 8, 'actress', 'Jenny Simcock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 419248, 1, 'actor', 'Ted Simcock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 419785, 10, 'actor', 'Neville Badger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 656452, 3, 'actress', 'Liz Badger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 656452, 4, 'actress', 'Liz Rodenhurst');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 656452, 5, 'actress', 'Badger');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 852438, 2, 'actress', 'Rita Simcock');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (96546, 943823, 7, 'actor', 'Rodney Sillitoe');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 92, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 92, 9, 'self', 'Basil Fawlty');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 92, 10, 'self', 'Self - Celebrity');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 100, 1, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 100, 2, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 19212, 11, 'actor', 'Shane Edmonds');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 19212, 12, 'actor', 'The ''Not'' team''s son');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 256529, 13, 'actor', 'Denis Healey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 256529, 14, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 323851, 15, 'actor', 'Stout Man in Non Diet Pepsi Commercial');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 323851, 16, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 323851, 17, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 486413, 6, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 486413, 7, 'actor', 'Various');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 710884, 18, 'actor', 'Cinema Usher');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 710884, 19, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 722619, 5, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 809321, 3, 'actor', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (80253, 827298, 4, 'actress', 'Various Roles');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 320209, 1, 'actress', 'Mata Hari');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 348888, 2, 'actor', 'George Ladou');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 519933, 7, 'actor', 'Maximilian Ridoh');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 634323, 10, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 710938, 5, 'actress', 'Elizabeth Shragmuller');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 710938, 6, 'actress', 'Elizabeth Schragmüller');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 1142722, 8, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 1246394, 11, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 1835909, 3, 'actress', 'Lidia Kireevskaya');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 3328412, 4, 'actor', 'Astruc');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4110246, 4582537, 9, 'actor', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (2372238, 700529, 1, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 282, 2, 'actor', 'Ethan Barnes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 317, 8, 'actor', 'Peter Kozyck');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 1513, 1, 'actor', 'Bill Dunne');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 11882, 10, 'actor', 'Julian Kerbis');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 17167, 9, 'actor', 'Dino');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 188041, 3, 'actress', 'Janet LeClaire');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 301925, 4, 'actor', 'Quentin Druzinski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 455242, 5, 'actress', 'Jamie Templeton');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 760254, 6, 'actor', 'Mel Thomas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 827695, 11, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (245022, 910076, 7, 'actress', 'Rachel Glass');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 5318, 10, 'actress', 'Maya Kandinski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 154000, 8, 'actress', 'Taylor Slate');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 177532, 15, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 192271, 5, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 192271, 6, 'actor', 'Nuremberg Devil');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 192271, 7, 'actor', 'The Devil');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 239294, 4, 'actress', 'Jeri Slate');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 336125, 9, 'actress', 'Katrina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 396406, 12, 'actor', 'The Abbey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 396406, 13, 'actor', 'Abbey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 396406, 14, 'actor', 'Grave Robber');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 413263, 11, 'actor', 'Danny Hullstrom');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 469475, 1, 'actor', 'Morgan Pym');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 558520, 16, 'writer', NULL);
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 1138942, 2, 'actor', 'Gabriel Slate');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (380869, 1176497, 3, 'actress', 'Maya Kandinski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14758812, 13741860, 1, 'self', 'Self (Host)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (14758812, 13741861, 2, 'actor', '(Narrator)');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 348, 4, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 80892, 1, 'actress', '(segment "Errol Flynn")');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 80892, 2, 'actress', '(segment: ''Jodie Foster'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 80892, 3, 'actress', 'Black Dahlia');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 203524, 6, 'actor', '(segment: ''Bela Lugosi'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 203524, 7, 'actor', 'Alan Ladd');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 203524, 8, 'actor', 'Joe Kennedy');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 290475, 5, 'actor', 'Narrator');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 418959, 12, 'actor', 'James Dean');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 418959, 13, 'actor', 'Roman Polanski');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 418959, 14, 'actor', 'Segment: ''alfred hitchcock''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 559193, 23, 'actor', '(segment "John Belushi")');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 559193, 24, 'actor', 'Segment: ''sophia loren''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 678070, 9, 'actress', '(segment "Errol Flynn")');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 678070, 10, 'actress', 'Lita Grey');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 678070, 11, 'actress', 'Segment: ''roman polanski''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 817043, 18, 'actor', '(segment "Vivien Leigh")');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 817043, 19, 'actor', '(segment: ''Bela Lugosi'')');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 817043, 20, 'actor', 'Segment: ''pantages''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 1521684, 15, 'actor', 'Desi Arnez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 1521684, 16, 'actor', 'Laurence Olivier');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 1521684, 17, 'actor', 'Segment: ''laurence olivier''');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 3270875, 21, 'actress', 'Brigitte Nielsen');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (826211, 3270875, 22, 'actress', 'Bella Darvi');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 1372052, 10, 'actor', 'William');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 2097384, 6, 'actress', 'Vilde');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 3651589, 7, 'actor', 'Kaibosh 3');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 4695420, 2, 'actor', 'Håkon');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 5456331, 1, 'actress', 'Maja');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 5818461, 4, 'actor', 'Kaibosh 2');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 8175918, 9, 'actor', 'Thomas Hayes');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 9752945, 3, 'actress', 'Sofie');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 10184096, 5, 'actress', 'Emma');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (8232658, 10952801, 8, 'actress', 'Kaibosh 4');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 905357, 1, 'actor', 'Aiken');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 1591496, 3, 'actor', 'Locke');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 1739987, 6, 'actor', 'Horrigan');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 2325042, 7, 'actor', 'Axl');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 2757852, 4, 'actor', 'Ramos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 4211410, 8, 'actress', 'Gaines');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 4377217, 9, 'actor', 'Hundley');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 6666382, 10, 'actress', 'Doctor');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 6671482, 5, 'actor', 'Estrin');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (3804114, 6709511, 2, 'actor', 'Aiken''s Daughter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 40125, 3, 'actor', 'Palych');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 499246, 2, 'actress', 'Lyuba');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 2659916, 5, 'actor', 'Kolya');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 3323035, 10, 'actor', 'Kultovyy komik');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 3907729, 9, 'actor', 'Gleb');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 5040910, 1, 'actress', 'Nika');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 6055366, 6, 'actor', 'Tyoma');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 7478043, 4, 'actress', 'Marina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 10419411, 8, 'actor', 'Sem');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (6519032, 12064054, 7, 'actor', 'Anya');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 89982, 1, 'actor', 'Cookie Bear');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 89982, 2, 'actor', 'Self - Cookie Bear');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 130324, 11, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 254177, 9, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 424527, 14, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 424527, 15, 'self', 'Self - Guest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 519296, 10, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 698512, 5, 'actor', 'Cookie Bear');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 698512, 6, 'actor', 'Self - Cookie Bear');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 828696, 12, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 828696, 13, 'self', 'Self - Guest');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 930023, 3, 'self', 'Self - Host');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 930023, 4, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 941506, 8, 'self', 'Self');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (63866, 1478739, 7, 'self', 'Themselves');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (4339188, 3738444, 1, 'self', 'Self - Presenter');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (29390842, 771510, 2, 'actress', 'Milla');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (29390842, 9387920, 5, 'actor', 'Nicklas');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (29390842, 11115129, 1, 'actress', 'Aino');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (29390842, 13070622, 3, 'actress', 'Andrea');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (29390842, 13614223, 4, 'actress', 'Työkaveri');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 25953, 5, 'actress', 'Estefanía Bracho');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 173393, 3, 'actor', 'Carlos Daniel Bracho');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 246705, 9, 'actress', 'Lalita');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 303853, 7, 'actor', 'Guillermo ''Willy'' Montero');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 346260, 11, 'actor', 'Carlitos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 350081, 6, 'actress', 'Fidelina');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 432823, 8, 'actress', 'Patricia Bracho');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 482840, 4, 'actress', 'Abuela Piedad Bracho');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 786465, 10, 'actress', 'Cachita Cienfuegos');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 816828, 1, 'actress', 'Paulina Martínez');
INSERT INTO participate (m_id, p_id, ordering, role, casting) VALUES (211878, 816828, 2, 'actress', 'Paola Bracho');


--
-- TOC entry 4946 (class 0 OID 17916)
-- Dependencies: 252
-- Data for Name: prefer; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO prefer (c_id, gr_id) VALUES (176, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (176, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (176, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (291, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (291, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (291, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (742, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (742, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (742, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (776, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (776, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (776, 23);
INSERT INTO prefer (c_id, gr_id) VALUES (855, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (855, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (855, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (869, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (869, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (869, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (1013, 9);
INSERT INTO prefer (c_id, gr_id) VALUES (1013, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (1013, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (1087, 1);
INSERT INTO prefer (c_id, gr_id) VALUES (1087, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (1087, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (1106, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (1106, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (1106, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (1319, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (1319, 11);
INSERT INTO prefer (c_id, gr_id) VALUES (1319, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (1387, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (1387, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (1387, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (1530, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (1530, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (1530, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (1614, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (1614, 24);
INSERT INTO prefer (c_id, gr_id) VALUES (1614, 26);
INSERT INTO prefer (c_id, gr_id) VALUES (1615, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (1615, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (1615, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (1700, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (1700, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (1700, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (1718, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (1718, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (1718, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (1725, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (1725, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (1725, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (1754, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (1754, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (1754, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (2055, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (2055, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (2055, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (2068, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (2068, 11);
INSERT INTO prefer (c_id, gr_id) VALUES (2068, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (2185, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (2185, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (2185, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (2372, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (2372, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (2372, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (2459, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (2459, 11);
INSERT INTO prefer (c_id, gr_id) VALUES (2459, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (2520, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (2520, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (2520, 26);
INSERT INTO prefer (c_id, gr_id) VALUES (2580, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (2580, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (2580, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (2596, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (2596, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (2596, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (2921, 4);
INSERT INTO prefer (c_id, gr_id) VALUES (2921, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (2921, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (2949, 9);
INSERT INTO prefer (c_id, gr_id) VALUES (2949, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (2949, 26);
INSERT INTO prefer (c_id, gr_id) VALUES (3004, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (3004, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (3004, 25);
INSERT INTO prefer (c_id, gr_id) VALUES (3085, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (3085, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (3085, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (3344, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (3344, 22);
INSERT INTO prefer (c_id, gr_id) VALUES (3344, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (3358, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (3358, 6);
INSERT INTO prefer (c_id, gr_id) VALUES (3358, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (3575, 7);
INSERT INTO prefer (c_id, gr_id) VALUES (3575, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (3575, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (3629, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (3629, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (3629, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (3908, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (3908, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (3908, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (3935, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (3935, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (3935, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (4037, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (4037, 24);
INSERT INTO prefer (c_id, gr_id) VALUES (4037, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (4194, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (4194, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (4194, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (4220, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (4220, 23);
INSERT INTO prefer (c_id, gr_id) VALUES (4220, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (4383, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (4383, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (4383, 25);
INSERT INTO prefer (c_id, gr_id) VALUES (4755, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (4755, 11);
INSERT INTO prefer (c_id, gr_id) VALUES (4755, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (4987, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (4987, 4);
INSERT INTO prefer (c_id, gr_id) VALUES (4987, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (4999, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (4999, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (4999, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (5000, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (5000, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (5000, 25);
INSERT INTO prefer (c_id, gr_id) VALUES (5064, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (5064, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (5064, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (5105, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (5105, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (5105, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (5416, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (5416, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (5416, 26);
INSERT INTO prefer (c_id, gr_id) VALUES (5654, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (5654, 6);
INSERT INTO prefer (c_id, gr_id) VALUES (5654, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (5839, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (5839, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (5839, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (5982, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (5982, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (5982, 26);
INSERT INTO prefer (c_id, gr_id) VALUES (6019, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (6019, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (6019, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (6287, 4);
INSERT INTO prefer (c_id, gr_id) VALUES (6287, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (6287, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (6369, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (6369, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (6369, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (6391, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (6391, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (6391, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (6460, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (6460, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (6460, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (6481, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (6481, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (6481, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (6575, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (6575, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (6575, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (6735, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (6735, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (6735, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (6747, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (6747, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (6747, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (6793, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (6793, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (6793, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (7055, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (7055, 24);
INSERT INTO prefer (c_id, gr_id) VALUES (7055, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (7103, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (7103, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (7103, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (7384, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (7384, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (7384, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (7422, 7);
INSERT INTO prefer (c_id, gr_id) VALUES (7422, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (7422, 22);
INSERT INTO prefer (c_id, gr_id) VALUES (7542, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (7542, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (7542, 22);
INSERT INTO prefer (c_id, gr_id) VALUES (7704, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (7704, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (7704, 25);
INSERT INTO prefer (c_id, gr_id) VALUES (7740, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (7740, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (7740, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (7741, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (7741, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (7741, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (7761, 9);
INSERT INTO prefer (c_id, gr_id) VALUES (7761, 22);
INSERT INTO prefer (c_id, gr_id) VALUES (7761, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (7768, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (7768, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (7768, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (8046, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (8046, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (8046, 24);
INSERT INTO prefer (c_id, gr_id) VALUES (8089, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (8089, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (8089, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (8091, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (8091, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (8091, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (8094, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (8094, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (8094, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (8154, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (8154, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (8154, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (8274, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (8274, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (8274, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (8456, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (8456, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (8456, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (8459, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (8459, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (8459, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (8799, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (8799, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (8799, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (9176, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (9176, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (9176, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (9217, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (9217, 11);
INSERT INTO prefer (c_id, gr_id) VALUES (9217, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (9272, 6);
INSERT INTO prefer (c_id, gr_id) VALUES (9272, 10);
INSERT INTO prefer (c_id, gr_id) VALUES (9272, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (9276, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (9276, 22);
INSERT INTO prefer (c_id, gr_id) VALUES (9276, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (9298, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (9298, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (9298, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (9323, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (9323, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (9323, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (9422, 13);
INSERT INTO prefer (c_id, gr_id) VALUES (9422, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (9422, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (9514, 6);
INSERT INTO prefer (c_id, gr_id) VALUES (9514, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (9514, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (9555, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (9555, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (9555, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (9566, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (9566, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (9566, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (9615, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (9615, 17);
INSERT INTO prefer (c_id, gr_id) VALUES (9615, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (9637, 5);
INSERT INTO prefer (c_id, gr_id) VALUES (9637, 14);
INSERT INTO prefer (c_id, gr_id) VALUES (9637, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (9654, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (9654, 16);
INSERT INTO prefer (c_id, gr_id) VALUES (9654, 27);
INSERT INTO prefer (c_id, gr_id) VALUES (9672, 1);
INSERT INTO prefer (c_id, gr_id) VALUES (9672, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (9672, 20);
INSERT INTO prefer (c_id, gr_id) VALUES (9705, 9);
INSERT INTO prefer (c_id, gr_id) VALUES (9705, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (9705, 18);
INSERT INTO prefer (c_id, gr_id) VALUES (9778, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (9778, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (9778, 21);
INSERT INTO prefer (c_id, gr_id) VALUES (9859, 6);
INSERT INTO prefer (c_id, gr_id) VALUES (9859, 12);
INSERT INTO prefer (c_id, gr_id) VALUES (9859, 19);
INSERT INTO prefer (c_id, gr_id) VALUES (9878, 4);
INSERT INTO prefer (c_id, gr_id) VALUES (9878, 15);
INSERT INTO prefer (c_id, gr_id) VALUES (9878, 28);
INSERT INTO prefer (c_id, gr_id) VALUES (9879, 2);
INSERT INTO prefer (c_id, gr_id) VALUES (9879, 8);
INSERT INTO prefer (c_id, gr_id) VALUES (9879, 21);


--
-- TOC entry 4943 (class 0 OID 17892)
-- Dependencies: 249
-- Data for Name: profession; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO profession (p_id, ocu_id) VALUES (53, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (53, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (53, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (92, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (92, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (92, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (100, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (100, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (100, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (228, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (228, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (228, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (231, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (231, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (231, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (282, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (282, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (317, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (317, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (317, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (347, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (347, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (347, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (348, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (348, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (348, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (410, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (410, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (410, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (434, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (434, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (434, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (535, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (535, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (535, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (638, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (638, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (638, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (705, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (705, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (705, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (722, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (722, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (722, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (790, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (790, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (790, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (993, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (993, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (993, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1464, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1464, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1464, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1486, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1486, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1486, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1513, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1513, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1513, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1556, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1556, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1556, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1593, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1593, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1593, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1654, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1654, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1654, 35);
INSERT INTO profession (p_id, ocu_id) VALUES (1813, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1813, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1813, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1826, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1826, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1826, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (1883, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1883, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1883, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1957, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1957, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2051, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2051, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (2051, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2079, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2079, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2079, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2083, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2083, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2083, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2554, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2554, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (3162, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3162, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3162, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3944, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3944, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (3944, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4170, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4170, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (4170, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4847, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4847, 21);
INSERT INTO profession (p_id, ocu_id) VALUES (4847, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4916, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4916, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (4916, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (4988, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4988, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (4988, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5189, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5189, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (5189, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5275, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5275, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (5275, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5318, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5318, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5318, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5471, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5471, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (5471, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (6219, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (6219, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (6219, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (11882, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (11882, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (11882, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (15924, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (15924, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (15924, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (17167, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (17167, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (18746, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (18746, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (19212, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (19212, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (21596, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (21596, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (21596, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (23524, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (23524, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (23524, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (25953, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (25953, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (31973, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (31973, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (33312, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (33312, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (33312, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (35277, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (35277, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (35602, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (35602, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (35602, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (39583, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (39583, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (39583, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (40125, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (40125, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (40125, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (40739, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (40739, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (40739, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (43389, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (43389, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (43389, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (45209, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (45209, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (45209, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (48083, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (52218, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (52218, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (52218, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (63527, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (63527, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (63527, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (64086, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (70355, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (73388, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (73388, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (73388, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (80867, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (80867, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (80867, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (80892, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (80892, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (80892, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (89603, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (89603, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (89982, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (89982, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (89982, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (89984, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (89984, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (91144, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (91144, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (91286, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (91286, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (91286, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (94951, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (94951, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (98120, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (98120, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (98120, 41);
INSERT INTO profession (p_id, ocu_id) VALUES (103071, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (103071, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (103120, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (103120, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (103722, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (103722, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (103722, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (104113, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (104113, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (104113, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (104405, 8);
INSERT INTO profession (p_id, ocu_id) VALUES (104405, 18);
INSERT INTO profession (p_id, ocu_id) VALUES (104405, 34);
INSERT INTO profession (p_id, ocu_id) VALUES (104561, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (104561, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (104561, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (110036, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (110518, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (110518, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (110518, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (118840, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (118840, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (120662, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (122184, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (122184, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (122184, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (127382, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (127382, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (130282, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (130282, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (130282, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (130324, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (130324, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (130324, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (132616, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (133936, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (133936, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (137262, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (137262, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (137262, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (138612, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (138612, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (139910, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (139910, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (139910, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (141745, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (141745, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (141745, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (143599, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (143599, 29);
INSERT INTO profession (p_id, ocu_id) VALUES (143599, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (143918, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (143918, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (144269, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (144269, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (147310, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (147310, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (147310, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (147689, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (147689, 11);
INSERT INTO profession (p_id, ocu_id) VALUES (147689, 20);
INSERT INTO profession (p_id, ocu_id) VALUES (149942, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (149942, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (149942, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (152839, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (152839, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (152839, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (154000, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (154000, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (154000, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (154811, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (154811, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (154811, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (156078, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (159609, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (159609, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (159609, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (162159, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (164800, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (164800, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (169212, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (169212, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (169212, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (170789, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (170789, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (170789, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (173268, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (173393, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (173393, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (173393, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (175834, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (175834, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (175834, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (177532, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (177532, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (177532, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (182456, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (182456, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (182456, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (185286, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (185286, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (185286, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (185954, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (185954, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (185954, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (186717, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (186717, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (186717, 43);
INSERT INTO profession (p_id, ocu_id) VALUES (188041, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (188041, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (192271, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (192271, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (192271, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (194143, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (194143, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (194143, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (194159, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (194159, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (195627, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (195627, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (195627, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (195639, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (195639, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (195639, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (200615, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (200615, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (200615, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (203524, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (210034, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (210034, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (211139, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (211139, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (211139, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (211140, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (211140, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (211140, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (211482, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (211482, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (211482, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (212402, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (212818, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (212818, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (212818, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (220635, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (220635, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (220635, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (225191, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (225191, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (225191, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (227704, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (227704, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (227704, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (227831, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (227831, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (227831, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (227885, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (227885, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (231942, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (231942, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (231942, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (236519, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (236519, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (236519, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (238046, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (238046, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (238635, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (238739, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (239294, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (239294, 12);
INSERT INTO profession (p_id, ocu_id) VALUES (239294, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (245364, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (246705, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (249731, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (250004, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (250004, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (250004, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (251705, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (251705, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (251705, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (253126, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (253126, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (253126, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (254177, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (254177, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (254177, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (254387, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (254387, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (254387, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (254402, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (254402, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (254402, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (255281, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (255281, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (255281, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (255837, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (256529, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (256529, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (256529, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (257023, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (257023, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (257237, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (257237, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (257237, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (258012, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (258012, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (258012, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (258321, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (258321, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (260234, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (260234, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (262530, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (263582, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (263582, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (263582, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (267977, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (267977, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (273253, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (273253, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (273253, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (278442, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (278442, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (278442, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (278920, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (282547, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (282547, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (283747, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (285783, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (285783, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (285783, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (287515, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (287562, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (290475, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (290475, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (290475, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (291217, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (291217, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (291217, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (292187, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (292187, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (292187, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (296791, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (299134, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (299134, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (299134, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (301925, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (301925, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (301925, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (303853, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (303853, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (303853, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (305894, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (305894, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (312036, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (318027, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (318027, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (318027, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (318703, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (319308, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (319308, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (319308, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (320209, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (323177, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (323177, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (323177, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (323851, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (324009, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (324009, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (324009, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (326091, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (326091, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (329588, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (329848, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (332562, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (332562, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (332562, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (336125, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (340264, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (344006, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (344043, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (345039, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (346260, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (346270, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (348297, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (348888, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (348888, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (350081, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (350081, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (351758, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (352313, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (352313, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (353362, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (353362, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (353362, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (353588, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (353588, 29);
INSERT INTO profession (p_id, ocu_id) VALUES (353588, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (358772, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (358772, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (362691, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (368561, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (368561, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (368561, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (368610, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (368610, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (368610, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (369954, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (369954, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (369954, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (372553, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (372553, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (372553, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (373668, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (373668, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (379084, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (382995, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (382995, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (384494, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (384494, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (384494, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (386810, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (386810, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (386810, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (386944, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (386944, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (386944, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (390161, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (390161, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (390161, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (390417, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (391563, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (391586, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (391586, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (393222, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (393222, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (393222, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (395443, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (395443, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (395950, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (395950, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (395950, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (396406, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (396406, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (400803, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (401370, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (408846, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (408846, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (409287, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (409287, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (409287, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (411879, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (411879, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (411879, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (412336, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (413263, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (413263, 13);
INSERT INTO profession (p_id, ocu_id) VALUES (413263, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (417712, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (417712, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (418959, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (418959, 12);
INSERT INTO profession (p_id, ocu_id) VALUES (418959, 41);
INSERT INTO profession (p_id, ocu_id) VALUES (419248, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (419248, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (419248, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (419650, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (419650, 29);
INSERT INTO profession (p_id, ocu_id) VALUES (419650, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (419785, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (419785, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (419785, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (423980, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (424527, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (424527, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (424527, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (427379, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (427379, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (427379, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (429115, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (429115, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (429115, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (431262, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (432823, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (432823, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (433738, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (435025, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (436778, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (436778, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (436778, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (441972, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (441972, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (446672, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (446672, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (446672, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (455242, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (458971, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (458971, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (458971, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (464674, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (464674, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (467437, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (468865, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (469475, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (469475, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (469475, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (469671, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (469671, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (469671, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (476889, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (476889, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (476889, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (476907, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (482840, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (482840, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (482840, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (482936, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (482936, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (482936, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (485183, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (485183, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (486095, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (486095, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (486413, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (486413, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (486413, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (487842, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (487842, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (489292, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (489292, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (489292, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (490704, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (491551, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (491551, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (493200, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (493200, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (493200, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (496378, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (496378, 35);
INSERT INTO profession (p_id, ocu_id) VALUES (497525, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (498472, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (499246, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (499246, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (500398, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (500398, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (500398, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (502035, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (502035, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (502043, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (502043, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (502043, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (502051, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (502051, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (502051, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (502056, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (502056, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (504489, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (504489, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (504489, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (507691, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (507691, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (507691, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (508877, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (508877, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (508877, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (519296, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (519296, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (519296, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (519933, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (519933, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (526103, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (526103, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (527179, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (528433, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (528433, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (528433, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (530308, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (530308, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (531933, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (531933, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (531933, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (537854, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (537854, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (537854, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (539197, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (539687, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (542603, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (542652, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (542652, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (542652, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (544718, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (544718, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (544718, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (550462, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (550462, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (551502, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (551502, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (551502, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (553013, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (553013, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (553013, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (553436, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (553436, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (553436, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (558520, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (558520, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (558520, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (559193, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (561841, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (561841, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (561841, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (561890, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (561890, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (562768, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (563983, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (565907, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (565907, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (565907, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (566331, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (579914, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (579914, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (579914, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (581536, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (581536, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (581751, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (581762, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (581762, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (581762, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (583472, 11);
INSERT INTO profession (p_id, ocu_id) VALUES (583472, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (583472, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (583701, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (583701, 13);
INSERT INTO profession (p_id, ocu_id) VALUES (583701, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (586528, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (586528, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (586528, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (592400, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (592400, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (592400, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (592950, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (592950, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (596959, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (596959, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (596959, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (599649, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (603800, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (603800, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (603800, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (606043, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (606043, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (606043, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (612818, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (612818, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (614877, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (614877, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (614877, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (617921, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (625899, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (625899, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (625899, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (628606, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (628606, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (628649, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (628649, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (628649, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (634323, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (634323, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (634323, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (640734, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (640734, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (640734, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (642601, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (642601, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (642601, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (644740, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (645636, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (645636, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (645636, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (645806, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (647434, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (647434, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (647434, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (653626, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (656452, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (656452, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (656452, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (666547, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (666547, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (666547, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (668271, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (668271, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (668271, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (673391, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (673391, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (673391, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (673897, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (673897, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (673897, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (674977, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (674977, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (674977, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (675340, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (675340, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (678070, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (679984, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (679984, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (685142, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (685142, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (692927, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (692927, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (692927, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (694619, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (694619, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (694619, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (695831, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (695831, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (695831, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (698444, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (698512, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (698512, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (698512, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (700529, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (705779, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (705779, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (705779, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (706709, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (708698, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (708698, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (708698, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (710884, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (710884, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (710884, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (710938, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (710938, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (710938, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (719535, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (719535, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (720184, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (720304, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (720304, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (720304, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (722619, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (722619, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (722619, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (722676, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (722676, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (722676, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (723218, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (723218, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (724656, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (724656, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (724656, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (726167, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (726167, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (726167, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (726315, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (726939, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (726939, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (728751, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (730168, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (730168, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (730419, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (730419, 29);
INSERT INTO profession (p_id, ocu_id) VALUES (730419, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (746125, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (746125, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (746125, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (748387, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (748387, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (749008, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (749008, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (749008, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (752490, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (753486, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (753486, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (760254, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (761809, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (761809, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (761809, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (762191, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (762191, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (762191, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (771510, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (771706, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (771706, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (773846, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (778081, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (778081, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (781493, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (781493, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (781493, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (782840, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (782840, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (782840, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (783314, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (783314, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (783314, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (786465, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (786465, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (786465, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (788958, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (793892, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (797725, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (797725, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (797725, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (797931, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (797931, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (798025, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (798025, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (798025, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (800219, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (800219, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (803756, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (804887, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (804887, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (804887, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (809321, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (809321, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (809321, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (815071, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (815071, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (815071, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (816828, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (816828, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (816828, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (817043, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (817043, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (817043, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (827298, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (827298, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (827298, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (827695, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (827695, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (827695, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (828696, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (828696, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (828696, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (828745, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (828745, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (828745, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (829484, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (829484, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (829484, 44);
INSERT INTO profession (p_id, ocu_id) VALUES (833080, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (833080, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (833080, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (835292, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (835292, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (839578, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (843955, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (843955, 7);
INSERT INTO profession (p_id, ocu_id) VALUES (843955, 17);
INSERT INTO profession (p_id, ocu_id) VALUES (845297, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (848801, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (848801, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (848801, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (852438, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (852438, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (852438, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (853299, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (853299, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (857953, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (861726, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (861726, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (861726, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (861830, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (861830, 41);
INSERT INTO profession (p_id, ocu_id) VALUES (861830, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (863192, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (863192, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (863192, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (863622, 4);
INSERT INTO profession (p_id, ocu_id) VALUES (863622, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (863622, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (864736, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (864908, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (864908, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (865395, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (879239, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (879239, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (887336, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (887336, 11);
INSERT INTO profession (p_id, ocu_id) VALUES (887336, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (887625, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (887931, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (887931, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (887931, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (891391, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (891391, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (891796, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (891796, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (893257, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (893257, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (893257, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (898905, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (898905, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (899211, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (903443, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (903443, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (903443, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (905357, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (905357, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (905357, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (907636, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (907636, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (907636, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (910076, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (910076, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (910076, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (915750, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (915750, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (918805, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (921044, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (921044, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (921699, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (921699, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (921699, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (922967, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (922967, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (923299, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (923299, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (925811, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (925811, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (928053, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (928053, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (930023, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (930023, 29);
INSERT INTO profession (p_id, ocu_id) VALUES (930023, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (930568, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (930568, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (932767, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (932767, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (932767, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (941506, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (941506, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (941506, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (943823, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (943823, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (946148, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (946148, 29);
INSERT INTO profession (p_id, ocu_id) VALUES (946148, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (948985, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (949049, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (949049, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (950725, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (950725, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (954348, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (954348, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (956544, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (956544, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (956544, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (957372, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (957372, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (961577, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (961577, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (961577, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (990444, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (991525, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (991525, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (991525, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (991810, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (991810, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (991810, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (997457, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1001404, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1001404, 4);
INSERT INTO profession (p_id, ocu_id) VALUES (1001404, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1005239, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1005239, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1009405, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1009405, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1009405, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1014554, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1025967, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1036361, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1036361, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1036361, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1039941, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1040396, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1045034, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1046845, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1046845, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1085519, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1097221, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1097221, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1097221, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1110625, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1110625, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1120190, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1120190, 11);
INSERT INTO profession (p_id, ocu_id) VALUES (1120190, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1120335, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1128564, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1128564, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1138201, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1138942, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1142722, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1142722, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1142722, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (1153052, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1153052, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1153052, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1154160, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1154160, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1155055, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1155055, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1160233, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1160233, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1167933, 20);
INSERT INTO profession (p_id, ocu_id) VALUES (1167933, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1167933, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1168954, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1169354, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1169354, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1176497, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1176497, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1192046, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1192046, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1192046, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1197589, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1197589, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1197589, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1204639, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1204639, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (1204639, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1206729, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1206729, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (1206729, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1210304, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1210304, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1210304, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1210922, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1210922, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1223801, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1223801, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1236850, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1246394, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1246394, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1246394, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (1256270, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1256270, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1256270, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1259826, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1259826, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1266343, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1266343, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1266343, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1270699, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1270699, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1270699, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1275273, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (1275273, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1275273, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1276077, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (1276077, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1276077, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1276078, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (1276078, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1276078, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1276570, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1276570, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1281009, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1283558, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1283558, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1284248, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1284248, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1284907, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1285135, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1285135, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1293137, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1293137, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1293376, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1293376, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1293376, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1296163, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1306481, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1308423, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (1308423, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1308423, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1315378, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1315378, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1315378, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1326574, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1326574, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1326574, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1328076, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1328076, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1328076, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1335221, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1335221, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1335221, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1335996, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1350869, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1353833, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1353833, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1353833, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1362936, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1362936, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1372052, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1390122, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1410260, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1410260, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (1410260, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1416557, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1416557, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1416557, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1418935, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1441167, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1450227, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1454130, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1454130, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1454130, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1455618, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1456039, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1459783, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1459785, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1460856, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1475685, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1478739, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1478739, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1478739, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1480633, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1480633, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1486492, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1486492, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1486492, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1493168, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1493623, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1493623, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1495361, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1502440, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1502440, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (1502440, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1507995, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1521684, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1525194, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1525194, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1525194, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1552764, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1591496, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1591496, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1591496, 45);
INSERT INTO profession (p_id, ocu_id) VALUES (1596202, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1617276, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1617276, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1621645, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1621645, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1621645, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1625839, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1628056, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1628056, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1628056, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (1645334, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1645334, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1645334, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1649880, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1650932, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1650932, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1650932, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1652223, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1652223, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1652223, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1679609, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1679609, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1679609, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1683003, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1683003, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (1683003, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1690630, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1690630, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1690630, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1712157, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1712157, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1712157, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1727356, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1727356, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1727356, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1739645, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1739987, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1739987, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1739987, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1764351, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1764351, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1764351, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1767820, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1767820, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1767820, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1784913, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1791970, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1814328, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1835909, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1835909, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1840982, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1840982, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (1840982, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1846255, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1846255, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (1856035, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1868320, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1868320, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (1868320, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1890752, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (1890752, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1890752, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1891021, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1907686, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1907686, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1907686, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (1908654, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1908654, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (1908654, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (1931870, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1931870, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (1938760, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (1947809, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (1958945, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2017335, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2017335, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2017335, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2064061, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2064061, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2064061, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2080557, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2080557, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2096872, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2096872, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2096872, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2096958, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2097384, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2097951, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2102472, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2104765, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2104765, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2104765, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2105255, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2105255, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2125592, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2125592, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2126217, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2126217, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2157205, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2157205, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2157205, 6);
INSERT INTO profession (p_id, ocu_id) VALUES (2197593, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2197593, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2197593, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2206168, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2206168, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2254468, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2254468, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2254468, 26);
INSERT INTO profession (p_id, ocu_id) VALUES (2274179, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2278073, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2278073, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2301857, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2301857, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2301857, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2315320, 20);
INSERT INTO profession (p_id, ocu_id) VALUES (2315320, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2316240, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2316240, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (2316240, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2325042, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2325042, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2325042, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2351099, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2354456, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2366973, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2366973, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2392667, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2392667, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (2392667, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2406892, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2406892, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2406892, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2416210, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2416210, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2416210, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2444889, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2470989, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2475153, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2512813, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2512813, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2542294, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2542294, 13);
INSERT INTO profession (p_id, ocu_id) VALUES (2542294, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (2545508, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2545508, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (2545508, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2559633, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2564906, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2564906, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2614895, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2659916, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2755953, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2755953, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2755953, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2757852, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2757852, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2761576, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2765628, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2775491, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2779259, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2792327, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (2792327, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2792327, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2802722, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2802722, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2802722, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2807968, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2811661, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2811661, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2815503, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2815503, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (2835675, 21);
INSERT INTO profession (p_id, ocu_id) VALUES (2835675, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2835675, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2844388, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2844388, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (2844388, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2858333, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2858333, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2858333, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (2894067, 7);
INSERT INTO profession (p_id, ocu_id) VALUES (2894067, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2904398, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2965079, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2965079, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2965079, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2969210, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2969210, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (2969210, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2976444, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2976492, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2976492, 7);
INSERT INTO profession (p_id, ocu_id) VALUES (2976492, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (2983438, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (2983438, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (2983438, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (2988465, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (2997812, 17);
INSERT INTO profession (p_id, ocu_id) VALUES (2999303, 18);
INSERT INTO profession (p_id, ocu_id) VALUES (3000270, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3006818, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3006818, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3006818, 37);
INSERT INTO profession (p_id, ocu_id) VALUES (3025446, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3105989, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3108867, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3108867, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (3117334, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (3117334, 20);
INSERT INTO profession (p_id, ocu_id) VALUES (3117334, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3125371, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (3141801, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (3141801, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3141801, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3148346, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3201579, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3201579, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (3220973, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3270875, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3270875, 35);
INSERT INTO profession (p_id, ocu_id) VALUES (3271473, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3271473, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3271473, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (3323035, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3328412, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3328412, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (3392665, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3413191, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3413191, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (3413191, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3419179, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3419179, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3419179, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3447129, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (3454470, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3454470, 35);
INSERT INTO profession (p_id, ocu_id) VALUES (3520630, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3524843, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (3531173, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3544802, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3544802, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (3544802, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3606341, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3629180, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3629180, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3631553, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3631553, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (3637677, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3637677, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (3637677, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3647085, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3651589, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3680986, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3688478, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3703274, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3703274, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3727250, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3738444, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3749397, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (3749397, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3749397, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3821405, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3821405, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (3821405, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3856456, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3856456, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (3866538, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3866538, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (3866538, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3872143, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3901455, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (3907729, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3907729, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (3912020, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (3912020, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (3944581, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (3944581, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (4013413, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4013413, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (4013413, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4057338, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4057338, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (4095201, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4096266, 11);
INSERT INTO profession (p_id, ocu_id) VALUES (4096266, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (4096266, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4117720, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4117720, 10);
INSERT INTO profession (p_id, ocu_id) VALUES (4117720, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4166234, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4166234, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (4166234, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (4204713, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4204713, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4204713, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4211410, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4211410, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (4219049, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (4219049, 23);
INSERT INTO profession (p_id, ocu_id) VALUES (4265826, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4265826, 13);
INSERT INTO profession (p_id, ocu_id) VALUES (4265826, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4334345, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4334345, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (4348131, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4348131, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (4377217, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4377217, 11);
INSERT INTO profession (p_id, ocu_id) VALUES (4377217, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4406070, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4406070, 20);
INSERT INTO profession (p_id, ocu_id) VALUES (4406070, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4528537, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (4528537, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4528537, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4561542, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4582537, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4582537, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (4582537, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (4628079, 13);
INSERT INTO profession (p_id, ocu_id) VALUES (4628079, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (4628079, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4629612, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4635210, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (4647943, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4695420, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4727722, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4739645, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4739645, 27);
INSERT INTO profession (p_id, ocu_id) VALUES (4829112, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (4829112, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4829112, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4853585, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (4889703, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4889703, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (4934471, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4934471, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (4934471, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4968004, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4982783, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (4982783, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (4982783, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (4997747, 17);
INSERT INTO profession (p_id, ocu_id) VALUES (5018955, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5040910, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5085683, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5085683, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (5085683, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5222799, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5224688, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (5239239, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5312818, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5401586, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5401586, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (5401586, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5413877, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5456331, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5479260, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (5479260, 45);
INSERT INTO profession (p_id, ocu_id) VALUES (5479260, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5480739, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5492282, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5492282, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5492282, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5492696, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5492696, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (5492696, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5539110, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (5545287, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5545287, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (5665787, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5665787, 4);
INSERT INTO profession (p_id, ocu_id) VALUES (5665787, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (5665843, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5666084, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5666084, 4);
INSERT INTO profession (p_id, ocu_id) VALUES (5666084, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5700310, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (5700310, 24);
INSERT INTO profession (p_id, ocu_id) VALUES (5701200, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5701200, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (5701200, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (5750227, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5818461, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (5991573, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6004468, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6004468, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (6004468, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (6037256, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6055366, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6055366, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (6072896, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6072896, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (6072896, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (6094267, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6100047, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6100047, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (6157905, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6157905, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (6473286, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6473286, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (6506497, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6506497, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (6506497, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (6507213, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6507213, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (6507213, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (6528013, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6528013, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (6626925, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6629365, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6629365, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (6666382, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (6671482, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6709511, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6748584, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (6791174, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6791174, 42);
INSERT INTO profession (p_id, ocu_id) VALUES (6791174, 44);
INSERT INTO profession (p_id, ocu_id) VALUES (6836912, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (6873940, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7124125, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7124125, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (7142794, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7142794, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (7142794, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (7159778, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7193193, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7275197, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7478043, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (7490325, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7490325, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (7490325, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (7523501, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7523501, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (7525352, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (7525352, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (7525352, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (7550362, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7550363, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7559933, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7642779, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (7642779, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (7724468, 4);
INSERT INTO profession (p_id, ocu_id) VALUES (7724468, 39);
INSERT INTO profession (p_id, ocu_id) VALUES (7724468, 45);
INSERT INTO profession (p_id, ocu_id) VALUES (7789161, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (7798190, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (7798190, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (7804130, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (7907002, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (7907003, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (7907011, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (7907012, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (7928530, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (7928530, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (7928530, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (8002547, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8013618, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (8087970, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (8087970, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (8175918, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (8175918, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (8229275, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (8229275, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (8306681, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (8306681, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (8306682, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8390567, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (8525993, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8529582, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8623936, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8634162, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (8634162, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (8743192, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8828374, 15);
INSERT INTO profession (p_id, ocu_id) VALUES (8828374, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (8828374, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (8902266, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (8902266, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (8902266, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (8921993, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (9047728, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (9097681, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (9176319, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (9208582, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (9267585, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (9267585, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (9387920, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (9472721, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (9752945, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (9985811, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (9992506, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10018495, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (10018495, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (10184096, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10184096, 26);
INSERT INTO profession (p_id, ocu_id) VALUES (10184096, 41);
INSERT INTO profession (p_id, ocu_id) VALUES (10184851, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (10184851, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (10184851, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (10358573, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (10419411, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (10419411, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (10441655, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10441655, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (10441655, 40);
INSERT INTO profession (p_id, ocu_id) VALUES (10503136, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10532126, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (10667764, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10667764, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (10667764, 30);
INSERT INTO profession (p_id, ocu_id) VALUES (10743253, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10825952, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10952801, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (10952801, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (11115129, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (11186166, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (11280043, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (11399236, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (11399236, 12);
INSERT INTO profession (p_id, ocu_id) VALUES (11401508, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (11491384, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (11557424, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (11697691, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (11956687, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12022183, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12036874, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (12044557, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12044708, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12044785, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12044857, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12064054, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12107532, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (12213063, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12213064, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12213065, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12213065, 13);
INSERT INTO profession (p_id, ocu_id) VALUES (12213065, 32);
INSERT INTO profession (p_id, ocu_id) VALUES (12213066, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12213067, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12213068, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12307165, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12340880, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12346893, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (12346894, 5);
INSERT INTO profession (p_id, ocu_id) VALUES (12401507, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (12416940, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (12699881, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (13070622, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (13138688, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (13138688, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (13305489, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (13518170, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (13552036, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (13552036, 19);
INSERT INTO profession (p_id, ocu_id) VALUES (13552036, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (13614223, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (13614223, 7);
INSERT INTO profession (p_id, ocu_id) VALUES (13614223, 18);
INSERT INTO profession (p_id, ocu_id) VALUES (13741860, 28);
INSERT INTO profession (p_id, ocu_id) VALUES (13741860, 46);
INSERT INTO profession (p_id, ocu_id) VALUES (13880591, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (13965437, 16);
INSERT INTO profession (p_id, ocu_id) VALUES (14064543, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (14466229, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (14490628, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (14796593, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (14796594, 3);
INSERT INTO profession (p_id, ocu_id) VALUES (14829616, 2);
INSERT INTO profession (p_id, ocu_id) VALUES (15906131, 46);


--
-- TOC entry 4947 (class 0 OID 18175)
-- Dependencies: 265
-- Data for Name: watch; Type: TABLE DATA; Schema: sample1; Owner: -
--

INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (14731794, 4037, '2024-04-07 20:15:01', 43);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (14731794, 5654, '2022-10-20 04:27:41', 12);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (14731794, 7704, '2024-08-19 21:17:36', 26);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (71002, 6019, '2022-03-31 14:55:38', 16);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (7956274, 5416, '2022-07-19 04:35:41', 27);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (7956274, 9422, '2022-03-23 18:36:35', 33);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (289036, 176, '2021-09-30 10:09:31', 12);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (81901, 1530, '2022-01-20 16:41:07', 23);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (81901, 1700, '2022-08-06 12:52:15', 31);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (81901, 9276, '2021-12-26 02:32:15', 17);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (27391405, 1013, '2023-05-04 05:30:22', 6);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (5189670, 2596, '2021-06-04 03:38:39', 39);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (5189670, 9615, '2022-01-17 11:19:59', 24);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (9426290, 2185, '2020-03-07 18:47:42', 41);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (9426290, 7103, '2021-08-12 04:30:59', 33);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (9426290, 7741, '2021-06-12 20:22:44', 4);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (341833, 9672, '2023-10-26 05:21:50', 13);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (7349078, 7422, '2022-10-25 11:16:41', 17);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (12661338, 776, '2022-06-15 05:28:39', 53);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (316613, 6460, '2023-12-17 22:46:49', 30);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (316613, 9654, '2023-03-25 07:30:00', 22);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (5422000, 1754, '2024-02-21 22:26:04', 8);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (490714, 6575, '2020-03-15 10:29:23', 4);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (71048, 2068, '2022-07-18 04:49:14', 3);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (2196757, 1087, '2023-11-23 03:07:19', 9);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (2196757, 1615, '2024-02-04 14:48:35', 19);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (6800902, 3935, '2024-07-08 20:03:29', 14);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (98802, 1614, '2024-02-02 19:08:43', 6);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (98802, 3004, '2020-02-19 06:53:44', 16);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (98802, 5982, '2024-04-30 22:13:50', 17);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1352421, 4220, '2023-09-01 21:09:42', 23);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1352421, 5839, '2021-03-06 21:36:00', 0);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1352421, 6481, '2022-12-28 07:08:38', 20);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (5861134, 1319, '2022-12-01 18:31:27', 7);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (5861134, 3344, '2021-12-19 13:10:04', 8);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (103359, 4383, '2021-02-28 22:48:37', 2);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (103359, 6287, '2021-04-05 01:36:41', 11);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (103359, 6793, '2022-11-11 00:37:56', 22);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (2390334, 9323, '2021-11-15 08:49:36', 21);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1508179, 9555, '2021-06-26 18:38:40', 30);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (31409842, 6735, '2020-10-05 02:39:48', 46);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (31409842, 7055, '2021-02-07 03:48:04', 62);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (4196822, 1387, '2022-08-13 20:11:52', 5);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (4196822, 9705, '2021-12-05 05:07:38', 7);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1856010, 855, '2022-02-21 00:38:14', 15);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (98891, 1106, '2023-05-13 06:46:59', 24);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (98891, 7542, '2023-04-20 20:01:16', 7);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (399943, 4755, '2024-06-15 10:28:50', 50);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (121002, 2520, '2022-01-06 19:11:54', 5);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (121002, 5105, '2023-06-30 11:48:47', 3);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (15156212, 2580, '2024-03-04 19:31:17', 49);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (15156212, 9879, '2020-05-30 09:33:53', 50);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1298725, 5000, '2024-04-17 08:36:43', 49);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1298725, 8091, '2024-07-26 14:54:50', 29);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (91618, 8094, '2021-03-25 08:31:05', 3);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (91618, 8799, '2023-09-22 07:49:54', 9);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (3018178, 6747, '2022-09-01 01:19:35', 0);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (3018178, 9514, '2022-12-16 06:14:30', 1);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (15151564, 7761, '2022-01-19 17:03:29', 26);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (784920, 6369, '2023-01-09 00:10:44', 0);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (784920, 7768, '2023-03-27 06:17:00', 5);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (784920, 9217, '2023-02-21 03:10:13', 3);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (13415620, 869, '2024-09-20 00:58:49', 31);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (27688981, 742, '2022-09-26 05:57:03', 32);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (27688981, 3908, '2024-04-13 02:41:06', 25);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (27688981, 8274, '2022-05-13 10:57:20', 43);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (90524, 2949, '2020-11-02 03:51:36', 9);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (90524, 5064, '2024-04-11 01:45:54', 46);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (90524, 7384, '2024-01-17 15:05:42', 0);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (331381, 9778, '2020-07-28 11:46:45', 8);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (14099968, 2459, '2022-05-03 08:07:01', 40);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (14099968, 4999, '2020-11-08 20:33:43', 21);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (238794, 4194, '2020-12-28 07:18:10', 26);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (3437610, 2921, '2020-08-30 04:12:23', 3);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (6213220, 2055, '2021-01-26 11:38:50', 10);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (199026, 1725, '2020-04-10 02:16:51', 36);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (199026, 3085, '2024-03-27 01:54:35', 45);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (7263380, 9859, '2023-05-10 07:57:51', 24);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (247851, 291, '2022-03-07 06:43:20', 40);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1002892, 3358, '2022-03-06 05:35:31', 13);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1002892, 3575, '2021-07-16 08:51:02', 23);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (1002892, 9298, '2022-07-24 19:07:27', 19);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (28516985, 4987, '2022-09-17 15:38:39', 6);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (15852584, 7740, '2021-11-04 17:04:45', 62);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (96546, 8089, '2024-07-03 11:27:12', 36);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (96546, 9176, '2020-01-31 03:00:17', 25);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (4110246, 2372, '2022-09-24 22:02:29', 8);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (4110246, 2949, '2021-10-21 16:06:26', 56);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (4110246, 6391, '2021-11-26 13:19:46', 35);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (4110246, 8456, '2024-08-03 09:31:53', 49);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (380869, 9878, '2021-12-13 09:05:30', 30);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (14758812, 8046, '2023-12-31 15:33:24', 12);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (826211, 9272, '2023-06-28 23:36:05', 28);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (3804114, 1718, '2021-04-24 15:57:53', 5);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (3804114, 3629, '2021-10-08 03:56:32', 25);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (3804114, 9566, '2023-06-13 01:48:11', 15);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (63866, 9637, '2024-08-14 00:52:41', 53);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (29390842, 8459, '2024-03-17 00:58:24', 3);
INSERT INTO watch (m_id, c_id, watch_date, pause_time) VALUES (211878, 8154, '2021-08-23 03:18:11', 47);


--
-- TOC entry 4761 (class 2606 OID 17855)
-- Name: classify classify_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY classify
    ADD CONSTRAINT classify_pkey PRIMARY KEY (m_id, gr_id);


--
-- TOC entry 4777 (class 2606 OID 17910)
-- Name: comment_to comment_to_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY comment_to
    ADD CONSTRAINT comment_to_pkey PRIMARY KEY (m_id, c_id);


--
-- TOC entry 4775 (class 2606 OID 17903)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (c_id);


--
-- TOC entry 4763 (class 2606 OID 17863)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (gr_id);


--
-- TOC entry 4765 (class 2606 OID 17870)
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (m_id);


--
-- TOC entry 4769 (class 2606 OID 17884)
-- Name: participant participant_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_pkey PRIMARY KEY (p_id);


--
-- TOC entry 4771 (class 2606 OID 17891)
-- Name: participate participate_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY participate
    ADD CONSTRAINT participate_pkey PRIMARY KEY (m_id, p_id, ordering);


--
-- TOC entry 4779 (class 2606 OID 17920)
-- Name: prefer prefer_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY prefer
    ADD CONSTRAINT prefer_pkey PRIMARY KEY (c_id, gr_id);


--
-- TOC entry 4767 (class 2606 OID 17877)
-- Name: occupation profession_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY occupation
    ADD CONSTRAINT profession_pkey PRIMARY KEY (ocu_id);


--
-- TOC entry 4773 (class 2606 OID 17896)
-- Name: profession profession_pkey1; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY profession
    ADD CONSTRAINT profession_pkey1 PRIMARY KEY (p_id, ocu_id);


--
-- TOC entry 4781 (class 2606 OID 18179)
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (m_id, c_id);


--
-- TOC entry 4792 (class 2606 OID 18185)
-- Name: watch fk_c_id; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY watch
    ADD CONSTRAINT fk_c_id FOREIGN KEY (c_id) REFERENCES customer(c_id);


--
-- TOC entry 4788 (class 2606 OID 17966)
-- Name: comment_to fk_c_id2; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY comment_to
    ADD CONSTRAINT fk_c_id2 FOREIGN KEY (c_id) REFERENCES customer(c_id);


--
-- TOC entry 4790 (class 2606 OID 17971)
-- Name: prefer fk_c_id3; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY prefer
    ADD CONSTRAINT fk_c_id3 FOREIGN KEY (c_id) REFERENCES customer(c_id);


--
-- TOC entry 4782 (class 2606 OID 17921)
-- Name: classify fk_gr_id; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY classify
    ADD CONSTRAINT fk_gr_id FOREIGN KEY (gr_id) REFERENCES genre(gr_id);


--
-- TOC entry 4791 (class 2606 OID 17976)
-- Name: prefer fk_gr_id2; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY prefer
    ADD CONSTRAINT fk_gr_id2 FOREIGN KEY (gr_id) REFERENCES genre(gr_id);


--
-- TOC entry 4783 (class 2606 OID 17926)
-- Name: classify fk_m_id; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY classify
    ADD CONSTRAINT fk_m_id FOREIGN KEY (m_id) REFERENCES movie(m_id);


--
-- TOC entry 4784 (class 2606 OID 17931)
-- Name: participate fk_m_id2; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY participate
    ADD CONSTRAINT fk_m_id2 FOREIGN KEY (m_id) REFERENCES movie(m_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4793 (class 2606 OID 18180)
-- Name: watch fk_m_id3; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY watch
    ADD CONSTRAINT fk_m_id3 FOREIGN KEY (m_id) REFERENCES movie(m_id);


--
-- TOC entry 4789 (class 2606 OID 17961)
-- Name: comment_to fk_m_id4; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY comment_to
    ADD CONSTRAINT fk_m_id4 FOREIGN KEY (m_id) REFERENCES movie(m_id);


--
-- TOC entry 4786 (class 2606 OID 17941)
-- Name: profession fk_ocu_id; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY profession
    ADD CONSTRAINT fk_ocu_id FOREIGN KEY (ocu_id) REFERENCES occupation(ocu_id);


--
-- TOC entry 4785 (class 2606 OID 17936)
-- Name: participate fk_p_id; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY participate
    ADD CONSTRAINT fk_p_id FOREIGN KEY (p_id) REFERENCES participant(p_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 17946)
-- Name: profession fk_p_id2; Type: FK CONSTRAINT; Schema: sample1; Owner: -
--

ALTER TABLE ONLY profession
    ADD CONSTRAINT fk_p_id2 FOREIGN KEY (p_id) REFERENCES participant(p_id);


-- Completed on 2024-10-10 13:28:11

--
-- PostgreSQL database dump complete
--

