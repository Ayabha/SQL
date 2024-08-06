SELECT[CountryName]
      ,[Continent]
      ,[Area]
      ,[Population]
      ,[GDP]
  FROM [SQLtraining].[dbo].[World3]

Create Procedure spPullworld3Data
As
Begin

--How To Drop A Table
Drop Table If Exists spPullworld3Data


--Creating A Backup Table
Select *Into World3Backup
From world3

--Updating World3
Update world3
Set CountryName = 'Cyprus'
Where CountryName ='Afghanistan'

--Fetching All Records 
Select *
From world3Backup
SELECT[CountryName]
      ,[Continent]
      ,[Area]
      ,[Population]
      ,[GDP]
  FROM [SQLtraining].[dbo].[World3]
End

Select *
From world3

Exec spPullworld3Data

--How To Remove Store Procedure From The Database

Drop Procedure spPullworld3Data

Select *Into World3Backup
From world3

Select *
From world3Backup