SELECT FirstName + ' ' + LastName AS FullName, Phone
	FROM Employees 
	WHERE Phone LIKE '3%'
	ORDER BY FirstName, Phone