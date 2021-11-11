USE [AMMTescoProject];
GO
CREATE procedure dbo.spCreateOrder
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