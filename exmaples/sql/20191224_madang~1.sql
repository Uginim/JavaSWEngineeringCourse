EXEC InsertBook(13,'����������', '������м���', 25000);

/* ���ν��� InsertBook�� �׽�Ʈ�ϴ� �κ� */
--EXEC InsertBook(13,'����������', '������м���', 25000);
SELECT * FROM Book;

EXEC BOOKINSERTORUPDATE(15, '������ ��ſ�','������м���',25000);

EXEC BOOKINSERTORUPDATE(15, '������ ��ſ�','������м���',20000);


--
SET SERVEROUTPUT ON;
DECLARE
  AverageVal NUMBER;
BEGIN
  AveragePrice(AverageVal);
  DBMS_OUTPUT.PUT_LINE('å�� ���: '||AverageVal);
END;

-- Interest ���ν��� ���� 
SET SERVEROUTPUT ON;
EXEC Interest;