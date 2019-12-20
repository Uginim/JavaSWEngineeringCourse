select abs(-78), abs(+78) from dual;
select round(4.875,2) from dual;
select custid "고객번호", round(sum(saleprice)/count(*),-2) "평균금액"
      FROM Orders
      GROUP BY custid;
      
      
SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM Orders;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1" FROM Dual;


select ABS(-15) from dual;
select CEIL(15.7) from dual;
select CEIL(15.7) from dual;

