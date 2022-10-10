-- -----------------------------------------
-- -- DDL Statements for the ASSIGNED_REGIMENT Table
-- -----------------------------------------

CREATE TABLE CANTRAINDB.ASSIGNED_REGIMENT (
    ASSIGNED_REGIMENT_ID INT NOT NULL AUTO_INCREMENT,
    REGIMENT_ID          INT NOT NULL,
    CLIENT_ID            INT NOT NULL,
    CURRENT_CYCLE        TINYINT,
    REGIMENT_ACTIVE      BOOLEAN,
    REGIMENT_ARCHIVE     BOOLEAN,
    REGIMENT_STATUS      TINYINT,
    PRIMARY KEY (ASSIGNED_REGIMENT_ID)
);

-- DDL Statements for indexes on ASSIGNED_REGIMENT Table
CREATE UNIQUE INDEX ASSIGNED_REGIMENT_UNQ1
ON CANTRAINDB.ASSIGNED_REGIMENT (ASSIGNED_REGIMENT_ID);

CREATE INDEX ASSIGNED_REGIMENT_IDX2
ON CANTRAINDB.ASSIGNED_REGIMENT (REGIMENT_ID);

CREATE INDEX ASSIGNED_REGIMENT_IDX3
ON CANTRAINDB.ASSIGNED_REGIMENT (CLIENT_ID);

-- DDL Statement for Foreign Keys on ASSIGNED_REGIMENT Table
ALTER TABLE CANTRAINDB.ASSIGNED_REGIMENT
ADD FOREIGN KEY (REGIMENT_ID) REFERENCES CANTRAINDB.REGIMENT (REGIMENT_ID);

ALTER TABLE CANTRAINDB.ASSIGNED_REGIMENT
ADD FOREIGN KEY (CLIENT_ID) REFERENCES CANTRAINDB.CLIENT (CLIENT_ID);
