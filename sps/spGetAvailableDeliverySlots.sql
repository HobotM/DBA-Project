use AMMTescoProject
GO

	CREATE procedure dbo.spGetAvailableDeliverySlots
	(
		@storeId int
	)
	as
	BEGIN;

	SELECT  s.name as 'Store Name',d.slotDateTime as 'Delivery Slot', d.cost as 'Delivery Cost'
	FROM dbo.tblStore s INNER JOIN dbo.tblDeliverySlot d ON s.storeId = d.storeId
	WHERE slotStatus = 0 AND s.storeId = @storeId;


	END;