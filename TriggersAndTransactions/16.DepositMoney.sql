CREATE PROC usp_DepositMoney (@accountId INT, @moneyAmount DECIMAL(15, 4))
AS
BEGIN TRANSACTION

DECLARE @account INT = (SELECT Id FROM Accounts WHERE Id = @accountId)

IF(@account IS NULL)
BEGIN 
	ROLLBACK
	RAISERROR('Invalid Account ID!!!', 16, 1)
	RETURN
END

IF(@moneyAmount < 0)
BEGIN 
	ROLLBACK
	RAISERROR('Negative balance', 16, 1)
	RETURN
END

UPDATE Accounts
SET Balance += @moneyAmount
WHERE Id = @accountId
COMMIT