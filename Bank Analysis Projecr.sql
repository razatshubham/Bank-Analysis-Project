USE project;
SHOW TABLES;
SELECT * FROM finance_1;
SELECT * FROM finance_2;
SHOW TABLES;

-- KPI 1

SELECT RIGHT(issue_d,4) as year, SUM(loan_amnt) FROM finance_1 GROUP BY year;

-- KPI 2

SELECT f1.grade as grade, f1.sub_grade as sub_grade, sum(f2.revol_bal) as revol_bal
FROM finance_1 as f1 JOIN finance_2 as f2 USING(id) GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;

-- KPI 3

SELECT verification_status as status, ROUND(SUM(total_pymnt)) as payment
FROM finance GROUP BY status;

-- KPI 4

SELECT DISTINCT (f1.addr_state) as State, LAST_VALUE (f2.last_credit_pull_d)
OVER (PARTITION BY f1.addr_state) as Last_date, f1.loan_status as Loan_Status
FROM finance_1 as f1 JOIN finance_2 as f2 USING(id) ORDER BY state;

-- KPI 5

SELECT DISTINCT (f1.home_ownership) as owner, LAST_VALUE (f2.last_pymnt_d)
OVER (PARTITION BY f1.home_ownership) as Last_date FROM finance_1 as f1
Join finance_2 as f2 USING(id);



















