USE AMMTescoProject
GO
    CREATE procedure dbo.spCreateCustomer (
        @addLine1 varchar(50),
        @addLine2 varchar(50),
        @addLine3 varchar(50),
        @townCity varchar(50),
        @postcode varchar(10),
        @eveningPhone varchar(11),
        @daytimePhone varchar(11),
        @mobile varchar(11),
        @fName varchar(50),
        @lName varchar(50),
        @email varchar(50),
        @description varchar(50)
    ) as begin;

declare @newId int
insert into
    dbo.tblCustomer(fName, lName, email, phoneNo)
values
    (@fName, @lName, @email, @mobile)
select
    @newId = scope_identity()
insert into
    dbo.tblAddress(
        addLine1,
        addLine2,
        addLine3,
        townCity,
        postcode,
        eveningPhone,
        daytimePhone,
        mobile,
        description,
        customerId,
        primaryAddress
    )
values
    (
        @addLine1,
        @addLine2,
        @addLine3,
        @townCity,
        @postcode,
        @eveningPhone,
        @daytimePhone,
        @mobile,
        @description,
        @newId,
        1
    )
insert into
    dbo.tblCustomerEmail(customerId, email)
values
    (@newId, @email)
insert into
    dbo.tblClubCard(customerId, creationDate)
values
    (@newId, getdate())
end;

-- new with address id
USE [AMMTescoProject]
GO
    /****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 13/11/2021 16:55:47 ******/
SET
    ANSI_NULLS ON
GO
SET
    QUOTED_IDENTIFIER ON
GO
    ALTER procedure [dbo].[spCreateCustomer] (
        @addLine1 varchar(50),
        @addLine2 varchar(50),
        @addLine3 varchar(50) = null,
        @townCity varchar(50),
        @postcode varchar(10),
        @eveningPhone varchar(11) = null,
        @daytimePhone varchar(11),
        @mobile varchar(11) = null,
        @fName varchar(50),
        @lName varchar(50),
        @email varchar(50),
        @description varchar(50)
    ) as begin;

declare @newAddressId int declare @newCustomerId int
insert into
    dbo.tblAddress(
        addLine1,
        addLine2,
        addLine3,
        townCity,
        postcode,
        eveningPhone,
        daytimePhone,
        mobile,
        description,
        primaryAddress
    )
values
    (
        @addLine1,
        @addLine2,
        @addLine3,
        @townCity,
        @postcode,
        @eveningPhone,
        @daytimePhone,
        @mobile,
        @description,
        1
    )
select
    @newAddressId = scope_identity()
insert into
    dbo.tblCustomer(fName, lName, email, phoneNo, addressid)
values
(@fName, @lName, @email, @daytimePhone, @newID)
select
    @newCustomerId = scope_identity()
insert into
    dbo.tblCustomerEmail(customerId, email)
values
(@newCustomerId, @email)
insert into
    dbo.tblClubCard(customerId, creationDate)
values
(@newCustomerId, getdate())
end;