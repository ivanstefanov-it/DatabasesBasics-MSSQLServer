SELECT TOP(5) c.Id, c.Name, c.CountryCode, COUNT(a.Id) 
	FROM Cities AS c
	JOIN Accounts AS a ON a.CityId = c.Id
	GROUP BY c.Id, c.Name, c.CountryCode
	ORDER BY COUNT(a.Id) DESC