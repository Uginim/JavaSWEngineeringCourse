SELECT * FROM orders;
SELECT * FROM book;
SELECT * FROM customer;


SELECT *
FROM  orders t1, book t2, customer t3;

SELECT count(* )
FROM  orders t1, book t2, customer t3;

-- 똑같은 컬럼이름이 중복돼 있을 경우
SELECT bookid
FROM  orders t1, book t2, customer t3;
-- column 이름이 같을 때 구분
SELECT t1.bookid, t2.bookid
FROM  orders t1, book t2, customer t3;


SELECT t1.*
FROM  orders t1, book t2, customer t3;

SELECT t1.*, t2.*
FROM  orders t1, book t2, customer t3;

-- 카티전 곱(카티전 프로덕트 연산)
SELECT *
FROM  orders t1, book t2, customer t3;
-- 내부 조인(Inner Join)
SELECT  *
FROM    orders t1, book t2, customer t3
WHERE   t1.bookid = t2.bookid
        and t1.custid = t3.custid;
-- 내부 조인(테이블 2개)
-- case 0)
SELECT *
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;
-- case 1)
SELECT *
FROM Customer t1, Orders t2
WHERE t1.custid = t2.custid;        
SELECT *
FROM Customer t1, Orders t2
WHERE t1.custid = t2.custid
    and t1.name= '박지성';
-- case 2)
SELECT *
FROM    customer t1 INNER JOIN orders t2
        ON t1.custid = t2.custid;

-- left outer join
-- case1)
SELECT *
FROM  customer t1, orders t2
WHERE t1.custid = t2.custid(+); -- +는 부족한 쪽에 붙여준다.
-- case 2)
SELECT  * 
FROM    book t1 left outer join orders t2 
    on t1.bookid = t2.bookid;

-- right outer join
-- case 1)
SElect * 
FROM customer t1, orders t2
WHERE t1.custid(+) = t2.custid;
-- case 2)
SELECT  * 
FROM    book t1 right outer join orders t2 
        on t1.bookid = t2.bookid;

-- FULL outer join
-- case 1)
SELECT  * 
FROM    book t1, orders t2 
WHERE t1.bookid = t2.bookid(+)
union
SELECT  * 
FROM    book t1, orders t2  
WHERE t1.bookid(+) = t2.bookid;
-- case 2)
SELECT  * 
FROM    book t1 left outer join orders t2 on t1.bookid = t2.bookid
union
SELECT  * 
FROM    book t1 right outer join orders t2 on t1.bookid = t2.bookid;

-- 안팔린 책 찾기
SELECT  bookname, publisher 
FROM    book t1 left outer join orders t2 on t1.bookid = t2.bookid
WHERE t2.orderid is null;

