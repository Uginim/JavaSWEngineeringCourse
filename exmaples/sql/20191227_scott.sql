CREATE OR REPLACE TRIGGER emp_sal_chk
BEFORE UPDATE OF sal ON emp
FOR EACH ROW WHEN (NEW.sal < OLD.sal 
		OR NEW.sal > OLD.sal * 1.1)
BEGIN
	raise_application_error(-20502,
	   'May not decrease salary. Increase must be < 10%');
END;
/


update emp set sal = 6000;


DROP SEQUENCE emp_row_seq;
CREATE SEQUENCE emp_row_seq
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999
	MINVALUE 1
	NOCYCLE
	NOCACHE;
DROP TABLE emp_row_tab;
CREATE TABLE emp_row_tab(
	e_id		NUMBER(6)
		CONSTRAINT emp_row_pk PRIMARY KEY,
	e_name		VARCHAR2(30),
	e_gubun		VARCHAR2(10),
	e_date		DATE);
CREATE OR REPLACE TRIGGER emp_row_aud
	AFTER insert OR update OR delete ON emp
	FOR EACH ROW
BEGIN
	IF INSERTING THEN
		INSERT INTO emp_row_tab
			VALUES(emp_row_seq.NEXTVAL,USER,'inserting',SYSDATE);
	ELSIF UPDATING THEN
		INSERT INTO emp_row_tab
			VALUES(emp_row_seq.NEXTVAL,USER,'updating',SYSDATE);
	ELSIF DELETING THEN
		INSERT INTO emp_row_tab
			VALUES(emp_row_seq.NEXTVAL,USER,'deleting',SYSDATE);
	END IF;
END;
/


UPDATE emp
  SET deptno = 40
  WHERE deptno = 10;



CREATE OR REPLACE PROCEDURE BookInsertOrUpdate(
  myBookID NUMBER,
  myBookName VARCHAR2,
  myPublisher VARCHAR2,
  myPrice INT)
AS
  mycount NUMBER;
BEGIN
  SELECT COUNT(*) INTO mycount FROM Book
    WHERE bookname LIKE myBookName;
  IF mycount!=0 THEN
    UPDATE Book SET price = myPrice
    WHERE bookname LIKE myBookName;
  ELSE
    INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(myBookID, myBookName, myPublisher, myPrice);
  END IF;
END;
