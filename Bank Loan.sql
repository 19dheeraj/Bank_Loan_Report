select count(id) as Total_Loan_Application from bankloandb.bank_loan_data

select count(id) as Total_Loan_Application from bankloandb.bank_loan_data
where month(issue_date)=12 AND yeear(issue_date)=2021

select sum(loan_amount) as Total_Funded_amount from bankloandb.bank_loan_data

select sum(loan_amount) as MTD_Total_Funded_amount from bankloandb.bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

select sum(loan_amount) as PMTD_Total_Funded_amount from bankloandb.bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

select sum(total_payment) as Total_Received_Amount from bankloandb.bank_loan_data

select sum(total_payment) as MTD_Total_Received_Amount from bankloandb.bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

select sum(total_payment) as PMTD_Total_Received_Amount from bankloandb.bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

select AVG(int_rate)*100 as AVG_interest_rate from bankloandb.bank_loan_data

select round(AVG(int_rate)*100,2) as AVG_interest_rate from bankloandb.bank_loan_data

select round(AVG(int_rate)*100,2) as MTD_AVG_interest_rate from bankloandb.bank_loan_data
where month(issue_date)=12 

select round(AVG(int_rate)*100,2) as PMTD_AVG_interest_rate from bankloandb.bank_loan_data
where month(issue_date)=11 

select round(avg(dti)*100,2) as AVG_dti from bankloandb.bank_loan_data

select round(avg(dti)*100,2) as MTD_AVG_dti from bankloandb.bank_loan_data
where month(issue_date)=12 

select round(avg(dti)*100,2) as PMTD_AVG_dti from bankloandb.bank_loan_data
where month(issue_date)=11 

select loan_status from bankloandb.bank_loan_data
~~good_loan

select
(count(case when loan_status='Fully Paid' or loan_status='Current' then id END)*100)
/
count(id) as Good_Loan_percentage
from bankloandb.bank_loan_data

select count(id) as Good_loan_application from bankloandb.bank_loan_data
where loan_status='Fully Piad' or loan_status='Current'


select sum(loan_amount) as Good_funded_amount from bankloandb.bank_loan_data
where loan_status='Fully Piad' or loan_status='Current'


select sum(total_payment) as Good_loan_recevied from bankloandb.bank_loan_data
where loan_status='Fully Piad' or loan_status='Current'

~~bad_loan

select
(count(case when loan_status='Charged Off' then id END)*100)
/
count(id) as bad_Loan_percentage
from bankloandb.bank_loan_data

select count(id) as bad_loan_application from bankloandb.bank_loan_data
where loan_status='Charde Off'

select sum(loan_amount) as bad_loan_funded_amount from bankloandb.bank_loan_data
where loan_status='Charde Off'

select sum(total_payment) as bad_loan_received from bankloandb.bank_loan_data
where loan_status='Charde Off'

~~loan_status

select 
loan_status,
count(id) as Totsl_loan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as Total_Funded_Amount,
AVG(int_rate*100) as Interest_rate,
AVG(dti*100) as DTI
from bankloandb.bank_loan_data
group by loan_status

select
loan_status,
sum(total_payment) as MTD_total_amount_received,
sum(loan_amount) as MTD_total_amount_funded from bankloan.bank_loan_data
where month(issue_date) = 12
group by loan_status


select 
month(issue_date) as Month_nummber,
DATENAME(month,issue_date) as Month_name,
count(id) as Total_loan_application,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
from bankloandb.bank_loan_data
group by month(issue_date), DATENAME(month,issue_date)
order by month(issue_date)


select 
address_state,
count(id) as Total_loan_application,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
from bankloandb.bank_loan_data
group by address_state
order by Total_loan_application desc


select 
term ,
count(id) as Total_loan_application,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
from bankloandb.bank_loan_data
group by term
order by total_loan_application desc


select 
emp_lenght ,
count(id) as Total_loan_application,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
from bankloandb.bank_loan_data
group by emp_lenght
order by count(id) desc


select 
purpose ,
count(id) as Total_loan_application,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
from bankloandb.bank_loan_data
group by purpose
order by count(id) desc


select 
home_ownership,
count(id) as Total_loan_application,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
from bankloandb.bank_loan_data
group by home_ownership
order by count(id) desc