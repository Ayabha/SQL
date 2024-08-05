SELECT [Year]
      ,[Subject]
      ,[Winner]
  FROM [SQLtraining].[dbo].[noble]


/*
--Why do we use Store Procedure?
--We use store procedure for security purpose
--To prevent People from hacking your DataBase
--To make our code reuseable especially when you automate instead of rewriting codes everytime
--For Performance,i.e helps to improve code
For Security Purpose

*/

--How To Create Store Procedure
Drop Table If Exists spPullNobleData
;
Create Procedure spPullNobleData
AS
Begin

--How To Remove/Drop A Table
Drop Table If Exists NobleBackup

--Creating A Backup Table
Select * Into NobleBackup
From Noble

Update Noble
Set Year = 2025
Where Year = 1963

Select *
From NobleBackup

SELECT  [Year]
      ,[Subject]
      ,[Winner]
  FROM [SQLtraining].[dbo].[noble]
End

Select *
From Noble

--How To Run Store Procedure
  Execute spPullNobleData

--How To Remove Store Procedure From The Database

Drop Procedure spPullNobleData

--How To Create A Backup Table

Select * Into NobleBackup
From Noble

Select *
From NobleBackup


Alter Procedure spPullNobleData
AS
Begin

--How To Remove/Drop A Table
Drop Table If Exists NobleBackup

--Creating A Backup Table
Select * Into NobleBackup
From Noble

Update Noble
Set Year = 2025
Where Year = 1963

Select *
From NobleBackup

SELECT  [Year]
      ,[Subject]
      ,[Winner]
  FROM [SQLtraining].[dbo].[noble]
End

Select *
From Noble

Execute spPullNobleData


--How To Track Changes In A Code