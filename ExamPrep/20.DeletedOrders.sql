CREATE TRIGGER tr_AfterDelete ON OrderItems FOR DELETE
AS
INSERT INTO DeletedOrders (ItemId, OrderId, ItemQuantity)
SELECT ItemId, OrderId, Quantity FROM deleted