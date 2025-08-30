CREATE TABLE employee2(
    employee_id INT Primary key,
	name VARCHAR(100) NOT NULL,
	position VARCHAR(50),
	department VARCHAR(50),
	hire_date DATE,
	salary NUMERIC(10,2)
);
SELECT * FROM employee2;