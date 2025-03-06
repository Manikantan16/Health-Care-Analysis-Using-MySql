/*
6)Assess how many patients are considered High, Medium, and Low Risk.
o
High Risk: patients who are smokers and have been diagnosed with either hypertension or diabetes.
o
Medium Risk: patients who are non-smokers and have been diagnosed with either hypertension or diabetes.
o
Low Risk: patients who do not fall into the High or Medium Risk categories. This includes patients who are not smokers and
 do not have a diagnosis of hypertension or diabetes.
 */
--  use capstoneprojects;
 -- Select * from tblpatients;
 -- select * from tbloutpatientvisits where Diagnosis not in ('Hypertension','Diabetes');

WITH CTE_RiskAssessment 
as
(
 Select count(patient_id) as Risk_Status_Count, 
	case when smoker_status = 'Y' and  Diagnosis in ('Hypertension','Diabetes') then 'HighRisk'
		 when smoker_status = 'N' and  Diagnosis in ('Hypertension','Diabetes') then 'MediumRisk' 
         else 'LowRisk' End as Risk_Status
 from tbloutpatientvisits
 group by Risk_Status
 )
 Select row_number() over (order by risk_status_count) as Sno,Risk_Status,Risk_Status_Count
 from CTE_RiskAssessment 