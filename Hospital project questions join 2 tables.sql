SELECT TOP [Id]
      ,[BIRTHDATE]
      ,[DEATHDATE]
      ,[SSN]
      ,[DRIVERS]
      ,[PASSPORT]
      ,[PREFIX]
      ,[FIRST]
      ,[MIDDLE]
      ,[LAST]
      ,[SUFFIX]
      ,[MAIDEN]
      ,[MARITAL]
      ,[RACE]
      ,[ETHNICITY]
      ,[GENDER]
      ,[BIRTHPLACE]
      ,[ADDRESS]
      ,[CITY]
      ,[STATE]
      ,[COUNTY]
      ,[FIPS]
      ,[ZIP]
      ,[LAT]
      ,[LON]
      ,[HEALTHCARE_EXPENSES]
      ,[HEALTHCARE_COVERAGE]
      ,[INCOME]
  FROM [Dev].[dbo].[Stg_Patients]


SELECT[Id]
      ,[START]
      ,[STOP]
      ,[PATIENT]
      ,[ORGANIZATION]
      ,[PROVIDER]
      ,[PAYER]
      ,[ENCOUNTERCLASS]
      ,[CODE]
      ,[DESCRIPTION]
      ,[BASE_ENCOUNTER_COST]
      ,[TOTAL_CLAIM_COST]
      ,[PAYER_COVERAGE]
      ,[REASONCODE]
      ,[REASONDESCRIPTION]
  FROM [Dev].[dbo].[Stg_Encounters]

  Select *
  FROM [Dev].[dbo].[Stg_Encounters]
   
  Select *
  FROM [Dev].[dbo].[Stg_Patients]




  --Join this 2 tables together and the key to join them on the Patient table will be ID
  --On the Encounter table it will patient
  Select B.ID, A.Patient
  From  [Dev].[dbo].[Stg_Patients] As B
  Join [Dev].[dbo].[Stg_Encounters] As A
  On B.ID = A.Patient

  /**Hospital Project Questions
We have 9 tables — Patients, Encounters, Conditions, Immunizations, Procedures, Observations, Allergies, Careplans & Medications.
Now to start answering the questions.
* Write a query that does the following:
* Lists out number of patients in descending order
* Does not include Quincy
* Must have at least 20 patients from that city

1. To find out the patients with the highest number of visits

2. To find out the Top 10 patients with the most visits to the hospital
3. ⁠To find out the number of times patients from each city visited the hospital.
4. ⁠To find out the cities with up to 50 counts of emergency cases.
5. ⁠Now to find out the number of patients from Boston who came in 2020.
6. ⁠To find out the top recurring conditions.
7. ⁠To find out the month with the highest number of ambulatory cases since 2010.
8. ⁠To find out the month with the highest number of emergency cases since 2010.
9. ⁠Now to find out the Top 15 years with the most immunizations.
**/


--Lists out number of patients in each city descending order

Select count (*) As NumberOfPatients
From Stg_Patients
Group by City 
Order By City Desc

--view
CREATE VIEW vwNumberOfPatients AS
SELECT City, COUNT(*) AS NumberOfPatients
FROM Stg_Patients
GROUP BY City

Select *
From vwNumberOfPatients

--List City that only starts with W in the Patients Table
Select City,  count (*) As NumberOfPatients
From Stg_Patients
Where City Like 'W%'
Group by City 
Order By City Desc


--Produce a report that shows Number of  Cities that are more than 0ne
Select City,  count (*) As 'NumberOfPatients'
From Stg_Patients
Where City Like 'W%'
Group by City
Having Count (*)> 1
Order By City Desc

--View
CREATE VIEW vwNumberOfCities AS
SELECT City, COUNT(*) AS 'NumberOfPatients'
FROM Stg_Patients
WHERE City LIKE 'W%'
GROUP BY City
HAVING COUNT(*) > 1

Select *
From vwNumberOfCities

--Patients with the highest number of visits(after that do sub query to get top 10)

Select B.ID,B.City, Count(A.Patient)As visits
From  [Dev].[dbo].[Stg_Patients] As B
Join [Dev].[dbo].[Stg_Encounters] As A
On B.ID = A.Patient
Group By B.ID, B.City




 --Return Top 10 Patients
 Select Top 10 *
From
(
			Select B.ID,B.City, Count(A.Patient)As visits
			From  [Dev].[dbo].[Stg_Patients] As B
			Join [Dev].[dbo].[Stg_Encounters] As A
			On B.ID = A.Patient
			Group By B.ID, B.City
		
--View
CREATE VIEW vwPatientVisits AS
SELECT B.ID, B.City, COUNT(A.Patient) AS Visits
FROM [Dev].[dbo].[Stg_Patients] AS B
JOIN [Dev].[dbo].[Stg_Encounters] AS A
ON B.ID = A.Patient
GROUP BY B.ID, B.City;
 
 Select *
 From vwPatientVisits

 )As Final 


 --Show the Highest 
  Select Top 1 *
From
(
			Select B.ID,B.City, Count(A.Patient)As visits
			From  [Dev].[dbo].[Stg_Patients] As B
			Join [Dev].[dbo].[Stg_Encounters] As A
			On B.ID = A.Patient
			Group By B.ID, B.City
			
)As Final 
 Order by visits Desc


 --cities with up to 50 counts of emergency cases.
Select B.ID,B.City, Count(A.Patient)As visits
From  [Dev].[dbo].[Stg_Patients] As B
Join [Dev].[dbo].[Stg_Encounters] As A
On B.ID = A.Patient
Where A.EncounterClass = 'Emergency'
Group By B.ID, B.City
Having Count (A.Patient)<=50

CREATE VIEW vwEmergencyVisits AS
Select B.ID,B.City, Count(A.Patient)As visits
From  [Dev].[dbo].[Stg_Patients] As B
Join [Dev].[dbo].[Stg_Encounters] As A
On B.ID = A.Patient
Where A.EncounterClass = 'Emergency'
Group By B.ID, B.City
Having Count (A.Patient)<=50



--find out the number of patients from Boston who came in 2020 and their conditions


SELECT C.Description, COUNT (*) AS PatientConditionCount
FROM [Dev].[dbo].[Stg_Patients] AS A
JOIN [Dev].[dbo].[Stg_Conditions] AS C
ON A.ID = C.Patient 
WHERE A.City = 'Boston'
AND YEAR(C.Start)> = 2020
Group by C.Description
Order by PatientConditionCount desc
 

 --View
 CREATE VIEW vwPatientConditionCount AS
SELECT C.Description, COUNT(*) AS PatientConditionCount
FROM [Dev].[dbo].[Stg_Patients] AS A
JOIN [Dev].[dbo].[Stg_Conditions] AS C
ON A.ID = C.Patient
WHERE A.City = 'Boston'
AND YEAR(C.Start) >= 2020
GROUP BY C.Description


select *
From vwPatientConditionCount


 --To find out the number of patients from Boston who had encounter in 2020
 Select count (*) As Patientencountercount
 From [Dev].[dbo].[Stg_Patients] As A
     Join [Dev].[dbo].[Stg_Encounters] As C
	  On A.ID =C.Patient
	  Where A.city = 'Boston'
	  And Year (C.Start)>=2020


	  --View
CREATE VIEW vwPatientEncounterCount AS
SELECT COUNT(*) AS PatientEncounterCount
FROM [Dev].[dbo].[Stg_Patients] AS A
JOIN [Dev].[dbo].[Stg_Encounters] AS C
ON A.ID = C.Patient
WHERE A.City = 'Boston'
AND YEAR(C.Start) >= 2020;

Select *
From vwPatientEncounterCount


-- ⁠To find out the top recurring conditions.
Select [Description],Count(*) As TotalOccurrence
From Stg_Encounters
Group By [Description]
Having count(*)> 1
Order By TotalOccurrence Desc

--View
CREATE VIEW vwTopRecurringConditions AS
SELECT 
    [Description], 
    COUNT(*) AS TotalOccurrence
FROM 
    [Dev].[dbo].[Stg_Encounters]
GROUP BY 
    [Description]
HAVING 
    COUNT(*) > 1

	select *
	From vwTopRecurringConditions

--Find month with the highest number of ambulatory cases since 2010	
Select Encounterclass, Month(Start) As Months,
Count(*) As 'Number of Ambulatory Case'
From [Dev].[dbo].[Stg_Encounters]
Where Encounterclass = 'Ambulatory'
And start > = '2010'
Group By Encounterclass, Month(Start)
Order By Month (Start) Desc

--View
CREATE VIEW vwNumberofAmbulatory AS
SELECT Encounterclass, MONTH(Start) AS Months,
       COUNT(*) AS 'Number of Ambulatory Case'
FROM [Dev].[dbo].[Stg_Encounters]
WHERE Encounterclass = 'Ambulatory'
AND Start >= '2010'
GROUP BY Encounterclass, MONTH(Start)
ORDER BY MONTH(Start) DESC
Select *From vwNumberofAmbulatory
Select Encounterclass,try_convert(Date,Start)
As Start,DatePart(Month,Start) As Months,
DatePart(WeekDay,Start)As [WeekDay],
Count(*) As 'Number of Ambulatory Case'
From [Dev].[dbo].[Stg_Encounters]
Where Encounterclass = 'Ambulatory'
And start > = '2010'
Group By Encounterclass,DatePart(Month,Start),DatePart(WeekDay,Start),Start
Order By Month (Start) Desc

--Produce a report that shows the number of ambulatory Encounterclass since 2010 for week 4
Select Encounterclass,
try_convert(Date,Start)As Start,
DatePart(Month,Start) As Months,
DatePart(WeekDay,Start)As [WeekDay],
Count(*) As 'Number of Ambulatory Case'
From [Dev].[dbo].[Stg_Encounters]
Where Encounterclass = 'Ambulatory'
And DatePart (WeekDay,Start)=4
And start > = '2010'
Group By Encounterclass,DatePart(Month,Start),DatePart(WeekDay,Start),Start
Order By Month (Start) Desc



Select Encounterclass,DatePart(Month,Start) As Month,
Count(*) As 'Number of Ambulatory Case'
From [Dev].[dbo].[Stg_Encounters]
Where Encounterclass = 'Ambulatory'
And start > = '2010'
Group By Encounterclass, Month(Start)
Order By Month (Start) Desc
--Find out the month with the highest number of emergency cases since 2010Select Encounterclass,
Month(Start) as Month,
Count(DatePart (Month,Start)) As 'Number of Emergencycases Case'
From [Dev].[dbo].[Stg_Encounters]
Where Encounterclass = 'Emergency'
And start > = '2010'
Group By Encounterclass,DatePart(Month,Start)
Order By Month (Start) Desc--viewCREATE VIEW vwNumberofEmergencycases AS
SELECT 
    Encounterclass,
    MONTH(Start) AS Month,
    COUNT(DATEPART(Month, Start)) AS 'Number of Emergency Cases'
FROM [Dev].[dbo].[Stg_Encounters]
WHERE 
    Encounterclass = 'Emergency'
    AND Start >= '2010'
GROUP BY 
    Encounterclass, DATEPART(Month, Start)
	Select * 	From vwNumberofEmergencycases--Find the month that has the highestSelect Top 1*From    (	Select Encounterclass,
	Month(Start) as Month,
	Count(DatePart (Month,Start)) As 'Number of Emergencycases Case'
	From [Dev].[dbo].[Stg_Encounters]
	Where Encounterclass = 'Emergency'
	And start > = '2010'
	Group By Encounterclass,DatePart(Month,Start)	)Final	Order By [Number of Emergencycases Case]Desc⁠--Now to find out the Top 15 years with the most immunizationsSELECT 
    YEAR([Date]) AS Year,
    COUNT(*) AS ImmunizationCount
FROM 
    [Dev].[dbo].[Stg_Immunizations]
GROUP BY 
    YEAR([Date])
ORDER BY 
    ImmunizationCount DESC
OFFSET 0 ROWS FETCH NEXT 15 ROWS ONLY;--ViewCREATE VIEW vwTop15YearsWithMostImmunizations AS
SELECT 
    YEAR([Date]) AS Year,
    COUNT(*) AS ImmunizationCount
FROM 
    [Dev].[dbo].[Stg_Immunizations]
GROUP BY 
    YEAR([Date])
ORDER BY 
    ImmunizationCount DESC
OFFSET 0 ROWS FETCH NEXT 15 ROWS ONLYSelect *From vwTop15YearsWithMostImmunizationsSelect *From --How you find,format dateSelect GetDate ()Select Format (GetDate (), 'yyyy-mm') As YearMonthSelect Format (GetDate (), 'yyyy-mm-dd') As YearMonthDay--To get Current DateSelect try_convert(Date, GetDate ()) As CurrentDate--To get year and monthSelect format (try_convert(Date, GetDate()),'yyyy-mm')As CurrentDate--To get the month from today's date Select DatePart(Month,GetDate()) As YearMonth