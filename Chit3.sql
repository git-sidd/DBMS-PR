DECLARE
    v_roll_no   NUMBER;      -- Variable to store student Roll number
    v_att       NUMBER;      -- Variable to store student's attendance
    v_status    VARCHAR2(2); -- Variable to store student's status

    -- Exception declaration
    e_no_data_found EXCEPTION;

BEGIN
    -- Accept Roll number from the user
    v_roll_no := &Enter_Roll_No;

    -- Fetch attendance and status for the entered Roll number
    SELECT Att, Status
    INTO v_att, v_status
    FROM Stud
    WHERE Roll = v_roll_no;

    -- Control structure to check attendance
    IF v_att < 75 THEN
        -- Update status to "D" (Detained) if attendance is less than 75%
        UPDATE Stud
        SET Status = 'D'
        WHERE Roll = v_roll_no;
        
        DBMS_OUTPUT.PUT_LINE('Term not granted. Status set to "D".');
    ELSE
        -- Update status to "ND" (Not Detained) if attendance is 75% or more
        UPDATE Stud
        SET Status = 'ND'
        WHERE Roll = v_roll_no;

        DBMS_OUTPUT.PUT_LINE('Term granted. Status set to "ND".');
    END IF;

EXCEPTION
    -- Handle exception if no student is found for the given Roll number
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student found with Roll No: ' || v_roll_no);

    -- Handle any other unhandled exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
