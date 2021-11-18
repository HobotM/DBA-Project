SELECT
    TOP (100) PERCENT dbo.tblOrder.orderId AS [Order id],
    dbo.tblOrderItem.quantity,
    dbo.tblProduct.name AS [Product Name],
    dbo.tblOrderItem.price AS [Price for each item],
    dbo.tblOrderItem.totalPrice AS [Total Price],
    dbo.tblProduct.departmentId,
    dbo.tblProduct.productId
FROM
    dbo.tblOrder
    INNER JOIN dbo.tblOrderItem ON dbo.tblOrder.orderId = dbo.tblOrderItem.orderId
    INNER JOIN dbo.tblProduct ON dbo.tblOrderItem.productId = dbo.tblProduct.productId
WHERE
    (dbo.tblOrder.orderId = 4)
ORDER BY
    dbo.tblProduct.departmentId