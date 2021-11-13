use AMMTescoProject
GO
    create procedure dbo.spCreateProductReview (
        @productId int,
        @customerId int,
        @bodyText varchar(1000),
        @headlineText varchar(50),
        @rating int
    ) as begin;

insert into
    tblProductReview(
        productId,
        customerId,
        bodyText,
        headlineText,
        rating
    )
values
    (
        @productId,
        @customerId,
        @bodyText,
        @headlineText,
        @rating
    )
end;

go