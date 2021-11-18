SELECT
    TOP (100) PERCENT dbo.tblProduct.name AS Product,
    dbo.tblProduct.brand,
    dbo.tblDepartment.name AS Department
FROM
    dbo.tblProduct
    INNER JOIN dbo.tblDepartment ON dbo.tblProduct.departmentId = dbo.tblDepartment.departmentId
WHERE
    (dbo.tblDepartment.name = 'produce')
ORDER BY
    Department