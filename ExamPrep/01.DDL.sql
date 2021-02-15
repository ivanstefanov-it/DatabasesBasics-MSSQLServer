CREATE TABLE Categories
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL
)

CREATE TABLE Items
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	Price DECIMAL(15, 2) NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id)  NOT NULL 
)

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Phone CHAR(12) NOT NULL,
	Salary DECIMAL(15, 2) NOT NULL,
)

CREATE TABLE Orders
(
	Id INT PRIMARY KEY IDENTITY,
	[DateTime] DATETIME NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL
)

CREATE TABLE OrderItems
(
	OrderId INT FOREIGN KEY REFERENCES Orders(Id) NOT NULL,
	ItemId INT FOREIGN KEY REFERENCES Items(Id) NOT NULL,
	Quantity INT CHECK(Quantity >= 1) NOT NULL

	PRIMARY KEY(OrderId, ItemId)
)

CREATE TABLE Shifts
(
	Id INT IDENTITY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	CheckIn DATETIME NOT NULL,
	CheckOut DATETIME NOT NULL 

	PRIMARY KEY(Id, EmployeeId)
)

ALTER TABLE Shifts
ADD CONSTRAINT CH_CheckInCheckOut CHECK(CheckIn < CheckOut)