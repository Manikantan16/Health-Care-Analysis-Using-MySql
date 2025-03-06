/*
-- 5) Typically, fasting blood sugar levels fall between 70-100 mg/dL. 
Identify patients whose lab results are outside this normal range to implement early intervention.
*/
use Capstoneprojects;
select * from tbllabresults;
select * from tblpatients;
select * from tblhospitalrecords;

select row_number() over(order by p.patient_id) as Sno,p.patient_id,P.Patient_name,result_value
 from tblpatients P 
inner join tbloutpatientvisits OV on P.patient_Id = OV.patient_Id
inner join tbllabresults lr on Lr.Visit_id = OV.Visit_Id
where lr.test_name = 'Fasting Blood Sugar'
and result_value < 70 or result_value > 100
