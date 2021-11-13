SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OrderHeader](
    [OrderID] [int] IDENTITY(1,1) NOT NULL,
    [OrderNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [OrderDate] [datetime] NULL,
    [CustomerNumber] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OrderDetails](
    [OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
    [OrderHeaderID] [int] NULL,

   19     [ItemNumber] [varchar](20)

COLLATE SQL_Latin1_General_CP1_CI_AS

NULL,

   20     [Qty] [int] NULL,

   21     [Rate] [float]

NULL

   22 ) ON

[PRIMARY]

   23 

   24 GO

   25 SET

ANSI_PADDING OFF

Stored Procedure

SaveSalesOrder

    1 CREATE

  PROCEDURE [dbo].[SaveSalesOrder]

    2 (

    3     @OrderNumber VARCHAR(10),

    4     @OrderDate DATETIME,

    5     @CustomerNumber

VARCHAR(10),

    6     @LineItems text

    7 )

    8 AS

    9 

   10 SET NOCOUNT

ON

   11 

   12 BEGIN

TRAN

   13 

   14 -- Initialize

XML handle

   15 DECLARE

@hdoc INT   

   16 EXEC

sp_xml_preparedocument @hdoc OUTPUT, @LineItems

   17 

   18 -- Insert

data to order header

   19 INSERT

INTO OrderHeader (OrderNumber, OrderDate, CustomerNumber)   

   20    

VALUES (@OrderNumber, @OrderDate, @CustomerNumber)

   21 

   22 -- Take

the IDENTITY of the new record

   23 DECLARE

@OrderID INT

   24 SET

@OrderID = SCOPE_IDENTITY()
data to Order Details
INSERT INTO OrderDetails( OrderHeaderID, ItemNumber, Qty, Rate)
SELECT
@OrderID, x.ItemNumber, x.Qty, x.Rate
FROM OPENXML ( @hdoc, '/lineItems/item',
2 ) WITH (
ItemNumber VARCHAR(20)
'itemNumber',
Qty INT 'qty',
Rate FLOAT 'rate'
)
AS x
XML handle

EXEC

sp_xml_removedocument @hdocIF
@@ERROR <> 0
ROLLBACK TRAN
ELSE
COMMIT TRAN