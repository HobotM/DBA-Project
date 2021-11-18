USE [AMMTescoProject];
GO

if exists(select 1 from sys.procedures where [name] = 'dbo.spCreateOrder')
begin;
    drop procedure dbo.spCreateOrder;
end;

GO

CREATE procedure dbo.spCreateOrder
(
    @customerId int,
    @addressId int, 
    @pickupSlotId int = null,
    @deliverySlotId int = null,
    @creationDate smalldatetime = default, 
    @modifiedDate smalldatetime = default,
    @grandTotal float, 
    @itemCount int, 
    @fulfilmentInstructions varchar(100) = null
)
as
BEGIN;
declare @newId int,
@todayDate as date
set @todayDate = getDate()

insert into
    dbo.tblOrder(
        customerId,
        addressId,
        pickupSlotId,
        deliverySlotId,
        creationDate,
        modifiedDate,
        grandTotal,
        itemCount,
        pointsEarned,
        fulfilmentInstructions
        )
values(
    @customerId,
    @addressId,
    @pickupSlotId,
    @deliverySlotId,
    @todayDate,
    @todayDate,
    @grandTotal,
    @itemCount,
    @pointsEarned,
    @fulfilmentInstructions
    )

END;