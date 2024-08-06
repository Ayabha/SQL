--How To Create Store Procedure

Create Procedure spPullGamesData
As
Begin

--How To Drop A Table
Drop Table If Exists GamesBackup

--Creating A Backup Table
Select * Into GamesBackup
From Games

Update Games
Set Year= 1999
Where Year= 2008

Select *
From GamesBackup
SELECT [Year]
      ,[City]
  FROM [SQLtraining].[dbo].[Games]

End

Select *
From Games

--How to Run Store Procedure
Execute spPullGamesData

--How to Drop a Store Procedure
Drop Procedure spPullGamesData

--How To Create A Backup Table
Select * Into GamesBackup
From Games

Select *
From GamesBackup

--How To Modify Store Procedure
Alter Procedure spPullGamesData
As
Begin

--How To Drop A Table
Drop Table If Exists GamesBackup

--Creating A Backup Table
Select * Into GamesBackup
From Games

Update Games
Set Year= 1999
Where Year= 2012

Select *
From GamesBackup
SELECT [Year]
      ,[City]
  FROM [SQLtraining].[dbo].[Games]

End

Select *
From Games

Exec spPullGamesData