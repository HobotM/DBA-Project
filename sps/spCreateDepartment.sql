use AMMTescoProject
GO
create procedure dbo.CreateDepartment
(
    @name
)
as
begin;
insert into dbo.tblDepartment(name)
    values(@name)
end;