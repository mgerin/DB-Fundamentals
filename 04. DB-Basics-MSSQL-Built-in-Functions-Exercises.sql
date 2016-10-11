--PROBLEM 01

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.FirstName LIKE 'sa%';

--PROBLEM 02

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.LastName LIKE '%ei%';

--PROBLEM 03

SELECT E.FirstName FROM Employees AS E
	WHERE e.DepartmentID in (3, 10) and (e.HireDate between '1995-01-01' and '2005-12-31');

--PROBLEM 04

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.JobTitle NOT LIKE '%engineer%';

--PROBLEM 05

SELECT T.[Name] FROM Towns AS T
	WHERE LEN(T.[Name]) = 5 OR LEN(T.[Name]) = 6
	ORDER BY T.[Name];

--PROBLEM 06

SELECT * FROM Towns AS T
	WHERE T.[Name] LIKE '[MKBE]%'
	ORDER BY T.[Name];

--PROBLEM 07

SELECT * FROM Towns AS T
	WHERE T.[Name] NOT LIKE '[RBD]%'
	ORDER BY T.[Name];

--PROBLEM 08

CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.HireDate >= '2001';

--PROBLEM 09

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE LEN(E.LastName) = 5;

--PROBLEM 10

USE Geography
GO

SELECT C.CountryName, C.IsoCode FROM Countries AS C
	WHERE C.CountryName LIKE '%A%A%A%'
	ORDER BY C.IsoCode;

SELECT C.CountryName, C.IsoCode FROM Countries AS C
	WHERE LEN(C.CountryName) - LEN(REPLACE(C.CountryName, 'A', '')) >= 3
	ORDER BY C.IsoCode;

--PROBLEM 11

SELECT PeakName, RiverName, CONCAT(LOWER(PeakName), LOWER(RIGHT(RiverName, LEN(RiverName)-1))) AS Mix FROM Peaks, Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix

--PROBLEM 12

USE Diablo
GO

SELECT TOP 50 Name, 
       FORMAT(Start, 'yyyy-MM-dd') AS NewDate,
	   CONVERT(DATE, Start, 120) AS NewDate2
  FROM Games
 WHERE YEAR(Start) IN (2011, 2012)
 ORDER BY Start, Name

 SELECT TOP 50 Name, 
       FORMAT(Start, 'yyyy-MM-dd') AS NewDate
  FROM Games
 WHERE YEAR(Start) IN (2011, 2012)
 ORDER BY Start, Name;

--PROBLEM 13

SELECT U.Username, REPLACE(U.Email, '@', '') AS 'Email Provider' FROM Users AS U

--PROBLEM 14

--PROBLEM 15

--PROBLEM 16

--PROBLEM 17