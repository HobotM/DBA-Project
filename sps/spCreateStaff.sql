USE [AMMTescoProject];  
GO  
CREATE procedure dbo.spCreateStaff
    @storeId int,
    @addressId int,
    @managerId int,
    @fName varchar(50),
    @lName varchar(50),
    @email varchar(50),
    @phone varchar(11),
    @gender nchar(2),
    @dob datetime,
    @salary int,
    @email varchar(50),
    @NIN varchar(9),
    @title varchar(50),
    @addLine1 varchar(50),
    @addLine2 varchar(50),
    @addLine3 varchar(50),
    @townCity varchar(50),
    @postcode varchar(10),
AS   
begin;

declare @newId int

insert into dbo.tblStaff(fName, lName, email, phone, gender, dob, salary, NIN, title)
	values(@fName, @lName, @email, @mobile, @phone, @gender, @dob, @salary, @NIN, @title )

select @newId = scope_identity()

insert into dbo.tblAddress(addLine1, addLine2, addLine3, townCity, postcode, eveningPhone, daytimePhone, mobile, description, customerId, primaryAddress)
	values (@addLine1, @addLine2, @addLine3, @townCity, @postcode, @eveningPhone, @daytimePhone, @mobile, @description, @newId, 1)