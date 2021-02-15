SELECT TOP(10) c.Id,
	   c.Name, 
	   SUM(h.BaseRate + r.Price) AS [TotalRevenue],
	   COUNT(t.Id) AS TripCount
	FROM Cities AS c
	JOIN Hotels AS h ON h.CityId = c.Id
	JOIN Rooms AS r ON r.HotelId = h.Id
	JOIN Trips AS t ON t.RoomId = r.Id
	WHERE DATEPART(YEAR, t.BookDate)  = 2016
	GROUP BY c.Id, c.Name
	ORDER BY [TotalRevenue] DESC, TripCount DESC