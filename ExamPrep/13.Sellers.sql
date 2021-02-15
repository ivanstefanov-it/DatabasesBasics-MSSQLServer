SELECT TOP(10) e.FirstName + ' ' + e.LastName AS FullName,
	   SUM(i.Price * oi.Quantity) AS TotalSum,
	   SUM(oi.Quantity) AS [Count]
	FROM Employees AS e
	JOIN Orders AS o ON o.EmployeeId = e.Id
	JOIN OrderItems AS oi ON oi.OrderId = o.Id
	JOIN Items AS i ON i.Id = oi.ItemId
	WHERE o.DateTime < '2018-06-15'
GROUP BY e.FirstName, e.LastName
ORDER BY TotalSum DESC, Count DESC