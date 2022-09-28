---------------------------------------------------
---- DDL Statements for the ASSIGNED_WORKOUT Table
---------------------------------------------------

CREATE TABLE ASSIGNED_WORKOUT (
    ASSIGNED_WORKOUT_ID INT NOT NULL AUTO_INCREMENT,
    REGIMENT_ID         INT NOT NULL,
    WORKOUT_NAME        VARCHAR(128) NOT NULL,
    WORKOUT_ORDER       TINYINT NOT NULL
);

-- DDL Statements for indexes on ASSIGNED_WORKOUT Table

-- DDL Statement for Foreign Keys on ASSIGNED_WORKOUT Table