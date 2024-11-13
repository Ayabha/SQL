--Create StoreProcedure
  Create Procedure spEmadeconsultingproducts
  As
SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[price]
  FROM [Dev].[dbo].[Emadeconsultingproducts]

  Exec spEmadeconsultingproducts

  --Create StoreProcedure Parameter
  Create Proc spProduct_name
  @product_name Varchar (20)
  As
  Begin
  SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[price]
  FROM [Dev].[dbo].[Emadeconsultingproducts]
  Where product_name =@product_name
  End

  Exec spproduct_name 'Product D'