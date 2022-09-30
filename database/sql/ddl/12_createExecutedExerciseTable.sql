----------------------------------------------------
---- DDL Statements for the EXECUTED_EXERCISE Table
----------------------------------------------------

CREATE TABLE EXECUTED_EXERCISE (
    EXECUTED_EXERCISE_ID INT NOT NULL AUTO_INCREMENT,
    ASSIGNED_EXERCISE_ID INT NOT NULL,
    EXECUTED_WORKOUT_ID  INT NOT NULL,
    EXERCISE_WEIGHT      TINYINT,
    EXERCISE_NOTES       VARCHAR(1024)
);

-- DDL Statements for indexes on EXECUTED_EXERCISE Table
CREATE UNIQUE INDEX EXECUTED_EXERCISE_UNQ1
ON EXECUTED_EXERCISE ("EXECUTED_EXERCISE_ID");

CREATE INDEX EXECUTED_EXERCISE_IDX2
ON EXECUTED_EXERCISE ("ASSIGNED_EXERCISE_ID");

CREATE INDEX EXECUTED_EXERCISE_IDX3
ON EXECUTED_EXERCISE ("EXECUTED_WORKOUT_ID");

-- DDL Statement for Foreign Keys on EXECUTED_EXERCISE Table
ALTER TABLE EXECUTED_EXERCISE
ADD FOREIGN KEY ("ASSIGNED_EXERCISE_ID") REFERENCES ASSIGNED_EXERCISE("ASSIGNED_EXERCISE_ID");

ALTER TABLE EXECUTED_EXERCISE
ADD FOREIGN KEY ("EXECUTED_WORKOUT_ID") REFERENCES EXECUTED_WORKOUT("EXECUTED_WORKOUT_ID");
