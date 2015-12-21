
CREATE TABLE comments (
                id INTEGER NOT NULL,
                article INTEGER NOT NULL,
                author INTEGER NOT NULL,
                comment VARCHAR NOT NULL,
                CONSTRAINT comments_pk PRIMARY KEY (id),
                FOREIGN KEY(article) REFERENCES clbposts(id),
                FOREIGN KEY(author) REFERENCES clb_users(id)
);


CREATE TABLE clbposts (
                id INTEGER NOT NULL,
                posted TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                author INTEGER NOT NULL,
                article VARCHAR NOT NULL,
                CONSTRAINT clbposts_pk PRIMARY KEY (id),
                FOREIGN KEY(author) REFERENCES clb_users(id)
);


CREATE TABLE clb_group_roles (
                id INTEGER NOT NULL,
                clbgroup INTEGER NOT NULL,
                clbrole INTEGER NOT NULL,
                CONSTRAINT clb_group_roles_pk PRIMARY KEY (id),
                FOREIGN KEY (clbgroup) REFERENCES clbgroup(id),
                FOREIGN KEY (clbrole) REFERENCES clbrole(id)
);


CREATE TABLE clb_user_group (
                id INTEGER NOT NULL,
                clb_user INTEGER NOT NULL,
                clb_group INTEGER NOT NULL,
                CONSTRAINT clb_user_group_pk PRIMARY KEY (id),
                FOREIGN KEY (clb_user) REFERENCES clb_user(id),
                FOREIGN KEY (clb_group) REFERENCES clb_group(id)
);


CREATE TABLE clb_group (
                id INTEGER NOT NULL,
                clbgroup VARCHAR(255) NOT NULL,
                CONSTRAINT clb_group_pk PRIMARY KEY (id)
);


CREATE TABLE clb_roles (
                id INTEGER NOT NULL,
                clbrole VARCHAR(255) NOT NULL,
                CONSTRAINT clb_roles_pk PRIMARY KEY (id)
);


CREATE TABLE clb_users (
                id INTEGER NOT NULL,
                username VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                email VARCHAR(255),
                fullname VARCHAR(255),
                CONSTRAINT clb_users_pk PRIMARY KEY (id)
);

