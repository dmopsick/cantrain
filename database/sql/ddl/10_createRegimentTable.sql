-------------------------------------------
---- DDL Statements for the REGIMENT Table
-------------------------------------------

CREATE TABLE CANTRAINDB.REGIMENT (
    REGIMENT_ID           INT NOT NULL AUTO_INCREMENT,
    TRAINER_ID            INT NOT NULL,
    REGIMENT_NAME         VARCHAR(128) NOT NULL,
    REGIMENT_CYCLE_LENGTH TINYINT,
    PRIMARY KEY (REGIMENT_ID)
);

-- DDL Statements for indexes on REGIMENT Table
CREATE UNIQUE INDEX REGIMENT_UNQ1
ON REGIMENT (REGIMENT_ID);

CREATE INDEX REGIMENT_IDX2
ON REGIMENT (TRAINER_ID);

-- DDL Statement for Foreign Keys on REGIMENT Table
ALTER TABLE REGIMENT
ADD FOREIGN KEY (TRAINER_ID) REFERENCES TRAINER(TRAINER_ID);
