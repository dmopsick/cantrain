-----------------------------------------
---- DDL Statements for the CLIENT Table
-----------------------------------------

CREATE TABLE CLIENT (
    CLIENT_ID      INT NOT NULL AUTO_INCREMENT,
    USER_ID        INT NOT NULL,
    CLIENT_PLAN_ID INT NOT NULL
);

-- DDL Statements for indexes on CLIENT Table

-- DDL Statement for Foreign Keys on CLIENT Table