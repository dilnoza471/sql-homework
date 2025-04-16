CREATE DATABASE IF NOT EXISTS class2;
use class2

-- Create the table with various data types
CREATE TABLE data_types_demo (
    tinyint_col TINYINT,           -- small integers (0 to 255)
    smallint_col SMALLINT,         -- smaller integers (-32,768 to 32,767)
    bit_col BIT,                   -- Stores boolean values (0 or 1)
    int_col INT,                   -- Stores integers (-2^31 to 2^31-1)
    float_col FLOAT,               -- Stores approximate numbers with floating point precision
    decimal_col DECIMAL(10,2),     -- Stores exact numbers with fixed decimal point
    char_col CHAR(10),             -- Fixed-length string (padded with spaces if shorter)
    varchar_col VARCHAR(50),       -- Variable-length string
    nvarchar_col NVARCHAR(50),     -- Variable-length string for Unicode characters
    text_col TEXT                  -- TEXT: Stores large amounts of text data
);

-- Insert sample values into the table
INSERT INTO data_types_demo (
    tinyint_col, smallint_col, bit_col, int_col, float_col, 
    decimal_col, char_col, varchar_col, nvarchar_col, text_col
)
VALUES 
    (127, 32000, 1, 123456, 123.456, 12345.67, 'A', 'VariableLengthString', N'UnicodeString', 'This is a sample text for the TEXT data type.');

-- Retrieve and display the values
SELECT * FROM data_types_demo;

