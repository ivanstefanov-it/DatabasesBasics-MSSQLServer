CREATE PROCEDURE usp_GetEmployeesFromTown(@TownName VARCHAR(50))
AS
BEGIN
	SELECT FirstName, LastName 
	FROM Employees AS e
	INNER JOIN Addresses AS a
	ON e.AddressID = a.AddressID
	INNER JOIN Towns AS t
	ON a.TownID = t.TownID
	WHERE t.[Name] = @TownName
END