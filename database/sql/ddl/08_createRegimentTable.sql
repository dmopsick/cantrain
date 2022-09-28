-------------------------------------------
---- DDL Statements for the REGIMENT Table
-------------------------------------------

CREATE TABLE REGIMENT (
    REGIMENT_ID        INT NOT NULL AUTO_INCREMENT,
    TRAINER_ID         INT NOT NULL,
    CLIENT_ID          INT NOT NULL,
    REGIMENT_NAME      VARCHAR(128) NOT NULL,
    REGIMENT_CYCLE_NUM SMALLINT
);

-- DDL Statements for indexes on REGIMENT Table

-- DDL Statement for Foreign Keys on REGIMENT Table