SELECT TripId,
	   SUM(Luggage),
	   CASE
	   WHEN SUM(Luggage) > 5 THEN CONCAT('$', SUM(Luggage) * 5)
	   ELSE '$0'
	   END AS Fee 
	FROM AccountsTrips
	GROUP BY TripId
	HAVING SUM(Luggage) > 0
	ORDER BY SUM(Luggage) DESC
