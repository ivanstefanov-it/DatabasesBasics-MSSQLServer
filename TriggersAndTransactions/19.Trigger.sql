CREATE TRIGGER tr_RestrictItems ON UserGameItems INSTEAD OF INSERT
AS
	DECLARE @itemID INT = (SELECT ItemId FROM inserted)
	DECLARE @userGameID INT = (SELECT UserGameId FROM inserted)

	DECLARE @itemLevel INT = (SELECT MinLevel FROM Items WHERE Id = @itemID)
	DECLARE @userGameLevel INT = (SELECT [Level] FROM UsersGames WHERE Id = @userGameID)

	IF (@userGameLevel >= @itemLevel)
	BEGIN 
		INSERT INTO UserGameItems(ItemId, UserGameId) VALUES
		(@itemID, @userGameID)
	END

SELECT * FROM Users AS u
	JOIN UsersGames AS ug ON ug.UserId = u.Id
	JOIN Games AS g ON g.Id = ug.GameId
	WHERE g.Name = 'Bali' AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')

UPDATE UsersGames
SET Cash += 50000
WHERE GameId = (SELECT Id FROM Games WHERE Name = 'Bali') AND
	  UserId IN (SELECT Id FROM Users WHERE Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'))

CREATE PROC usp_BuyItem (@userID INT, @itemID INT, @gameID INT)
AS
BEGIN TRANSACTION
DECLARE @user INT = (SELECT Id FROM Users WHERE Id = @userID)
DECLARE @item INT = (SELECT Id FROM Items WHERE Id = @itemID)

IF(@user IS NULL OR @item IS NULL)
BEGIN 
	ROLLBACK
	RAISERROR('Invalid user or item id!', 16, 1)
	RETURN
END

DECLARE @userCash DECIMAL(15, 2) = (SELECT Cash FROM UsersGames WHERE UserId = @userID
AND GameId = @gameID)
DECLARE @itemPrice DECIMAL(15, 2) = (SELECT Price FROM Items WHERE Id = @itemID)

IF(@userCash - @itemPrice < 0)
BEGIN
	ROLLBACK
	RAISERROR('Insufficient funds!', 16, 2)
	RETURN
END

UPDATE UsersGames
SET Cash -= @itemPrice
WHERE UserId = @userID AND GameId = @gameID

DECLARE @userGameID DECIMAL(15, 2) = (SELECT Id FROM UsersGames WHERE UserId = @userID
AND GameId = @gameID)

INSERT INTO UserGameItems (ItemId, UserGameId) VALUES
	(@itemID, @userGameID)

COMMIT
GO
DECLARE @itemId INT = 251

WHILE(@itemId <= 299)
BEGIN
	EXEC usp_BuyItem 22, @itemId, 212
	EXEC usp_BuyItem 37, @itemId, 212
	EXEC usp_BuyItem 52, @itemId, 212
	EXEC usp_BuyItem 61, @itemId, 212
	SET @itemId += 1
END

DECLARE @counter INT = 501

WHILE(@counter <= 539)
BEGIN
	EXEC usp_BuyItem 22, @counter, 212
	EXEC usp_BuyItem 37, @counter, 212
	EXEC usp_BuyItem 52, @counter, 212
	EXEC usp_BuyItem 61, @counter, 212
	SET @counter += 1
END