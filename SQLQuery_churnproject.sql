use churndb;
go

-- task2

-- TOTAL NO.OF CUSTOMERS
select count(customerID) as Total_Customers from dbo.customerchurn;

-- TOTAL NO.OF ROWS
select COUNT(*) as Total_Columns from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'CustomerChurn';

-- DISPLAY ALL RECORDS IN DATASET
select * from dbo.customerchurn;

-- DISPLAY TOP 10 CUSTOMER RECORDS
select top 10 * from customerchurn;

-- TASK3-SQL DATA MODELLING:CLEAN STRUCTURE & VIEWS 

-- CHECK COLUMN NAMES,DATA TYPE,IS NULL 
select ORDINAL_POSITION,COLUMN_NAME,DATA_TYPE,IS_NULLABLE from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='customerchurn' 
order by ORDINAL_POSITION;

-- CHECK NULL VALUES IN DATASET
SELECT
    COUNT(*) - COUNT(customerID) AS customerID_NULL,
    COUNT(*) - COUNT(tenure) AS tenure_NULL,
    COUNT(*) - COUNT(MonthlyCharges) AS MonthlyCharges_NULL,
    COUNT(*) - COUNT(TotalCharges) AS TotalCharges_NULL,
    COUNT(*) - COUNT(Contract) AS Contract_NULL,
    COUNT(*) - COUNT(Churn) AS Churn_NULL
FROM customerchurn;

-- TOTAL NO. OF  NULL VALUES IN TOTAL CHARGES
select count(*) as Null_Total_charges from dbo.customerchurn where TotalCharges is null;

-- IDENTIFY CUSTOMERS WITH NULL TOTAL CHARGES
select customerID,tenure,Monthlycharges,Totalcharges,churn from dbo.customerchurn where TotalCharges is null;

-- CREATE AND ALTER CLEAN VIEW
use churndb;
go
alter view dbo.vw_Churndata
as
select customerID,gender,SeniorCitizen,Partner,Dependents,tenure,PhoneService,MultipleLines,InternetService,OnlineSecurity,
    OnlineBackup,DeviceProtection,TechSupport,StreamingTV,StreamingMovies,Contract,PaperlessBilling,PaymentMethod,MonthlyCharges,
    TotalCharges,Churn
FROM dbo.CustomerChurn;
go 

-- TEST THE CLEAN VIEW
select TOP 10 * from dbo.vw_Churndata;
select count(*) as View_Total_Customers from dbo.vw_Churndata;

SELECT CUSTOMERID,TENURE,MONTHLYCHARGES,TOTALCHARGES FROM dbo.vw_ChurnData WHERE TOTALCHARGES IS NULL;



-- TASK 4: SQL EXPLORATORY DATA ANALYSIS

-- HOW MANY CUSTOMERS HAVE CHURNED?
select count(*) as Total_Churn_customers from vw_Churndata where Churn='yes';

-- WHAT PERCENTAGE OF CUSTOMERS HAVE CHURNED OVERALL?
select cast(
round(count(case when Churn='Yes' then 1 end)*100.0/
count(*),2) as decimal(5,2)) as churn_rate_percentage from vw_Churndata;

-- WHICH CONTRACT TYPE(MONTH-TO-MONTH,ONE YEAR,TWO YEAR) HAS THE HIGHEST CHURN RATE?
select contract,count(case when Churn='yes' then 1 end) as Churned_customers,
count(*) as Total_customers,cast(count(case when Churn='yes' then 1 end)*100.0/
count(*) as decimal(5,2)) as Churn_rate_percentage
from vw_Churndata group by contract order by Churn_rate_percentage desc;

-- DO CUSTOMERS WITH HIGHER MONTHLY CHARGES CHURN MORE?
select Churn,cast(AVG(monthlycharges) as decimal(5,2)) as Avg_monthly_charges from vw_Churndata group by Churn;

-- DOES TENURE (HOW LONG THEY'VE BEEN A CUSTOMER RELATE TO CHURN?
select churn,avg(tenure) as Avg_Tenure from vw_Churndata group by churn;

--DOES INTERNET SERVICE RELATE TO CHURN?
select internetservice,churn,count(*) as Total_customers from vw_Churndata group by internetservice,churn 
order by internetservice,churn ;

-- DOES TECH SUPPORT RELATE TO CHURN?
select techsupport,churn,count(*) as Total_customers from vw_Churndata group by techsupport,churn
order by techsupport,churn;

-- DOES PAYMENT Method RELATE TO CHURN?
select  PaymentMethod,Churn,
count(*) AS Total_Customers from dbo.vw_ChurnData group by PaymentMethod, Churn
order by PaymentMethod;

