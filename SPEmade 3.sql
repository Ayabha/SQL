 --Create StoreProcedure
  Create Procedure spEmadeconsultingHR
  As
SELECT TOP (1000) [ID]
      ,[FirstName]
      ,[LastName]
      ,[MaritalStatus]
  FROM [Dev].[dbo].[EmadeConsultingHR]

   Execute spEmadeconsultingHR

  
  
  --Create StoreProcedure Parameter
  Create Proc spID
  @ID INT 
  As
  Begin
  SELECT TOP (1000) [ID]
      ,[FirstName]
      ,[LastName]
      ,[MaritalStatus]
  FROM [Dev].[dbo].[EmadeConsultingHR]
   Where ID = @ID
  End

  Exec spID 3
