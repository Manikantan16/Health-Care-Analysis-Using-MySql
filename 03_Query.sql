/*
3) What are the most common appointment times throughout the day, and how does the distribution of appointment times vary across different hours?
The late morning to early afternoon period, specifically between 9 AM and 12 PM, has the highest volume of appointments, with a noticeable peak at 12 PM. 
Patients tend to schedule more appointments between 9 AM and 12 PM, with the peak occurring at 12 PM.
*/
select row_number() over() as Sno, HOUR(STR_TO_DATE(appointment_time, '%l:%i%p')) AS Appointment_time, Count(Visit_Id) as Appointee_count
from tblappointmentanalysis 
group by HOUR(STR_TO_DATE(appointment_time, '%l:%i%p'))
order by HOUR(STR_TO_DATE(appointment_time, '%l:%i%p'))