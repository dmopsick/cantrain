-- Create two users who will be trainers
INSERT INTO CANTRAINDB.USER (USER_ID, USER_EMAIL, USER_FIRST_NAME, USER_LAST_NAME, USER_PREFERRED_NAME, USER_ACTIVE, UNITS_OF_MEASUREMENT_SWITCH)
VALUES (1, 'jane.trainer@gmail.com', 'Jane', 'Doe', null, True, True);

INSERT INTO CANTRAINDB.USER (USER_ID, USER_EMAIL, USER_FIRST_NAME, USER_LAST_NAME, USER_PREFERRED_NAME, USER_ACTIVE, UNITS_OF_MEASUREMENT_SWITCH)
VALUES (2, 'john.coach@gmail.com', 'John', 'Smith', 'Johnny', True, True);

-- Create four users who will be clients
INSERT INTO CANTRAINDB.USER (USER_ID, USER_EMAIL, USER_FIRST_NAME, USER_LAST_NAME, USER_PREFERRED_NAME, USER_ACTIVE, UNITS_OF_MEASUREMENT_SWITCH)
VALUES (3, 'mike.client@hotmail.com', 'Mike', 'Monkey', 'Michael', True, True);

INSERT INTO CANTRAINDB.USER (USER_ID, USER_EMAIL, USER_FIRST_NAME, USER_LAST_NAME, USER_PREFERRED_NAME, USER_ACTIVE, UNITS_OF_MEASUREMENT_SWITCH)
VALUES (4, 'danmopsick@gmail.com', 'Daniel', 'Mopsick', 'Dan', True, True);

INSERT INTO CANTRAINDB.USER (USER_ID, USER_EMAIL, USER_FIRST_NAME, USER_LAST_NAME, USER_PREFERRED_NAME, USER_ACTIVE, UNITS_OF_MEASUREMENT_SWITCH)
VALUES (5, 'janet.fitness@aol.com', 'Janet', "Shloople", null, True, True);

INSERT INTO CANTRAINDB.USER (USER_ID, USER_EMAIL, USER_FIRST_NAME, USER_LAST_NAME, USER_PREFERRED_NAME, USER_ACTIVE, UNITS_OF_MEASUREMENT_SWITCH)
VALUES (6, 'sally.soccer@gmail.com', 'Sally', 'Mustard', null, True, True);

