USE [AMMTescoProject]
GO
    /****** Object:  StoredProcedure [dbo].[spCreateStaff]    Script Date: 13/11/2021 15:00:25 ******/
SET
    ANSI_NULLS ON
GO
SET
    QUOTED_IDENTIFIER ON
GO
    ALTER PROCEDURE [dbo].[spCreateStaff] (
        @fName varchar(50),
        @lName varchar(50),
        @gender nchar(2),
        @dob datetime,
        @salary int,
        @email varchar(50),
        @NIN varchar(9),
        @title varchar(50),
        @addLine1 varchar(50),
        @addLine2 varchar(50),
        @addLine3 varchar(50) = NULL,
        @townCity varchar(50),
        @postcode varchar(10),
        @managerId int = NULL,
        @daytimePhone varchar(11),
        @mobile varchar(11),
        @hireDate smalldatetime = default,
        @storeId int @primaryAddress int = 1,
    ) as begin;

declare @todaysDate as date
set
    @todaysDate = getDate() declare @NewAddressId int
insert into
    dbo.tblAddress(
        addLine1,
        addLine2,
        addLine3,
        daytimePhone,
        mobile,
        townCity,
        postcode,
        primaryAddress
    )
values
    (
        @addLine1,
        @addLine2,
        @addLine3,
        @daytimePhone,
        @mobile,
        @townCity,
        @postcode,
        @primaryAddress
    )
select
    @NewAddressId = scope_identity()
insert into
    dbo.tblStaff(
        fName,
        lName,
        gender,
        dob,
        salary,
        email,
        NIN,
        title,
        managerId,
        addressId,
        storeId,
        hireDate
    )
values
(
        @fName,
        @lName,
        @gender,
        @dob,
        @salary,
        @email,
        @NIN,
        @title,
        @managerId,
        @NewAddressId,
        @storeId,
        @todaysDate
    )
end;