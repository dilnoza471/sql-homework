CREATE DATABASE IF NOT EXISTS class2;
use class2
--create table
CREATE TABLE worker (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

--insert the csv file
BULK INSERT worker
FROM 'workers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM student;


