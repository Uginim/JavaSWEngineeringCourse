-- 3-21
SELECT  * 
FROM    Customer, Orders
WHERE   Customer.custid = Orders.custid;

SELECT  * 
FROM    Customer, Orders
WHERE   Customer.custid = Orders.custid(+);


SELECT  * 
FROM    Customer, Orders
WHERE   Customer.custid(+) = Orders.custid;

--SELECT  * 
--FROM    Customer, Orders
--WHERE   Customer.custid(+) = Orders.custid(+);

-- 3-22
SELECT    *
FROM      Customer, Orders
WHERE     Customer.custid = Orders.custid
ORDER BY  Customer.custid;

-- 3-23
SELECT    name, saleprice
FROM      Customer, Orders
WHERE     Customer.custid = Orders.custid;

-- 3-24 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬
SELECT    name, SUM(saleprice)
FROM      Customer, Orders
WHERE     Customer.custid = Orders.custid
GROUP BY  Customer.name
ORDER BY  Customer.name;

-- 3-25
SELECT    Customer.name, Book.bookname
FROM      Customer, Orders, Book
WHERE     Customer.custid = Orders.custid
          AND Orders.bookid = Book.bookid;
-- 3-26          
select Customer.name, Book.bookname
FROM   Customer ,Orders, book
Where  Customer.custid = Orders.custid AND Orders.bookid = Book.bookid and Book.price = 20000;

-- 3-27
SELECT    Customer.name, saleprice
FROM      Customer LEFT OUTER JOIN
          Orders ON Customer.custid = Orders.custid;

--SELECT    Customer.name, SUM(saleprice)
--FROM      Customer LEFT OUTER JOIN
--          Orders ON Customer.custid = Orders.custid;
--GROUP BY  Customer.name;

-- 3-28 서브쿼리 복수쿼리 부속질의
SELECT    bookname
FROM      Book
WHERE     price = ( SELECT MAX(price)
                    FROM Book);

-- 3-29 구매한 적 있는 고객이름
SELECT    name
FROM      Customer
WHERE     custid IN (SELECT custid
                    FROM  Orders);
                    
SELECT    name
FROM      Customer
WHERE     custid IN (SELECT custid
                    FROM    Orders
                    WHERE    bookid IN ( SELECT bookid
                                      FROM    Book
                                      WHERE   publisher='대한미디어'));

-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL문을 작성하시오.
-- 1.(5) 박지성이 구매한 도서의 출판사 수
select   count(DISTINCT publisher) as "출판사 수"
from    Customer, Orders, Book
where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
        and Customer.name='박지성';
-- 1.(5) 선생님 답
select   count(distinct t3.publisher) 출판사수
from customer t1, orders t2, book t3
where t2.custid = t1.custid
      and t2.bookid = t3.bookid
      and t1.name = '박지성';

-- 1.(6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select   Customer.name, Book.price, saleprice, Book.price - saleprice as "정가와 판매가의 차이"
from    Customer, Orders, Book
where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
        and Customer.name='박지성';
-- 1.(6) 선생님 답
select t3.bookname 도서이름, t3.price 도서가격, t2.saleprice 판매가격, t3.price - t2.saleprice "정가-판매가격"
from customer t1, orders t2, book t3
where t2.custid = t1.custid
      and t2.bookid = t3.bookid
      and t1.name = '박지성';

-- 1.(7)
select Book.bookname
from Book 
where bookname NOT IN (select Book.bookname
                    from    Customer, Orders, Book
                    where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
                            and Customer.name='박지성');
                            
-- 2.(8)
select    name
from      Customer
Where name NOT IN (select customer.name 
                  from    Customer, Orders
                    where    Customer.custid = Orders.custid );
                    
-- 2.(9)
select    sum(saleprice ), avg(saleprice)
from    Orders;

-- 2.(10)
select  name , sum(saleprice)
from (select customer.name, saleprice 
        from customer inner join orders on customer.custid = orders.custid)
group by  name;


-- 질의 3-31 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오
SELECT     b1.bookname
FROM       Book b1
WHERE     b1.price > (SELECT avg(b2.price)
          from Book b2
          WHERE b2.publisher=b1.publisher);
--and b2.publisher=b1.publisher;
SELECT     b1.bookname
FROM       Book b1, (SELECT publisher, avg(price) as price
          from Book group by publisher)  b2
WHERE     b1.price > b2.price
          and b2.publisher=b1.publisher;

