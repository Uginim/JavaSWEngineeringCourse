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

-- 3-24 ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ������ ����
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

-- 3-28 �������� �������� �μ�����
SELECT    bookname
FROM      Book
WHERE     price = ( SELECT MAX(price)
                    FROM Book);

-- 3-29 ������ �� �ִ� ���̸�
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
                                      WHERE   publisher='���ѹ̵��'));

-- 1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�.
-- 1.(5) �������� ������ ������ ���ǻ� ��
select   count(DISTINCT publisher) as "���ǻ� ��"
from    Customer, Orders, Book
where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
        and Customer.name='������';
-- 1.(5) ������ ��
select   count(distinct t3.publisher) ���ǻ��
from customer t1, orders t2, book t3
where t2.custid = t1.custid
      and t2.bookid = t3.bookid
      and t1.name = '������';

-- 1.(6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select   Customer.name, Book.price, saleprice, Book.price - saleprice as "������ �ǸŰ��� ����"
from    Customer, Orders, Book
where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
        and Customer.name='������';
-- 1.(6) ������ ��
select t3.bookname �����̸�, t3.price ��������, t2.saleprice �ǸŰ���, t3.price - t2.saleprice "����-�ǸŰ���"
from customer t1, orders t2, book t3
where t2.custid = t1.custid
      and t2.bookid = t3.bookid
      and t1.name = '������';

-- 1.(7)
select Book.bookname
from Book 
where bookname NOT IN (select Book.bookname
                    from    Customer, Orders, Book
                    where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
                            and Customer.name='������');
                            
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


-- ���� 3-31 ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�
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

