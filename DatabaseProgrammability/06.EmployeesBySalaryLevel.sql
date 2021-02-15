CREATE PROCEDURE usp_EmployeesBySalaryLevel (@salary CHAR(10))
AS
BEGIN 
	SELECT FirstName, LastName 
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @salary
END