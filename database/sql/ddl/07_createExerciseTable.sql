-------------------------------------------
---- DDL Statements for the EXERCISE Table
-------------------------------------------

CREATE TABLE EXERCISE (
    EXERCISE_ID           INT NOT NULL AUTO_INCREMENT,
    TRAINER_ID            INT NOT NULL,
    EXERCISE_NAME         VARCHAR(128) NOT NULL,
    EXERCISE_INSTRUCTIONS VARCHAR(1024),
    EXERCISE_VIDEO_LINK   VARCHAR(256)
);

-- DDL Statements for indexes on EXERCISE Table

-- DDL Statement for Foreign Keys on EXERCISE Table