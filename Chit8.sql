Here are the SQL queries to perform the specified tasks on your MySQL database terminal based on the given table structures:

### Table Structures:
- **teaches**: (T_ID, course_id, sec_id, semester, year)
- **student**: (S_ID, name, dept_name, tot_cred)
- **instructor**: (T_ID, name, dept_name, salary)
- **course**: (course_id, title, dept_name, credits)

### SQL Queries

#### i. Find the names of the instructors in the university who have taught the courses semester-wise.
```sql
SELECT i.name, t.semester, t.year, c.title
FROM instructor AS i
JOIN teaches AS t ON i.T_ID = t.T_ID
JOIN course AS c ON t.course_id = c.course_id
ORDER BY t.semester, t.year;
```

#### ii. Create a view on the student table that retrieves student details.
```sql
CREATE VIEW student_details AS
SELECT S_ID, name, dept_name, tot_cred
FROM student;
```

#### iii. Rename the column of the table student from `dept_name` to `deptatrment_name`.
```sql
ALTER TABLE student
CHANGE dept_name deptatrment_name VARCHAR(255);
```

#### iv. Delete student names whose department is NULL.
```sql
DELETE FROM student
WHERE deptatrment_name IS NULL;
```

### Explanation:
1. **Query i**: This query joins the `instructor`, `teaches`, and `course` tables to retrieve the names of instructors along with the courses they taught, ordered by semester and year.
2. **Query ii**: This query creates a view named `student_details`, which retrieves all relevant details from the `student` table.
3. **Query iii**: This query uses the `ALTER TABLE` statement to rename the `dept_name` column to `deptatrment_name` in the `student` table. Adjust the `VARCHAR(255)` size if necessary.
4. **Query iv**: This query deletes records from the `student` table where the `deptatrment_name` column is NULL.

You can execute these queries in your MySQL terminal to get the desired results.