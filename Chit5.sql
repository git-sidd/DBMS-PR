DECLARE
   -- Declare a cursor with a parameter for Roll number
   CURSOR cur_n_rollcall IS
      SELECT roll_no, student_name, attendance
      FROM N_RollCall;

   -- Declare variables to hold the cursor data
   v_roll_no N_RollCall.roll_no%TYPE;
   v_student_name N_RollCall.student_name%TYPE;
   v_attendance N_RollCall.attendance%TYPE;

   -- Declare a variable to check if the data already exists in O_RollCall
   v_exists NUMBER;

BEGIN
   -- Open the cursor and loop through all records in N_RollCall
   OPEN cur_n_rollcall;
   LOOP
      -- Fetch the data from the cursor into variables
      FETCH cur_n_rollcall INTO v_roll_no, v_student_name, v_attendance;

      -- Exit when there are no more records to fetch
      EXIT WHEN cur_n_rollcall%NOTFOUND;

      -- Check if the record already exists in O_RollCall
      SELECT COUNT(*)
      INTO v_exists
      FROM O_RollCall
      WHERE roll_no = v_roll_no;

      -- If the record doesn't exist, insert it into O_RollCall
      IF v_exists = 0 THEN
         INSERT INTO O_RollCall (roll_no, student_name, attendance)
         VALUES (v_roll_no, v_student_name, v_attendance);
      END IF;

   END LOOP;

   -- Close the cursor
   CLOSE cur_n_rollcall;

   -- Commit the changes
   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Data merged successfully, duplicates skipped.');

EXCEPTION
   -- Exception handling
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/




DECLARE
   -- Variables to hold data from N_RollCall table
   v_roll_no N_RollCall.roll_no%TYPE;
   v_student_name N_RollCall.student_name%TYPE;
   v_attendance N_RollCall.attendance%TYPE;

   -- Variable to check if the data already exists in O_RollCall
   v_exists NUMBER;

BEGIN
   -- Use an implicit cursor to loop through N_RollCall table
   FOR rec IN (SELECT roll_no, student_name, attendance FROM N_RollCall) LOOP

      -- Assign values from the record to variables
      v_roll_no := rec.roll_no;
      v_student_name := rec.student_name;
      v_attendance := rec.attendance;

      -- Check if the record already exists in O_RollCall
      SELECT COUNT(*)
      INTO v_exists
      FROM O_RollCall
      WHERE roll_no = v_roll_no;

      -- If the record doesn't exist, insert it into O_RollCall
      IF v_exists = 0 THEN
         INSERT INTO O_RollCall (roll_no, student_name, attendance)
         VALUES (v_roll_no, v_student_name, v_attendance);
      END IF;

   END LOOP;

   -- Commit the changes
   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Data merged successfully, duplicates skipped.');

EXCEPTION
   -- Exception handling
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/

