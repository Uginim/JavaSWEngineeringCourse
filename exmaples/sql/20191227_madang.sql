-- ����1)
-- OFICIAL
CREATE OR REPLACE PROCEDURE BookInsertOrUpdate(
  p_bookid     IN Book.bookid%TYPE,
  p_bookname  IN Book.bookname%TYPE,
  p_publisher   IN Book.publisher%TYPE,
  p_price      IN Book.price%TYPE,
  r_errcode    OUT number,
  r_errmsg    OUT varchar2
)
AS
  l_count number;
BEGIN
  SELECT COUNT(*) 
      INTO l_count
      FROM Book WHERE publisher = p_publisher
                    AND  bookname = p_bookname;
  IF l_count != 0 THEN
    -- �ݾ� ����
    UPDATE Book set price = p_price  
        WHERE publisher = p_publisher
          AND bookname = p_bookname;
  ELSE 
    -- �������� �߰�
    INSERT INTO book(bookid, bookname, publisher, price)
      VALUES (p_bookid, p_bookname, p_publisher, p_price);
  END IF;
  
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    r_errcode := SQLCODE;
    r_errmsg := SQLERRM;
    DBMS_OUTPUT.PUT_LINE(r_errcode || '-' || r_errmsg );
END;

SET SERVEROUTPUT ON;
DECLARE 
  l_sqlcode number;
  l_sqlerrmsg varchar2(255);
BEGIN
  BookInsertOrUpdate(17, '�����ͺ��̽�3', '�Ѻ�',40000, l_sqlcode, l_sqlerrmsg);
  DBMS_OUTPUT.PUT_LINE('���� :' || l_sqlcode || '-' || l_sqlerrmsg);
END;


-- ����2)
CREATE OR REPLACE FUNCTION Grade(
  v_custid NUMBER
) RETURN VARCHAR2
IS 
  v_totalSalePrice NUMBER;
  v_resultText VARCHAR2(255);
BEGIN
  SELECT SUM(saleprice) into v_totalSalePrice FROM orders WHERE custid =v_custid ;
  IF v_totalSalePrice >= 1000000 THEN v_resultText := '���';
  ELSE v_resultText := '�Ϲ�';
  END IF;
  RETURN v_resultText; 
END;
-- official
CREATE OR REPLACE FUNCTION Grade(
  p_custid IN customer.custid%TYPE
) RETURN VARCHAR2
IS
  l_sum NUMBER;
  l_grade VARCHAR2(6);
BEGIN
  SELECT SUM(saleprice) INTO l_sum
    FROM Orders
  WHERE custid = p_custid;
  IF l_sum >= 1000000 THEN
    l_grade := '���';
  ELSE 
    l_grade := '�Ϲ�';
  END IF;
  RETURN l_grade;
--EXCEPTION
--  WHEN OTHERS THEN
END;

SELECT SUM(saleprice) 
    FROM Orders
  WHERE custid = 15000;

declare
  l_grade carchar2(6);
  cursor custid_cursor is
    select custid from customer;
begin
  for rec in custid_cursor loop
    l_grade := grade(rec.custid);
    dbms_output.put_line(l_grade);
  end loop;
end;


-- ���� 5)

select custid, name, grade(custid) as "���" from customer;

select name "�̸�", grade(custid) as "���" from customer;

select t1.custid, t2.name, grade(sum(saleprice))
  from orders t1, customer t2
  where t1.custid = t2.custid
group by t1.custid, t2.name;


-- ����3)
DROP TABLE OrdersLog;
drop sequence orderslog_seq;
drop trigger orderslog_trigger;

CREATE SEQUENCE ordersLog_seq
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999
	MINVALUE 1
	NOCYCLE
	NOCACHE;
CREATE TABLE OrdersLog(
  seq number,
  ORDERID	number,
  CUSTID	NUMBER,
  BOOKID	NUMBER,
  SALEPRICE	NUMBER,
  ORDERDATE	DATE,
  LOGDATE DATE
);

CREATE OR REPLACE TRIGGER orderslog_trigger
	AFTER update OR delete ON orders 
  FOR EACH ROW
BEGIN  
  INSERT INTO OrdersLog
  VALUES(ordersLog_seq.NEXTVAL,:OLD.ORDERID,:OLD.CUSTID,:OLD.BOOKID,:OLD.SALEPRICE,:OLD.ORDERDATE,SYSDATE);
END;

-- official

CREATE SEQUENCE ordersLog_seq
  INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999
	MINVALUE 1
	NOCYCLE
	NOCACHE;

-- ���̺� ���� ����
CREATE TABLE ordersLog as
SELECT * FROM ORDERS WHERE 1=2;
DESC ordersLog;

-- ���̺� �÷��߰�
ALTER TABLE ordersLog ADD(seq number, logdate date);
desc ordersLog

-- �⺻Ű �߰�
alter table ordersLog add constrants seq_pk primary key(seq);

  CREATE TABLE ORDERSLOG
   (	
   seq number,
   logdate date,
  ORDERID NUMBER(2,0), 
	CUSTID NUMBER(2,0), 
	BOOKID NUMBER(2,0), 
	SALEPRICE NUMBER(8,0), 
	ORDERDATE DATE, 
	PRIMARY KEY (seq)
  );
-- ����  
create or replace trigger ordersLog
AFTER UPDATE OR DELETE
ON ORDERS FOR EACH ROW
DECLARE
BEGIN  
  INSERT INTO ordersLog
  values(ordersLog_seq.nextval,sysdate,
      :old.orderid, 
      :old.custid, 
      :old.bookid, 
      :old.saleprice, 
      :old.orderdate);
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(SQLCODE || '-' || SQLERRM);
END;

-- updating, deleting �̺�Ʈ ����
alter table ordersLog add (event varchar2(10));

create or replace trigger ordersLog
AFTER UPDATE OR DELETE
ON ORDERS FOR EACH ROW
DECLARE
  l_event varchar2(10);
BEGIN 
  IS updating THEN
    l_event := 'updating';
  ELSE IF deleting THEN
    l_event := 'deleting';
  END IF;
  INSERT INTO ordersLog
  values(ordersLog_seq.nextval,sysdate,
      :old.orderid, 
      :old.custid, 
      :old.bookid, 
      :old.saleprice, 
      :old.orderdate,
      l_event);
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(SQLCODE || '-' || SQLERRM);
END;

-- 4�� ����
select t2.publisher "���ǻ�", sum(t1.saleprice) "�� �����", 
  rank() over(order by sum(t1.saleprice) desc) "����"
from orders t1, book t2
where t1.bookid = t2.bookid
group by t2.publisher;
