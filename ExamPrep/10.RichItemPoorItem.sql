SELECT TOP(10) o.Id, 
	   MAX(i.Price) AS ExpensivePrice,
	   MIN(i.Price) AS CheapPrice
	FROM Orders AS o
	JOIN OrderItems AS oi ON oi.OrderId = o.Id
	JOIN Items AS i ON i.Id = oi.ItemId
	GROUP BY o.Id
	ORDER BY ExpensivePrice DESC, Id