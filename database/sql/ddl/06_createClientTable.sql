-- ---------------------------------------
-- -- DDL Statements for the CLIENT Table
-- ---------------------------------------

CREATE TABLE CANTRAINDB.CLIENT (
    CLIENT_ID      INT NOT NULL AUTO_INCREMENT,
    USER_ID        INT NOT NULL,
    PRIMARY KEY (CLIENT_ID)
);

-- DDL Statements for indexes on CLIENT Table
CREATE UNIQUE INDEX CLIENT_UNQ1
ON CANTRAINDB.CLIENT (CLIENT_ID);

CREATE INDEX CLIENT_IDX2
ON CANTRAINDB.CLIENT (USER_ID);

-- DDL Statement for Foreign Keys on CLIENT Table
ALTER TABLE CANTRAINDB.CLIENT
ADD FOREIGN KEY (USER_ID) REFERENCES CANTRAINDB.USER (USER_ID);
