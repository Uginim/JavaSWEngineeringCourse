select * from book;
INSERT INTO Book(bookid, bookname, publisher, price)
        VALUES (11, '스포츠 의학', '한솔의학서적',90000);
        
INSERT INTO Book(bookid, bookname, publisher)
        VALUES (14,'스포츠 의학','한솔의학서적');

INSERT INTO Book(bookid, bookname, price, publisher) 
        SELECT bookid, bookname,price,publisher
        FROM Imported_book;
       
select * from customer;
--3-47 
UPDATE Customer
SET     address='대한민국 부산'
WHERE  custid=5;

UPDATE  Customer
SET       address = (SELECT address
                      FROM Customer
                      WHERE name='김연아')
WHERE   name LIKE '박세리';

DELETE FROM Customer
WHERE   custid = 5;

DELETE FROM Customer;

rollback;
select *
      from orders od inner join customer cs on od.custid = cs.custid 
       inner join book bk on bk.bookid = od.bookid ;
       

-- 3-1
-- teacher
SELECT distinct t1.name
FROM   customer t1, oders t2, Book t3
WHERE t1.custid=t2.custid
AND    t2.bookid=t3.bookid
AND    t3.publisher IN (SELECT t3.publisher
                      FROM   customer t1, Orders t2, Book t3
                      WHERE t1.custid = t2.custid
                      AND    t2.bookid = t3.bookid
                      AND     t1.name = '박지성'
AND t1.name <> '박지성';
-- mine
select distinct name
      from orders od inner join customer cs on od.custid = cs.custid 
       inner join book bk on bk.bookid = od.bookid 
where publisher in (select publisher
      from orders od inner join customer cs on od.custid = cs.custid 
       inner join book bk on bk.bookid = od.bookid 
       where name = '박지성')
and name <>'박지성';
 
-- 3-2
--mine
select cs.name, count(distinct publisher)
      from orders od inner join customer cs on od.custid = cs.custid 
       inner join book bk on bk.bookid = od.bookid 
group by  cs.name
having count(distinct publisher)>=2;
-- teacher 
SELECT t1.name
FROM    customer t1
WHERE  ( SELECT COUNT(DISTINCT t4.publisher)
                  FROM customer t2, Orders t3, Book t4
                  WHERE t2.custid=t3.custid
                  AND t3.bookid =t4.booid
                  AND t2.name =t1.name) >= 2;

-- 3-3
--mine
select bookname, count(cs.name)
      from orders od inner join customer cs on od.custid = cs.custid 
       inner join book bk on bk.bookid = od.bookid 
group by bookname       
having count(cs.name) >= (select count(*) from customer) * 0.3;
-- teacher
SELECT t1.bookname
FROM    Book t1
WHERE (SELECT COUNT(t2.bookid)
        FROM Book t2, Orders t3
        WHERE t2.bookid = t3.bookid
        AND   t3.bookid=t1.bookid)
        >= (SELECT COUNT(*) FROM customer) * 0.3;
