SELECT
    TOP (100) PERCENT dbo.tblStaff.staffId AS [Employee Number],
    dbo.tblStaff.managerId,
    dbo.tblStaff.fullName AS [Full Name],
    dbo.tblStaff.gender,
    dbo.tblStaff.dob AS [Date of Birth],
    dbo.tblStaff.hireDate AS [Join Date],
    dbo.tblStaff.salary,
    dbo.tblStore.name AS [Store Name],
    dbo.tblAddress.addLine1 AS [Address 1],
    dbo.tblAddress.addLine2 AS [Address 2],
    dbo.tblAddress.addLine3 AS [Address 3],
    dbo.tblStaff.jobTitle
FROM
    dbo.tblStore
    INNER JOIN dbo.tblAddress ON dbo.tblStore.addressId = dbo.tblAddress.addressId
    RIGHT OUTER JOIN dbo.tblStaff ON dbo.tblStore.storeId = dbo.tblStaff.storeId
WHERE
    (dbo.tblStore.name = 'Stonelaw')
ORDER BY
    dbo.tblStaff.lName