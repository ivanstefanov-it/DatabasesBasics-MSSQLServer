CREATE PROC usp_CancelOrder(@OrderId INT, @CancelDate DATETIME)
AS
	DECLARE @targetOrder INT = (SELECT Id FROM Orders WHERE Id = @OrderId)

	IF(@targetOrder IS NULL)
	BEGIN
		RAISERROR('The order does not exist!', 16, 1)
		RETURN
	END

	DECLARE @orderDateTime DATETIME = (SELECT [DateTime] FROM Orders WHERE Id = @OrderId)

	IF(DATEDIFF(DAY, @orderDateTime, @CancelDate) > 3)
	BEGIN
		RAISERROR('You cannot cancel the order!', 16, 2)
		RETURN
	END

	DELETE FROM OrderItems 
	WHERE OrderId = @OrderId

	DELETE FROM Orders 
	WHERE Id = @OrderId