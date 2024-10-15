DECLARE
    v_roll_no     NUMBER;
    v_name_of_book VARCHAR2(100);
    v_date_of_issue DATE;
    v_status      VARCHAR2(1);
    v_days_late   NUMBER;
    v_fine_amt    NUMBER := 0;
    
    -- Exception declaration
    e_no_data_found EXCEPTION;
    v_fine_date DATE;
BEGIN
    -- Accept roll number and name of book from user
    v_roll_no := &Enter_Roll_no;
    v_name_of_book := '&Enter_Name_of_Book';

    -- Get the date of issue and status from the Borrower table
    SELECT DateofIssue, Status
    INTO v_date_of_issue, v_status
    FROM Borrower
    WHERE Rollin = v_roll_no
    AND NameofBook = v_name_of_book;

    -- If status is 'I' (Issued), calculate the number of days
    IF v_status = 'I' THEN
        v_days_late := TRUNC(SYSDATE - v_date_of_issue);

        -- Calculate fine based on the number of days late
        IF v_days_late > 30 THEN
            v_fine_amt := (v_days_late - 30) * 50 + (15 * 5); -- Fine Rs 50 per day for days after 30, and Rs 5 per day for days between 15 and 30
        ELSIF v_days_late BETWEEN 15 AND 30 THEN
            v_fine_amt := (v_days_late - 15) * 5; -- Fine Rs 5 per day for days between 15 and 30
        ELSE
            v_fine_amt := 0; -- No fine for less than 15 days
        END IF;

        -- If there's a fine, insert data into the Fine table
        IF v_fine_amt > 0 THEN
            INSERT INTO Fine (Roll_no, Date, Amt)
            VALUES (v_roll_no, SYSDATE, v_fine_amt);
        END IF;

        -- Change the status to 'R' (Returned) in the Borrower table
        UPDATE Borrower
        SET Status = 'R'
        WHERE Rollin = v_roll_no
        AND NameofBook = v_name_of_book;

        DBMS_OUTPUT.PUT_LINE('Book returned successfully. Fine: Rs ' || v_fine_amt);
    ELSE
        -- If the book is not issued (status not 'I')
        RAISE e_no_data_found;
    END IF;

EXCEPTION
    -- Handle if no data found for the entered roll number and book
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found for the provided Roll number or Book.');

    -- Handle custom exception if book is not issued
    WHEN e_no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Book is not issued or already returned.');

    -- Handle any other unhandled exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
