---------------------------------------------------
---- DDL Statements for the EXECUTED_WORKOUT Table
---------------------------------------------------

CREATE TABLE EXECUTED_WORKOUT (
    EXECUTED_WORKOUT_ID INT NOT NULL AUTO_INCREMENT,
    ASSIGNED_WORKOUT_ID INT NOT NULL,
    WORKOUT_START_TIME  TIMESTAMP NOT NULL,
    WORKOUT_END_TIME    TIMESTAMP NOT NULL,
    WORKOUT_NOTES       VARCHAR(5012) -- How long do I want this?
);

-- DDL Statements for indexes on EXECUTED_WORKOUT Table

-- DDL Statement for Foreign Keys on EXECUTED_WORKOUT Table