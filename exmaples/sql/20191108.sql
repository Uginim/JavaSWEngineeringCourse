-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL문을 작성하시오
--  (1) 도서번호가 1인 도서의 이름
SELECT  bookname
FROM    book
WHERE   bookid = '1';

--  (2) 가격이 20,000원 이상인 도서의 이름
SELECT  bookname
FROM    book
WHERE   price >= 20000;

--  (3) 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
SELECT  sum(saleprice)
FROM    orders
WHERE   custid = '1';

--  (4) 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
SELECT  count(*)
FROM    orders
WHERE   custid = '1';

-- 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--  (1) 마당서점 도서의 총 개수
SELECT  count(*)
FROM    book;

--  (2) 마당서점에 도서를 출고하는 출판사의 총 개수
SELECT  count(distinct publisher) -- 중복피하기 distinct
FROM    book;

--  (3) 모든 고객의 이름 주소
SELECT  name, address
FROM    customer;

--  (4) 2014년 7월 4일~ 7월 7일 사이에 주문받은 도서의 주문번호
select * from orders;
SELECT  orderid
FROM    orders
WHERE   orderdate between '20140704' and '20140707';

SELECT  orderid
FROM    orders
WHERE   orderdate >= '20140704' 
        and orderdate <= '20140707';
        
--  (5) 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select * from orders;
SELECT  orderid
FROM    orders
WHERE   orderdate not between '20140704' and '20140707';

SELECT  orderid
FROM    orders
WHERE   orderdate < '20140704' 
        or orderdate > '20140707';
        
-- (6) 성이 '김'씨인 고객의 이름과 주소
SELECT  name, address
FROM    customer
WHERE   name like '김%';

-- (7) 성이 '김' 씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT  name, address
FROM    customer
WHERE   name like '김%아';


-- 테이블 조인
SELECT  *
FROM    customer, orders;

SELECT  * FROM customer;
SELECT  * FROM orders;
SELECT  * FROM book;

SELECT  * 
FROM    customer, orders, book
WHERE   customer.custid = orders.custid
    and orders.orderid = '1';
    
SELECT  orders.orderid, 
        orders.orderdate, 
        customer.name, 
        book.bookname, 
        book.publisher,
        orders.saleprice
FROM    customer, orders, book
WHERE   customer.custid = orders.custid
    and book.bookid = orders.bookid
    and orders.orderid = '1';
    
SELECT  orders.orderid AS 주문번호, 
        orders.orderdate AS 판매일자, 
        customer.name AS 고객이름, 
        book.bookname AS 도서이름, 
        book.publisher AS 출판사,
        orders.saleprice AS 판매액
FROM    customer, orders, book
WHERE   customer.custid = orders.custid
    and book.bookid = orders.bookid;
--    and orders.orderid = '1';

SELECT  t2.orderid AS 주문번호, 
        t2.orderdate AS 판매일자, 
        t1.name AS 고객이름, 
        t3.bookname AS 도서이름, 
        t3.publisher AS 출판사,
        t2.saleprice AS 판매액
FROM    customer t1, orders t2, book t3
WHERE   t1.custid = t2.custid
    and t3.bookid = t2.bookid