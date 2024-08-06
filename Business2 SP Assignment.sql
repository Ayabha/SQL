

Create Procedure spPullBusiness2Data
As
Begin

--How To Drop Table
Drop Table If Exists Business2Backup

--How To Backup Table
Select * Into Business2Backup
From Business2

Update Business2
Set Address = 'Calkuta'
Where Address= 'Mumbai'

Select * 
From Business2Backup
SELECT [ID]
      ,[Name]
      ,[Age]
      ,[Address]
      ,[Salary]
  FROM [SQLTrainingCase].[dbo].[Business2]
End

Select *
From Business2
  --How To Run Store Procedure
  Execute   spPullBusiness2Data
  
  --How To Drop Store Procedure From The Database
  Drop Procedure spPullBusiness2Data

  --How To Create A Backup Table
Select * Into Business2Backup
From Business2

Select * 
From Business2Backup

--How To Modify Store Procedure
Alter Procedure spPullBusiness2Data
As
Begin

--How To Drop Table
Drop Table If Exists Business2Backup

--How To Backup Table
Select * Into Business2Backup
From Business2

Update Business2
Set Address = 'Calkuta'
Where Address= 'Indore'

Select * 
From Business2Backup
SELECT [ID]
      ,[Name]
      ,[Age]
      ,[Address]
      ,[Salary]
  FROM [SQLTrainingCase].[dbo].[Business2]
End

Select *
From Business2

Exec spPullBusiness2Data