CREATE PROC usp_GetHoldersWithBalanceHigherThan(@inputNumber DECIMAL(18, 4)) 
AS
	SELECT k.FirstName, k.LastName 
	FROM 
		(SELECT ah.Id, ah.FirstName, ah.LastName
		FROM AccountHolders AS ah
		JOIN Accounts AS a ON a.AccountHolderId = ah.Id
		GROUP BY ah.Id, ah.FirstName, ah.LastName
		HAVING SUM(a.Balance) > @inputNumber) AS k
		ORDER BY k.FirstName, k.LastName