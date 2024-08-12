SELECT  [EmployeeID]
    ,Upper((LastName + ' ' + FirstName + ' ' + MiddleName)) As EmployeeName
	,Upper((LastName + FirstName + MiddleName)) As EmployeeName
	,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
  FROM [SQLTrainingCase].[dbo].[Employee1]

  --The + sign above is concatenate (Adding something together)

  --To see the 1st 3 Letters of the FirstName
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
	   Into EmployeeString
  FROM [SQLTrainingCase].[dbo].[Employee1]

  --Join Employee_String To Employee1 Table
  Select *
  From EmployeeString As ES
  Join Employee1 As E
  On ES.FirstName_String = E.FIRSTNAME --Where They both merge on the First_Sring Column

  use SQLTrainingcase
  --Join Employee_String LastName To Employee1 table LastName 
  Select *
  From EmployeeString As ES
  Join Employee1 As E
  On ES.FirstName = E.FirstName  --where they both merge on the Lastname column
  
  
  Select *
  From EmployeeString As ES
  Join Employee1 As E
  On Substring (ES.FirstName_String, 1,3) = Substring(E.FirstName, 1,3)


  --Union all shows all records on both tables but the tables must have the same column
 Select [EmployeeID] 
     --,'Employee_String ' As TableName --(To Add A table name)
	  --, FirstName_String
	  ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
  From Employee_String

  --Add a Derived column when combining 2 tables using UNION or UNION ALL clauae
  
  Union 
  Select [EmployeeID] 
   --,'Employee1 ' As TableName --(To know from which table each come from.Use UNION ALL) Also look at the table above
      --,' 'As FirstName_String --(To add FirstName_String column to employee1.It will be empty after running it
	  ,[LastName]             --(But when you run both Tables,FirstName_String column will be filled
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
  From Employee1

 --Where both tables merge
  Select EmployeeID, FirstName, LastName
  From Employee_String
  UNION
  Select EmployeeID,FirstName, LastName
  From Employee1

  --To add record in  table ,right click on the table on the object explorer
  --and click on Edit top 200 fill the table,close it and go and run the table.
  --the new record will appear on the table