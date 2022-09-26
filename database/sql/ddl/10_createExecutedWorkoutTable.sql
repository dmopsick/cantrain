---------------------------------------------------
---- DDL Statements for the EXECUTED_WORKOUT Table
---------------------------------------------------

CREATE TABLE EXECUTED_WORKOUT (
    EXECUTED_WORKOUT_ID INTEGER NOT NULL,
    ASSIGNED_WORKOUT_ID INTEGER NOT NULL,
    WORKOUT_START_TIME  TIMESTAMP NOT NULL,
    WORKOUT_END_TIME    TIMESTAMP NOT NULL,
    WORKOUT_NOTES       VARCHAR(5012) -- How long do I want this?
);
