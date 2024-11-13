--Create StoreProcedure
  Create Procedure spEmadeconsultingorders
  As
SELECT TOP (1000) [order_id]
      ,[customer_id]
      ,[order_date]
  FROM [Dev].[dbo].[Emadeconsultingorders]

  Exec spEmadeconsultingorders

  --Create StoreProcedure Parameter
  Create Proc spCustomer_ID
  @Customer_ID INT
  As
  Begin
  SELECT TOP (1000) [order_id]
      ,[customer_id]
      ,[order_date]
  FROM [Dev].[dbo].[Emadeconsultingorders]
  Where Customer_ID = @Customer_ID
  End

  EXEC spCustomer_ID 7