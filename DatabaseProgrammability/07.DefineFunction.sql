CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
BEGIN
	DECLARE @count INT = 1
	
	WHILE (@count <= LEN(@word))
	BEGIN 
		DECLARE @currentLetter CHAR(1) = SUBSTRING(@word, @count, 1)
		DECLARE @charIndex INT = CHARINDEX(@currentLetter, @setOfLetters)
	
		IF(@charIndex = 0)
		BEGIN
			RETURN 0
		END
	
		SET @count += 1
	END
		RETURN 1
END