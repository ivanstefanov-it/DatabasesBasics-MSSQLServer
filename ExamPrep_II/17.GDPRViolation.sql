SELECT t.Id,
	   FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS FullName,
	   ci.Name AS [From],
	   c.Name AS [To],
	   CASE
	   WHEN t.CancelDate IS NULL THEN CONCAT(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate), ' days')
	   ELSE 'Canceled'
	   END AS Duration
	FROM Trips AS t
	JOIN AccountsTrips AS at ON at.TripId = t.Id
	JOIN Accounts AS a ON a.Id = at.AccountId
	JOIN Cities AS ci ON ci.Id = a.CityId 
	JOIN Rooms AS r ON r.Id = t.RoomId
	JOIN Hotels AS h ON h.Id = r.HotelId
	JOIN Cities AS c ON c.Id = h.CityId
	ORDER BY FullName, t.Id