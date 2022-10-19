-- ---------------------------------------
-- -- DDL Statements for the USER Table
-- ---------------------------------------

CREATE TABLE CANTRAINDB.USER (
    USER_ID                     INT NOT NULL AUTO_INCREMENT,
    USER_EMAIL                  VARCHAR(128) NOT NULL,
    USER_FIRST_NAME             VARCHAR(128) NOT NULL,
    USER_LAST_NAME              VARCHAR(128) NOT NULL,
    USER_PREFERRED_NAME         VARCHAR(128),
    USER_ACTIVE                 BOOLEAN NOT NULL,
    UNITS_OF_MEASUREMENT_SWITCH BOOLEAN NOT NULL,
    PRIMARY KEY (USER_ID)
);

-- DDL Statements for indexes on USER Table
CREATE UNIQUE INDEX USER_UQ1 
ON CANTRAINDB.USER (USER_ID);

-- DDL Statement for Foreign Keys on USER Table
-- N/A
