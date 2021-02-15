CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @AvailableRoom VARCHAR(MAX) = (SELECT TOP(1) CONCAT('Room ', r.Id, ': ', r.Type, ' (', r.Beds, ' beds) - $', (h.BaseRate + r.Price) * @People) 
	FROM Hotels AS h 
	JOIN Rooms AS r ON r.HotelId = h.Id
	JOIN Trips AS t ON t.RoomId = r.Id
	WHERE h.Id = @HotelId 
	AND @Date NOT BETWEEN t.ArrivalDate AND t.ReturnDate
	AND t.CancelDate IS NULL
	AND r.Beds > @People)
	
	IF (@AvailableRoom IS NULL)
	BEGIN
		RETURN 'No rooms available'
	END

	RETURN @AvailableRoom
END