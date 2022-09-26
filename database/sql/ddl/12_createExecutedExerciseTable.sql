----------------------------------------------------
---- DDL Statements for the EXECUTED_EXERCISE Table
----------------------------------------------------

CREATE TABLE EXECUTED_EXERCISE (
    EXECUTED_EXERCISE_ID INTEGER NOT NULL,
    ASSIGNED_EXERCISE_ID INTEGER NOT NULL,
    EXECITED_WORKOUT_ID  INTEGER NOT NULL,
    EXERCISE_WEIGHT      SMALLINT,
    EXERCISE_NOTES       VARCHAR(1024)
);
