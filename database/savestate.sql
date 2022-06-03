--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3 (Ubuntu 14.3-0ubuntu0.22.04.1)

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
-- Name: files; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.files (
    "fileId" integer NOT NULL,
    "fileObjectKey" text NOT NULL,
    "previewImagePath" text NOT NULL,
    "filePropsName" text,
    "filePropsSound" integer,
    "filePropsLayerCount" integer
);


ALTER TABLE public.files OWNER TO dev;

--
-- Name: files_fileId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."files_fileId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."files_fileId_seq" OWNER TO dev;

--
-- Name: files_fileId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."files_fileId_seq" OWNED BY public.files."fileId";


--
-- Name: posts; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.posts (
    "postId" integer NOT NULL,
    "fileId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    title text NOT NULL,
    description text
);


ALTER TABLE public.posts OWNER TO dev;

--
-- Name: posts_postId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."posts_postId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."posts_postId_seq" OWNER TO dev;

--
-- Name: posts_postId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."posts_postId_seq" OWNED BY public.posts."postId";


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.taggings (
    "tagName" text NOT NULL,
    "postId" integer NOT NULL
);


ALTER TABLE public.taggings OWNER TO dev;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.tags (
    "tagName" text NOT NULL
);


ALTER TABLE public.tags OWNER TO dev;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    username text NOT NULL,
    "hashedPassword" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO dev;

--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users_userId_seq" OWNER TO dev;

--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: files fileId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.files ALTER COLUMN "fileId" SET DEFAULT nextval('public."files_fileId_seq"'::regclass);


--
-- Name: posts postId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.posts ALTER COLUMN "postId" SET DEFAULT nextval('public."posts_postId_seq"'::regclass);


--
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.files ("fileId", "fileObjectKey", "previewImagePath", "filePropsName", "filePropsSound", "filePropsLayerCount") FROM stdin;
1	a46c04b8-2a97-4aa5-b6f2-6ae6fcba7462.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/a46c04b8-2a97-4aa5-b6f2-6ae6fcba7462.png	ONE MORE	12	197
2	f5cd4963-56f9-4b29-be87-82fb4f651281.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/f5cd4963-56f9-4b29-be87-82fb4f651281.png	Flash Player	9	53
3	9c1ebe94-dafb-4c7e-92ad-417c356ee00e.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/9c1ebe94-dafb-4c7e-92ad-417c356ee00e.png	sexycast	9	93
4	d2b28056-4bf0-449b-9f98-e5f77ccaf9fc.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/d2b28056-4bf0-449b-9f98-e5f77ccaf9fc.png	Drake	7	79
5	53d3dd1a-f9c1-4ee2-9966-5676d486c4fa.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/53d3dd1a-f9c1-4ee2-9966-5676d486c4fa.png	ONE MORE	12	200
6	fde5ca0a-61af-4e8b-8779-2b8fe3f177c0.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/fde5ca0a-61af-4e8b-8779-2b8fe3f177c0.png	@Pikaboi 2021-02-21	11	78
7	5e81629a-6495-4092-9336-22155c7bdeec.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/5e81629a-6495-4092-9336-22155c7bdeec.png	僕と勝負するニャ…	4	149
8	22bdd967-d58e-46c6-96a2-21873ca42d9c.sar	https://symbol-art-vault.s3.us-west-1.amazonaws.com/22bdd967-d58e-46c6-96a2-21873ca42d9c.png	ポプテピピックap	4	197
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.posts ("postId", "fileId", "userId", "createdAt", title, description) FROM stdin;
1	1	1	2022-06-02 23:46:07.581187+00	Juan More!!!	PSE Burst gaming
2	2	1	2022-06-02 23:46:54.062517+00	Adobe Flash Player	Like the old days...
3	3	1	2022-06-02 23:47:26.510597+00	Hot Sexy Casts	Why yes, I do play CAST
4	4	1	2022-06-02 23:47:50.45816+00	Lobby Grinding >>>>	Drake Meme but epic
5	5	1	2022-06-02 23:48:10.656897+00	WAN MOAR!!!	PSE Burst One More!!!
6	6	1	2022-06-02 23:48:24.358375+00	rappy my beloved	
7	7	1	2022-06-02 23:48:51.605105+00	Rappy Punch Nyau	kill.... kill!!!
8	8	1	2022-06-02 23:49:43.249282+00	Dudu Death	Pop Team Epic... kill dudu... rip guardian soul
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.taggings ("tagName", "postId") FROM stdin;
pso2	1
producer	1
pse burst	1
onemore	1
flash	2
2000s	2
cast	3
pso2	3
meme	3
drake meme	4
meme forma	4
pse burst	5
one more	5
pso2	5
rappy	6
meme form	6
pso2	7
rappy	7
nyau	7
dudu	8
pso2	8
potepipi	8
gaming	8
affix	8
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.tags ("tagName") FROM stdin;
pso2
producer
pse burst
onemore
flash
2000s
cast
meme
drake meme
meme forma
one more
rappy
meme form
nyau
dudu
potepipi
gaming
affix
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.users ("userId", username, "hashedPassword", "createdAt") FROM stdin;
1	admin	fakepassword	2022-06-02 23:40:22.180351+00
\.


--
-- Name: files_fileId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."files_fileId_seq"', 8, true);


--
-- Name: posts_postId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."posts_postId_seq"', 8, true);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."users_userId_seq"', 1, true);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY ("fileId");


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY ("postId");


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY ("tagName");


--
-- Name: users users_hashedPassword_key; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_hashedPassword_key" UNIQUE ("hashedPassword");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: posts posts_fileId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES public.files("fileId");


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");


--
-- Name: taggings taggings_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT "taggings_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts("postId");


--
-- Name: taggings taggings_tagName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT "taggings_tagName_fkey" FOREIGN KEY ("tagName") REFERENCES public.tags("tagName");


--
-- PostgreSQL database dump complete
--
