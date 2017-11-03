--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

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
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE films (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    premiere_date date,
    producer_id integer,
    rental real,
    duration time without time zone,
    country_id integer,
    budget real,
    age_limit integer,
    director_id integer,
    studio_id integer,
    CONSTRAINT films_age_limit_ck CHECK (((age_limit >= 0) AND (age_limit <= 18))),
    CONSTRAINT films_budget_ck CHECK ((budget >= (0)::double precision)),
    CONSTRAINT films_premiere_ck_date CHECK ((premiere_date >= '1895-12-28'::date)),
    CONSTRAINT films_rental_ck CHECK ((rental >= (0)::double precision))
);


ALTER TABLE films OWNER TO postgres;

--
-- Name: films_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE films_actors (
    film_id bigint,
    actor_id bigint
);


ALTER TABLE films_actors OWNER TO postgres;

--
-- Name: films_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE films_genres (
    genre_id integer,
    film_id integer
);


ALTER TABLE films_genres OWNER TO postgres;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_id_seq OWNER TO postgres;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE films_id_seq OWNED BY films.id;


--
-- Name: films_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE films_ratings (
    film_id integer,
    rating_producer_id integer,
    rating real NOT NULL,
    CONSTRAINT fims_ratings_rating_ck CHECK (((rating >= (0)::double precision) AND (rating <= (10)::double precision)))
);


ALTER TABLE films_ratings OWNER TO postgres;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genres (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE persons (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100),
    sex boolean,
    birthdate date,
    country_id integer,
    CONSTRAINT persons_birthdate_ck CHECK ((birthdate >= '1795-12-28'::date))
);


ALTER TABLE persons OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persons_id_seq OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persons_id_seq OWNED BY persons.id;


--
-- Name: rating_producer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rating_producer (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE rating_producer OWNER TO postgres;

--
-- Name: rating_producer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_producer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rating_producer_id_seq OWNER TO postgres;

--
-- Name: rating_producer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_producer_id_seq OWNED BY rating_producer.id;


--
-- Name: studios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE studios (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    date_of_create date,
    country_id integer,
    CONSTRAINT studios_date_of_create_ck CHECK ((date_of_create >= '1895-12-28'::date))
);


ALTER TABLE studios OWNER TO postgres;

--
-- Name: studios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE studios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studios_id_seq OWNER TO postgres;

--
-- Name: studios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE studios_id_seq OWNED BY studios.id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films ALTER COLUMN id SET DEFAULT nextval('films_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persons ALTER COLUMN id SET DEFAULT nextval('persons_id_seq'::regclass);


--
-- Name: rating_producer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_producer ALTER COLUMN id SET DEFAULT nextval('rating_producer_id_seq'::regclass);


--
-- Name: studios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studios ALTER COLUMN id SET DEFAULT nextval('studios_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (id, name) FROM stdin;
1	Россия
2	США
3	Украина
4	Италия
5	Франция
6	Норвегия
7	Англия
8	Индия
9	Япония
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 9, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY films (id, name, premiere_date, producer_id, rental, duration, country_id, budget, age_limit, director_id, studio_id) FROM stdin;
1	Побег из Шоушенка	1994-09-10	1	59841312	02:02:00	2	1123123	16	2	1
2	Игра Престолов	2010-09-10	4	19841312	01:01:00	2	1123123	0	1	9
3	Хищник	1994-12-11	5	29841312	03:00:00	5	1123123	6	3	8
4	Хищник 2	1996-11-10	2	9841312	02:32:00	2	1123123	12	4	7
5	Операция Ы	1985-10-12	8	61312	02:42:00	1	1123123	16	5	9
6	Годовщина	1994-09-13	10	3221412	01:02:00	2	1123123	18	6	8
7	Спасти рядового Райна	2005-08-10	9	2281312	02:02:00	2	1123123	16	7	1
8	Мальчишник	2009-07-14	1	413256	01:40:00	2	1123123	18	8	7
9	Е бой	1928-06-15	3	522876	01:36:00	8	1123123	18	9	6
10	Версус	2015-05-16	4	12345	01:17:00	6	1123123	16	2	5
11	Слово СПБ	2017-04-17	5	123456	02:15:00	2	1123123	0	2	4
12	РБЛ	1991-03-18	6	541312	02:06:00	2	1123123	0	1	1
13	Дизастер	2016-02-22	7	982312	01:56:00	2	1123123	3	2	3
14	Рэмпэйдж	2006-01-30	8	1441312	01:43:00	2	1123123	18	4	2
15	Побег из курятника	1994-09-10	1	14881312	01:52:00	1	1123123	18	5	1
\.


--
-- Data for Name: films_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY films_actors (film_id, actor_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	15
1	16
2	17
3	18
4	19
5	20
6	21
7	22
8	23
9	24
10	25
11	1
12	2
13	3
14	4
15	5
1	6
2	7
3	8
4	9
5	10
6	11
7	12
8	13
9	14
10	15
11	16
12	17
13	18
14	19
15	20
\.


--
-- Data for Name: films_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY films_genres (genre_id, film_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
2	3
3	4
4	5
5	6
6	7
7	9
6	1
5	2
7	3
8	4
9	5
3	6
4	7
\.


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('films_id_seq', 15, true);


--
-- Data for Name: films_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY films_ratings (film_id, rating_producer_id, rating) FROM stdin;
1	9	9.30000019
2	2	8.10000038
3	3	7.19999981
4	1	6.30000019
5	1	5.4000001
6	4	4.30000019
7	1	1.5
8	1	2.5999999
9	1	3.70000005
10	2	4.80000019
11	3	9.89999962
12	1	5
13	1	6.0999999
14	2	9.19999981
15	3	0.300000012
8	4	9.39999962
9	3	9.5
1	1	9.60000038
5	9	7.69999981
8	8	9.80000019
9	7	8.89999962
1	6	6
1	5	9.10000038
8	9	5.19999981
9	5	8.30000019
1	2	7.4000001
12	8	6.5
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genres (id, name) FROM stdin;
1	Комедия
2	Драма
3	Триллер
4	Ужасы
5	Мелодрама
6	Боевик
7	Сказка
8	Детектив
9	Фантастика
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genres_id_seq', 9, true);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persons (id, name, surname, sex, birthdate, country_id) FROM stdin;
1	Ник	Марвин	f	1964-03-25	2
2	Фрэнк	Дарабонт	t	1959-02-28	2
3	Тимур	Сиркин	t	1945-02-22	5
4	Владимир	Путин	t	1923-03-01	4
5	Галиябану	Бакирова	f	1999-01-31	1
6	Артемий	Морозов	t	1957-11-21	1
7	Сергей	Безруков	t	1979-12-01	1
8	Алексей	Бодров	t	1908-02-26	1
9	Лидия	Улидия	f	1972-12-01	9
10	Боб	Марлей	t	1978-05-05	5
11	Ким - чен	Чен - ким	t	1989-11-16	8
12	Батя	Батькович	t	2001-01-31	1
13	Джон	Джонсон	t	1945-01-31	6
14	НеДжон	НеДжонсон	t	1974-02-28	1
15	Румит	Уразмуривей	t	1988-11-11	2
16	Рики	Мару	t	1929-10-31	2
17	Бара	Трум	t	1941-09-13	2
18	Кристал	Мэйдэн	f	2006-08-31	1
19	Лен	Клен	t	2004-07-31	8
20	Бас	Дас	t	1989-06-17	7
21	НенеДжон	НенеДжонсон	t	1969-05-03	6
22	Кумит	Азмуривей	t	1964-01-02	5
23	Рикимару	Марурики	t	1980-02-08	4
24	Баратрум	Жабиев	t	1981-03-10	3
25	Лина	Фаер	f	1988-04-22	1
\.


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persons_id_seq', 25, true);


--
-- Data for Name: rating_producer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_producer (id, name) FROM stdin;
1	КиноПоиск
2	GidOnline
3	IMDb
4	Hdrezka
5	Zfilm-hd
6	По мнению Сиркина Тимура
7	По мнению Морозова Артема
8	По мнению Астрального духа
9	По мнению из космоса
\.


--
-- Name: rating_producer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_producer_id_seq', 9, true);


--
-- Data for Name: studios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY studios (id, name, date_of_create, country_id) FROM stdin;
1	Castle Rock Entertainment	1987-05-20	2
2	Warner Brothers	1909-01-31	2
3	Lipnik studio	2007-05-16	3
4	Русский стандрат	1999-06-21	4
5	Липкий Джимми	1946-08-12	5
6	Очень Липкий Джимми	2010-10-05	6
7	Shalala land	1979-11-19	7
8	О МОЙ БОГ	2015-09-22	8
9	Real talk	2017-02-02	9
\.


--
-- Name: studios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('studios_id_seq', 9, true);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: films_actors films_actors_actor_id_films_id_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_actors
    ADD CONSTRAINT films_actors_actor_id_films_id_uq UNIQUE (actor_id, film_id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: films_ratings films_ratings_rating_producer_id_films_id_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_ratings
    ADD CONSTRAINT films_ratings_rating_producer_id_films_id_uq UNIQUE (rating_producer_id, film_id);


--
-- Name: films_genres genres_genre_id_films_id_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_genres
    ADD CONSTRAINT genres_genre_id_films_id_uq UNIQUE (genre_id, film_id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: rating_producer rating_producer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_producer
    ADD CONSTRAINT rating_producer_name_key UNIQUE (name);


--
-- Name: rating_producer rating_producer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_producer
    ADD CONSTRAINT rating_producer_pkey PRIMARY KEY (id);


--
-- Name: studios studios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studios
    ADD CONSTRAINT studios_pkey PRIMARY KEY (id);


--
-- Name: films_actors films_actors_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_actors
    ADD CONSTRAINT films_actors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES persons(id);


--
-- Name: films_actors films_actors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_actors
    ADD CONSTRAINT films_actors_film_id_fkey FOREIGN KEY (film_id) REFERENCES films(id);


--
-- Name: films films_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: films films_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_director_id_fkey FOREIGN KEY (director_id) REFERENCES persons(id);


--
-- Name: films_genres films_genres_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_genres
    ADD CONSTRAINT films_genres_film_id_fkey FOREIGN KEY (film_id) REFERENCES genres(id);


--
-- Name: films_genres films_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_genres
    ADD CONSTRAINT films_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES films(id);


--
-- Name: films films_producer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_producer_id_fkey FOREIGN KEY (producer_id) REFERENCES persons(id);


--
-- Name: films_ratings films_ratings_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_ratings
    ADD CONSTRAINT films_ratings_film_id_fkey FOREIGN KEY (film_id) REFERENCES films(id);


--
-- Name: films_ratings films_ratings_rating_producer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_ratings
    ADD CONSTRAINT films_ratings_rating_producer_id_fkey FOREIGN KEY (rating_producer_id) REFERENCES rating_producer(id);


--
-- Name: films films_studio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_studio_id_fkey FOREIGN KEY (studio_id) REFERENCES studios(id);


--
-- Name: persons persons_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: studios studios_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studios
    ADD CONSTRAINT studios_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- PostgreSQL database dump complete
--

