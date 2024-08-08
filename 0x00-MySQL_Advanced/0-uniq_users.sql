-- This sql script creates the table users IF DOES NOT EXIST

-- create the schema of the table
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    name VARCHAR(255)
    );
