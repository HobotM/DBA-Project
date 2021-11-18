use AMMTescoProject
GO

	CREATE procedure dbo.spGetAvailablePickupSlots
	(
		@storeId int
	)
	as
	BEGIN;

	SELECT  s.name as 'Store Name',p.slotDateTime as 'Collection Slot', p.cost as 'Collection Cost'
	FROM dbo.tblStore s INNER JOIN dbo.tblPickupSlot p ON s.storeId = p.storeId
	WHERE slotStatus = 0 AND s.storeId = @storeId;


	END;