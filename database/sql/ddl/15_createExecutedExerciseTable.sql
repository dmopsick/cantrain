-- --------------------------------------------------
-- -- DDL Statements for the EXECUTED_EXERCISE Table
-- --------------------------------------------------

CREATE TABLE CANTRAINDB.EXECUTED_EXERCISE (
    EXECUTED_EXERCISE_ID INT NOT NULL AUTO_INCREMENT,
    ASSIGNED_EXERCISE_ID INT NOT NULL,
    EXECUTED_WORKOUT_ID  INT NOT NULL,
    EXERCISE_NOTES       TEXT,
    EXECUTED_EXERCISE_DURATION VARCHAR(128),
    EXECUTED_EXERCISE_DISTANCE VARCHAR(128),
    PRIMARY KEY (EXECUTED_EXERCISE_ID)
);

-- DDL Statements for indexes on EXECUTED_EXERCISE Table
CREATE UNIQUE INDEX EXECUTED_EXERCISE_UNQ1
ON CANTRAINDB.EXECUTED_EXERCISE (EXECUTED_EXERCISE_ID);

CREATE INDEX EXECUTED_EXERCISE_IDX2
ON CANTRAINDB.EXECUTED_EXERCISE (ASSIGNED_EXERCISE_ID);

CREATE INDEX EXECUTED_EXERCISE_IDX3
ON CANTRAINDB.EXECUTED_EXERCISE (EXECUTED_WORKOUT_ID);

-- DDL Statement for Foreign Keys on EXECUTED_EXERCISE Table
ALTER TABLE CANTRAINDB.EXECUTED_EXERCISE
ADD FOREIGN KEY (ASSIGNED_EXERCISE_ID) REFERENCES CANTRAINDB.ASSIGNED_EXERCISE (ASSIGNED_EXERCISE_ID);

ALTER TABLE CANTRAINDB.EXECUTED_EXERCISE
ADD FOREIGN KEY (EXECUTED_WORKOUT_ID) REFERENCES CANTRAINDB.EXECUTED_WORKOUT (EXECUTED_WORKOUT_ID);
