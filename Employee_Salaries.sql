# Employee Salaries SQL Queries 📊  
This folder contains SQL queries for analyzing salaries across departments and job roles.

## 📌 Queries Included:
- **Average Salary Per Department:** `Average_Salary_By_Department.sql`
- **Salary Analysis by Job Title:** `Salary_Analysis_By_Job_Title.sql`
- **Highest & Lowest Salary Per Department:** `High_Low_Salary_Per_Department.sql`
- **Departments with Above-Average Salaries:** `Above_Avg_Salary_Departments.sql`

🚀 Feel free to use and modify these queries for your projects!

- **Basic Query: Average Salary per Department 
  

SELECT 
    department_id, 
    AVG (salary) AS average_salary
FROM 
    employees
GROUP BY 
    department_id
ORDER BY 
    average_salary DESC;







... # If you have a departments table, use a JOIN to show department names instead of IDs:
  this rounds salary to 2 decimal places and this is a more readable output for reports 

SELECT 
    d.department_name, 
    ROUND(AVG(e.salary), 2) AS average_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    average_salary DESC;








# Query Average Salary Per Department and job Title, 
  this shows the average salary for each job role , 
  when results ordered by departments and highest salary

SELECT 
    d.department_name, 
    e.job_title, 
    ROUND(AVG(e.salary), 2) AS average_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name, e.job_title
ORDER BY 
    d.department_name, average_salary DESC;






# Query: Highest, lowest , and average salaries per department. 
  sorted by highest-paid departments 

SELECT 
    d.department_name, 
    MAX(e.salary) AS highest_salary, 
    MIN(e.salary) AS lowest_salary, 
    ROUND(AVG(e.salary), 2) AS average_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    highest_salary DESC;




# - **Query: Departments with Salaries Above and Overall Average, 
  this shows departments where average slalry is above the company average 

SELECT 
    d.department_name, 
    ROUND(AVG(e.salary), 2) AS department_avg_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
HAVING 
    AVG(e.salary) > (SELECT AVG(salary) FROM employees)
ORDER BY 
    department_avg_salary DESC;


