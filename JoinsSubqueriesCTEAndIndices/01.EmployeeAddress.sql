SELECT TOP(5) EmployeeID, JobTitle, e.AddressID , AddressText
	FROM Employees AS e
	JOIN Addresses AS a ON a.AddressID = e.AddressID
	ORDER BY e.AddressID