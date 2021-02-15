CREATE TRIGGER tr_LogEmail ON Logs FOR INSERT 
AS
	DECLARE @accountID INT = (SELECT TOP(1) AccountId FROM inserted)
	DECLARE @oldSum DECIMAL(15, 2) = (SELECT TOP(1) OldSum FROM inserted)
	DECLARE @newSum DECIMAL(15, 2) = (SELECT TOP(1) NewSum FROM inserted)

	INSERT INTO NotificatonEmails (Recipient, Subject, Body) VALUES
	(
	@accountID,
	'Balance change for account: ' + @accountID,
	'On ' + GETDATE() +  'your balance was changed from ' + @oldSum + ' to ' + @newSum
	)

