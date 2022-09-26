-------------------------------------------
---- DDL Statements for the REGIMENT Table
-------------------------------------------

CREATE TABLE REGIMENT (
    REGIMENT_ID        INTEGER NOT NULL,
    TRAINER_ID         INTEGER NOT NULL,
    CLIENT_ID          INTEGER NOT NULL,
    REGIMENT_NAME      VARCHAR(128) NOT NULL,
    REGIMENT_CYCLE_NUM SMALLINT
);
