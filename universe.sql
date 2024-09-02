--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    age_in_billion_years integer,
    distance_from_milky_way_in_million_light_years numeric,
    galaxy_name_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    time_of_full_rotation_in_days integer,
    is_sferic boolean,
    eclipse_cycle_in_years integer,
    moons_around_the_planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info_planet (
    name character varying(30) NOT NULL,
    more_info_planet_id integer NOT NULL,
    info_planet text,
    info_planet_id integer
);


ALTER TABLE public.more_info_planet OWNER TO freecodecamp;

--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_planet_more_info_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_planet_more_info_planet_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_planet_more_info_planet_id_seq OWNED BY public.more_info_planet.more_info_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(30),
    is_sferic boolean,
    has_life boolean,
    planets_around_the_star_id integer,
    moons_around_the_planet_id integer NOT NULL,
    info_planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    type character varying(30),
    age_in_million_years integer,
    radius_size numeric,
    galaxy_name_id integer,
    planets_around_the_star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info_planet more_info_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet ALTER COLUMN more_info_planet_id SET DEFAULT nextval('public.more_info_planet_more_info_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, 'Spiral Galaxy', 10, 2537, 1);
INSERT INTO public.galaxy VALUES ('Whirpool', 2, 'Spiral Galaxy', 1, 23, 2);
INSERT INTO public.galaxy VALUES ('NGC 1300', 3, 'Barred Spiral Galaxy', 7, 61, 3);
INSERT INTO public.galaxy VALUES ('Sombrero', 4, 'Lenticular Galaxy', 9, 31, 4);
INSERT INTO public.galaxy VALUES ('Centauri A', 5, 'Elliptical Galaxy', 12, 13, 5);
INSERT INTO public.galaxy VALUES ('Cygnus X', 6, 'Dwarf Galaxy', 8, 30, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Nix', 1, 10, true, 5, 1);
INSERT INTO public.moon VALUES ('Aether', 2, 4, true, 10, 2);
INSERT INTO public.moon VALUES ('Wavecraste', 3, 1, false, 7, 3);
INSERT INTO public.moon VALUES ('Tidewalker', 4, 3, true, 12, 3);
INSERT INTO public.moon VALUES ('Dune', 5, 16, true, 6, 4);
INSERT INTO public.moon VALUES ('Arid', 6, 20, true, 15, 4);
INSERT INTO public.moon VALUES ('Frostbite', 7, 7, false, 8, 5);
INSERT INTO public.moon VALUES ('Stormbringer', 8, 1, true, 4, 6);
INSERT INTO public.moon VALUES ('Blaze', 9, 11, true, 13, 7);
INSERT INTO public.moon VALUES ('Inferno', 10, 9, false, 20, 7);
INSERT INTO public.moon VALUES ('Bloom', 11, 4, true, 14, 8);
INSERT INTO public.moon VALUES ('Reef', 12, 8, false, 17, 9);
INSERT INTO public.moon VALUES ('Coral', 13, 3, true, 3, 9);
INSERT INTO public.moon VALUES ('Goliath', 17, 8, false, 1, 10);
INSERT INTO public.moon VALUES ('Titan', 18, 2, false, 19, 10);
INSERT INTO public.moon VALUES ('Verdant', 19, 1, true, 21, 10);
INSERT INTO public.moon VALUES ('Frost', 20, 7, true, 50, 11);
INSERT INTO public.moon VALUES ('Cyro', 21, 4, false, 2, 11);
INSERT INTO public.moon VALUES ('Radiance', 22, 3, false, 35, 12);
INSERT INTO public.moon VALUES ('Glow', 23, 2, true, 11, 12);


--
-- Data for Name: more_info_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info_planet VALUES ('Terrestrial Type', 1, 'Rocky, solid surface, Earth-like', 1);
INSERT INTO public.more_info_planet VALUES ('Gas Type', 2, 'Massive, mostly hydrogen and helium', 2);
INSERT INTO public.more_info_planet VALUES ('Desert Type', 3, 'Arid, dry, mostly sand and rock', 3);
INSERT INTO public.more_info_planet VALUES ('Ocean Type', 4, 'Covered in vast, deep oceans', 4);
INSERT INTO public.more_info_planet VALUES ('Ice Type', 5, 'Composed mostly of icy materials', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Pandora', 1, 'Terrestrial', true, true, 1, 1, 1);
INSERT INTO public.planet VALUES ('Xenon-5', 2, 'Gas', false, false, 1, 2, 2);
INSERT INTO public.planet VALUES ('Velora', 4, 'Desert', false, false, 2, 3, 3);
INSERT INTO public.planet VALUES ('Zephyra', 5, 'Ocean', false, true, 2, 4, 4);
INSERT INTO public.planet VALUES ('Auroria', 6, 'Ice', true, true, 3, 5, 5);
INSERT INTO public.planet VALUES ('Nimbosia', 7, 'Gas', true, false, 3, 6, 6);
INSERT INTO public.planet VALUES ('Vox', 8, 'Rock', false, false, 4, 7, 7);
INSERT INTO public.planet VALUES ('Elara-9', 9, 'Terrestrial', true, false, 4, 8, 8);
INSERT INTO public.planet VALUES ('Mythra', 10, 'Ocean', true, true, 5, 9, 9);
INSERT INTO public.planet VALUES ('Zyphos', 11, 'Super-Earth', false, true, 5, 10, 10);
INSERT INTO public.planet VALUES ('Astralis', 12, 'Ice', false, false, 6, 11, 11);
INSERT INTO public.planet VALUES ('Lumina', 13, 'Rock', false, true, 6, 12, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius', 1, 'Main Sequence Star', 242, 1200000, 1, 1);
INSERT INTO public.star VALUES ('Vega', 2, 'Main Sequence Star', 455, 1870000, 2, 2);
INSERT INTO public.star VALUES ('Betelgeuse', 3, 'Red Supergiant', 10, 1340000, 3, 3);
INSERT INTO public.star VALUES ('Antares', 4, 'Red Supergiant', 12, 833000, 4, 4);
INSERT INTO public.star VALUES ('Luminaris', 5, 'Blue Giant', 50, 8500000, 5, 5);
INSERT INTO public.star VALUES ('Solaris Prime', 6, 'Yellow Dwarf', 350, 695700, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_planet_more_info_planet_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_distance_from_milky_way_in_million_light_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_milky_way_in_million_light_years_key UNIQUE (distance_from_milky_way_in_million_light_years);


--
-- Name: galaxy galaxy_galaxy_name_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_id_key UNIQUE (galaxy_name_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_eclipse_cycle_in_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_eclipse_cycle_in_years_key UNIQUE (eclipse_cycle_in_years);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info_planet more_info_planet_info_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_info_planet_key UNIQUE (info_planet);


--
-- Name: more_info_planet more_info_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_pkey PRIMARY KEY (more_info_planet_id);


--
-- Name: planet planet_info_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_info_planet_id_key UNIQUE (info_planet_id);


--
-- Name: planet planet_moons_around_the_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moons_around_the_planet_id_key UNIQUE (moons_around_the_planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_planets_around_the_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planets_around_the_star_id_key UNIQUE (planets_around_the_star_id);


--
-- Name: star star_radius_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_radius_size_key UNIQUE (radius_size);


--
-- Name: star fk_galaxy_name_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_name_id FOREIGN KEY (galaxy_name_id) REFERENCES public.galaxy(galaxy_name_id);


--
-- Name: more_info_planet fk_info_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT fk_info_planet_id FOREIGN KEY (info_planet_id) REFERENCES public.planet(info_planet_id);


--
-- Name: moon fk_moons_around_the_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moons_around_the_planet_id FOREIGN KEY (moons_around_the_planet_id) REFERENCES public.planet(moons_around_the_planet_id);


--
-- Name: planet fk_planets_around_the_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planets_around_the_star_id FOREIGN KEY (planets_around_the_star_id) REFERENCES public.star(planets_around_the_star_id);


--
-- PostgreSQL database dump complete
--

