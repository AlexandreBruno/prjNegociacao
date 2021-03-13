CREATE TABLE PRODUTOR (
    ID INTEGER NOT NULL,
    NOME VARCHAR(255));

ALTER TABLE PRODUTOR
ADD CONSTRAINT PK_PRODUTOR
PRIMARY KEY (ID);

CREATE SEQUENCE PRODUTOR_ID;

ALTER SEQUENCE PRODUTOR_ID RESTART WITH 1;

