CREATE FUNCTION udf_GetPromotedProducts(@CurrentDate DATETIME, @StartDate DATETIME, @EndDate DATETIME, @Discount DECIMAL(15, 2), @FirstItemId INT, @SecondItemId INT, @ThirdItemId INT)
RETURNS VARCHAR(MAX)
BEGIN
	DECLARE @FirstItem VARCHAR(50) = (SELECT [Name] FROM Items WHERE Id = @FirstItemId)
	DECLARE @SecondItem VARCHAR(50) = (SELECT [Name] FROM Items WHERE Id = @SecondItemId)
	DECLARE @ThirdItem VARCHAR(50) = (SELECT [Name] FROM Items WHERE Id = @ThirdItemId)

	IF(@FirstItem IS NULL OR @SecondItem IS NULL OR @ThirdItem IS NULL)
	BEGIN
		RETURN 'One of the items does not exists!'
	END

	IF(@CurrentDate NOT BETWEEN @StartDate AND @EndDate) 
	BEGIN 
		RETURN 'The current date is not within the promotion dates!' 
	END

	DECLARE @firstItemPrice DECIMAL(15, 2) = (SELECT Price FROM Items WHERE Id = @FirstItemId)
	DECLARE @secondItemPrice DECIMAL(15, 2) = (SELECT Price FROM Items WHERE Id = @SecondItemId)
	DECLARE @thirdItemPrice DECIMAL(15, 2) = (SELECT Price FROM Items WHERE Id = @ThirdItemId)

	SET @firstItemPrice = @firstItemPrice - (@firstItemPrice * (@Discount / 100))
	SET @secondItemPrice = @secondItemPrice - (@secondItemPrice * (@Discount / 100))
	SET @thirdItemPrice = @thirdItemPrice - (@thirdItemPrice * (@Discount / 100))
	
	RETURN @FirstItem + ' price: ' + CAST(@firstItemPrice AS varchar(10)) + ' <-> ' + 
		   @SecondItem + ' price: ' + CAST(@secondItemPrice AS varchar(10)) + ' <-> ' + 
		   @ThirdItem + ' price: ' + CAST(@thirdItemPrice AS varchar(10)) 
END

SELECT dbo.udf_GetPromotedProducts('2018-08-02', '2018-08-01', '2018-08-03',13, 3,4,5)