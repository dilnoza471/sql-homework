CREATE DATABASE IF NOT EXISTS class2;
use class2
CREATE TABLE photos (
    id INT PRIMARY KEY,
    photo_data VARBINARY(MAX)
);
INSERT INTO photos (id, photo_data)
SELECT 1, 
       * 
FROM OPENROWSET(BULK 'images/image.jpg', SINGLE_BLOB) AS img;

