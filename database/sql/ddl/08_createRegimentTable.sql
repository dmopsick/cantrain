-------------------------------------------
---- DDL Statements for the REGIMENT Table
-------------------------------------------

CREATE TABLE REGIMENT (
    REGIMENT_ID        INT NOT NULL,
    TRAINER_ID         INT NOT NULL,
    CLIENT_ID          INT NOT NULL,
    REGIMENT_NAME      VARCHAR(128) NOT NULL,
    REGIMENT_CYCLE_NUM SMALLINT
);
