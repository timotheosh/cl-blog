
CREATE TABLE clb_user_group (
                id INTEGER NOT NULL,
                user INTEGER NOT NULL,
                clbgroup INTEGER NOT NULL,
                CONSTRAINT clb_user_group_pk PRIMARY KEY (id)
);


CREATE TABLE clb_group (
                id INTEGER NOT NULL,
                clbgroup VARCHAR(255) NOT NULL,
                CONSTRAINT clb_group_pk PRIMARY KEY (id)
);


CREATE TABLE clb_roles (
                id INTEGER NOT NULL,
                role VARCHAR(255) NOT NULL,
                CONSTRAINT clb_roles_pk PRIMARY KEY (id)
);


CREATE TABLE clb_users (
                id INTEGER NOT NULL,
                username VARCHAR(255) NOT NULL,
                CONSTRAINT clb_users_pk PRIMARY KEY (id)
);
