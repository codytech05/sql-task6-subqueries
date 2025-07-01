USE company_db;

CREATE TABLE employess (
    emp_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER
);

CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT
);

INSERT INTO employess VALUES
(1, 'OP', 'HR', 50000),
(2, 'Ashish', 'IT', 60000),
(3, 'Amit', 'HR', 55000),
(4, 'Akash', 'Finance', 52000),
(5, 'Eva', 'IT', 70000);

-- Scalar Subquery
SELECT name, salary,
    (SELECT AVG(salary) FROM employess) AS avg_salary
FROM employess;

-- Subquery in WHERE Clause
SELECT name FROM employess
WHERE salary > (SELECT AVG(salary) FROM employess);

-- Subquery in FROM Clause (Derived Table)
SELECT dept, AVG(salary) AS avg_salary
FROM (SELECT department AS dept, salary FROM employess) AS dept_salaries
GROUP BY dept;

-- Correlated Subquery
SELECT name, salary
FROM employess e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employess e2
    WHERE e1.department = e2.department
);

-- EXISTS Clause
SELECT name
FROM employess e
WHERE EXISTS (
    SELECT 1 FROM departments d
    WHERE d.dept_name = e.department
);
