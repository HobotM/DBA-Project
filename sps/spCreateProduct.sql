use AMMTescoProject
GO
create procedure dbo.spCreateProduct
(
    @SKU varchar(20),
    @departmentId varchar(20),
    @price float,
    @brand varchar(30),
    @description varchar(100) = null,
    @name varchar(30),
    @tagline varchar(50) = null,
    @discounted int = 0,
    @weight float
)

as
begin;
insert into tblProduct(departmentId, SKU, price, brand, description, name, tagline, discounted, weight)
    values(@departmentId, @SKU, @price, @brand, @description, @name, @tagline, @discounted, @weight)
end;