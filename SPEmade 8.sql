 --Create StoreProcedure
  Create Procedure spEmadeCustomer
  As
SELECT TOP (1000) [ID]
      ,[CustomerName]
      ,[CustomerNumber]
      ,[Address]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[FamilyID]
  FROM [Dev].[dbo].[EmadeCustomer]

  Exec spEmadeCustomer

   --Create StoreProcedure Parameter
  Create Proc spCustomerName
  @CuStomerName VARCHAR(30) 
  As
  Begin
  SELECT TOP (1000) [ID]
      ,[CustomerName]
      ,[CustomerNumber]
      ,[Address]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[FamilyID]
  FROM [Dev].[dbo].[EmadeCustomer]
  Where  CustomerName = @CustomerName
  End

  Exec spCustomerName 'Ben Johnson'