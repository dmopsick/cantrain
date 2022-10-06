-----------------------------------------------
---- DDL Statements for the PAYMENT_PLAN Table
-----------------------------------------------

CREATE TABLE PAYMENT_PLAN (
    PAYMENT_PLAN_ID     INT NOT NULL AUTO_INCREMENT,
    PLAN_NAME           VARCHAR(128),
    PLAN_ANNUAL_COST    DECIMAL(10, 2),
    NUM_CLIENTS_ALLOWED TINYINT
);

-- DDL Statements for indexes on PAYMENT_PLAN Table
CREATE UNIQUE INDEX PAYMENT_PLAN_UNQ1
ON PAYMENT_PLAN ("PAYMENT_PLAN_ID");

-- DDL Statement for Foreign Keys on PAYMENT_PLAN Table
-- No foreign keys
