SELECT t.Id,
	   h.Name,
	   r.Type ,
	   CASE
	   WHEN t.CancelDate IS NULL THEN SUM(h.BaseRate + r.Price)
	   ELSE 0.0
	   END AS Revenue
	FROM Trips AS t
	JOIN AccountsTrips AS at ON at.TripId = t.Id
	JOIN Rooms AS r ON r.Id = t.RoomId
	JOIN Hotels AS h ON h.Id = r.HotelId
	GROUP BY t.Id, h.Name, r.Type , t.CancelDate
	ORDER BY r.Type, t.Id