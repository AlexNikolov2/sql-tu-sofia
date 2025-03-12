DROP DATABASE IF EXISTS emp_depts;
CREATE DATABASE emp_depts;
USE emp_depts;
CREATE TABLE departments(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(200) NOT NULL
);
CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(200) NOT NULL,
department_id INT,
CONSTRAINT FOREIGN KEY (department_id) REFERENCES departments(id)
);
INSERT INTO departments (name) VALUES
('Sales'),
('Marketing'),
('IT'),
('HR');
INSERT INTO employees (name, department_id) VALUES
('Maria Petrova', 1),
('Ivan Ivanov', 1),
('Georgi Georgiev', 2),
('Petar Dimitrov', 3),
('Elena Stoyanova', 4);