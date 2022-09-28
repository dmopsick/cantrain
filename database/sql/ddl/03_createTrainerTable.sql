-----------------------------------------
---- DDL Statements for the TRAINER Table
-----------------------------------------

CREATE TABLE TRAINER (
    TRAINER_ID      INT NOT NULL AUTO_INCREMENT,
    USER_ID         INT NOT NULL
);

-- DDL Statements for indexes on TRAINER Table
CREATE UNIQUE INDEX TRAINER_UNQ1 
ON TRAINER (TRAINER_ID);

CREATE INDEX TRAINER_IDX2
ON TRAINER (USER_ID);

-- DDL Statement for Foreign Keys on TRAINER Table
ALTER TABLE TRAINER
ADD FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID);
