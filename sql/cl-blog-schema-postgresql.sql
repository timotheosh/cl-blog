
CREATE SEQUENCE public.comments_id_seq;

CREATE TABLE public.comments (
                id INTEGER NOT NULL DEFAULT nextval('public.comments_id_seq'),
                article INTEGER NOT NULL,
                author INTEGER NOT NULL,
                comment VARCHAR NOT NULL,
                CONSTRAINT comments_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;

CREATE SEQUENCE public.clbposts_id_seq;

CREATE TABLE public.clbposts (
                id INTEGER NOT NULL DEFAULT nextval('public.clbposts_id_seq'),
                posted TIMESTAMP DEFAULT now() NOT NULL,
                author INTEGER NOT NULL,
                article VARCHAR NOT NULL,
                CONSTRAINT clbposts_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.clbposts_id_seq OWNED BY public.clbposts.id;

CREATE SEQUENCE public.clb_group_roles_id_seq;

CREATE TABLE public.clb_group_roles (
                id INTEGER NOT NULL DEFAULT nextval('public.clb_group_roles_id_seq'),
                clbgroup INTEGER NOT NULL,
                clbrole INTEGER NOT NULL,
                CONSTRAINT clb_group_roles_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.clb_group_roles_id_seq OWNED BY public.clb_group_roles.id;

CREATE SEQUENCE public.clb_user_group_id_seq;

CREATE TABLE public.clb_user_group (
                id INTEGER NOT NULL DEFAULT nextval('public.clb_user_group_id_seq'),
                clb_user INTEGER NOT NULL,
                clb_group INTEGER NOT NULL,
                CONSTRAINT clb_user_group_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.clb_user_group_id_seq OWNED BY public.clb_user_group.id;

CREATE SEQUENCE public.clb_group_id_seq;

CREATE TABLE public.clb_group (
                id INTEGER NOT NULL DEFAULT nextval('public.clb_group_id_seq'),
                clbgroup VARCHAR(255) NOT NULL,
                CONSTRAINT clb_group_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.clb_group_id_seq OWNED BY public.clb_group.id;

CREATE SEQUENCE public.clb_roles_id_seq;

CREATE TABLE public.clb_roles (
                id INTEGER NOT NULL DEFAULT nextval('public.clb_roles_id_seq'),
                clbrole VARCHAR(255) NOT NULL,
                CONSTRAINT clb_roles_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.clb_roles_id_seq OWNED BY public.clb_roles.id;

CREATE SEQUENCE public.clb_users_id_seq;

CREATE TABLE public.clb_users (
                id INTEGER NOT NULL DEFAULT nextval('public.clb_users_id_seq'),
                username VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                email VARCHAR(255),
                fullname VARCHAR(255),
                CONSTRAINT clb_users_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.clb_users_id_seq OWNED BY public.clb_users.id;

ALTER TABLE public.clbposts ADD CONSTRAINT comments_clbposts_fk
FOREIGN KEY (id)
REFERENCES public.comments (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clb_users ADD CONSTRAINT comments_clb_users_fk
FOREIGN KEY (id)
REFERENCES public.comments (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clb_users ADD CONSTRAINT clbposts_clb_users_fk
FOREIGN KEY (id)
REFERENCES public.clbposts (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clb_group ADD CONSTRAINT clb_group_roles_clb_group_fk
FOREIGN KEY (id)
REFERENCES public.clb_group_roles (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clb_roles ADD CONSTRAINT clb_group_roles_clb_roles_fk
FOREIGN KEY (id)
REFERENCES public.clb_group_roles (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clb_users ADD CONSTRAINT clb_user_group_clb_users_fk
FOREIGN KEY (id)
REFERENCES public.clb_user_group (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clb_group ADD CONSTRAINT clb_user_group_clb_group_fk
FOREIGN KEY (id)
REFERENCES public.clb_user_group (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
