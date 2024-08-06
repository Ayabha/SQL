

Create Procedure spPullCompanyInfo1Data
AS
Begin

--How To Drop A Table
Drop Table If Exists CompanyInfo1Backup

--Creating A Backup Table
Select * Into CompanyInfo1Backup
 From CompanyInfo1

 --Update CompanyInfo1 Table
Update CompanyInfo1
Set FirstName = 'Alfred'
Where FirstName = 'Adam'


--Fetching CompanyInfo1 Records
Select *
From CompanyInfo1Backup
SELECT [FirstName]
      ,[LastName]
      ,[Country]
  FROM [SQLTrainingCase].[dbo].[CompanyInfo1]
End

Select *
From CompanyInfo1

--How To Run Store Procedure
  Exec  spPullCompanyInfo1Data

  --How To Drop Store Procedure From The Database

  Drop Procedure  spPullCompanyInfo1Data

  --How To Create A Backup Table
  Select * Into CompanyInfo1Backup
  From CompanyInfo1

  Select *
  From CompanyInfo1Backup

  --How To Modify Store Procedure
Alter Procedure spPullCompanyInfo1Data
AS
Begin

--How To Drop A Table
Drop Table If Exists CompanyInfo1Backup

--Creating A Backup Table
Select * Into CompanyInfo1Backup
 From CompanyInfo1

Update CompanyInfo1
Set FirstName = 'Alfred'
Where FirstName = 'Sally'

Select *
From CompanyInfo1Backup
SELECT [FirstName]
      ,[LastName]
      ,[Country]
  FROM [SQLTrainingCase].[dbo].[CompanyInfo1]
End

Select *
From CompanyInfo1

Exec spPullCompanyInfo1Data