SELECT c.CountryCode, COUNT(mc.CountryCode) AS MountainRanges
	FROM Countries AS c
	JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
	WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria')
	GROUP BY c.CountryCode
