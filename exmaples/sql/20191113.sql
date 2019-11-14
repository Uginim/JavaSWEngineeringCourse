-- 전체 고객이름
SELECT    name
FROM      customer;


-- 구매이력이 있는 고객이름
SELECT    name
FROM      customer
WHERE     custid in ( SELECT  custid
                        FROM  orders);
                        
-- 전체고객이름 - 구매이력이 있는 고객이름 = 구매이력이 없는 고객이름
SELECT    name -- 컬럼 개수는 같아야함
FROM      customer
MINUS
SELECT    name -- 컬럼 개수는 같아야함
FROM      customer
WHERE     custid  IN   (SELECT custid
                        FROM    orders);
                        
-- 전체고객이름 - 구매이력이 없는 고객이름 = 구매이력이 있는 고객이름
SELECT    name -- 컬럼 개수는 같아야함
FROM      customer
MINUS
SELECT    name -- 컬럼 개수는 같아야함
FROM      customer
WHERE     custid  NOT IN   (SELECT custid
                        FROM    orders);
                        
-- 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT    name,address
FROM      Customer t1
WHERE     EXISTS (SELECT *
                  FROM    Orders t2
                  WHERE   t2.custid = t1.custid);
                  
-- 주문이 없는 고객의 이름과 주소를 보이시오.
SELECT    name,address
FROM      Customer t1
WHERE     NOT EXISTS (SELECT *
                  FROM    Orders t2
                  WHERE   t2.custid = t1.custid);
                  
                  
-- 1-(5)
select   count(DISTINCT bk.publisher) as "출판사 수"
from    Customer cs, Orders od, Book bk
where    cs.custid = od.custid and od.bookid = bk.bookid 
        and cs.name='박지성';
-- 1-(6) 
select   cs.name, bk.price, od.saleprice, bk.price - od.saleprice as "정가와 판매가의 차이"
from    Customer cs, Orders od, Book bk
where    cs.custid = od.custid and od.bookid = bk.bookid 
        and cs.name='박지성';

-- 1-(7)
-- case 1)
select  bookname
from    Book bk
minus 
select Book.bookname
from    Customer, Orders, Book
where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
        and Customer.name='박지성';
-- case 2)
select Book.bookname
from Book 
where bookname NOT IN (select Book.bookname
                    from    Customer, Orders, Book
                    where    Customer.custid = Orders.custid and Orders.bookid = Book.bookid 
                            and Customer.name='박지성');        
-- 2-(8)
-- case 1)
select    name
from      Customer
Where name NOT IN (select customer.name 
                  from    Customer, Orders
                    where    Customer.custid = Orders.custid );
-- case 2) 부속질의 말고 집합연산
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
select cs.name, avg(od.saleprice) as "구매액평균"
from  Orders od, Customer cs
where od.custid = cs.custid
group by name
having avg(od.saleprice) > (select avg(saleprice) from Orders);