----------------------------------------------------
---- DDL Statements for the ASSIGNED_EXERCISE Table
----------------------------------------------------

CREATE TABLE ASSIGNED_EXERCISE (
    ASSIGNED_EXERCISE_ID INT NOT NULL AUTO_INCREMENT,
    EXERCISE_ID          INT NOT NULL,
    WORKOUT_ID           INT NOT NULL,
    ASSIGNED_SETS        SMALLINT,
    ASSIGNED_REPS        SMALLINT,
    EXERCISE_NOTES       VARCHAR(1024)
);

-- DDL Statements for indexes on ASSIGNED_EXERCISE Table

-- DDL Statement for Foreign Keys on ASSIGNED_EXERCISE Table