-------------------------------------------------
---- DDL Statements for the USER_SETTINGS Table
-------------------------------------------------

CREATE TABLE USER_SETTINGS (
    USER_SETTINGS_ID            INT NOT NULL AUTO_INCREMENT,
    UNITS_OF_MEASUREMENT_SWITCH BOOLEAN NOT NULL
);

-- DDL Statements of Indexes on USER_SETTINGS Table
CREATE UNIQUE INDEX USER_SETTINGS_UNQ1 
ON USER_SETTINGS ("USER_SETTINGS_ID");

ALTER TABLE USER_SETTINGS
ADD PRIMARY KEY ("USER_SETTINGS_ID");

-- DDL Statement for Foreign Keys on USER_SETTINGS Table
-- N/A


