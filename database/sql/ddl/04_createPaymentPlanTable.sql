-----------------------------------------------
---- DDL Statements for the PAYMENT_PLAN Table
-----------------------------------------------

CREATE TABLE PAYMENT_PLAN (
    PAYMENT_PLAN_ID     INTEGER NOT NULL,
    PLAN_NAME           VARCHAR(128),
    PLAN_MONTHLY_COST   DECIMAL(10, 2),
    NUM_CLIENTS_ALLOWED SMALLINT
);
