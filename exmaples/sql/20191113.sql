-- ��ü ���̸�
SELECT    name
FROM      customer;


-- �����̷��� �ִ� ���̸�
SELECT    name
FROM      customer
WHERE     custid in ( SELECT  custid
                        FROM  orders);
                        
-- ��ü���̸� - �����̷��� �ִ� ���̸� = �����̷��� ���� ���̸�
SELECT    name -- �÷� ������ ���ƾ���
FROM      customer
MINUS
SELECT    name -- �÷� ������ ���ƾ���
FROM      customer
WHERE     custid  IN   (SELECT custid
                        FROM    orders);
                        
-- ��ü���̸� - �����̷��� ���� ���̸� = �����̷��� �ִ� ���̸�
SELECT    name -- �÷� ������ ���ƾ���
FROM      customer
MINUS
SELECT    name -- �÷� ������ ���ƾ���
FROM      customer
WHERE     custid  NOT IN   (SELECT custid
                        FROM    orders);
                        
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
SELECT    name,address
FROM      Customer t1
WHERE     EXISTS (SELECT *
                  FROM    Orders t2
                  WHERE   t2.custid = t1.custid);
                  
-- �ֹ��� ���� ���� �̸��� �ּҸ� ���̽ÿ�.
SELECT    name,address
FROM      Customer t1
WHERE     NOT EXISTS (SELECT *
                  FROM    Orders t2
                  WHERE   t2.custid = t1.custid);
                  
                  
-- 1-(5)
select   count(DISTINCT bk.publisher) as "���ǻ� ��"
from    Customer cs, Orders od, Book bk
where    cs.custid = od.custid and od.bookid = bk.bookid 
        and cs.name='������';
-- 1-(6) 
select   cs.name, bk.price, od.saleprice, bk.price - od.saleprice as "������ �ǸŰ��� ����"
from    Customer cs, Orders od, Book bk
where    cs.custid = od.custid and od.bookid = bk.bookid 
        and cs.name='������';

-- 1-(7)
-- case 1)
select  bookname
from    Book bk
minus 
select Book.bookname
from    Customer, Orders, Book
where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
        and Customer.name='������';
-- case 2)
select Book.bookname
from Book 
where bookname NOT IN (select Book.bookname
                    from    Customer, Orders, Book
                    where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
                            and Customer.name='������');        
-- 2-(8)
-- case 1)
select    name
from      Customer
Where name NOT IN (select customer.name 
                  from    Customer, Orders
                    where    Customer.custid = Orders.custid );
-- case 2) �μ����� ���� ���տ���
select    name
from      Customer
minus 
select customer.name 
from    Customer, Orders
where    Customer.custid = Orders.custid;

-- 2-(9)
select    sum(saleprice ), avg(saleprice)
from    Orders;

-- 2-(10)
select  name , sum(saleprice)
from (select customer.name, saleprice 
        from customer inner join orders on customer.custid = orders.custid)
group by  name;

-- 2-(11)
select  cs.name , bk.bookname
from Customer cs, Orders od, Book bk
where cs.custid(+)=od.custid and od.bookid=bk.bookid
order by name, bookname;

-- 2-(12)
select od.orderid, bk.bookname, bk.price, od.saleprice
from Orders od, Book bk
where od.bookid= bk.bookid and 
bk.price - od.saleprice = (select max(bk.price - od.saleprice ) 
                            from Orders od, Book bk
                            where od.bookid= bk.bookid);
-- 2-(13)
select cs.name, avg(od.saleprice) as "���ž����"
from  Orders od, Customer cs
where od.custid = cs.custid
group by name
having avg(od.saleprice) > (select avg(saleprice) from Orders);