--PROBLEM 01
--IMPORT DATABASES

--PROBLEM 02

SELECT * FROM Departments;

--PROBLEM 03

SELECT Name FROM Departments;

--PROBLEM 04

SELECT FirstName, LastName, Salary FROM Employees;

--PROBLEM 05

SELECT FirstName, MiddleName, LastName FROM Employees;

--PROBLEM 06

SELECT E.FirstName + '.' + E.LastName + '@softuni.bg' AS 'Full Email Address' FROM Employees AS E;

--PROBLEM 07

SELECT DISTINCT E.Salary FROM Employees AS E;

--PROBLEM 08

SELECT * FROM Employees
	WHERE JobTitle = 'Sales Representative';

--PROBLEM 09

SELECT E.FirstName, E.LastName, E.JobTitle FROM Employees AS E
	WHERE E.Salary BETWEEN 20000 AND 30000;

--PROBLEM 10

SELECT E.FirstName + ' ' + E.MiddleName + ' ' + E.LastName FROM Employees AS E
	WHERE E.Salary IN (25000, 14000, 12500, 23600);

--PROBLEM 11

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.ManagerID IS NULL;

--PROBLEM 12

SELECT E.FirstName, E.LastName, E.Salary FROM Employees AS E
	WHERE E.Salary > 50000
	ORDER BY E.Salary DESC;

--PROBLEM 13

SELECT TOP (5) E.FirstName, E.LastName FROM Employees AS E
ORDER BY E.Salary DESC;

--PROBLEM 14

SELECT E.FirstName, E.LastName FROM Employees AS E
WHERE E.DepartmentID <> 4;

--PROBLEM 15

SELECT * FROM Employees AS E
ORDER BY E.Salary DESC, E.FirstName, E.LastName DESC, E.MiddleName;

--PROBLEM 16

CREATE VIEW V_EmployeesSalaries AS
SELECT E.FirstName, E.LastName, E.Salary FROM Employees AS E;

SELECT * FROM V_EmployeesSalaries;

--PROBLEM 17

CREATE VIEW V_EmployeeNameJobTitle AS
SELECT E.FirstName + ' ' + 
	CASE WHEN E.MiddleName IS NULL THEN '' 
	ELSE E.MiddleName 
	END 
	+ ' ' + E.LastName AS 'Full Name', E.JobTitle
FROM Employees AS E;

--PROBLEM 18

SELECT DISTINCT E.JobTitle FROM Employees AS E;

--PROBLEM 19

SELECT TOP (10) * FROM Projects AS P
ORDER BY P.StartDate, P.Name;

--PROBLEM 20

SELECT TOP (7) E.FirstName, E.LastName, E.HireDate FROM Employees AS E
ORDER BY E.HireDate DESC;

--PROBLEM 21

SELECT * FROM Employees AS E
	WHERE E.DepartmentID IN (1, 2, 4, 11);

UPDATE Employees
SET Salary = Salary + Salary * 0.12
	WHERE DepartmentID IN (1, 2, 4, 11);

SELECT E.Salary FROM Employees AS E;

UPDATE Employees
SET Salary = Salary / 1.12
	WHERE DepartmentID IN (1, 2, 4, 11);

--PROBLEM 22

USE Geography
GO

SELECT P.PeakName FROM Peaks AS P
ORDER BY P.PeakName;

--PROBLEM 23

SELECT TOP (30) C.CountryName, C.Population FROM Countries AS C
	WHERE C.ContinentCode = 'EU'
	ORDER BY C.Population DESC, C.CountryName;

--PROBLEM 24

SELECT C.CountryName, 
	   C.CountryCode,
	   CASE 
	   WHEN C.CurrencyCode = 'EUR' 
	   THEN 'Euro' 
	   ELSE 'Not Euro' 
	   END AS 'Currency'
	FROM Countries AS C
	ORDER BY C.CountryName;

--PROBLEM 25

USE Diablo
GO

SELECT CH.Name FROM Characters AS CH
ORDER BY CH.Name;