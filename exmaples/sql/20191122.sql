-- 연습문제 6
-- 6-(1)
-- mine
CREATE VIEW highorders
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher, od.saleprice
      from Book bk, Customer cs, Orders od
      WHERE bk.bookid = od.bookid and od.custid = cs.custid
          and od.saleprice >= 20000;
-- teacher
create view vw_highorders as
select  t3.bookid 도서번호,
        t3.bookname 도서이름,
        t1.name 고객이름,
        t3.publisher 출판사,
        t2.saleprice 판매가격
  from  customer t1, orders t2, book t3
where  t1.custid = t2.custid
    and t2.bookid = t3.bookid
    and t2.saleprice >= 20000;
-- 6-(2)   
-- mine
SELECT bookname, name FROM Highorders;
-- teacher
SELECT "도서이름", "고객이름" FROM vw_highorders;

-- 6-(3)   
-- mine
CREATE OR REPLACE VIEW highorders
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher
      from Book bk, Customer cs, Orders od
      WHERE bk.bookid = od.bookid and od.custid = cs.custid
          and od.saleprice >= 20000;




SELECT bookname, name FROM Highorders;