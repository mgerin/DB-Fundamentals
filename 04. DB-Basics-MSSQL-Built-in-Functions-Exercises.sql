--PROBLEM 01

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.FirstName LIKE 'sa%';

--PROBLEM 02

SELECT E.FirstName, E.LastName FROM Employees AS E
	WHERE E.LastName LIKE '%ei%';

--PROBLEM 03

SELECT E.FirstName, E.HireDate FROM Employees AS E
	WHERE e.DepartmentID in (3, 10) and (e.HireDate between '1995-01-01' and '2005-12-31');

--PROBLEM 04

--PROBLEM 05

--PROBLEM 06

--PROBLEM 07

--PROBLEM 08

--PROBLEM 09

--PROBLEM 10

--PROBLEM 11

--PROBLEM 12

--PROBLEM 13

--PROBLEM 14

--PROBLEM 15

--PROBLEM 16

--PROBLEM 17