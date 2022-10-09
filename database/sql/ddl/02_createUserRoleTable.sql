-------------------------------------------------
---- DDL Statements for the USER_ROLE Table
-------------------------------------------------

CREATE TABLE CANTRAINDB.USER_ROLE(
    USER_ROLE_ID   INT NOT NULL,
    USER_ROLE_NAME VARCHAR(128),
    PRIMARY KEY (USER_ROLE_ID)
);


-- DDL Statements of Indexes on USER_ROLE Table
CREATE UNIQUE INDEX USER_ROLE_UNQ1 
ON USER_ROLE (USER_ROLE_ID);

-- DDL Statement for Foreign Keys on USER_ROLE Table
-- N/A
