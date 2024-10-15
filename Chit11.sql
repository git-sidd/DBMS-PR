CREATE TABLE Library (
    book_id   NUMBER PRIMARY KEY,
    book_name VARCHAR2(100),
    author    VARCHAR2(100),
    category  VARCHAR2(50),
    price     NUMBER
);


CREATE TABLE Library_Audit (
    audit_id   NUMBER PRIMARY KEY,
    book_id    NUMBER,
    book_name  VARCHAR2(100),
    author     VARCHAR2(100),
    category   VARCHAR2(50),
    price      NUMBER,
    operation  VARCHAR2(10),   -- Will store 'UPDATE' or 'DELETE'
    changed_on DATE            -- To track when the change occurred
);


CREATE OR REPLACE TRIGGER library_row_audit
AFTER UPDATE OR DELETE ON Library
FOR EACH ROW
BEGIN
    IF DELETING THEN
        INSERT INTO Library_Audit (audit_id, book_id, book_name, author, category, price, operation, changed_on)
        VALUES (Library_Audit_SEQ.NEXTVAL, :OLD.book_id, :OLD.book_name, :OLD.author, :OLD.category, :OLD.price, 'DELETE', SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO Library_Audit (audit_id, book_id, book_name, author, category, price, operation, changed_on)
        VALUES (Library_Audit_SEQ.NEXTVAL, :OLD.book_id, :OLD.book_name, :OLD.author, :OLD.category, :OLD.price, 'UPDATE', SYSDATE);
    END IF;
END;
/
