CREATE TRIGGER tr_InsertAccountInfo ON Accounts FOR UPDATE
AS
DECLARE @newSum DECIMAL(15, 2) = (SELECT Balance FROM inserted)
DECLARE @oldSum DECIMAL(15, 2) = (SELECT Balance FROM deleted)
DECLARE @accountID INT = (SELECT Id FROM inserted)


INSERT INTO Logs(AccountID, NewSum, OldSum) VALUES
(@accountID, @newSum, @oldSum)