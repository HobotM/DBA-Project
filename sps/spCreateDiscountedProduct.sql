use AMMTescoProject
GO
    create procedure dbo.spCreateDiscountedProduct (
        @SKU varchar(20),
        @departmentId varchar(20),
        @price float,
        @discountedPrice float,
        @brand varchar(30),
        @description varchar(100) = null,
        @name varchar(30),
        @tagline varchar(50) = null,
        @discounted int = 1,
        @weight float
    ) declare @newProductId int as begin;

insert into
    tblProduct(
        departmentId,
        SKU,
        price,
        brand,
        description,
        name,
        tagline,
        discounted,
        weight
    )
values
(
        @departmentId,
        @SKU,
        @price,
        @brand,
        @description,
        @name,
        @tagline,
        @discounted,
        @weight
    )
select
    @newProductId = scope_identity()
insert into
    tblDiscountedPrice(productId, price)
values
(@newProductId, @discountedPrice)
end;

go