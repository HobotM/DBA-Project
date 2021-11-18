SELECT
    TOP (100) PERCENT dbo.tblStockCount.productId AS [Product ID],
    dbo.tblProduct.SKU,
    dbo.tblProduct.name AS [Product Name],
    dbo.tblStockCount.stockCount AS Count,
    dbo.tblStore.storeId AS [Store ID],
    dbo.tblStore.name AS [Store Name],
    dbo.tblStore.type,
    dbo.tblProduct.departmentId,
    dbo.tblProduct.productId
FROM
    dbo.tblStockCount
    INNER JOIN dbo.tblProduct ON dbo.tblStockCount.productId = dbo.tblProduct.productId
    INNER JOIN dbo.tblStore ON dbo.tblStockCount.storeId = dbo.tblStore.storeId
WHERE
    (dbo.tblStockCount.stockCount > 0)
    AND (dbo.tblStore.storeId = 1)
ORDER BY
    dbo.tblProduct.departmentId,
    dbo.tblProduct.productId