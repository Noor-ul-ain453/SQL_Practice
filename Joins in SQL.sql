 -- Create Employees Table
CREATE TABLE Employees3 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- Insert Data into Employees
INSERT INTO Employees3 (first_name, last_name, department_id)
VALUES
('Rahul', 'Sharma', 101),
('Priya', 'Mehta', 102),
('Ankit', 'Verma', 103),
('Simran', 'Kaur', NULL),
('Aman', 'Singh', 101);

SELECT * FROM employees3;
-- Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert Data into Departments
INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');


SELECT * FROM Departments;

       --inner join  (common in both tables)
SELECT e.employee_id, e.first_name, e.last_name, 
		d.department_id, d.department_name 
FROM Employees3 e 
INNER JOIN
Departments d
ON e.department_id=d.department_id;
      --left join  (retrive left all table but right table only whose match with left table)

SELECT e.employee_id, e.first_name, e.last_name, 
		d.department_id, d.department_name 
FROM Employees3 e 
LEFT JOIN
Departments d
ON e.department_id=d.department_id;

       --right join  (retrive right all table but left table only whose match with left table)

SELECT e.employee_id, e.first_name, e.last_name, 
		d.department_id, d.department_name 
FROM Employees3 e 
RIGHT JOIN
Departments d
ON e.department_id=d.department_id;
        --full outer join (retrive all 2 tables including non matching rows from both)
SELECT e.employee_id, e.first_name, e.last_name, 
		d.department_id, d.department_name 
FROM Employees3 e 
FULL OUTER JOIN
Departments d
ON e.department_id=d.department_id;

        --cross join (retrive all possible combinations of  tables)
SELECT  e.first_name, e.last_name, 
          d.department_name 
FROM Employees3 e 
CROSS JOIN
Departments d;   
    
         --self join (retrive the record from table to its table)
SELECT  e1.first_name as employee_name1,	 
	   e2.first_name as employee_name2,
	   d.department_name 
FROM employees3 e1 join  employees3 e2   
ON e1.department_id = e2.department_id and e1.employee_id!=e2.employee_id
join
department d 
on  e1.department_id=d.department_id;

	   
