CREATE PROC usp_AssignProject(@emloyeeID INT, @projectID INT)
AS
BEGIN TRANSACTION
DECLARE @employee INT = (SELECT EmployeeID FROM Employees WHERE EmployeeID = @emloyeeID)
DECLARE @project INT = (SELECT ProjectID FROM Projects WHERE ProjectID = @projectID)

IF(@employee IS NULL OR @project IS NULL)
BEGIN
	ROLLBACK
	RAISERROR('Invalid employee id or project id', 16, 1)
	RETURN
END

DECLARE @employeeProjects INT = (SELECT COUNT(*) FROM EmployeesProjects WHERE EmployeeID = @emloyeeID)

IF(@employeeProjects >= 3)
BEGIN
	ROLLBACK
	RAISERROR('The employee has too many projects!', 16, 2)
	RETURN
END

INSERT INTO EmployeesProjects (EmployeeID, ProjectID) VALUES
	(@emloyeeID, @projectID)
COMMIT