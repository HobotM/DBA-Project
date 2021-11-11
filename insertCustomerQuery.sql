USE [AMMTescoProject]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spCreateCustomer]
		@addLine1 = N'flat 1/1',
		@addLine2 = N'278 allison st',
		@addLine3 = N'glasgow',
		@townCity = N'lanarkshire',
		@postcode = N'g42 8hd',
		@eveningPhone = N'07988194104',
		@daytimePhone = N'07988194104',
		@mobile = N'07988194104',
		@fName = N'matt',
		@lName = N'crabtree',
		@email = N'm.crabtree@zohomail.eu',
		@description = N'home'

SELECT	'Return Value' = @return_value

GO