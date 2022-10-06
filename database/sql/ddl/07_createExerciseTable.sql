-------------------------------------------
---- DDL Statements for the EXERCISE Table
-------------------------------------------

CREATE TABLE EXERCISE (
    EXERCISE_ID           INT NOT NULL AUTO_INCREMENT,
    TRAINER_ID            INT NOT NULL,
    EXERCISE_NAME         VARCHAR(256) NOT NULL,
    EXERCISE_INSTRUCTIONS VARCHAR(1024),
    EXERCISE_VIDEO_LINK   VARCHAR(256),
    PUBLIC_EXERCISE       BOOLEAN
);

-- DDL Statements for indexes on EXERCISE Table
CREATE UNIQUE INDEX EXERCISE_UNQ1
ON EXERCISE ("EXERCISE_ID");

CREATE INDEX EXERCISE_IDX2
ON EXERCISE ("TRAINER_ID");

-- DDL Statement for Foreign Keys on EXERCISE Table
ALTER TABLE EXERCISE
ADD FOREIGN KEY ("TRAINER_ID") REFERENCES TRAINER("TRAINER_ID");
