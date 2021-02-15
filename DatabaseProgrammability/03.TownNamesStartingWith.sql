CREATE PROCEDURE usp_GetTownsStartingWith (@TownStartsWith VARCHAR(20))
AS
BEGIN
	SELECT [Name] FROM Towns AS Town
	WHERE [Name] LIKE @TownStartsWith + '%'
END
