use AMMTescoProject
GO

	CREATE procedure dbo.spAddItem
	(
		@orderId int, 
		@productId int, 
		@quantity int, 
		@price int
	)
	as
	BEGIN;

	INSERT INTO dbo.tblOrderItem(orderId,productId,quantity,price)
		VALUES(@orderId,@productId,@quantity,@price)

	END;