 Create Procedure spEmadeconsultingLOCATION
As
SELECT TOP (1000) [LOCATION_ID]
     ,[CITY]
FROM [Dev].[dbo].[EmadeconsultingLOCATION]

 Execute spEmadeconsultingLOCATION

 --Create StoreProcedutre Parameteer
 Create Proc spCity
  @City VARCHAR(20) 
  As
  Begin
  SELECT [LOCATION_ID]
     ,[CITY]
FROM [Dev].[dbo].[EmadeconsultingLOCATION]
Where City = @City
End

 EXEC spCity 'DALLAS'