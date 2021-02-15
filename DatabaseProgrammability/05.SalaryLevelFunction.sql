CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS CHAR(30)
AS
BEGIN 
	DECLARE @salaryLevel CHAR(10)

	IF(@salary < 300000)
		SET @salaryLevel = 'Low'
	ELSE IF(@salary >= 30000 and @salary <= 50000)
		SET @salaryLevel = 'Average'
	ELSE
		SET @salaryLevel = 'High'

	RETURN @salaryLevel
END