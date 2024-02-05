--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    speed integer NOT NULL,
    redshift numeric(6,5) DEFAULT 0.00000
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
    name character varying(30),
    description text NOT NULL,
    color text NOT NULL,
    planet_id integer
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
    name character varying(30),
    description text,
    has_ring boolean NOT NULL,
    distance_from_sun_au numeric(4,2),
    star_id integer
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
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    radius integer NOT NULL,
    has_water boolean NOT NULL
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
-- Name: stellar; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar (
    stellar_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    connection_date date NOT NULL
);


ALTER TABLE public.stellar OWNER TO freecodecamp;

--
-- Name: stellar_stellar_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_stellar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_stellar_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_stellar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stellar_stellar_id_seq OWNED BY public.stellar.stellar_id;


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
-- Name: stellar stellar_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar ALTER COLUMN stellar_id SET DEFAULT nextval('public.stellar_stellar_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy (M51)', 'Face-on spiral with prominent arms, interacting with a smaller companion', 230, 0.00290);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy (M104)', 'Edge-on spiral with a distinct dust lane and central bulge', 300, 0.00580);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy (AM 0631-330)', 'Ring-shaped galaxy formed from a collision, two rings visible', 210, 0.24200);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy (M31)', 'Largest galaxy in our Local Group, closest major galaxy to Milky Way', 300, 0.00070);
INSERT INTO public.galaxy VALUES (2, 'Messier 87 (M87)', 'Giant elliptical galaxy with a supermassive black hole at its center', 1200, 0.00730);
INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy (NGC 3031)', 'Barred spiral galaxy with four major arms, home to our Solar System', 600, 0.00006);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s natural satellite', 'Gray', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars''s moons, irregular shape', 'Gray', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars''s smaller moon with a smooth surface', 'Reddish', 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 'Yellow', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter with a subsurface ocean', 'Icy', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System, around Jupiter', 'Brown', 5);
INSERT INTO public.moon VALUES (7, 'Titan', 'Largest moon of Saturn, with a thick atmosphere', 'Orange', 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Moon of Saturn with geysers of water vapor', 'White', 6);
INSERT INTO public.moon VALUES (9, 'Miranda', 'One of Uranus''s moons with a varied landscape', 'Gray', 7);
INSERT INTO public.moon VALUES (10, 'Triton', 'Largest moon of Neptune, retrograde orbit', 'Pink', 8);
INSERT INTO public.moon VALUES (11, 'Charon', 'Largest moon of Pluto, in a binary system with Pluto', 'Brown', 9);
INSERT INTO public.moon VALUES (12, 'Phobos II', 'Another moon of Mars, named after the first Phobos', 'Gray', 4);
INSERT INTO public.moon VALUES (13, 'Europa II', 'Second moon of Jupiter named Europa', 'Icy', 5);
INSERT INTO public.moon VALUES (14, 'Titan II', 'Another moon of Saturn, similar to Titan', 'Orange', 6);
INSERT INTO public.moon VALUES (15, 'Triton II', 'Another moon of Neptune, similar to Triton', 'Pink', 8);
INSERT INTO public.moon VALUES (16, 'Charon II', 'Another moon of Pluto, similar to Charon', 'Brown', 9);
INSERT INTO public.moon VALUES (17, 'Luna II', 'Another moon of Earth, similar to Luna', 'Gray', 3);
INSERT INTO public.moon VALUES (18, 'Phobos III', 'Yet another moon of Mars, similar to Phobos', 'Gray', 4);
INSERT INTO public.moon VALUES (19, 'Ganymede II', 'Another moon of Jupiter, similar to Ganymede', 'Brown', 5);
INSERT INTO public.moon VALUES (20, 'Triton III', 'Another moon of Neptune, similar to Triton', 'Pink', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Innermost planet in the Solar System', false, 0.39, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun, known for its thick atmosphere', false, 0.72, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun, our home', false, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the Red Planet, has distinct surface features', false, 1.52, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, known for its Great Red Spot', true, 5.20, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its stunning ring system', true, 9.58, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a unique rotational axis', true, 19.22, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue giant with powerful storms, last planet in the Solar System', true, 30.05, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper Belt', false, 39.48, 1);
INSERT INTO public.planet VALUES (10, 'Mars II', 'Martian moon with interesting geological features', false, 0.01, 6);
INSERT INTO public.planet VALUES (11, 'Neptune IX', 'One of Neptune''s irregular moons', false, 30.25, 3);
INSERT INTO public.planet VALUES (12, 'Saturn XLIV', 'One of Saturn''s numerous moons', false, 10.82, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Main sequence star of MW', 696340, false);
INSERT INTO public.star VALUES (2, 3, 'Proxima Centauri', 'Red dwarf in the Andromeda Galaxy', 118646, false);
INSERT INTO public.star VALUES (3, 5, 'Betelgeuse', 'Red supergiant in Sombrero Galaxy', 887000, false);
INSERT INTO public.star VALUES (4, 2, 'Sirius', 'Binary system in Messier 87', 1711, false);
INSERT INTO public.star VALUES (5, 4, 'Alpha Centauri A', 'Binary system in Cartwheel Galaxy', 122, false);
INSERT INTO public.star VALUES (6, 6, 'Kepler-186', 'Exoplanet host star in Whirlpool Galaxy', 48, false);


--
-- Data for Name: stellar; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar VALUES (1, 'Stellar System A', 1, 4, 10, '2022-02-05');
INSERT INTO public.stellar VALUES (2, 'Stellar System B', 2, 7, 15, '2022-02-06');
INSERT INTO public.stellar VALUES (3, 'Stellar System C', 3, 11, 18, '2022-02-07');


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
-- Name: stellar_stellar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_stellar_id_seq', 3, true);


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
-- Name: stellar stellar_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_name_key UNIQUE (name);


--
-- Name: stellar stellar_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_pkey PRIMARY KEY (stellar_id);


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
-- Name: stellar stellar_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: stellar stellar_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: stellar stellar_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

