create procedure dbo.tmpSP
(
    @name varchar(10),
    @email varchar(20)
)

as
begin;
declare @id int
insert into dbo.tmpCustomer(name) values(@name)
select @id = scope_identity()
insert into dbo.tmpEmail(custId, name) values (@id, @email)