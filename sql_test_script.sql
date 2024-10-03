-- DDL
--Create Tables (You've already done this part)
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

--Alter 
-- Add a new column to the Employees table
ALTER TABLE Employees ADD DateOfBirth DATE;


--Drop
-- Drop the Projects table from the database
DROP TABLE Projects;


--DML
-- Inserting Data (You've already done this)
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'HR');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'IT');

INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (1, 'Alice', 1);
INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (2, 'Bob', 2);

INSERT INTO Projects (ProjectID, ProjectName) VALUES (1, 'Project A');

INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES (1, 1);
INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES (2, 1);

-- Update Data
UPDATE Employees SET Name = 'Jamali John' WHERE EmployeeID = 1;

-- Delete Data
DELETE FROM Employees WHERE EmployeeID = 2;

--Select
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Projects;
SELECT * FROM EmployeesProjects;

--Joins
-- Retrieve all employees with their departments
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Retrieve all employees working on a specific project
SELECT e.Name, p.ProjectName
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID;

--Subqueries
-- Retrieve employees who are part of 'Project A'
SELECT Name
FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeeProjects WHERE ProjectID = 1);

--DCL
--Grant
-- Grant SELECT permission on the Employees table to a user
GRANT SELECT ON Employees TO user_name;

-- Grant INSERT, UPDATE, and DELETE permissions on the Employees table to a user
GRANT INSERT, UPDATE, DELETE ON Employees TO user_name;

-- Grant all privileges (full access) to a specific user
GRANT ALL PRIVILEGES ON Employees TO user_name;

--Revoke
-- Revoke all privileges from a user on the Employees table
REVOKE ALL PRIVILEGES ON Employees FROM user_name;

-- Revoke specific permissions
REVOKE INSERT, UPDATE ON Employees FROM user_name;


--TCL

-- Commit
BEGIN;

-- Insert new employee
INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (3, 'Charlie', 1);

-- Update existing employee
UPDATE Employees SET Name = 'Alice Smith' WHERE EmployeeID = 1;

-- Commit the transaction to save changes permanently
COMMIT;

-- In case of errors
ROLLBACK;

--Rollback

BEGIN;

-- Insert new employee
INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (4, 'David', 2);

-- Oops! An error occurred. Rollback the transaction to undo the insert
ROLLBACK;


