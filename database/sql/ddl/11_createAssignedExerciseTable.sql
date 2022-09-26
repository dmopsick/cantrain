----------------------------------------------------
---- DDL Statements for the ASSIGNED_EXERCISE Table
----------------------------------------------------

CREATE TABLE ASSIGNED_EXERCISE (
    ASSIGNED_EXERCISE_ID INTEGER NOT NULL,
    EXERCISE_ID          INTEGER NOT NULL,
    WORKOUT_ID           INTEGER NOT NULL,
    ASSIGNED_SETS        SMALLINT,
    ASSIGNED_REPS        SMALLINT,
    EXERCISE_NOTES       VARCHAR(1024)
);
