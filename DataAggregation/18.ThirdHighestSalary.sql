SELECT DISTINCT k.DepartmentID, k.Salary 
FROM 
(SELECT DepartmentID, Salary, DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
	FROM Employees) AS k
WHERE k.SalaryRank = 3