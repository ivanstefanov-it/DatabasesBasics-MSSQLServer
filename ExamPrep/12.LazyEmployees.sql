SELECT DISTINCT e.Id, e.FirstName + ' ' + e.LastName AS FullName
		FROM Employees AS e
	JOIN Shifts AS s ON s.EmployeeId = e.Id
WHERE DATEDIFF(HOUR, s.CheckIn, s.CheckOut) < 4
ORDER BY e.Id
