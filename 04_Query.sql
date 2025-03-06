/*
4) What are the most common lab tests?
The top three lab tests performed are Chloride, Fasting Blood Sugar, ALT, and Thyroid Stimulating Hormone.
*/
WITH CTE_LABResults
AS
(
	select  count(*) as Test_Count,Test_Name
	from tbllabresults
	group by Test_Name
)
 
select row_number() over(order by test_count desc) as Sno, Test_Count,Test_Name
from CTE_LABResults
