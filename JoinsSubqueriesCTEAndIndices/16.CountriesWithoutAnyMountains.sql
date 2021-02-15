SELECT COUNT(c.CountryCode) AS country_count 
	FROM countries AS c
	LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	WHERE mc.MountainId IS NULL;