use AMMTescoProject
GO

	CREATE procedure dbo.spBookDeliverySlot
	(
        @slotId int,
        @orderId int
	)
	as
	BEGIN;

    UPDATE dbo.tblOrder
	SET deliverySlotId = @slotId
    WHERE orderId = @orderId;
    

    UPDATE dbo.tblDeliverySlot
	SET slotStatus = 1
    WHERE slotId = @slotId;
    
	END;