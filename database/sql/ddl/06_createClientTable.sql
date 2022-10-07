-----------------------------------------
---- DDL Statements for the CLIENT Table
-----------------------------------------

CREATE TABLE CLIENT (
    CLIENT_ID      INT NOT NULL AUTO_INCREMENT,
    USER_ID        INT NOT NULL
);

-- DDL Statements for indexes on CLIENT Table
CREATE UNIQUE INDEX CLIENT_UNQ1
ON CLIENT ("CLIENT_ID");

CREATE INDEX CLIENT_IDX2
ON CLIENT ("USER_ID");

ALTER TABLE CLIENT
ADD PRIMARY KEY ("CLIENT_ID");

-- DDL Statement for Foreign Keys on CLIENT Table
ALTER TABLE CLIENT
ADD FOREIGN KEY ("USER_ID") REFERENCES USER("USER_ID");
