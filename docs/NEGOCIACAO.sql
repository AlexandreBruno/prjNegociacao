CREATE TABLE NEGOCIACAO (
    ID INTEGER NOT NULL,
    ID_PRODUTOR INTEGER,
    ID_DISTRIBUIDOR INTEGER,
    STATUS VARCHAR(30),
    VALOR DECIMAL(18,2));

ALTER TABLE NEGOCIACAO
ADD CONSTRAINT PK_NEGOCIACAO
PRIMARY KEY (ID);

CREATE SEQUENCE NEGOCIACAO_ID;

ALTER SEQUENCE NEGOCIACAO_ID RESTART WITH 1;

