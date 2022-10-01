-----------------------------------------
---- DDL Statements for the USER Table
-----------------------------------------

CREATE TABLE USER (
    USER_ID          INT NOT NULL AUTO_INCREMENT,
    USER_EMAIL       VARCHAR(128) NOT NULL
    USER_SETTINGS_ID INT NOT NULL
);

-- DDL Statements for indexes on USER Table
CREATE UNIQUE INDEX USER_UQ1 
ON USER ("USER_ID");

CREATE INDEX USER_IDX2
ON USER ("USER_SETTINGS_ID");

-- DDL Statement for Foreign Keys on USER Table
ALTER TABLE USER
ADD FOREIGN KEY ("USER_SETTINGS_ID") REFERENCES USER_SETTINGS("USER_SETTINGS_ID");
