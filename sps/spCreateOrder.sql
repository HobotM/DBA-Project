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
    @pickupSlot int, 
    @deliverySlot int, 
    @creationDate smalldatetime, 
    @modifiedDate smalldatetime,
    @grandTotal float, 
    @itemCount int, 
    @pointsEarned int, 
    @fulfilmentInstructions varchar(100)
)
as
BEGIN;
declare @newId int




END;