SELECT department_id, SUM(salary) as "Sum Salary", 
  NTILE (4) over (order by SUM(salary) DESC) as "Bucket#"
FROM Employees
GROUP BY department_id
ORDER BY 3;

SELECT employee_id, last_name, salary, department_id,
        rank() over (partition by department_id order by salary desc) "Rank",
        dense_rank() over (partition by department_id order by salary desc) "Dense_Rank",
        row_number() over (partition by department_id order by salary desc) "Dense_Rank"
  FROM Employees;