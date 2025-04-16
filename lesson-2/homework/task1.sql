CREATE database class2
use class2
--create table with identity column
DROP TABLE IF EXISTS test_identity;
CREATE TABLE test_identity (
    id INT IDENTITY(1,1),
    name VARCHAR(50)
);

--insert elements

INSERT INTO test_identity (name) VALUES 
('Alice'), 
('Bob'), 
('Charlie'), 
('Diana'), 
('Ethan');

SELECT * from test_identity;

--try delete; rows deleted
DELETE from test_identity;
INSERT INTO test_identity VALUES('Bella')
SELECT * from test_identity;


--truncate; rows deleted, identity is reset
DROP TABLE IF EXISTS test_identity; --deletes the table
CREATE TABLE test_identity (
    id INT IDENTITY(1,1),
    name VARCHAR(50)
);

--insert elements

INSERT INTO test_identity (name) VALUES 
('Alice'), 
('Bob'), 
('Charlie'), 
('Diana'), 
('Ethan');

SELECT * from test_identity;
TRUNCATE TABLE test_identity;
INSERT into test_identity VALUES('Bella')
SELECT * from test_identity;


