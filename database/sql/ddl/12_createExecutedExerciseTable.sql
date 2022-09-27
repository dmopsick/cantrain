----------------------------------------------------
---- DDL Statements for the EXECUTED_EXERCISE Table
----------------------------------------------------

CREATE TABLE EXECUTED_EXERCISE (
    EXECUTED_EXERCISE_ID INT NOT NULL,
    ASSIGNED_EXERCISE_ID INT NOT NULL,
    EXECITED_WORKOUT_ID  INT NOT NULL,
    EXERCISE_WEIGHT      SMALLINT,
    EXERCISE_NOTES       VARCHAR(1024)
);
