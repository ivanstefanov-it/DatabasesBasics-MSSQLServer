CREATE FUNCTION ufn_CashInUsersGames(@gameName VARCHAR(MAX))
RETURNS TABLE
	RETURN( SELECT SUM(k.Cash) AS TotalCash
		FROM
			(SELECT g.[Name], ug.Cash,
			ROW_NUMBER() OVER(ORDER BY Cash DESC) AS RowNumber
			FROM Games AS g
			JOIN UsersGames AS ug ON ug.GameId = g.Id
			WHERE g.[Name] = @gameName) AS k
		WHERE k.RowNumber % 2 = 1)