-- 3-1
SELECT  bookname, price
FROM    Book;

-- 3-1 ����
SELECT  price, bookname
FROM    Book;

-- 3-2
SELECT  bookid, bookname, publisher, price
FROM    Book;


-- 3-3
SELECT  publisher
FROM    Book;

-- 3-3 �Ļ�
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

-- 3-5 �Ļ�
SELECT  * 
FROM    Book
WHERE   price >= 10000 AND price <= 20000;


-- 3-6
SELECT  * 
FROM    Book
WHERE   publisher IN ('�½�����', '���ѹ̵��');

SELECT  * 
FROM    Book
WHERE   publisher = '�½�����' 
    or  publisher = '���ѹ̵��';

SELECT  * 
FROM    Book
WHERE   publisher = '�½�����' 
  and   price >= 7000;

-- 3-6 ����
SELECT  * 
FROM    Book
WHERE   publisher NOT IN ('�½�����', '���ѹ̵��');

SELECT  * 
FROM    Book
WHERE   publisher <> '�½�����' 
  and   publisher <> '���ѹ̵��';
  
  
-- 3-7 '�౸�� ���� �Ⱓ�� ���ǻ縦 �˻�
SELECT  bookname, publisher
FROM    Book
WHERE   bookname LIKE '�౸�� ����';

-- 3-8 ���ϵ� ���� ���
SELECT  bookname, publisher
FROM    Book
WHERE   bookname LIKE '%�౸%';

-- 3-9 
SELECT  *
FROM    Book
WHERE   bookname LIKE '_��%';


-- 3-10
SELECT  *
FROM    Book
WHERE   bookname LIKE '%�౸%' AND price >= 20000;


-- 3-11
SELECT *
FROM    Book
WHERE   publisher='�½�����' OR publisher='���ѹ̵��';


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
where     publisher ='���ѹ̵��'
ORDER BY  price desc, bookname desc;

-- 3-15 ���� ���Ǹž�
SELECT    SUM(saleprice)
FROM      orders;

SELECT    SUM(saleprice) AS �Ѹ���
FROM      orders;

-- 3-16 ���� �Լ�
SELECT    SUM(saleprice) AS �Ѹ���
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
SELECT    custid, COUNT(*) AS ��������, SUM(saleprice) AS �Ѿ�
FROM      Orders
GROUP BY  custid;

-- 3-20
SELECT    custid, COUNT(*) AS ��������
FROM      Orders
WHERE     saleprice >= 8000
GROUP BY  custid
HAVING    COUNT(*) >= 2;

SELECT    custid, COUNT(*) AS ��������
FROM      Orders
WHERE     saleprice >= 8000
GROUP BY  custid
HAVING    COUNT(*) >= 2
ORDER BY  custid;

-- ��������
-- 1-1
select bookname 
from Book
where bookid = 1;

-- 1-2
select bookname,
from book
where price >= 20000;

-- 1-3
select sum(saleprice) as �ѱ��ž�
from orders
where custid = 1
group by custid;

-- 1-4

select count(*) as ���ŵ�����
from orders
where custid = 1
group by custid;


-- 2-1
select count(*) as "�� ���� ��"
from book;

-- 2-2
select count(distinct publisher) as "���ǻ� �� ����"
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
where name like '��%';

-- 2-7
select name, address
from  customer 
where name like '��%��';