CREATE TABLE IF NOT EXISTS MIMETYPE (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS LANGUAGE (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS CONTAINER (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS PUBLICATIONTYPE (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS PUBLICATION_RELATION_ROLE (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS AUTHOR_ROLE (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS AUTHOR (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL,
ADDITION VARCHAR(256),
SORTNAME VARCHAR(256) NOT NULL,
REMARKS VARCHAR(256)
);

CREATE UNIQUE INDEX IF NOT EXISTS AUTHOR_NDX ON AUTHOR(NAME, ADDITION);

CREATE TABLE IF NOT EXISTS AUTHOR_ALIAS (
AUTHORREALNAMEID INT NOT NULL,
AUTHORALIASID INT NOT NULL,
REMARKS VARCHAR(256)
);

ALTER TABLE AUTHOR_ALIAS ADD FOREIGN KEY(AUTHORREALNAMEID) REFERENCES AUTHOR(ID);
ALTER TABLE AUTHOR_ALIAS ADD FOREIGN KEY (AUTHORALIASID) REFERENCES AUTHOR(ID);


CREATE TABLE IF NOT EXISTS PUBLICATION (
ID SERIAL PRIMARY KEY,
TITLE VARCHAR(256) NOT NULL,
SUBTITLE VARCHAR(256),
SORTTITLE VARCHAR(256) NOT NULL,
REMARKS VARCHAR(256),
SOURCE VARCHAR(256),
PUBLICATIONTYPEID INT NOT NULL,
CONTAINERID INT NOT NULL,
EXTERNALID 	VARCHAR(30)
);

ALTER TABLE PUBLICATION ADD FOREIGN KEY (PUBLICATIONTYPEID) REFERENCES PUBLICATIONTYPE(ID);
ALTER TABLE PUBLICATION ADD FOREIGN KEY (CONTAINERID) REFERENCES CONTAINER(ID);

CREATE TABLE IF NOT EXISTS CATEGORY (
ID SERIAL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL,
PARENT INT
);

ALTER TABLE CATEGORY ADD FOREIGN KEY(PARENT) REFERENCES CATEGORY(ID);

CREATE TABLE IF NOT EXISTS PUBLICATION_CATEGORY (
PUBLICATIONID INT NOT NULL,
CATEGORYID INT NOT NULL
);

ALTER TABLE PUBLICATION_CATEGORY ADD FOREIGN KEY(CATEGORYID) REFERENCES CATEGORY(ID);
ALTER TABLE PUBLICATION_CATEGORY ADD FOREIGN KEY(PUBLICATIONID) REFERENCES PUBLICATION(ID);

CREATE TABLE IF NOT EXISTS PUBLICATION_MIMETYPE (
PUBLICATIONID INT NOT NULL,
MIMETYEID INT NOT NULL
);

ALTER TABLE PUBLICATION_MIMETYPE ADD FOREIGN KEY(MIMETYPEID) REFERENCES MIMETYPE(ID);
ALTER TABLE PUBLICATION_MIMETYPE ADD FOREIGN KEY(PUBLICATIONID) REFERENCES PUBLICATION(ID);

CREATE TABLE IF NOT EXISTS PUBLICATION_LANGUAGE (
PUBLICATIONID INT NOT NULL,
LANGUAGEID INT NOT NULL
);

ALTER TABLE PUBLICATION_LANGUAGE ADD FOREIGN KEY(LANGUAGEID) REFERENCES LANGUAGE(ID);
ALTER TABLE PUBLICATION_LANGUAGE ADD FOREIGN KEY(PUBLICATIONID) REFERENCES PUBLICATION(ID);


CREATE TABLE IF NOT EXISTS PUBLICATION_ROLE_AUTHOR (
PUBLICATIONID INT NOT NULL,
AUTHORROLEID INT NOT NULL,
AUTHORID INT NOT NULL
);

ALTER TABLE PUBLICATION_ROLE_AUTHOR ADD FOREIGN KEY(PUBLICATIONID) REFERENCES PUBLICATION(ID);
ALTER TABLE PUBLICATION_ROLE_AUTHOR ADD FOREIGN KEY(AUTHORROLEID) REFERENCES AUTHOR_ROLE(ID);
ALTER TABLE PUBLICATION_ROLE_AUTHOR ADD FOREIGN KEY(AUTHORID) REFERENCES AUTHOR(ID);

CREATE TABLE IF NOT EXISTS PUBLICATIONRELATION (
FIRST_PUBLICATIONID INT NOT NULL,
SECOND_PUBLICATIONID INT NOT NULL,
PUBLICATION_RELATION_ROLEID INT NOT NULL
);

ALTER TABLE PUBLICATIONRELATION ADD FOREIGN KEY(FIRST_PUBLICATIONID) REFERENCES PUBLICATION(ID);
ALTER TABLE PUBLICATIONRELATION ADD FOREIGN KEY(SECOND_PUBLICATIONID) REFERENCES PUBLICATION(ID);
ALTER TABLE PUBLICATIONRELATION ADD FOREIGN KEY(PUBLICATION_RELATION_ROLEID) REFERENCES PUBLICATION_RELATION_ROLE(ID);

