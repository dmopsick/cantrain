----------------------------------------------------
---- DDL Statements for the EXECUTED_EXERCISE Table
----------------------------------------------------

CREATE TABLE EXECUTED_EXERCISE (
    EXECUTED_EXERCISE_ID INT NOT NULL AUTO_INCREMENT,
    ASSIGNED_EXERCISE_ID INT NOT NULL,
    EXECITED_WORKOUT_ID  INT NOT NULL,
    EXERCISE_WEIGHT      TINYINT,
    EXERCISE_NOTES       VARCHAR(1024)
);

-- DDL Statements for indexes on EXECUTED_EXERCISE Table

-- DDL Statement for Foreign Keys on EXECUTED_EXERCISE Table