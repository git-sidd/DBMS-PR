-- Create the Stud_Marks table
CREATE TABLE Stud_Marks (
   name VARCHAR2(50),
   total_marks NUMBER(5)
);

-- Create the Result table
CREATE TABLE Result (
   roll NUMBER,
   name VARCHAR2(50),
   class VARCHAR2(20)
);


CREATE OR REPLACE PROCEDURE proc_Grade (p_name IN VARCHAR2, p_marks IN NUMBER, p_roll IN NUMBER) IS
   v_class VARCHAR2(20);
BEGIN
   -- Categorize the student based on total marks
   IF p_marks BETWEEN 990 AND 1500 THEN
      v_class := 'Distinction';
   ELSIF p_marks BETWEEN 900 AND 989 THEN
      v_class := 'First Class';
   ELSIF p_marks BETWEEN 825 AND 899 THEN
      v_class := 'Higher Second Class';
   ELSE
      v_class := 'Fail'; -- You can add another category if needed
   END IF;
   
   -- Insert the result into the Result table
   INSERT INTO Result (roll, name, class) 
   VALUES (p_roll, p_name, v_class);

   DBMS_OUTPUT.PUT_LINE('Student ' || p_name || ' categorized as ' || v_class);

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END proc_Grade;


DECLARE
   v_name VARCHAR2(50);
   v_marks NUMBER(5);
   v_roll NUMBER(5);
BEGIN
   -- Loop through the Stud_Marks table and categorize students using proc_Grade
   FOR rec IN (SELECT ROWNUM AS roll, name, total_marks FROM Stud_Marks) LOOP
      -- Get the name, marks, and roll number from the table
      v_name := rec.name;
      v_marks := rec.total_marks;
      v_roll := rec.roll;
      
      -- Call the proc_Grade procedure
      proc_Grade(p_name => v_name, p_marks => v_marks, p_roll => v_roll);
   END LOOP;

   -- Commit changes
   COMMIT;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/
