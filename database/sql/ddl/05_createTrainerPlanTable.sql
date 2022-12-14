-- ----------------------------------------------
-- -- DDL Statements for the TRAINER_PLAN Table
-- ----------------------------------------------

CREATE TABLE CANTRAINDB.TRAINER_PLAN (
    TRAINER_PLAN_ID     INT NOT NULL AUTO_INCREMENT,
    TRAINER_ID          INT NOT NULL,
    PAYMENT_PLAN_ID     INT NOT NULL,
    DATE_STARTED        TIMESTAMP NOT NULL,
    BILLED_PRICE        DECIMAL(10, 2),
    TRAINER_PLAN_ACTIVE BOOLEAN,
    PRIMARY KEY (TRAINER_PLAN_ID)
);

-- DDL Statements for indexes on TRAINER_PLAN Table
CREATE UNIQUE INDEX TRAINER_PLAN_UNQ1
ON CANTRAINDB.TRAINER_PLAN (TRAINER_PLAN_ID);

CREATE INDEX TRAINER_PLAN_IDX2
ON CANTRAINDB.TRAINER_PLAN (TRAINER_ID);

CREATE INDEX TRAINER_PLAN_IDX3
ON CANTRAINDB.TRAINER_PLAN (PAYMENT_PLAN_ID);

-- DDL Statement for Foreign Keys on TRAINER_PLAN Table
ALTER TABLE CANTRAINDB.TRAINER_PLAN
ADD FOREIGN KEY (TRAINER_ID) REFERENCES CANTRAINDB.TRAINER(TRAINER_ID);

ALTER TABLE CANTRAINDB.TRAINER_PLAN
ADD FOREIGN KEY (PAYMENT_PLAN_ID) REFERENCES CANTRAINDB.PAYMENT_PLAN(PAYMENT_PLAN_ID);
