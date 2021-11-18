use AMMTescoProject
GO

	CREATE procedure dbo.spAmendQuantity
	(
		@orderId int, 
		@productId int, 
		@quantity int, 
	)
	as
	BEGIN;
    IF(@quantity<=0)
    
    DELETE FROM dbo.tblOrderItem
    WHERE productId = @productId AND orderId = @orderId;

    ELSE

    UPDATE dbo.tblOrderItem
        SET quantity = @quantity
        WHERE productId = @productId AND orderId = @orderId;
	END;