--Data Migration and UAT
Drop Table if Exists Prod.[dbo].[Health_Facility_Location]
Select * 
Into Prod.[dbo].[Health_Facility_Location]
From Dev.[dbo].[Health_Facility_Location]
Where FAC_TYPE_CODE = 'GACH'

Select *
From Prod.[dbo].[Health_Facility_Location]

--TestCase001--Count, Find or show total count in record(record count)
Select Count (*)As 'TotalCount' , 'Prod' As Source
From Prod.[dbo].[Health_Facility_Location]
Union All
Select Count (*)As 'TotalCount'  , 'Dev' As Source
From Dev.[dbo].[Health_Facility_Location]

--TestCase002, Find where facility is Null
Select Count (*)As 'TotalCount' , 'Prod' As Source
From Prod.[dbo].[Health_Facility_Location]
Where CCN is Null
Union All
Select Count (*)As 'TotalCount' , 'Dev' As Source
From Dev.[dbo].[Health_Facility_Location]
Where CCN is Null

Select Count (*)As 'TotalCount' , 'Prod' As Source
From Prod.[dbo].[Health_Facility_Location]
Where CCN is Not Null
Union All
Select Count (*)As 'TotalCount' , 'Prod' As Source
From Dev.[dbo].[Health_Facility_Location]
Where CCN is Not Null

--TestCase002, Check for the FAC YYPE that is GACH,ifthere found,if not there missing
Select Count (*)As 'TotalCount' , 'Prod' As Source,
Case When FAC_TYPE_CODE = ' GACH' Then 'Found'
Else 'Missing'
End As Expected
From Prod.[dbo].[Health_Facility_Location]
Group By FAC_TYPE_CODE

-- Validate where facility not GACH, missing, else found
Select Count (*)As 'TotalCount' , 'Prod' As Source,
Case When FAC_TYPE_CODE <> 'GACH' Then 'Not Found'
Else 'Found'
End As Expected
From Prod.[dbo].[Health_Facility_Location]
Group By FAC_TYPE_CODE

Select Count (*)As 'TotalCount' , 'Prod' As Source,
Case When FAC_TYPE_CODE <> 'ACH' Then 'Not Found'
Else 'Found'
End As Expected
From Prod.[dbo].[Health_Facility_Location]
Group By FAC_TYPE_CODE