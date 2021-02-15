SELECT c.Name, COUNT(h.Id) AS HotelCount
	FROM Cities AS c
	LEFT JOIN Hotels AS h ON h.CityId = c.Id
	GROUP BY c.Name
	ORDER BY HotelCount DESC, c.Name