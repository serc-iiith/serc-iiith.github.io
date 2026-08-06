-- =========================================================================
-- ADVANCED SQL CONCEPTS SCRIPT
-- Builds upon the Departments, Employees, Projects, and Project_Assignments schema
-- Includes: UDFs, Triggers, Indexes, Views, Materialized Views (Simulated),
--           Transactions/ACID control, Window Functions, and Constraints.
-- =========================================================================

-- 1. SETUP SCHEMA WITH ADVANCED CONSTRAINTS
DROP TABLE IF EXISTS Audit_Log;
DROP TABLE IF EXISTS Project_Assignments;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    manager_id INT,
    salary DECIMAL(10,2) CHECK (salary > 0),
    hire_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'ON_LEAVE', 'TERMINATED')),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE SET NULL,
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id) ON DELETE SET NULL
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2) CHECK (budget >= 0)
);

CREATE TABLE Project_Assignments (
    emp_id INT,
    project_id INT,
    hours_worked INT CHECK (hours_worked >= 0),
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE
);

-- Audit table for triggers
CREATE TABLE Audit_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50),
    table_name VARCHAR(50),
    record_id INT,
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details TEXT
);

-- Insert Sample Data
INSERT INTO Departments VALUES (1, 'Engineering', 'New York');
INSERT INTO Departments VALUES (2, 'HR', 'Chicago');
INSERT INTO Departments VALUES (3, 'Sales', 'San Francisco');

INSERT INTO Employees VALUES (101, 'Alice Smith', 1, NULL, 120000.00, '2018-03-15', 'ACTIVE');
INSERT INTO Employees VALUES (102, 'Bob Jones', 1, 101, 85000.00, '2020-06-01', 'ACTIVE');
INSERT INTO Employees VALUES (103, 'Charlie Brown', 2, 101, 60000.00, '2019-11-20', 'ACTIVE');
INSERT INTO Employees VALUES (104, 'Diana Prince', 3, 103, 95000.00, '2021-01-10', 'ACTIVE');
INSERT INTO Employees VALUES (105, 'Evan Wright', 1, 102, 75000.00, '2022-05-14', 'ACTIVE');

INSERT INTO Projects VALUES (501, 'Cloud Migration', 150000.00);
INSERT INTO Projects VALUES (502, 'HR Portal Upgrade', 40000.00);
INSERT INTO Projects VALUES (503, 'Global Sales Expansion', 200000.00);

INSERT INTO Project_Assignments VALUES (101, 501, 120);
INSERT INTO Project_Assignments VALUES (102, 501, 160);
INSERT INTO Project_Assignments VALUES (103, 502, 90);
INSERT INTO Project_Assignments VALUES (104, 503, 200);
INSERT INTO Project_Assignments VALUES (105, 501, 80);


-- =========================================================================
-- SECTION 1: USER-DEFINED FUNCTIONS (UDFs)
-- =========================================================================
DELIMITER //

-- Function 1: Scalar Function to calculate annual compensation including an estimated bonus
CREATE FUNCTION CalculateAnnualComp(p_salary DECIMAL(10,2), p_bonus_pct DECIMAL(5,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN p_salary + (p_salary * (p_bonus_pct / 100.0));
END //

-- Function 2: Scalar Function to check if an employee is a senior member (over 5 years tenure)
CREATE FUNCTION IsSeniorEmployee(p_hire_date DATE)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF DATEDIFF(CURRENT_DATE(), p_hire_date) > (365 * 5) THEN
        RETURN 'YES';
    ELSE
        RETURN 'NO';
    END IF;
END //

DELIMITER ;

-- Example usage of UDFs:
-- SELECT emp_name, salary, CalculateAnnualComp(salary, 10.5) AS total_comp, IsSeniorEmployee(hire_date) AS is_senior FROM Employees;


-- =========================================================================
-- SECTION 2: TRIGGERS
-- =========================================================================
DELIMITER //

-- Trigger 1: After Insert Trigger to log new employee additions in Audit_Log
CREATE TRIGGER trg_after_employee_insert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (action_type, table_name, record_id, details)
    VALUES ('INSERT', 'Employees', NEW.emp_id, CONCAT('Added employee: ', NEW.emp_name, ' with salary ', NEW.salary));
END //

-- Trigger 2: Before Update Trigger to prevent salary cuts (enforces business rule)
CREATE TRIGGER trg_before_employee_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Operation aborted: Employee salary reductions are not permitted.';
    END IF;
END //

DELIMITER ;


-- =========================================================================
-- SECTION 3: INDEXES & PERFORMANCE OPTIMIZATION
-- =========================================================================

-- Index 1: B-Tree Index on Employee names for fast lookups
CREATE INDEX idx_employee_name ON Employees(emp_name);

-- Index 2: Composite Index on Department ID and Salary for analytical filters
CREATE INDEX idx_dept_salary ON Employees(dept_id, salary);

-- Query performance analysis command
EXPLAIN SELECT * FROM Employees WHERE dept_id = 1 AND salary > 80000;


-- =========================================================================
-- SECTION 4: VIEWS & MATERIALIZED VIEWS (Simulated via regular table refresh)
-- =========================================================================

-- View 1: Standard View showing employee summary with department names
CREATE VIEW vw_EmployeeDetails AS
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    d.location,
    e.salary,
    e.hire_date
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id;

-- View 2: Aggregated Summary View for department payroll totals
CREATE VIEW vw_DepartmentPayrollSummary AS
SELECT 
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    COALESCE(SUM(e.salary), 0) AS total_payroll,
    COALESCE(AVG(e.salary), 0) AS average_salary
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- Simulated Materialized View: A physical table updated periodically for reporting
CREATE TABLE mv_ProjectWorkloadSummary (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    total_assigned_staff INT,
    total_hours_logged INT,
    budget DECIMAL(12,2)
);

-- Procedure to refresh the "Materialized View"
DELIMITER //
CREATE PROCEDURE RefreshProjectWorkloadSummary()
BEGIN
    TRUNCATE TABLE mv_ProjectWorkloadSummary;
    
    INSERT INTO mv_ProjectWorkloadSummary
    SELECT 
        p.project_id,
        p.project_name,
        COUNT(pa.emp_id),
        COALESCE(SUM(pa.hours_worked), 0),
        p.budget
    FROM Projects p
    LEFT JOIN Project_Assignments pa ON p.project_id = pa.project_id
    GROUP BY p.project_id, p.project_name, p.budget;
END //
DELIMITER ;

-- Call the refresh procedure
CALL RefreshProjectWorkloadSummary();


-- =========================================================================
-- SECTION 5: TRANSACTIONS & ACID CONTROL
-- =========================================================================

-- Example: Transaction handling safe department reassignment and budget reallocation
START TRANSACTION;

-- Step 1: Update employee department
UPDATE Employees 
SET dept_id = 2 
WHERE emp_id = 105;

-- Step 2: Check for conditional rollback or commit execution
-- (If any error condition occurs, developers would call ROLLBACK)
COMMIT;


-- =========================================================================
-- SECTION 6: ADVANCED WINDOW FUNCTIONS
-- =========================================================================

-- Window Function 1: Ranking employees by salary inside their department using RANK()
SELECT 
    emp_name,
    dept_id,
    salary,
    RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_salary_rank
FROM Employees;

-- Window Function 2: Cumulative running total of project hours using SUM() OVER
SELECT 
    emp_id,
    project_id,
    hours_worked,
    SUM(hours_worked) OVER (ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_hours
FROM Project_Assignments;

-- Window Function 3: Comparing individual salary against department average using window aggregations
SELECT 
    emp_name,
    dept_id,
    salary,
    AVG(salary) OVER (PARTITION BY dept_id) AS dept_avg_salary,
    salary - AVG(salary) OVER (PARTITION BY dept_id) AS diff_from_dept_avg
FROM Employees;
