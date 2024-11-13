 --Create StoreProcedure
  Create Procedure spEmadeFamily
  As
SELECT TOP (1000) [ID]
      ,[FamilyName]
      ,[FamilyNumber]
  FROM [Dev].[dbo].[EmadeFamily]

  Exec spEmadeFamily

   --Create StoreProcedure Parameter
  Create Proc spFamilyName
  @FamilyName VARCHAR(20) 
  As
  Begin
  SELECT TOP (1000) [ID]
      ,[FamilyName]
      ,[FamilyNumber]
  FROM [Dev].[dbo].[EmadeFamily]
  Where FamilyName = @FamilyName
  End

  Exec spFamilyName 'Globex Corporation'