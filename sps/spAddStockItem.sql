use AMMTescoProject
GO
    create procedure dbo.spAddStockItem (
        @productId int,
        @storeId int,
        @stockCount int = NULL,
        @restockTrigger int = NULL
    ) as begin;

insert into
    tblStockCount(productId, storeId, stockCount, restockTrigger)
values
(
        @productId,
        @storeId,
        @stockCount,
        @restockTrigger
    )
end;