CREATE TABLE DepositTypes
(
DepositTypeID INT PRIMARY KEY,
[Name] NVARCHAR(20)
);

CREATE TABLE Deposits
(
DepositID INT PRIMARY KEY IDENTITY,
Amount DECIMAL(10, 2),
StartDate DATE,
EndDate DATE,
DepositTypeID INT,
CustomerID INT
CONSTRAINT FK_Deposits_DepositType FOREIGN KEY (DepositTypeID)
REFERENCES DepositTypes (DepositTypeID),
CONSTRAINT FK_Deposits_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers (CustomerID)
);

CREATE TABLE EmployeesDeposits
(
EmployeeID INT,
DepositID INT,
CONSTRAINT PK_EmployeesDeposits PRIMARY KEY(EmployeeID, DepositID),
CONSTRAINT FK_EmployeesDeposits_Employees FOREIGN KEY(EmployeeID)
REFERENCES Employees(EmployeeID),
CONSTRAINT FK_EmployeesDeposits_Deposits FOREIGN KEY(DepositID)
REFERENCES Deposits(DepositID)
);

CREATE TABLE CreditHistory
(
CreditHistoryID INT PRIMARY KEY,
Mark NVARCHAR(1),
StartDate DATE,
EndDate DATE,
CustomerID INT,
CONSTRAINT FK_CreditHistory_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments
(
PaymentsID INT PRIMARY KEY,
[Date] DATE,
Amount DECIMAL(10, 2),
LoanID INT,
CONSTRAINT FK_Payments_Loans FOREIGN KEY(LoanID)
REFERENCES Loans(LoanID)
);

CREATE TABLE Users
(
UserID INT PRIMARY KEY,
UserName NVARCHAR(20),
[Password] NVARCHAR(20),
CustomerID INT UNIQUE,
CONSTRAINT FK_Users_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID)
);