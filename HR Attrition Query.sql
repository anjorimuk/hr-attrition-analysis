USE hr_analysis;
-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employeedata;
-- Overall Attrition Rate
SELECT Attrition, COUNT(*) AS employee_count
FROM employeedata
GROUP BY Attrition;
-- Attrition by Department
SELECT Department, COUNT(*) AS employees_left
FROM employeedata
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY employees_left DESC;
-- Attrition and Overtime
SELECT OverTime, COUNT(*) AS employees_left
FROM employeedata
WHERE Attrition = 'Yes'
GROUP BY OverTime
ORDER BY employees_left DESC;
-- Average salary by department
SELECT Department, AVG(MonthlyIncome) AS avg_salary
FROM employeedata
GROUP BY Department
ORDER BY avg_salary DESC;
-- Average salary by job role
SELECT JobRole, AVG(MonthlyIncome) AS avg_salary
FROM employeedata
GROUP BY JobRole
ORDER BY avg_salary DESC;
-- Tenure and Attrition
SELECT YearsAtCompany, COUNT(*) AS employees_left
FROM employeedata
WHERE Attrition = 'Yes'
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
-- Employees earning above the company average salary
SELECT EmployeeNumber, MonthlyIncome
FROM employeedata
WHERE MonthlyIncome >
      (SELECT AVG(MonthlyIncome) FROM employeedata);
  -- Departments with above average salary
  SELECT Department, AVG(MonthlyIncome) AS avg_salary
FROM employeedata
GROUP BY Department
HAVING AVG(MonthlyIncome) >
       (SELECT AVG(MonthlyIncome) FROM employeedata);
-- Attrition Rate Percentage
SELECT 
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS attrition_rate
FROM employeedata;
-- Attrition by job role 
SELECT JobRole, COUNT(*) AS employees_left
FROM employeedata
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY employees_left DESC;
-- Average salary of employees who left vs stayed
SELECT Attrition, AVG(MonthlyIncome) AS avg_salary
FROM employeedata
GROUP BY Attrition;
-- Attrition by tenure (years at the company)
SELECT YearsAtCompany, COUNT(*) AS employees_left
FROM employeedata
WHERE Attrition = 'Yes'
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
-- Promotion Patterns
SELECT EmployeeNumber, YearsSinceLastPromotion
FROM employeedata
ORDER BY YearsSinceLastPromotion DESC
LIMIT 10;

      
      