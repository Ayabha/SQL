  --Temperature Table (Temp Table)
--Temp Tables are accessible in the current session.
--To create a Temp Table,You add pound (#)
 Select [EmployeeID] 
      ,Substring(FirstName, 1,3) As FirstName_String
	  ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
	   Into #Employee_String
  FROM [SQLTrainingCase].[dbo].[Employee1]

  Select *
  From  #Employee_String


--Global Table
--Temp Table are accessible in the other session
--To create a Global Table,you add 2 pound (##)
 Select [EmployeeID] 
      ,Substring(FirstName, 1,3) As FirstName_String
	  ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
	   Into ##Employee_String
  FROM [SQLTrainingCase].[dbo].[Employee1]


  Select *
  From ##Employee_String

  --If you copy the 2 Select * above and paste it in a new query
  --temp table wont run but global table will