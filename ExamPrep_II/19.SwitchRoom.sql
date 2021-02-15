CREATE PROC usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
BEGIN
	DECLARE @HotelTrip INT = (SELECT TOP(1) r.HotelId FROM Trips AS t
	JOIN Rooms AS r ON r.Id = t.RoomId
	WHERE t.Id = @TripId)

	DECLARE @TargetRoomHotelId INT = (SELECT TOP(1) r.HotelId FROM Rooms AS r
	WHERE r.Id = @TargetRoomId)

	IF(@HotelTrip <> @TargetRoomHotelId)
	BEGIN 
		RAISERROR('Target room is in another hotel!', 16, 1)
		RETURN
	END

	DECLARE @TripAccountBeds INT = (SELECT COUNT(*) FROM AccountsTrips WHERE TripId = @TripId)
	
	IF(@TripAccountBeds > (SELECT r.Beds FROM Rooms AS r WHERE r.Id = @TargetRoomId))
	BEGIN
		RAISERROR('Not enough beds in target room!', 16, 2)
		RETURN
	END

	UPDATE Trips 
	SET RoomId = @TargetRoomId
	WHERE Id = @TripId
END
