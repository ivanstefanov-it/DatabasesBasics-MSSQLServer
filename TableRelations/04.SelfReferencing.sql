CREATE TABLE Teachers
(
	TeacherID INT PRIMARY KEY IDENTITY (101, 1) NOT NULL,
	[Name] VARCHAR(30)NOT NULL,
	ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID) NOT NULL,
)
