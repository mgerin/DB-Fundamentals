--PROBLEM 1

CREATE DATABASE Minions;

--PROBLEM 2

CREATE TABLE Minions
(
Id INT NOT NULL PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Age INT
);

CREATE TABLE Towns
(
Id INT NOT NULL PRIMARY KEY,
Name NVARCHAR(50) NOT NULL
);

--PROBLEM 3

ALTER TABLE Minions
ADD TownId INT NOT NULL;

ALTER TABLE Minions
ADD CONSTRAINT Minions_TownId_FK FOREIGN KEY (TownId) REFERENCES Towns (Id);

--PROBLEM 4

INSERT INTO Towns VALUES (1, 'Sofia');

INSERT INTO Towns VALUES (2, 'Plovdiv'), (3, 'Varna');

INSERT INTO Minions VALUES (1, 'Kevin', 22, 1), (2, 'Bob', 15, 3), (3, 'Steward', NULL, 2);

--PROBLEM 5

TRUNCATE TABLE Minions;

--PROBLEM 6

DROP TABLE Minions, Towns;

--PROBLEM 7

CREATE TABLE People
(
Id INT NOT NULL PRIMARY KEY IDENTITY,
Name NVARCHAR(200) NOT NULL,
Picture VARBINARY(max) NULL,
Height FLOAT(2) NULL,
Weight FLOAT(2) NULL,
Gender CHAR(1) NOT NULL CHECK (Gender = 'm' OR Gender = 'f'),
Birthdate DATE NOT NULL,
Biography NVARCHAR(max) NULL
);

INSERT INTO People(Name, Picture, Height, Weight, Gender, Birthdate, Biography) VALUES ('IVAN', NULL, 1.60, 90.00, 'm', '1988-04-25', 'BIOGRAPHY'),
('Lora', NULL, 1.55, 61.25, 'f', '1995-04-25', 'BIOGRAPHY of Lora'), ('Stamat', NULL, 1.95, 101.25, 'm', '1990-03-15', 'BIOGRAPHY of Stamat'),
('Lyubo', NULL, 1.82, 85.25, 'm', '1992-06-04', 'BIOGRAPHY of Lyubo'), ('Katya', NULL, 1.65, 65.25, 'f', '1994-04-25', 'BIOGRAPHY of Lora');

--PROBLEM 8

CREATE TABLE Users
(
Id INT NOT NULL PRIMARY KEY IDENTITY,
Username VARCHAR(30) UNIQUE NOT NULL,
Password VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(max) NULL,
LastLoginTime DATETIME,
IsDeleted BIT
);

INSERT INTO Users VALUES ('mgerin', '2131321432423', NULL, '2016-10-02', 'false'),
('ghfhgh', '213132143242hhj', NULL, '2016-10-02', 'false'),
('jjhjjjuuii', '2131321432423', NULL, '2016-10-02', 'true'),
('hhhghj', '21314455', NULL, '2016-10-02', 'false'),
('DFSPDFSFDSFSFDSFSDS', '2131321432423', NULL, '2016-10-02', 'false');

--PROBLEM 9

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07F77747D8;

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id, Username);

--PROBLEM 10

ALTER TABLE Users
ADD CONSTRAINT CK_Users_Password CHECK (LEN(Password) >= 5);

--PROBLEM 11

ALTER TABLE Users
ADD CONSTRAINT DF_Users DEFAULT GETDATE() FOR LastLoginTime;

--PROBLEM 12

ALTER TABLE Users
DROP CONSTRAINT PK_Users;

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id);

ALTER TABLE Users
ADD CONSTRAINT DF_Users_Username CHECK (LEN(Username) >= 3);

--PROBLEM 13

CREATE DATABASE Movies;

USE Movies
GO

CREATE TABLE Directors
(
Id INT NOT NULL PRIMARY KEY,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(max) NULL
);

CREATE TABLE Genres
(
Id INT NOT NULL PRIMARY KEY,
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(max) NULL
);

CREATE TABLE Categories
(
Id INT NOT NULL PRIMARY KEY,
CategoryName NVARCHAR(150) NOT NULL,
Notes NVARCHAR(max) NULL
);

CREATE TABLE Movies
(
Id INT NOT NULL PRIMARY KEY,
Title NVARCHAR(250) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear INT NOT NULL,
Length INT NULL,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating INT NULL,
Notes NVARCHAR(max) NULL
);

INSERT INTO Directors
VALUES (1, 'SHARO', 'NOTES'),
(2, 'LUCKY', 'NOTES 2'),
(3, 'STRAHIL', NULL),
(4, 'JOHNY', 'NOTES 4'),
(5, 'LORENZO', 'NOTES 5');

INSERT INTO Genres
VALUES (1, 'ACTION', 'NOTES'),
(2, 'COMEDY', 'HAHAHA'),
(3, 'ROMANTIC', NULL),
(4, 'THRILLER', NULL),
(5, 'DRAMA', 'NOTES 5');

INSERT INTO Categories
VALUES (1, 'A', 'FOR ALL PEOPLE'),
(2, 'B', 'HAHAHA'),
(3, 'C', NULL),
(4, 'D', NULL),
(5, 'E', 'NOTES 5');

INSERT INTO Movies
VALUES (1, 'FILM ONE', 2, 2016, 120, 1, 3, NULL, 'NOTES'),
(2, 'FILM TWO', 1, 2010, 88, 2, 2, 6, 'NOTES'),
(3, 'FILM THREE', 3, 2016, 120, 1, 4, 10, 'NOTES'),
(4, 'FILM FOUR', 4, 2014, 120, 5, 1, NULL, 'NOTES'),
(5, 'FILM FIVE', 2, 2013, 100, 4, 5, 6, 'NOTES');

--PROBLEM 14

CREATE DATABASE CarRental;

USE CarRental
GO

CREATE TABLE Categories
(
Id INT NOT NULL PRIMARY KEY,
Category NVARCHAR(50) NOT NULL UNIQUE,
DailyRate FLOAT(1) NOT NULL,
WeeklyRate FLOAT(1) NOT NULL,
MonthlyRate FLOAT(1) NOT NULL,
WeekendRate FLOAT(1) NOT NULL
)

CREATE TABLE Cars
(
Id INT NOT NULL PRIMARY KEY,
PlateNumber NVARCHAR(15) NOT NULL,
Make NVARCHAR(30) NOT NULL,
Model NVARCHAR(30) NOT NULL,
CarYear INT NOT NULL,
CategoryId INT,
Doors INT,
Picture VARBINARY(max),
Condition NVARCHAR(50),
Available BIT
)

CREATE TABLE Employees
(
Id INT NOT NULL PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50),
Notes NVARCHAR(max)
)

CREATE TABLE Customers
(
Id INT NOT NULL PRIMARY KEY,
DriverLicenceNumber NVARCHAR(20) NOT NULL,
FullName NVARCHAR(150) NOT NULL,
Address NVARCHAR(150) NOT NULL,
City NVARCHAR(50) NOT NULL,
ZIPCode NVARCHAR(10),
Notes NVARCHAR(max)
)

CREATE TABLE RentalOrders
(
Id INT NOT NULL PRIMARY KEY,
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
CarCondition NVARCHAR(50),
TankLevel INT NOT NULL,
KilometrageStart FLOAT(1) NOT NULL,
KilometrageEnd FLOAT(1) NOT NULL,
TotalKilometrage FLOAT(1) NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays INT NOT NULL,
RateApplied FLOAT(1) NOT NULL,
TaxRate FLOAT(1) NOT NULL,
OrderStatus NVARCHAR(30) NOT NULL,
Notes NVARCHAR(max)
)

INSERT INTO Categories VALUES(1, 'Category 1', 13.55, 60, 220.5, 35),
(2, 'Category 2', 20.55, 70, 250.5, 50),
(3, 'Category 3', 25.55, 80, 320.5, 65);

INSERT INTO Cars VALUES (1, 'CA4223XP', 'BMW', '320d', 2001, 1, 4, NULL, 'GOOD', 'TRUE'),
(2, 'CB2223XP', 'OPEL', 'VECTRA', 2005, 2, 5, NULL, 'GOOD', 'TRUE'),
(3, 'PA4265AP', 'VW', 'PASSAT', 2010, 3, 4, NULL, 'PERFECT', 'TRUE');

INSERT INTO Employees VALUES (1, 'IVAN', 'IVANOV', 'JOHNY', 'NOTES'),
(2, 'STAMAT', 'PETROV', 'SP', 'NOTES SP'),
(3, 'KOSTADIN', 'IVANOV', 'KOKI', NULL);

INSERT INTO Customers VALUES (1, '34234234SFSD', 'BOBI B', 'RICCARDO VACCARINI', 'SOFIA', '1404', 'Notes'),
(2, '34SSDASAS234234SFSD', 'MANO', 'ANGEL KANCHEV', 'SOFIA', '1404', 'Notes'),
(3, '34234234SDADASDFSD', 'GESHEV', 'GOCE DELCHEV', 'SOFIA', '1000', NULL);

INSERT INTO RentalOrders VALUES (1, 2, 1, 3, 'GOOD', 23, 140440, 140640, 200,
 '2016-09-08', '2016-09-08', 1, 13.55, 20, 'CONFIRMED', 'Notes'),
 (2, 2, 1, 3, 'GOOD', 23, 140440, 140640, 200,
 '2016-09-08', '2016-09-08', 1, 13.55, 20, 'CONFIRMED', 'Notes'),
 (3, 2, 1, 3, 'GOOD', 23, 140440, 140640, 200,
 '2016-09-08', '2016-09-08', 1, 13.55, 20, 'CONFIRMED', 'Notes');

 --PROBLEM 15

 CREATE DATABASE Hotel;
 
 USE Hotel
 GO

 CREATE TABLE Employees
 (
 Id,
 FirstName,
 LastName,
 Title,
 Notes
 );

 CREATE TABLE Customers
 (
 AccountNumber,
 FirstName,
 LastName, 
 PhoneNumber, 
 EmergencyName, 
 EmergencyNumber, 
 Notes
 );

 CREATE TABLE RoomStatus
 (
 RoomStatus, 
 Notes
 );

 CREATE TABLE RoomTypes
 (
 RoomType, 
 Notes
 );

 CREATE TABLE BedTypes
 (
 BedType, 
 Notes
 );

 CREATE TABLE Rooms
 (
 RoomNumber, 
 RoomType,
 BedType, 
 Rate, 
 RoomStatus, 
 Notes
 );

 CREATE TABLE Payments
 (
 Id, 
 EmployeeId, 
 PaymentDate, 
 AccountNumber, 
 FirstDateOccupied, 
 LastDateOccupied, 
 TotalDays, 
 AmountCharged, 
 TaxRate, 
 TaxAmount, 
 PaymentTotal, 
 Notes
 );

 CREATE TABLE Occupancies
 (
 Id, 
 EmployeeId, 
 DateOccupied, 
 AccountNumber, 
 RoomNumber, 
 RateApplied, 
 PhoneCharge, 
 Notes
 );
