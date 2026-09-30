--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    size_in_km integer NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL
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
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    planet_id integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    star_id integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'A large object in the asteroid belt', 940, true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'One of the largest objects in the asteroid belt', 525, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'A large asteroid in the asteroid belt', 512, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy', 8000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand design spiral galaxy', 9000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A bright spiral galaxy', 13000, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'A ring galaxy', 12000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths natural satellite', 4500, true, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small moon of Mars', 4500, false, 78000000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A small moon of Mars', 4500, false, 78000000, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'A volcanic moon of Jupiter', 4500, true, 628000000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter', 4500, true, 628000000, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system', 4500, true, 628000000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter', 4500, true, 628000000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'A large moon of Saturn', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'An icy moon of Saturn', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'A moon of Saturn with two distinct sides', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'An icy moon of Saturn', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'A small icy moon of Saturn', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'A moon with an icy surface', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'A small moon of Saturn', 4500, true, 1270000000, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'A small moon of Uranus', 4500, true, 2700000000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'A moon of Uranus', 4500, true, 2700000000, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'A dark moon of Uranus', 4500, true, 2700000000, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'The largest moon of Uranus', 4500, true, 2700000000, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'An outer moon of Uranus', 4500, true, 2700000000, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'The largest moon of Neptune', 4500, true, 4300000000, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our solar system', 4500, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'A hot planet with a thick atmosphere', 4500, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 4500, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', 4600, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system', 4600, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant famous for its rings', 4500, true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis', 4500, true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest known major planet from the Sun', 4500, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Sirius-b', 'A white dwarf companion of Sirius', 242, true, false, 2);
INSERT INTO public.planet VALUES (10, 'Vega-b', 'A fictional planet orbiting Vega', 400, true, false, 5);
INSERT INTO public.planet VALUES (11, 'Polaris-b', 'A fictional planet orbiting Polaris', 60, true, false, 6);
INSERT INTO public.planet VALUES (12, 'Proxima-b', 'A planet orbiting Proxima Centauri', 4800, true, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 242, false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star', 10, false, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'The nearest known star to the Sun', 4850, false, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A bright star in the Lyra constellation', 455, false, 2);
INSERT INTO public.star VALUES (6, 'Polaris', 'The North Star', 70, false, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

