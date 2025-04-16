CREATE DATABASE IF NOT EXISTS class2;
use class2
--create table
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    classes INT,
    tuition_per_class DECIMAL(10, 2),
    total_tuition AS (classes * tuition_per_class) PERSISTED --calculated
);
--insert values
INSERT INTO student (id, name, classes, tuition_per_class)
VALUES 
(1, 'John Doe', 5, 100.00),
(2, 'Jane Smith', 6, 120.00),
(3, 'Michael Brown', 4, 150.00);
SELECT * FROM student;


