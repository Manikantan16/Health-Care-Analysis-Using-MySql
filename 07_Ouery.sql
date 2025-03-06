
SELECT row_number() over() as Sno, Ov1.patient_id, 
		Ov1.visit_date AS Initial_Visit_Date, Ov1.reason_for_visit AS Initial_Visit_Reason,
		Ov2.visit_date AS ReVisit_Date, Ov2.reason_for_visit AS ReVisit_Reason,
        timestampdiff(day,STR_TO_DATE(Ov1.Visit_Date, '%d-%m-%Y'),STR_TO_DATE(Ov2.Visit_Date, '%d-%m-%Y')) AS Days_Between_Initial_and_Revisit
FROM tbloutpatientvisits Ov1
INNER JOIN tbloutpatientvisits Ov2
ON Ov1.patient_id = Ov2.patient_id
WHERE  timestampdiff(day,STR_TO_DATE(Ov1.Visit_Date, '%d-%m-%Y'),STR_TO_DATE(Ov2.Visit_Date, '%d-%m-%Y')) <= 30
and STR_TO_DATE(Ov2.Visit_Date, '%d-%m-%Y') > STR_TO_DATE(Ov1.Visit_Date, '%d-%m-%Y')
