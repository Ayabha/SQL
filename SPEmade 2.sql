--Create StoreProcedure
  Create Procedure spEmadeconsultingEMPLOYEE
  As
SELECT [EMPLOYEE_ID]
      ,[Last_Name]
      ,[First_Name]
      ,[Middle_Name]
      ,[Job_ID]
      ,[Manager_ID]
      ,[Hire_Date]
      ,[Salary]
      ,[Comm]
      ,[Department_ID]
  FROM [Dev].[dbo].[EmadeconsultingEMPLOYEE]

   Execute spEmadeconsultingEMPLOYEE

--Create StoreProcedure Parameter
  Create Proc spMiddle_Name
  @Middle_Name VARCHAR(20) 
  As
  Begin
  SELECT TOP (1000)[EMPLOYEE_ID]
      ,[Last_Name]
      ,[First_Name]
      ,[Middle_Name]
      ,[Job_ID]
      ,[Manager_ID]
      ,[Hire_Date]
      ,[Salary]
      ,[Comm]
      ,[Department_ID]
  FROM [Dev].[dbo].[EmadeconsultingEMPLOYEE]
  Where Middle_Name = @Middle_Name 
  End
 
 EXEC spMiddle_Name 'J'