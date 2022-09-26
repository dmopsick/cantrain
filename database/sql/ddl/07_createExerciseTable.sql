-------------------------------------------
---- DDL Statements for the EXERCISE Table
-------------------------------------------

CREATE TABLE EXERCISE (
    EXERCISE_ID           INTEGER NOT NULL,
    TRAINER_ID            INTEGER NOT NULL,
    EXERCISE_NAME         VARCHAR(128) NOT NULL,
    EXERCISE_INSTRUCTIONS VARCHAR(1024),
    EXERCISE_VIDEO_LINK   VARCHAR(256)
);
