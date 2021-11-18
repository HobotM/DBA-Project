SELECT
    TOP (100) PERCENT dbo.tblCustomer.fName + ' ' + dbo.tblCustomer.lName AS [Customer Name],
    tblAddress_1.addLine1 + ',  ' + tblAddress_1.addLine2 + ' ' + tblAddress_1.postcode AS [Customer Address],
    dbo.tblCustomer.phoneNo AS [Phone No],
    dbo.tblDeliverySlot.slotDateTime AS [Delivery Date],
    dbo.tblTransaction.transactionDate AS [Transaction Date],
    dbo.tblTransaction.transactionStatus AS [Transaction Status],
    dbo.tblProduct.name AS Product,
    dbo.tblOrderItem.quantity,
    dbo.tblOrderItem.totalPrice AS [Item Total],
    dbo.tblStore.name AS Tesco,
    dbo.tblAddress.addLine1 + ' ' + dbo.tblAddress.addLine2 + '. ' + dbo.tblAddress.postcode AS [Store Address]
FROM
    dbo.tblDeliverySlot
    INNER JOIN dbo.tblOrder ON dbo.tblDeliverySlot.slotId = dbo.tblOrder.deliverySlotId
    INNER JOIN dbo.tblStore ON dbo.tblDeliverySlot.storeId = dbo.tblStore.storeId
    INNER JOIN dbo.tblAddress ON dbo.tblStore.addressId = dbo.tblAddress.addressId
    INNER JOIN dbo.tblTransaction ON dbo.tblOrder.orderId = dbo.tblTransaction.orderId
    INNER JOIN dbo.tblOrderItem ON dbo.tblOrder.orderId = dbo.tblOrderItem.orderId
    INNER JOIN dbo.tblProduct ON dbo.tblOrderItem.productId = dbo.tblProduct.productId FULL
    OUTER JOIN dbo.tblAddress AS tblAddress_1 FULL
    OUTER JOIN dbo.tblCustomer ON tblAddress_1.addressId = dbo.tblCustomer.addressID ON dbo.tblOrder.customerId = dbo.tblCustomer.customerId
WHERE
    (dbo.tblCustomer.customerId = 11)
    AND (dbo.tblOrder.orderId = 4)
ORDER BY
    dbo.tblProduct.departmentId