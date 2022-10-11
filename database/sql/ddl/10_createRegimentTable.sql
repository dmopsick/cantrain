-- -----------------------------------------
-- -- DDL Statements for the REGIMENT Table
-- -----------------------------------------

CREATE TABLE CANTRAINDB.REGIMENT (
    REGIMENT_ID           INT NOT NULL AUTO_INCREMENT,
    TRAINER_ID            INT NOT NULL,
    REGIMENT_NAME         VARCHAR(128) NOT NULL,
    REGIMENT_CYCLE_LENGTH TINYINT,
    PRIMARY KEY (REGIMENT_ID)
);

-- DDL Statements for indexes on REGIMENT Table
CREATE UNIQUE INDEX REGIMENT_UNQ1
ON CANTRAINDB.REGIMENT (REGIMENT_ID);

CREATE INDEX REGIMENT_IDX2
ON CANTRAINDB.REGIMENT (TRAINER_ID);

-- DDL Statement for Foreign Keys on REGIMENT Table
ALTER TABLE CANTRAINDB.REGIMENT
ADD FOREIGN KEY (TRAINER_ID) REFERENCES CANTRAINDB.TRAINER (TRAINER_ID);