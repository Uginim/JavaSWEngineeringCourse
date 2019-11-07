-- 3-1
SELECT  bookname, price
FROM    Book;

-- 3-1 변형
SELECT  price, bookname
FROM    Book;

-- 3-2
SELECT  bookid, bookname, publisher, price
FROM    Book;


-- 3-3
SELECT  publisher
FROM    Book;

-- 3-3 파생
SELECT  DISTINCT publisher
FROM    Book;

-- 3-4
SELECT * 
FROM Book
WHERE price < 20000;

-- 3-5
SELECT  * 
FROM    Book
WHERE   price BETWEEN 10000 AND 20000;

-- 3-5 파생
SELECT  * 
FROM    Book
WHERE   price >= 10000 AND price <= 20000;


-- 3-6
SELECT  * 
FROM    Book
WHERE   publisher IN ('굿스포츠', '대한미디어');

SELECT  * 
FROM    Book
WHERE   publisher = '굿스포츠' 
    or  publisher = '대한미디어';

SELECT  * 
FROM    Book
WHERE   publisher = '굿스포츠' 
  and   price >= 7000;

-- 3-6 제외
SELECT  * 
FROM    Book
WHERE   publisher NOT IN ('굿스포츠', '대한미디어');

SELECT  * 
FROM    Book
WHERE   publisher <> '굿스포츠' 
  and   publisher <> '대한미디어';
  
  
-- 3-7 '축구의 역사 출간한 출판사를 검색
SELECT  bookname, publisher
FROM    Book
WHERE   bookname LIKE '축구의 역사';

-- 3-8 와일드 문자 사용
SELECT  bookname, publisher
FROM    Book
WHERE   bookname LIKE '%축구%';

-- 3-9 
SELECT  *
FROM    Book
WHERE   bookname LIKE '_구%';


-- 3-10
SELECT  *
FROM    Book
WHERE   bookname LIKE '%축구%' AND price >= 20000;


-- 3-11
SELECT *
FROM    Book
WHERE   publisher='굿스포츠' OR publisher='대한미디어';


-- 3-12
SELECT    *
FROM      Book
ORDER BY  bookname;


-- 3-13
SELECT    *
FROM      Book
ORDER BY  price, bookname;


SELECT    *
FROM      Book
ORDER BY  price desc, bookname desc;

SELECT    *
FROM      Book 
where     publisher ='대한미디어'
ORDER BY  price desc, bookname desc;

-- 3-15 집계 총판매액
SELECT    SUM(saleprice)
FROM      orders;

SELECT    SUM(saleprice) AS 총매출
FROM      orders;

-- 3-16 집계 함수
SELECT    SUM(saleprice) AS 총매출
FROM      orders 
WHERE     custid=2;

SELECT    SUM(saleprice) AS Total,
          AVG(saleprice) AS Average,
          MIN(saleprice) AS Minimum,
          MAX(saleprice) AS Maximum
FROM      Orders;

SELECT    COUNT(*)
FROM      Orders;
          
-- 3-19
SELECT    custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM      Orders
GROUP BY  custid;

-- 3-20
SELECT    custid, COUNT(*) AS 도서수량
FROM      Orders
WHERE     saleprice >= 8000
GROUP BY  custid
HAVING    COUNT(*) >= 2;

SELECT    custid, COUNT(*) AS 도서수량
FROM      Orders
WHERE     saleprice >= 8000
GROUP BY  custid
HAVING    COUNT(*) >= 2
ORDER BY  custid;

-- 연습문제
-- 1-1
select bookname 
from Book
where bookid = 1;

-- 1-2
select bookname,
from book
where price >= 20000;

-- 1-3
select sum(saleprice) as 총구매액
from orders
where custid = 1
group by custid;

-- 1-4

select count(*) as 구매도서수
from orders
where custid = 1
group by custid;


-- 2-1
select count(*) as "총 도서 수"
from book;

-- 2-2
select count(distinct publisher) as "출판사 총 개수"
from book;
-- 2-3
select name, address
from customer;
-- 2-4 1)
select orderid
from orders
where TO_CHAR(orderdate, 'YYYY-MM-DD') between '2014-07-04' and '2014-07-07';
-- 2-4 2)
select orderid
from orders
where orderdate between '14/07/04' and '14/07/07';

-- 2-5 1)
select orderid
from orders
where TO_CHAR(orderdate, 'YYYY-MM-DD') NOT between '2014-07-04' and '2014-07-07';
-- 2-5 2)
select orderid
from orders
where NOT orderdate between '14/07/04' and '14/07/07';

-- 2-6
select name, address
from  customer 
where name like '김%';

-- 2-7
select name, address
from  customer 
where name like '김%아';