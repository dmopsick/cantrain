------------------------------------------------
---- DDL Statements for the TRAINER_PLAN Table
------------------------------------------------

CREATE TABLE TRAINER_PLAN (
    TRAINER_PLAN_ID INTEGER NOT NULL,
    TRAINER_ID      INTEGER NOT NULL,
    PLAN_ID         INTEGER NOT NULL,
    DATE_STARTED    TIMESTAMP NOT NULL.
    BILLED_PRICE    DECIMAL(10, 2)
);