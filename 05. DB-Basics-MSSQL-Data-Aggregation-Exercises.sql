-- PROBLEM 01

select count(*) from WizzardDeposits;

-- PROBLEM 02

SELECT MAX(W.MagicWandSize) AS LongestMagicWand FROM WizzardDeposits AS W;

-- PROBLEM 03

SELECT W.DepositGroup, MAX(W.MagicWandSize) AS LongestMagicWand 
  FROM WizzardDeposits AS W
  GROUP BY W.DepositGroup;

-- PROBLEM 04

-- SELECT MIN(AverageMagicWandSize) MinAverageMagicWandSize 
--   FROM
--(SELECT DepositGroup, AVG(MagicWandSize) AS AverageMagicWandSize
--   FROM [dbo].[WizzardDeposits]
--  GROUP BY DepositGroup) AS av

  SELECT DepositGroup FROM
  (SELECT DepositGroup, AVG(MagicWandSize) AS AverageMagicWandSize
   FROM [dbo].[WizzardDeposits]
  GROUP BY DepositGroup) as avgm
  WHERE AverageMagicWandSize = ( SELECT MIN(AverageMagicWandSize) MinAverageMagicWandSize 
								   FROM
								(SELECT DepositGroup, AVG(MagicWandSize) AS AverageMagicWandSize
								   FROM [dbo].[WizzardDeposits]
								  GROUP BY DepositGroup) AS av)

-- PROBLEM 05

SELECT W.DepositGroup, SUM(W.DepositAmount) 
  FROM WizzardDeposits AS W
  GROUP BY W.DepositGroup;

-- PROBLEM 06

SELECT W.DepositGroup, SUM(W.DepositAmount) 
FROM WizzardDeposits AS W
WHERE W.MagicWandCreator = 'Ollivander family'
GROUP BY W.DepositGroup;

-- PROBLEM 07

SELECT W.DepositGroup, SUM(W.DepositAmount) AS TotalSum
FROM WizzardDeposits AS W
WHERE W.MagicWandCreator = 'Ollivander family'
GROUP BY W.DepositGroup
HAVING SUM(W.DepositAmount) < 150000
ORDER BY TotalSum DESC;

-- PROBLEM 08

SELECT W.DepositGroup, W.MagicWandCreator, MIN(W.DepositCharge) AS MinDepositCharge
FROM WizzardDeposits AS W
GROUP BY W.DepositGroup, W.MagicWandCreator
ORDER BY W.MagicWandCreator, W.DepositGroup;

-- PROBLEM 09

 SELECT CASE
			WHEN Age <= 10 THEN '[0-10]'
			WHEN Age <= 20 THEN '[11-20]'
			WHEN Age <= 30 THEN '[21-30]'
			WHEN Age <= 40 THEN '[31-40]'
			WHEN Age <= 50 THEN '[41-50]'
			WHEN Age <= 60 THEN '[51-60]'
			ELSE '[61+]'
		END AS AgeGroup,
        COUNT(*) AS WizzardCount
   FROM [dbo].[WizzardDeposits]
  GROUP BY CASE
			WHEN Age <= 10 THEN '[0-10]'
			WHEN Age <= 20 THEN '[11-20]'
			WHEN Age <= 30 THEN '[21-30]'
			WHEN Age <= 40 THEN '[31-40]'
			WHEN Age <= 50 THEN '[41-50]'
			WHEN Age <= 60 THEN '[51-60]'
			ELSE '[61+]'
		END

-- PROBLEM 10

SELECT LEFT(W.FirstName, 1) AS firs_letter 
FROM WizzardDeposits AS W
WHERE W.DepositGroup = 'Troll Chest'
GROUP BY LEFT(W.FirstName, 1)

-- PROBLEM 11

SELECT W.DepositGroup, W.IsDepositExpired, AVG(W.DepositInterest) AS AverageInterest 
  FROM WizzardDeposits AS W
  WHERE W.DepositStartDate > '1985-01-01'
GROUP BY W.DepositGroup, W.IsDepositExpired
ORDER BY W.DepositGroup DESC, W.IsDepositExpired;

-- PROBLEM 12

SELECT SUM([Output].WizzardDepositDifference) AS SumDifference
  FROM (SELECT DepositAmount - (SELECT DepositAmount
								FROM WizzardDeposits
							   WHERE Id = IdWizzardDeposit.Id + 1) AS WizzardDepositDifference
			FROM WizzardDeposits AS IdWizzardDeposit) AS [Output];

-- PROBLEM 13

USE SoftUni
GO

  SELECT E.DepartmentID, MIN(E.Salary) 
    FROM Employees AS E
   WHERE E.DepartmentID IN (2, 5, 7) AND E.HireDate > '2000-01-01'
GROUP BY E.DepartmentID

-- PROBLEM 14

SELECT * INTO NewTable
		 FROM Employees
		WHERE Salary > 30000;

DELETE FROM NewTable
	WHERE ManagerID = 42;

UPDATE NewTable
   SET Salary += 5000
 WHERE DepartmentID = 1;

  SELECT DepartmentID, AVG(Salary) AS AverageSalary 
    FROM NewTable
GROUP BY DepartmentID;

-- PROBLEM 15

SELECT E.DepartmentID, MAX(E.Salary) AS MaxSalary
FROM Employees AS E
GROUP BY E.DepartmentID
HAVING MAX(E.Salary) NOT BETWEEN 30000 AND 70000;

-- PROBLEM 16

SELECT COUNT(E.Salary) AS Count
FROM Employees AS E
WHERE E.ManagerID IS NULL

-- PROBLEM 17

 SELECT DISTINCT sal.DepartmentId, sal.Salary FROM
(SELECT e.DepartmentId, e.Salary, DENSE_RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
   FROM [dbo].[Employees] AS e) AS sal
  WHERE sal.SalaryRank = 3;

-- PROBLEM 18

SELECT TOP 10 e.[FirstName], e.[LastName], e.[DepartmentID]
  FROM [Employees] AS e,
       (SELECT [DepartmentID] AS avgSalaryOfDepartmentID,
               AVG([Salary]) AS avgSalaryOfDepartment
          FROM [Employees]
         GROUP BY [DepartmentID]) AS avgSalaryByDepartments
 WHERE e.[DepartmentID] = avgSalaryByDepartments.avgSalaryOfDepartmentID
   AND e.[Salary] > avgSalaryOfDepartment
 ORDER BY e.[DepartmentID];