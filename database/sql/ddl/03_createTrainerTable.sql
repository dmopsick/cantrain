-- ---------------------------------------
-- -- DDL Statements for the TRAINER Table
-- ---------------------------------------

CREATE TABLE CANTRAINDB.TRAINER (
    TRAINER_ID            INT NOT NULL AUTO_INCREMENT,
    USER_ID               INT NOT NULL,
    TRAINER_WEBSITE_URL   VARCHAR(256),
    TRAINER_YOUTUBE_URL   VARCHAR(256),
    TRAINER_INSTAGRAM_URL VARCHAR(256),
    PRIMARY KEY (TRAINER_ID)
);

-- DDL Statements for indexes on TRAINER Table
CREATE UNIQUE INDEX TRAINER_UNQ1 
ON CANTRAINDB.TRAINER (TRAINER_ID);

CREATE INDEX TRAINER_IDX2
ON CANTRAINDB.TRAINER (USER_ID);

-- DDL Statement for Foreign Keys on TRAINER Table
ALTER TABLE CANTRAINDB.TRAINER
ADD FOREIGN KEY (USER_ID) REFERENCES CANTRAINDB.USER (USER_ID);
