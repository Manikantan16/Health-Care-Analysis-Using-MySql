-- 2) Which diagnoses are most prevalent among patients and how do they vary across the different demographic groups, including gender and age?

Select row_number() over(order by Gender asc,Age_Group asc,Diagnosis asc) as Sno, Gender,Age_Group,Diagnosis,Count(*)  as Patient_Count
from
(
	   Select Gender as Gender,Case when age < 18 then 'Pediatric'
			when age between 18 and 64 then 'Adult' 
			else 'Senior' end as Age_Group, case OV.Diagnosis when '' then 'No Diagnosis' else OV.Diagnosis end as Diagnosis
		from
		(
			Select *, floor(DATEDIFF(CURDATE(), DATE_FORMAT(STR_TO_DATE(date_of_birth, '%d-%m-%Y'), '%Y-%m-%d'))/365) as Age
			from tblPatients
		) as TblResult
	   inner  join tbloutpatientvisits OV
		on TblResult.Patient_Id = OV.Patient_Id
    ) as TblFinal
    group by Gender,Age_Group,Diagnosis
    order by Gender asc,Age_Group asc,Diagnosis asc
    
    
    
    -- select * from tbloutpatientvisits;
   