SELECT custid, (SELECT address 
                FROM Customer cs
                WHERE cs.custid=od.custid) "address",
                SUM(SALEPRICE) "total"
FROM      Orders od
GROUP BY od.custid;


SELECT cs.name, s
FROM    (SELECT custid, AVG(saleprice) s
          FROM Orders
          GROUP BY custid) od, customer cs
WHERE   cs.custid=od.custid;

SELECT SUM(saleprice) "total"
FROM    Orders od
WHERE   EXISTS (SELECT* 
          FROM Customer cs
          WHERE custid <= 3 AND cs.custid=od.custid);
          
          
-- ���ν���
CREATE OR REPLACE PROCEDURE InsertBook(
  myBookID in number,
  myBookName in varchar2,
  myPublisher in varchar2,
  myPrice in number)
AS
BEGIN
  INSERT INTO Book(bookid, bookname, publisher, price)
  VALUES(myBookID, myBookName, myPublisher, myPrice);
END;
  

-- 
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


CREATE OR REPLACE PROCEDURE AveragePrice(
  AverageVal OUT NUMBER)
AS
BEGIN
  SELECT AVG(price) INTO AverageVal FROM Book WHERE price IS NOT NULL;
END;


-- Ŀ���� ����ϴ� ���ν���
CREATE OR REPLACE PROCEDURE Interest
AS
  myInterest NUMERIC;
  Price NUMERIC;
  CURSOR InterestCursor IS SELECT saleprice FROM Orders;
BEGIN
  myInterest := 0.0;
  OPEN InterestCursor;
  LOOP
    FETCH interestCursor INTO Price;
    EXIT WHEN InterestCursor%NOTFOUND;
    IF Price >= 30000 THEN
      myInterest := myInterest + Price * 0.1;
    ELSE
      myInterest := myInterest + Price * 0.05;
    END IF;
  END LOOP;
  CLOSE InterestCursor;
  DBMS_OUTPUT.PUT_LINE(' ��ü ���� �ݾ� = ' || myInterest);
END;


-- Ʈ���� �ǽ��� ���� ���̺�
CREATE TABLE Book_log(
  bookid_l NUMBER,
  bookname_l VARCHAR2(40),
  publisher_l VARCHAR2(40),
  price_l NUMBER);
  
/* ���ϸ� : AfterInsertBook.sql */
CREATE OR REPLACE TRIGGER AfterInsertBook
AFTER INSERT ON Book FOR EACH ROW
DECLARE
  average NUMBER;
BEGIN
  INSERT INTO Book_log
    VALUES(:new.bookid, :new.bookname, :new.publisher, :new.price);
  DBMS_OUTPUT.PUT_LINE('���� ������ Book_log ���̺� ���..');
END;  
  
INSERT INTO Book VALUES(14, '������ ���� 1', '�̻�̵��',25000);
SELECT * FROM Book WHERE bookid='14';
SELECT * FROM Book_log WHERE bookid_l ='14';

--Ʈ���� ���� Ȯ��
select table_name,status from user_triggers;

-- Ʈ���� Ȱ��/��Ȱ��
alter trigger AfterInsertBook disable;


CREATE OR REPLACE FUNCTION fnc_Interest(
  price NUMBER) RETURN INT
IS
  myInterest NUMBER;
BEGIN
  IF PRICE >= 30000 THEN myInterest := Price * 0.1;
  ELSE myInterest := Price * 0.5;
  END IF;
  RETURN myInterest;
END;

SELECT custid, orderid, saleprice, fnc_Interest(saleprice) interest
FROM Orders;
