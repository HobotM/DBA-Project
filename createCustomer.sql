USE [AMMTescoProject]
GO
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 11/11/2021 19:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[spCreateCustomer]
(
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
)
as
begin;
declare @newId int
insert into dbo.tblCustomer(fName, lName, email, phoneNo)
	values(@fName, @lName, @email, @mobile)
select @newId = scope_identity()
insert into dbo.tblAddress(addLine1, addLine2, addLine3, townCity, postcode, eveningPhone, daytimePhone, mobile, description, customerId, primaryAddress)
	values (@addLine1, @addLine2, @addLine3, @townCity, @postcode, @eveningPhone, @daytimePhone, @mobile, @description, @newId, 1)
insert into dbo.tblCustomerEmail(customerId, email)
	values(@newId, @email)
insert into dbo.tblClubCard(customerId, creationDate)
	values(@newId, getdate())
end;