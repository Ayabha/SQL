--Create StoreProcedure
  Create Procedure spEmadeconsultingHawb
  As
SELECT TOP (1000) [ID]
      ,[Hawb]
      ,[HawbDate]
      ,[ServiceCodeID]
      ,[DueDate]
      ,[PODDate]
      ,[AccountID]
      ,[ConsigneeID]
      ,[Revenue]
  FROM [Dev].[dbo].[EmadeHawb]

  Exec  spEmadeconsultingHawb

  --Create StoreProcedure Parameter

  Create Proc spAccountID
  @AccountID Int
  As
  Begin
  SELECT TOP (1000) [ID]
      ,[Hawb]
      ,[HawbDate]
      ,[ServiceCodeID]
      ,[DueDate]
      ,[PODDate]
      ,[AccountID]
      ,[ConsigneeID]
      ,[Revenue]
  FROM [Dev].[dbo].[EmadeHawb]
  Where AccountID = @AccountID
  End

  Exec spAccountID 37925188