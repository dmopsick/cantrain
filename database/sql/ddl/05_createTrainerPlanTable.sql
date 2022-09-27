------------------------------------------------
---- DDL Statements for the TRAINER_PLAN Table
------------------------------------------------

CREATE TABLE TRAINER_PLAN (
    TRAINER_PLAN_ID INT NOT NULL,
    TRAINER_ID      INT NOT NULL,
    PLAN_ID         INT NOT NULL,
    DATE_STARTED    TIMESTAMP NOT NULL.
    BILLED_PRICE    DECIMAL(10, 2)
);