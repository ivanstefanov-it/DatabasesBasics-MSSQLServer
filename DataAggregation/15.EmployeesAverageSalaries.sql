SELECT * INTO NewTable
	FROM Employees
	WHERE Salary > 30000

DELETE FROM NewTable	
	WHERE ManagerID = 42

UPDATE NewTable 
	SET Salary += 5000
	WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AgerageSalary
	FROM NewTable
	GROUP BY DepartmentID