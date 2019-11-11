SELECT * FROM orders;
SELECT * FROM book;
SELECT * FROM customer;


SELECT *
FROM  orders t1, book t2, customer t3;

SELECT count(* )
FROM  orders t1, book t2, customer t3;

-- �Ȱ��� �÷��̸��� �ߺ��� ���� ���
SELECT bookid
FROM  orders t1, book t2, customer t3;
-- column �̸��� ���� �� ����
SELECT t1.bookid, t2.bookid
FROM  orders t1, book t2, customer t3;


SELECT t1.*
FROM  orders t1, book t2, customer t3;

SELECT t1.*, t2.*
FROM  orders t1, book t2, customer t3;

-- īƼ�� ��(īƼ�� ���δ�Ʈ ����)
SELECT *
FROM  orders t1, book t2, customer t3;
-- ���� ����(Inner Join)
SELECT  *
FROM    orders t1, book t2, customer t3
WHERE   t1.bookid = t2.bookid
        and t1.custid = t3.custid;
-- ���� ����(���̺� 2��)
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
    and t1.name= '������';
-- case 2)
SELECT *
FROM    customer t1 INNER JOIN orders t2
        ON t1.custid = t2.custid;

-- left outer join
-- case1)
SELECT *
FROM  customer t1, orders t2
WHERE t1.custid = t2.custid(+); -- +�� ������ �ʿ� �ٿ��ش�.
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

-- ���ȸ� å ã��
SELECT  bookname, publisher 
FROM    book t1 left outer join orders t2 on t1.bookid = t2.bookid
WHERE t2.orderid is null;

