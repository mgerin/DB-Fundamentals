CREATE DATABASE TableRelations;
GO
 
USE TableRelations;
GO
 
CREATE TABLE Passports
(
PassportID INT PRIMARY KEY,
PassportNumber VARCHAR(8)
);
 
CREATE TABLE Persons
(
PersonID INT PRIMARY KEY,
FirstName VARCHAR(50),
Salary FLOAT(2),
PassportID INT FOREIGN KEY REFERENCES Passports(PassportID)
);
 
INSERT INTO [Passports] (PassportID, PassportNumber)
VALUES (101, 'N34FG21B'), (102, 'K65LO4R7'), (103, 'ZE657QP2');
 
INSERT INTO [Persons] (PersonID, FirstName, Salary, PassportID)
VALUES (1, 'Roberto', 43300.00, 102),
       (2, 'Tom', 56100.00, 103),
       (3, 'Yana', 60200.00, 101);

-- Problem 02

CREATE TABLE Manufacturers
(
ManufacturerID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
EstablishedOn DATE NOT NULL
);
 
INSERT INTO Manufacturers (ManufacturerID, Name, EstablishedOn)
     VALUES (1, 'BMW', '1916-03-07'),
            (2, 'Tesla', '2003-01-01'),
            (3, 'Lada', '1966-05-01');
 
CREATE TABLE Models
(
ModelID INT PRiMARY KEY,
Name VARCHAR(50) NOT NULL,
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
);
 
INSERT INTO [Models] (ModelID, Name, ManufacturerID)
     VALUES (101, 'X1', 1),
            (102, 'i6', 1),
            (103, 'Model S', 2),
            (104, 'Model X', 2),
            (105, 'Model 3', 2),
            (106, 'Nova', 3);

--Problem 03

CREATE TABLE Students
(
StudentID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL
);
 
INSERT INTO [Students] (StudentID, Name)
     VALUES (1, 'Mila'),
            (2, 'Toni'),
            (3, 'Ron');
 
CREATE TABLE Exams
(
ExamID INT PRIMARY KEY,
Name VARCHAR(50)
);
 
INSERT INTO [Exams] (ExamID, Name)
     VALUES (101, 'Spring MVC'),
            (102, 'Neo4j'),
            (103, 'Oracle 11g');
 
CREATE TABLE StudentsExams
(
StudentID INT,
ExamID INT
CONSTRAINT PK_StudentID_ExamID PRIMARY KEY (StudentID, ExamID),
CONSTRAINT FK_StudentExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
CONSTRAINT FK_StudentExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);
 
INSERT INTO StudentsExams (StudentID, ExamID)
     VALUES (1, 101),
            (1, 102),
            (2, 101),
            (3, 103),
            (2, 102),
            (2, 103);

--Problem 04

CREATE TABLE Teachers
(
TeacherID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
);
 
INSERT INTO [Teachers] (TeacherID, Name)
VALUES (101, 'John');
 
INSERT INTO [Teachers]
VALUES (102, 'Maya', 106),
       (103, 'Silvia', 106),
       (104, 'Ted', 105),
       (105, 'Mark', 101),
       (106, 'Greta', 101);

--Problem 05

CREATE DATABASE OnlineStore;
GO

USE OnlineStore;
GO

CREATE TABLE Cities
(
CityID INT NOT NULL,
[Name] VARCHAR(50),
CONSTRAINT PK_Cities PRIMARY KEY CLUSTERED
(
    [CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

CREATE TABLE [dbo].[Customers](
    [CustomerID] [int] NOT NULL,
    [Name] [varchar](50) NULL,
    [Birthday] [date] NULL,
    [CityID] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
    [CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 
CREATE TABLE [dbo].[Items](
    [ItemID] [int] NOT NULL,
    [Name] [varchar](50) NULL,
    [ItemTypeID] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
    [ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 
CREATE TABLE [dbo].[ItemTypes](
    [ItemTypeID] [int] NOT NULL,
    [Name] [varchar](50) NULL,
 CONSTRAINT [PK_ItemTypes] PRIMARY KEY CLUSTERED 
(
    [ItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 
CREATE TABLE [dbo].[OrderItems](
    [OrderID] [int] NOT NULL,
    [ItemID] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
    [OrderID] ASC,
    [ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 
CREATE TABLE [dbo].[Orders](
    [OrderID] [int] NOT NULL,
    [CustomerID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
    [OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID]);
 
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Cities];
 
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_ItemTypes] FOREIGN KEY([ItemTypeID])
REFERENCES [dbo].[ItemTypes] ([ItemTypeID]);
 
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_ItemTypes];
 
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID]);
 
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Items];
 
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID]);
 
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders];
 
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID]);
 
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers];

--Problem 06

CREATE DATABASE SoftUniUniversity;
GO
 
USE SoftUniUniversity;
GO
 
CREATE TABLE Majors
(
MajorID INT PRIMARY KEY,
Name VARCHAR(50)
);
 
CREATE TABLE Students
(
StudentID INT PRIMARY KEY,
StudentNumber VARCHAR(12),
StudentName VARCHAR(50),
MajorID INT,
CONSTRAINT FK_Students_Majors FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
);
 
CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY,
PaymentDate DATE,
PaymentAmount DECIMAL(8,2),
StudentID INT,
CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
 
CREATE TABLE Subjects
(
SubjectID INT PRIMARY KEY,
SubjectName VARCHAR(50)
);
 
CREATE TABLE Agenda
(
StudentID INT,
SubjectID INT,
CONSTRAINT PK_StudentID_SubjectID PRIMARY KEY (StudentID, SubjectID),
CONSTRAINT FK_Agenda_Subjects_SubjectID FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
CONSTRAINT FK_Agenda_Students_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

--Problem 09

USE SoftUni;
GO

SELECT TOP(5) E.EmployeeID, E.JobTitle, E.AddressID, A.AddressText
  FROM Employees AS E
  INNER JOIN Addresses AS A
  ON E.AddressID = A.AddressID
 ORDER BY E.AddressID ASC;

--Problem 10

SELECT TOP(5) E.EmployeeID, E.FirstName, E.Salary, D.Name AS DepartmentName
  FROM Employees AS E
  INNER JOIN Departments AS D
  ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 15000
 ORDER BY E.DepartmentID ASC;

--Problem 11

  SELECT TOP(3) E.EmployeeID, E.FirstName 
    FROM Employees AS E
    LEFT JOIN EmployeesProjects AS EP
      ON E.EmployeeID = EP.EmployeeID
   WHERE EP.EmployeeID IS NULL
ORDER BY E.EmployeeID;

--Problem 12

  SELECT TOP(5) E.EmployeeID, E.FirstName, P.Name
    FROM Employees AS E
   INNER JOIN EmployeesProjects AS EP
      ON E.EmployeeID = EP.EmployeeID
   INNER JOIN Projects AS P
      ON EP.ProjectID = P.ProjectID
   WHERE P.StartDate > '2002-08-13'
     AND P.EndDate IS NULL
ORDER BY E.EmployeeID ASC;


--Problem 13

SELECT e.EmployeeID, e.FirstName, p.Name
  FROM Employees AS e
 INNER JOIN [EmployeesProjects] AS ep
    ON e.EmployeeID = ep.EmployeeID
  LEFT JOIN [Projects] AS p
    ON ep.ProjectID = p.ProjectID
   AND p.StartDate < '2005-01-01'
 WHERE e.EmployeeID = 24;

--Problem 14

  SELECT e.[EmployeeID], e.[FirstName], e.[ManagerID], m.[FirstName] AS 'ManagerName'
    FROM [Employees] AS e
   INNER JOIN [Employees] AS m
      ON e.ManagerID = m.EmployeeID
   WHERE e.ManagerID IN (3, 7)
ORDER BY [EmployeeID] ASC;

--Problem 15

USE Geography;
GO

  SELECT C.CountryCode, M.MountainRange, P.PeakName, P.Elevation 
    FROM Countries AS C
   INNER JOIN MountainsCountries AS MC
      ON C.CountryCode = MC.CountryCode
   INNER JOIN Mountains AS M
      ON MC.MountainId = M.Id
   INNER JOIN Peaks AS P
      ON MC.MountainId = P.MountainId
   WHERE C.CountryCode = 'BG'
     AND P.Elevation > '2835'
ORDER BY P.Elevation DESC;

--Problem 16

    SELECT DISTINCT c.[CountryCode], COUNT(m.[MountainRange]) AS 'MountainRanges'
      FROM [Countries] AS c
INNER JOIN [MountainsCountries] AS mc
        ON c.[CountryCode] = mc.[CountryCode]
INNER JOIN [Mountains] AS m
        ON mc.[MountainId] = m.[Id]
     WHERE c.[CountryCode] IN ('BG', 'US', 'RU')
  GROUP BY c.[CountryCode];

--Problem 17

   SELECT TOP 5 c.[CountryName], r.[RiverName]
     FROM [Countries] AS c
LEFT JOIN [CountriesRivers] AS cr
       ON c.[CountryCode] = cr.[CountryCode]
LEFT JOIN [Rivers] AS r
       ON cr.[RiverId] = r.[Id]
    WHERE c.[ContinentCode] = 'AF'
 ORDER BY c.[CountryName] ASC;

--Problem 18

  SELECT continents.[ContinentCode], 
         countries.[CurrencyCode], 
         COUNT(countries.[CountryCode]) AS 'CurrencyUsage'
    FROM [Continents] AS continents
    JOIN [Countries] AS countries
      ON continents.[ContinentCode] = countries.[ContinentCode]
GROUP BY continents.[ContinentCode], countries.[CurrencyCode]
  HAVING COUNT(countries.[CountryCode]) = (SELECT MAX(xxx.CurrencyXX) 
                                             FROM (SELECT cx.ContinentCode, 
                                                          ccx.CurrencyCode, 
                                                          COUNT(ccx.[CountryCode]) AS CurrencyXX
                                                     FROM Continents AS cx
                                                     JOIN Countries AS ccx
                                                       ON cx.[ContinentCode] = ccx.[ContinentCode]
                                                    WHERE continents.[ContinentCode] = cx.[ContinentCode] 
                                                 GROUP BY cx.[ContinentCode], ccx.[CurrencyCode]) AS xxx)
     AND COUNT(countries.[CountryCode]) > 1
ORDER BY continents.[ContinentCode];

--Problem 19

   SELECT COUNT(c.[CountryCode]) AS 'CountryCode'
     FROM [Countries] AS c
LEFT JOIN [MountainsCountries] AS mc
       ON c.[CountryCode] = mc.[CountryCode]
LEFT JOIN [Mountains] AS m
       ON mc.[MountainId] = m.[Id]
    WHERE m.MountainRange IS NULL;

--Problem 20

SELECT TOP 5 c.[CountryName], 
       MAX(p.[Elevation]) AS 'HighestPeakElevation',
       MAX(r.[Length]) AS 'LongestRiverLength'
  FROM [Countries] AS c
  LEFT JOIN [MountainsCountries] AS mc
    ON c.[CountryCode] = mc.[CountryCode]
  LEFT JOIN [Peaks] AS p
    ON mc.[MountainId] = p.[MountainId]
  LEFT JOIN [CountriesRivers] AS cr
    ON c.[CountryCode] = cr.[CountryCode]
  LEFT JOIN [Rivers] AS r
    ON cr.[RiverId] = r.[Id]
 GROUP BY c.[CountryName]
 ORDER BY [HighestPeakElevation] DESC, LongestRiverLength DESC, c.CountryName ASC;

--Problem 21

SELECT TOP 5 * FROM(SELECT c.CountryName,
                           p.PeakName,
                           p.Elevation,
                           m.MountainRange 
                      FROM [dbo].[Countries] AS c
                     INNER JOIN [dbo].[MountainsCountries] AS mc
                        ON c.CountryCode = mc.CountryCode
                     INNER JOIN [dbo].[Mountains] AS m
                        ON mc.MountainId = m.Id
                     INNER JOIN [dbo].[Peaks] AS p
                        ON p.MountainId = m.Id
                     INNER JOIN (SELECT c.CountryName,
                                        MAX(p.Elevation) AS MaxElevation
                                   FROM [dbo].[Countries] AS c
                                  INNER JOIN [dbo].[MountainsCountries] AS mc
                                     ON c.CountryCode = mc.CountryCode
                                  INNER JOIN [dbo].[Mountains] AS m
                                     ON mc.MountainId = m.Id
                                  INNER JOIN [dbo].[Peaks] AS p
                                     ON p.MountainId = m.Id
                                  GROUP BY c.CountryName) AS max_elevation
                        ON max_elevation.MaxElevation = p.Elevation
                       AND max_elevation.CountryName = c.CountryName
                     UNION ALL
                    SELECT c.CountryName,
                           '(no highest peak)' AS PeakName,
                           0 AS Elevation,
                           '(no mountain)' AS MountainRange
                      FROM [dbo].[Countries] AS c
                      LEFT JOIN [dbo].[MountainsCountries] AS mc
                        ON c.CountryCode = mc.CountryCode
                     WHERE mc.MountainId  IS NULL) AS results
 ORDER BY CountryName, PeakName