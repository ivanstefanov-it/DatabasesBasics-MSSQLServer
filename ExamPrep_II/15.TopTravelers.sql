SELECT k.Id, k.Email, k.CountryCode, k.Trips
	FROM (SELECT a.Id,
	   a.Email,
	   c.CountryCode,
	   COUNT(t.Id) AS Trips,
	   DENSE_RANK() OVER (PARTITION BY c.CountryCode ORDER BY COUNT(t.Id) DESC, a.Id) AS TripsRank
	FROM Accounts AS a
	JOIN AccountsTrips AS at ON at.AccountId = a.Id
	JOIN Trips AS t ON t.Id = at.TripId
	JOIN Rooms AS r ON r.Id = t.RoomId
	JOIN Hotels AS h ON h.Id = r.HotelId
	JOIN Cities AS c ON c.Id = h.CityId
	GROUP BY a.Id, a.Email, c.CountryCode) AS k 
	WHERE k.TripsRank = 1
	ORDER BY k.Trips DESC, k.Id