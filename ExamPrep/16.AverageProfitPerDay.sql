SELECT DATEPART(DAY, o.DateTime) AS DayOfMonth,
	   FORMAT(AVG(oi.Quantity * i.Price), 'N2') AS AveragePrice
	FROM Orders AS o
	JOIN OrderItems AS oi ON oi.OrderId = o.Id
	JOIN Items AS i ON i.Id = oi.ItemId
GROUP BY DATEPART(DAY, o.DateTime)
ORDER BY DayOfMonth 