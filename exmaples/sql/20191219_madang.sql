select abs(-78), abs(+78) from dual;
select round(4.875,2) from dual;
select custid "����ȣ", round(sum(saleprice)/count(*),-2) "��ձݾ�"
      FROM Orders
      GROUP BY custid;
      
      
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
FROM Orders;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1" FROM Dual;


select ABS(-15) from dual;
select CEIL(15.7) from dual;
select CEIL(15.7) from dual;

