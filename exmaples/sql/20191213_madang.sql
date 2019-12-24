-- 이름순으로 맨앞의 2명을 찾기
-- 제대로 나오지 않음
select rownum, custid, name, phone
  from customer
  where rownum <=2 
  order by name;
  
-- 이름순으로 맨앞의 2명 찾기(제대로된 버전)
SELECT ROWNUM "순번", custid, name, phone
FROM    (SELECT custid, name, phone
          FROM   Customer
          ORDER BY name)
WHERE   ROWNUM <= 2;
          
          
          
-- (1)          
SELECT  *
FROM    Book;
-- (2)
SELECT   *
FROM     Book
WHERE   ROWNUM <= 5;
-- (3)
SELECT  *
FROM    Book
WHERE  ROWNUM <= 5
ORDER BY price;
-- (4)
SELECT  * 
FROM    ( SELECT * FROM Book ORDER BY price) b
WHERE   ROWNUM <=5;
-- (5)
SELECT *
FROM (SELECT * FROM Book WHERE ROWNUM <=5) b
ORDER BY price;
-- (6)
SELECT *
FROM (SELECT * FROM Book WHERE ROWNUM <= 5 ORDER BY price) b;





SELECT (SELECT name FROM Customer cs
          WHERE cs.custid=od.custid) "name", sum(saleprice) "total"
FROM  orders od
GROUP BY od.custid;


set autotrace on explain;
SELECT t1.custid, t2.name,  sum(t1.saleprice)
FROM    orders t1, customer t2
WHERE t1.custid = t2.custid
GROUP BY t1.custid, t2.name;


ALTER TABLE Orders ADD bookname VARCHAR2(40);
UPDATE Orders
SET bookname = (SELECT bookname
                  FROM Book
                  WHERE Book.bookid=Orders.bookid);
                  
SELECT  cs.name, SUM(od.saleprice) "total"
FROM    (SELECT custid, name
            FROM  Customer
          WHERE  custid <= 2) cs,
          Orders od
WHERE  cs.custid=od.custid
GROUP BY cs.name;