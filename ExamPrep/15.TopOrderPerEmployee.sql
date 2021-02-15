SELECT k.FullName, 
	   DATEDIFF(HOUR, s.CheckIn, s.CheckOut) AS WorkHours,
	   k.TotalSum 
FROM (
	SELECT o.Id,
		   e.Id AS EmployeeId,
		   o.DateTime,
		   e.FirstName + ' ' + e.LastName AS FullName,
		   SUM(oi.Quantity  * i.Price) AS TotalSum,
		   ROW_NUMBER() OVER (PARTITION BY e.Id ORDER BY SUM(oi.Quantity  * i.Price) DESC)	AS RowNumber
		FROM Employees AS e
		JOIN Orders AS o ON o.EmployeeId = e.Id
		JOIN OrderItems AS oi ON oi.OrderId = o.Id
		JOIN Items AS i ON i.Id = oi.ItemId
	GROUP BY o.Id, e.FirstName, e.LastName, e.Id, o.DateTime) AS k
	JOIN Shifts AS s ON s.EmployeeId = k.EmployeeId
WHERE k.RowNumber = 1 AND k.DateTime BETWEEN s.CheckIn AND s.CheckOut
ORDER BY k.FullName, WorkHours DESC, k.TotalSum DESC
