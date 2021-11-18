SELECT
    dbo.tblCustomer.customerId AS [Customer ID],
    dbo.tblCustomer.fName AS [First Name],
    dbo.tblCustomer.lName AS [Last Name],
    LEFT(dbo.tblCustomer.phoneNo, 0) + '*********' + RIGHT(
        dbo.tblCustomer.phoneNo,
        2
    ) AS [Phone Number],
    dbo.tblCustomerEmail.email
FROM
    dbo.tblCustomer
    INNER JOIN dbo.tblCustomerEmail ON dbo.tblCustomer.customerId = dbo.tblCustomerEmail.customerId
WHERE
    (dbo.tblCustomer.customerId = 15)