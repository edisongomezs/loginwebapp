CREATE DATABASE IF NOT EXISTS sample;

USE sample;

CREATE TABLE IF NOT EXISTS USER (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL
);

INSERT INTO USER (username, password) VALUES ('admin', 'password');
