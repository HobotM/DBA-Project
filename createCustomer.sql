if exists(select 1 from sys.procedures where [name] = 'dbo.CreateCustomer')
begin;
    drop procedure dbo.CreateCustomerl
end;

create procedure dbo.CreateCustomer
(
    @addLine1 varchar(50),
    @addLine2 varchar(50),
    @addLine3 varchar(50),
    @townCity varchar(50),
    @postcode varchar(10),
    @eveningPhone varchar(11),
    @daytimePhone varchar(11),
    @mobile varchar(11) null,
    @fName varchar(50),
    @lName varchar(50),
    @email varchar(50),
    @description varchar(50)
)
as
begin;
declare @newId int
insert into dbo.tblCustomer(fName, lName, email, phoneNo) values(@fName, @lName, @email, @mobile)
select @newId = scope_identity()
insert into dbo.tblAddress(addLine1, addLine2, addLine3, townCity, postcode, eveningPhone, daytimePhone, mobile, description, customerId, primaryAddress)
values (@addLine1, @addLine2, @addLine3, @townCity, @postcode, @eveningPhone, @daytimePhone, @mobile, @description, @newId, 1)
end;