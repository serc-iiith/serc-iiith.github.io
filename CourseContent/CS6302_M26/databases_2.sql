

-- 1. SETUP SCHEMA AND SAMPLE DATA
DROP TABLE IF EXISTS Project_Assignments;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    manager_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(12,2)
);

CREATE TABLE Project_Assignments (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Insert Sample Data
INSERT INTO Departments VALUES (1, 'Engineering', 'New York');
INSERT INTO Departments VALUES (2, 'HR', 'Chicago');
INSERT INTO Departments VALUES (3, 'Sales', 'San Francisco');

INSERT INTO Employees VALUES (101, 'Alice Smith', 1, NULL, 120000.00, '2018-03-15');
INSERT INTO Employees VALUES (102, 'Bob Jones', 1, 101, 85000.00, '2020-06-01');
INSERT INTO Employees VALUES (103, 'Charlie Brown', 2, 101, 60000.00, '2019-11-20');
INSERT INTO Employees VALUES (104, 'Diana Prince', 3, 103, 95000.00, '2021-01-10');
INSERT INTO Employees VALUES (105, 'Evan Wright', 1, 102, 75000.00, '2022-05-14');

INSERT INTO Projects VALUES (501, 'Cloud Migration', 150000.00);
INSERT INTO Projects VALUES (502, 'HR Portal Upgrade', 40000.00);
INSERT INTO Projects VALUES (503, 'Global Sales Expansion', 200000.00);

INSERT INTO Project_Assignments VALUES (101, 501, 120);
INSERT INTO Project_Assignments VALUES (102, 501, 160);
INSERT INTO Project_Assignments VALUES (103, 502, 90);
INSERT INTO Project_Assignments VALUES (104, 503, 200);
INSERT INTO Project_Assignments VALUES (105, 501, 80);


-- =========================================================================
-- SECTION 1: SUB QUERIES (4 Examples)
-- =========================================================================

-- Subquery Example 1: Employees earning more than the overall average salary
SELECT emp_name, salary 
FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- Subquery Example 2: Departments that have employees making over 100,000
SELECT dept_name 
FROM Departments 
WHERE dept_id IN (SELECT dept_id FROM Employees WHERE salary > 100000);

-- Subquery Example 3 (Correlated): Employees earning more than the average salary of their specific department
SELECT e.emp_name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM Employees 
    WHERE dept_id = e.dept_id
);

-- Subquery Example 4: Projects with a budget higher than the average budget of all projects
SELECT project_name, budget 
FROM Projects 
WHERE budget > (SELECT AVG(budget) FROM Projects);


-- =========================================================================
-- SECTION 2: COMMON TABLE EXPRESSIONS / CTEs (4 Examples)
-- =========================================================================

-- CTE Example 1: Basic CTE calculating total payroll per department
WITH DeptPayroll AS (
    SELECT dept_id, SUM(salary) AS total_payroll
    FROM Employees
    GROUP BY dept_id
)
SELECT d.dept_name, dp.total_payroll
FROM Departments d
JOIN DeptPayroll dp ON d.dept_id = dp.dept_id;

-- CTE Example 2: Multiple CTEs tracking high budgets and project workloads
WITH HighBudgetProjects AS (
    SELECT project_id, project_name 
    FROM Projects 
    WHERE budget > 50000
),
AssignedStaff AS (
    SELECT pa.project_id, COUNT(pa.emp_id) AS staff_count
    FROM Project_Assignments pa
    GROUP BY pa.project_id
)
SELECT hb.project_name, a.staff_count
FROM HighBudgetProjects hb
JOIN AssignedStaff a ON hb.project_id = a.project_id;

-- CTE Example 3: CTE for ranking employee salaries using window functions
WITH RankedSalaries AS (
    SELECT emp_name, salary, dept_id,
           RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) as salary_rank
    FROM Employees
)
SELECT * FROM RankedSalaries WHERE salary_rank = 1;

-- CTE Example 4: Recursive CTE for organizational hierarchy (Manager chain)
WITH RECURSIVE OrgHierarchy AS (
    -- Anchor: Top-level managers
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM Employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive step: Direct reports
    SELECT e.emp_id, e.emp_name, e.manager_id, oh.level + 1
    FROM Employees e
    JOIN OrgHierarchy oh ON e.manager_id = oh.emp_id
)
SELECT * FROM OrgHierarchy;


-- =========================================================================
-- SECTION 3: STORED PROCEDURES (4 Examples)
-- =========================================================================
DELIMITER //

-- Stored Procedure Example 1: Add a new employee safely
CREATE PROCEDURE AddEmployee (
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_dept INT,
    IN p_manager INT,
    IN p_salary DECIMAL(10,2),
    IN p_hire DATE
)
BEGIN
    INSERT INTO Employees (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
    VALUES (p_id, p_name, p_dept, p_manager, p_salary, p_hire);
END //

-- Stored Procedure Example 2: Update employee salary by ID
CREATE PROCEDURE UpdateSalary (
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees 
    SET salary = p_new_salary 
    WHERE emp_id = p_emp_id;
END //

-- Stored Procedure Example 3: Get total department employee count and payroll via OUT parameters
CREATE PROCEDURE GetDeptStats (
    IN p_dept_id INT,
    OUT p_emp_count INT,
    OUT p_total_salary DECIMAL(12,2)
)
BEGIN
    SELECT COUNT(*), COALESCE(SUM(salary), 0)
    INTO p_emp_count, p_total_salary
    FROM Employees
    WHERE dept_id = p_dept_id;
END //

-- Stored Procedure Example 4: Conditional procedure to give bonuses based on hire date
CREATE PROCEDURE ApplyTenureBonus (
    IN p_dept_id INT,
    IN p_bonus_amount DECIMAL(8,2)
)
BEGIN
    UPDATE Employees
    SET salary = salary + p_bonus_amount
    WHERE dept_id = p_dept_id 
      AND hire_date < '2020-01-01';
END //

DELIMITER ;


-- =========================================================================
-- SECTION 4: CURSORS (4 Examples)
-- =========================================================================
DELIMITER //

-- Cursor Example 1: Iterate and print names/salaries of all employees
CREATE PROCEDURE CursorPrintAllEmployees()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_name VARCHAR(100);
    DECLARE v_sal DECIMAL(10,2);
    
    DECLARE cur CURSOR FOR SELECT emp_name, salary FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_name, v_sal;
        IF v_done = 1 THEN LEAVE read_loop; END IF;
        -- Outputs the row data
        SELECT CONCAT('Employee: ', v_name, ' | Salary: ', v_sal);
    END LOOP;
    CLOSE cur;
END //

-- Cursor Example 2: Cursor to grant automated inflation raises to low earners
CREATE PROCEDURE CursorInflationAdjustment()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_sal DECIMAL(10,2);
    
    DECLARE cur CURSOR FOR SELECT emp_id, salary FROM Employees WHERE salary < 80000;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_sal;
        IF v_done = 1 THEN LEAVE read_loop; END IF;
        
        -- Apply a 10% raise to everyone under 80,000
        UPDATE Employees SET salary = v_sal * 1.10 WHERE emp_id = v_id;
    END LOOP;
    CLOSE cur;
END //

-- Cursor Example 3: Cursor simulating a summary logger (calculating running cumulative budget allocation)
CREATE PROCEDURE CursorLogHighBudgetProjects()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_pname VARCHAR(100);
    DECLARE v_budget DECIMAL(12,2);
    
    DECLARE cur CURSOR FOR SELECT project_name, budget FROM Projects;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_pname, v_budget;
        IF v_done = 1 THEN LEAVE read_loop; END IF;
        
        IF v_budget > 100000 THEN
            SELECT CONCAT('High Priority Project Alert: ', v_pname, ' with budget ', v_budget);
        END IF;
    END LOOP;
    CLOSE cur;
END //

-- Cursor Example 4: Cursor to clean up / audit employee assignments 
CREATE PROCEDURE CursorAuditAssignments()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_emp INT;
    DECLARE v_proj INT;
    DECLARE v_hours INT;
    
    DECLARE cur CURSOR FOR SELECT emp_id, project_id, hours_worked FROM Project_Assignments;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_emp, v_proj, v_hours;
        IF v_done = 1 THEN LEAVE read_loop; END IF;
        
        -- Custom audit check logic row-by-row
        IF v_hours > 150 THEN
            SELECT CONCAT('Heavy workload detected for Emp ID: ', v_emp, ' on Project ID: ', v_proj);
        END IF;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;