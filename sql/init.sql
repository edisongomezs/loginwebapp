CREATE DATABASE IF NOT EXISTS sample;
USE sample;

CREATE TABLE IF NOT EXISTS USER (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    username VARCHAR(50),
    password VARCHAR(50),
    regdate DATETIME
);

