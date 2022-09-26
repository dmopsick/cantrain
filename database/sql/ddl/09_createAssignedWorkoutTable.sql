---------------------------------------------------
---- DDL Statements for the ASSIGNED_WORKOUT Table
---------------------------------------------------

CREATE TABLE ASSIGNED_WORKOUT (
    ASSIGNED_WORKOUT_ID INTEGER NOT NULL,
    REGIMENT_ID         INTEGER NOT NULL,
    WORKOUT_NAME        VARCHAR(128) NOT NULL,
    WORKOUT_ORDER       SMALLINT NOT NULL
);
