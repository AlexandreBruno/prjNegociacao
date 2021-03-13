CREATE TABLE DISTRIBUIDOR (
    ID INTEGER NOT NULL,
    NOME VARCHAR(255),
    CNPJ VARCHAR(30));

ALTER TABLE DISTRIBUIDOR
ADD CONSTRAINT PK_DISTRIBUIDOR
PRIMARY KEY (ID);

CREATE SEQUENCE DISTRIBUIDOR_ID;

ALTER SEQUENCE DISTRIBUIDOR_ID RESTART WITH 1;