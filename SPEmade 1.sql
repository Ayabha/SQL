SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[email]
  FROM [Dev].[dbo].[Emadeconsultingcustomers]

  --Create StoreProcedure
  Create Procedure spPullEmadeconsultingcustomers
  As
  SELECT [customer_id]
      ,[first_name]
      ,[last_name]
      ,[email]
  FROM [Dev].[dbo].[Emadeconsultingcustomers]

  Execute spPullEmadeconsultingcustomers

  --Create Parameter
Create Proc spfirst_name
@first_name varchar(100)
As
Begin
SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[email]
  FROM [Dev].[dbo].[Emadeconsultingcustomers]
  Where first_name = @first_name 
  End
  EXEC spfirst_name 'John'