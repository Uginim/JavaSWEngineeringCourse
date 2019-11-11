-- 1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�
--  (1) ������ȣ�� 1�� ������ �̸�
SELECT  bookname
FROM    book
WHERE   bookid = '1';

--  (2) ������ 20,000�� �̻��� ������ �̸�
SELECT  bookname
FROM    book
WHERE   price >= 20000;

--  (3) �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
SELECT  sum(saleprice)
FROM    orders
WHERE   custid = '1';

--  (4) �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
SELECT  count(*)
FROM    orders
WHERE   custid = '1';

-- 2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
--  (1) ���缭�� ������ �� ����
SELECT  count(*)
FROM    book;

--  (2) ���缭���� ������ ����ϴ� ���ǻ��� �� ����
SELECT  count(distinct publisher) -- �ߺ����ϱ� distinct
FROM    book;

--  (3) ��� ���� �̸� �ּ�
SELECT  name, address
FROM    customer;

--  (4) 2014�� 7�� 4��~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select * from orders;
SELECT  orderid
FROM    orders
WHERE   orderdate between '20140704' and '20140707';

SELECT  orderid
FROM    orders
WHERE   orderdate >= '20140704' 
        and orderdate <= '20140707';
        
--  (5) 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select * from orders;
SELECT  orderid
FROM    orders
WHERE   orderdate not between '20140704' and '20140707';

SELECT  orderid
FROM    orders
WHERE   orderdate < '20140704' 
        or orderdate > '20140707';
        
-- (6) ���� '��'���� ���� �̸��� �ּ�
SELECT  name, address
FROM    customer
WHERE   name like '��%';

-- (7) ���� '��' ���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
SELECT  name, address
FROM    customer
WHERE   name like '��%��';


-- ���̺� ����
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
    
SELECT  orders.orderid AS �ֹ���ȣ, 
        orders.orderdate AS �Ǹ�����, 
        customer.name AS ���̸�, 
        book.bookname AS �����̸�, 
        book.publisher AS ���ǻ�,
        orders.saleprice AS �Ǹž�
FROM    customer, orders, book
WHERE   customer.custid = orders.custid
    and book.bookid = orders.bookid;
--    and orders.orderid = '1';

SELECT  t2.orderid AS �ֹ���ȣ, 
        t2.orderdate AS �Ǹ�����, 
        t1.name AS ���̸�, 
        t3.bookname AS �����̸�, 
        t3.publisher AS ���ǻ�,
        t2.saleprice AS �Ǹž�
FROM    customer t1, orders t2, book t3
WHERE   t1.custid = t2.custid
    and t3.bookid = t2.bookid