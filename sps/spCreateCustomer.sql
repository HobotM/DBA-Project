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
declare @newAddressId int
declare @newCustomerId int
insert into dbo.tblAddress(addLine1, addLine2, addLine3, townCity, postcode, eveningPhone, daytimePhone, mobile, description, primaryAddress)
	values (@addLine1, @addLine2, @addLine3, @townCity, @postcode, @eveningPhone, @daytimePhone, @mobile, @description, 1)

	select @newAddressId = scope_identity()

insert into dbo.tblCustomer(fName, lName, phoneNo, addressid)
	values(@fName, @lName, @daytimePhone, @newAddressID)
    
    select @newCustomerId = scope_identity()
    
insert into dbo.tblCustomerEmail(customerId, email)
	values(@newCustomerId, @email)
insert into dbo.tblClubCard(customerId, creationDate)
	values(@newCustomerId, getdate())

	set @password = convert(varchar(50),@password);
	set @password = hashbytes('sha2_256',@password);

insert into dbo.tblCustomerLogin(customerId,password)
	values(@newCustomerId,@password)
end;