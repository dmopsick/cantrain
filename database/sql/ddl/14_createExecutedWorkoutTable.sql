---------------------------------------------------
---- DDL Statements for the EXECUTED_WORKOUT Table
---------------------------------------------------

CREATE TABLE EXECUTED_WORKOUT (
    EXECUTED_WORKOUT_ID INT NOT NULL AUTO_INCREMENT,
    ASSIGNED_WORKOUT_ID INT NOT NULL,
    WORKOUT_START_TIME  TIMESTAMP NOT NULL,
    WORKOUT_END_TIME    TIMESTAMP NOT NULL,
    WORKOUT_NOTES       VARCHAR(4096)
);

-- DDL Statements for indexes on EXECUTED_WORKOUT Table
CREATE UNIQUE INDEX EXECUTED_WORKOUT_UNQ1
ON EXECUTED_WORKOUT ("EXECUTED_WORKOUT_ID");

CREATE INDEX EXECUTED_WORKOUT_IDX2
ON EXECUTED_WORKOUT ("ASSIGNED_WORKOUT_ID");

ALTER TABLE EXECUTED_WORKOUT
ADD PRIMARY KEY ("EXECUTED_WORKOUT_ID");

-- DDL Statement for Foreign Keys on EXECUTED_WORKOUT Table
ALTER TABLE EXECUTED_WORKOUT
ADD FOREIGN KEY ("ASSIGNED_WORKOUT_ID") REFERENCES ASSIGNED_WORKOUT("ASSIGNED_WORKOUT_ID");
