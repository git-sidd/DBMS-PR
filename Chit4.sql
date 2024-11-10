-- Creating student table
CREATE TABLE student (
    S_ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    tot_cred INT
);
INSERT INTO student (S_ID, name, dept_name, tot_cred) VALUES
(1, 'Aman', 'Computer', 30),
(2, 'Amit', 'Mechanical', 28),
(3, 'Amol', 'Electronics', 24),
(4, 'Samira', 'Computer', 35),
(5, 'Samar', 'Civil', 20),
(6, 'Deepam', 'Computer', 40),
(7, 'Raman', 'Mechanical', 32),
(8, 'Shriram', 'Computer', 38),
(9, 'Hemant', 'Electrical', 42),
(10, 'Pramod', 'Computer', 22);


-- Creating instructor table
CREATE TABLE instructor (
    T_ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);
INSERT INTO instructor (T_ID, name, dept_name, salary) VALUES
(1, 'Dr. Sharma', 'Computer', 50000),
(2, 'Prof. Amol', 'Mechanical', 42000),
(3, 'Dr. Seema', 'Electronics', 60000),
(4, 'Prof. Nitin', 'Computer', 48000),
(5, 'Dr. Deepak', 'Civil', 39000),
(6, 'Prof. Shalini', 'Electrical', 45000),
(7, 'Dr. Amit', 'Mechanical', 41000),
(8, 'Prof. John', 'Computer', 55000),
(9, 'Dr. Preeti', 'Computer', 53000),
(10, 'Prof. Ravi', 'Civil', 47000);

-- Creating course table
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT
);
INSERT INTO course (course_id, title, dept_name, credits) VALUES
(101, 'DBMS', 'Computer', 4),
(102, 'Data Structures', 'Computer', 3),
(103, 'Thermodynamics', 'Mechanical', 4),
(104, 'Digital Electronics', 'Electronics', 3),
(105, 'Civil Engineering Basics', 'Civil', 2),
(106, 'Power Systems', 'Electrical', 3),
(107, 'Algorithms', 'Computer', 3),
(108, 'Fluid Mechanics', 'Mechanical', 4),
(109, 'VLSI Design', 'Electronics', 4);



Here are the SQL queries to perform the specified tasks on your MySQL database terminal based on the given table structures:

### Table Structures:
- **student**: (S_ID, name, dept_name, tot_cred)
- **instructor**: (T_ID, name, dept_name, salary)
- **course**: (course_id, title, dept_name, credits)

### SQL Queries

#### i. Find the average salary of instructors in those departments where the average salary is more than Rs. 42000/-.
```sql
SELECT AVG(salary) AS average_salary
FROM instructor
WHERE dept_name IN (
    SELECT dept_name
    FROM instructor
    GROUP BY dept_name
    HAVING AVG(salary) > 42000
);
```

#### ii. Increase the salary of each instructor in the computer department by 10%.
```sql
UPDATE instructor
SET salary = salary * 1.10
WHERE dept_name = 'Computer';
```

#### iii. Find the names of instructors whose names are neither ‘Amol’ nor ‘Amit’.
```sql
SELECT name
FROM instructor
WHERE name NOT IN ('Amol', 'Amit');
```

#### iv. Find the names of students which contain ‘am’ as its substring.
```sql
SELECT name
FROM student
WHERE name LIKE '%am%';
```

#### v. Find the names of students from the computer department that take “DBMS” courses.
```sql
SELECT s.name
FROM student AS s
JOIN course AS c ON c.dept_name = s.dept_name
WHERE s.dept_name = 'Computer' AND c.title = 'DBMS';
```

### Explanation:
1. **Query i**: This query first retrieves the departments with an average salary above 42000 and then calculates the average salary of instructors in those departments.
2. **Query ii**: This query increases the salary of instructors in the computer department by multiplying their current salary by 1.10 (adding 10%).
3. **Query iii**: This query selects instructor names that are not 'Amol' or 'Amit'.
4. **Query iv**: This query retrieves student names that contain the substring 'am' anywhere in the name.
5. **Query v**: This query finds students in the computer department who are enrolled in the DBMS course by joining the `student` and `course` tables based on their department names. 

You can execute these queries in your MySQL terminal to get the required results.