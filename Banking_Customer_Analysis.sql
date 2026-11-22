create database banking;
use banking;
show tables;

select * from customer
limit 5;

DESCRIBE customer;
SHOW CREATE TABLE customer;
SHOW COLUMNS FROM customer;
ALTER TABLE customer
CHANGE COLUMN `ï»¿Client ID` Client_ID TEXT;

select count(*) as Total_Records
from customer;

select count(distinct Client_ID) AS Uniuque_Customers
from customer;

select round(avg(age),2) as Average_Age
from customer;

select Round(avg('Estimated Income'),2) as Average_Income
from customer;

select round(sum(`Bank Deposits`),2) as Total_Deposits
from customer;

select 'Bank Deposits'
from customer
limit 10;

SELECT COUNT(*) FROM customer;

SHOW COLUMNS FROM customer LIKE 'Bank Deposits';

SELECT Client_ID, Name, `Bank Deposits`
FROM customer
LIMIT 10;

SELECT MIN(`Bank Deposits`), MAX(`Bank Deposits`)
FROM customer;

SELECT 
    COUNT(*) AS Total_Records,
    SUM(`Bank Deposits`) AS Total_Deposits,
    AVG(`Bank Deposits`) AS Average_Deposits
FROM customer;
select sum(`Bank Deposits`) as Total_Deposits
from customer;

# Total Bank Loans
select sum(`Bank Loans`) as Total_Loans
from customer;

# Average Credit Score Balance
SELECT ROUND(AVG(`Credit Card Balance`), 2) AS Avg_CC_Balance
FROM customer;

# Total superannuation savings
SELECT ROUND(SUM(`Superannuation Savings`), 2) AS Total_Savings
FROM customer;

# Average risk weighting
SELECT ROUND(AVG(`Risk Weighting`), 2) AS Avg_Risk
FROM customer;
 
 # Total properties owned
SELECT SUM(`Properties Owned`) AS Total_Properties
FROM customer;

# Customers by nationality
SELECT Nationality, COUNT(*) AS Total_Customers
FROM customer
GROUP BY Nationality
ORDER BY Total_Customers DESC;

# Customers by occupation
SELECT Occupation, COUNT(*) AS Total_Customers
FROM customer
GROUP BY Occupation
ORDER BY Total_Customers DESC;

# Customers by loyalty classification
SELECT `Loyalty Classification`, COUNT(*) AS Total_Customers
FROM customer
GROUP BY `Loyalty Classification`
ORDER BY Total_Customers DESC;

# Customers by fee structure
SELECT `Fee Structure`, COUNT(*) AS Total_Customers
FROM customer
GROUP BY `Fee Structure`
ORDER BY Total_Customers DESC;

# Customers by gender ID
SELECT GenderId, COUNT(*) AS Total_Customers
FROM customer
GROUP BY GenderId
ORDER BY Total_Customers DESC;

# Average income by occupation
SELECT Occupation, ROUND(AVG(`Estimated Income`), 2) AS Avg_Income
FROM customer
GROUP BY Occupation
ORDER BY Avg_Income DESC;

# Total deposits by loyalty classification
SELECT `Loyalty Classification`,
ROUND(SUM(`Bank Deposits`), 2) AS Total_Deposits
FROM customer
GROUP BY `Loyalty Classification`
ORDER BY Total_Deposits DESC;

# Average loans by fee structure
SELECT `Fee Structure`, ROUND(AVG(`Bank Loans`), 2) AS Avg_Loans
FROM customer
GROUP BY `Fee Structure`;

# Average risk by loyalty classification
SELECT `Loyalty Classification`,
ROUND(AVG(`Risk Weighting`), 2) AS Avg_Risk
FROM customer
GROUP BY `Loyalty Classification`
ORDER BY Avg_Risk DESC;

# Top 10 customers by bank deposits
SELECT Client_ID, Name, `Bank Deposits`
FROM customer
ORDER BY `Bank Deposits` DESC
LIMIT 10;

# Top 10 customers by income
SELECT Client_ID, Name, `Estimated Income`
FROM customer
ORDER BY `Estimated Income` DESC
LIMIT 10;

# Top 10 customers by loans
SELECT Client_ID, Name, `Bank Loans`
FROM customer
ORDER BY `Bank Loans` DESC
LIMIT 10;

# Customers with deposits above average
SELECT Client_ID, Name, `Bank Deposits`
FROM customer
WHERE `Bank Deposits` > (SELECT AVG(`Bank Deposits`) FROM customer)
ORDER BY `Bank Deposits` DESC;

# Customer count by age group
SELECT
    CASE
        WHEN Age <= 25 THEN '18-25'
        WHEN Age <= 35 THEN '26-35'
        WHEN Age <= 45 THEN '36-45'
        WHEN Age <= 55 THEN '46-55'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Customers
FROM customer
GROUP BY Age_Group
ORDER BY Age_Group;

# Total deposits and loans by nationality
SELECT Nationality,
       ROUND(SUM(`Bank Deposits`), 2) AS Total_Deposits,
       ROUND(SUM(`Bank Loans`), 2) AS Total_Loans
FROM customer
GROUP BY Nationality
ORDER BY Total_Deposits DESC;