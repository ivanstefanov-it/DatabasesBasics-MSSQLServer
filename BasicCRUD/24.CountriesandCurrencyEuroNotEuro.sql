SELECT  CountryName, CountryCode,
	CASE WHEN CurrencyCode = 'EUR' THEN 'Euro'
	ELSE 'Not Euro'
	END AS [CurrencyCode]
	FROM Countries
ORDER BY CountryName