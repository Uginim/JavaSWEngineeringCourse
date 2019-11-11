--1마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을작성하시오.

--  (1)도서번호가 1인도서의 이름
SELECT  bookname
FROM    book
WHERE   bookid = '1';

--  (2)가격이 20,000원이상인 도서의 이름
SELECT  bookname
FROM    book
WHERE   price >= 20000;

--  (3)박지성의 총구매액(박지성의고객번호는 1번으로놓고 작성)
SELECT  SUM(saleprice)
FROM    orders
WHERE   custid = '1';

--  (4)박지성이 구매한도서의 수(박지성의고객번호는 1번으로놓고 작성)
SELECT  COUNT(*)
FROM    orders
WHERE   custid = '1';
  

--2마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을작성하시오.
--  (1) 마당서점도서의 총 개수
SELECT  COUNT(*)
FROM    book;
--  (2) 마당서점에도서를 출고하는 출판사의 총 개수
SELECT  COUNT(DISTINCT publisher)
FROM    book;
--  (3) 모든고객의 이름, 주소
SELECT  name, address
FROM    customer;
--  (4) 2014년 7월4일~7월7일사이에 주문받은도서의 주문번호
SELECT  bookid
FROM    orders
where   orderdate between 
--  (5) 2014년 7월4일~7월7일사이에 주문받은도서를 제외한 도서의 주문번호

--  (6) 성이‘김’ 씨인 고객의 이름과 주소

--  (7) 성이‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소

