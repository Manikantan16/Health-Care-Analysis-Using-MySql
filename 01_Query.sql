/*
Analysis and Insights:
1) What is the demographic profile of the patient population, including age and gender distribution?
o
Pediatric: less than 18 years old
o
Adult: Between 18 to 64 years old
o
Senior: Over 65 years old
*/

select Tot_Patients,Age_Group,Gender,Count(Patient_Id) as Age_Group_GenderWise_Count
from
(
	Select Tot_Patients, Patient_Id,Gender,age,Case when age < 18 then 'Pediatric'
		when age between 18 and 64 then 'Adult' 
		else 'Senior' end as Age_Group
	from
	(
		Select *, floor(DATEDIFF(CURDATE(), DATE_FORMAT(STR_TO_DATE(date_of_birth, '%d-%m-%Y'), '%Y-%m-%d'))/365) as Age,count(*) over() as Tot_Patients
		from tblPatients
	) as TblResult
) as TblFinal group by Gender,Age_Group,Tot_Patients
order by Age_Group asc,Gender desc;


