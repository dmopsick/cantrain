----------------------------------------------------
---- DDL Statements for the ASSIGNED_WORKOUT Table
----------------------------------------------------

CREATE TABLE CANTRAINDB.ASSIGNED_WORKOUT (
    ASSIGNED_WORKOUT_ID    INT NOT NULL AUTO_INCREMENT,
    REGIMENT_ID            INT NOT NULL,
    WORKOUT_ID             INT NOT NULL,
    WORKOUT_ORDER          TINYINT,
    ASSIGNED_WORKOUT_NOTES VARCHAR(4096),
    PRIMARY KEY (ASSIGNED_WORKOUT_ID)
);
 
-- DDL Statements for indexes on ASSIGNED_WORKOUT Table
CREATE UNIQUE INDEX ASSIGNED_WORKOUT_UNQ1
ON CANTRAINDB.ASSIGNED_WORKOUT (ASSIGNED_WORKOUT_ID);

CREATE INDEX ASSIGNED_WORKOUT_IDX2
ON CANTRAINDB.ASSIGNED_WORKOUT (REGIMENT_ID);

CREATE INDEX ASSIGNED_WORKOUT_IDX3
ON CANTRAINDB.ASSIGNED_WORKOUT (WORKOUT_ID);

-- DDL Statement for Foreign Keys on ASSIGNED_WORKOUT Table
ALTER TABLE CANTRAINDB.ASSIGNED_WORKOUT
ADD FOREIGN KEY (REGIMENT_ID) REFERENCES CANTRAINDB.REGIMENT (REGIMENT_ID);

ALTER TABLE CANTRAINDB.ASSIGNED_WORKOUT
ADD FOREIGN KEY (WORKOUT_ID) REFERENCES CANTRAINDB.WORKOUT (WORKOUT_ID);