Create Proc spEmadeconsultingJOB
As
SELECT TOP (1000) [JOB_ID]
      ,[DESIGNATION]
  FROM [Dev].[dbo].[EmadeconsultingJOB]

  Execute  spEmadeconsultingJOB


 --Create StoreProcedure Parameter
Create Proc spDestination
@DESIGNATION VARCHAR (20)
As
Begin
SELECT TOP (1000) [JOB_ID]
      ,[DESIGNATION]
  FROM [Dev].[dbo].[EmadeconsultingJOB]
  Where DESIGNATION = @DESIGNATION 
  End

  EXEC spDestination 'Analyst'