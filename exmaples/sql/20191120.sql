-- 4-(1)
insert into book (bookid, bookname, publisher, price) 
        VALUES (11, '������ ����','���ѹ̵��',10000);
-- 4-(2)
delete from book where publisher ='�Ｚ��';
-- 4-(3)
delete from book where publisher ='�̻�̵��';
-- 4-(4)
UPDATE book
SET     publisher='�������ǻ�'
WHERE  publisher='���ѹ̵��';
rollback;
-- 4-(5)
create table Bookcompany(
  name    VARCHAR2(20),
  address   VARCHAR2(20),
  begin     DATE
);
-- 4-(6)
ALTER TABLE Bookcompany ADD webaddress VARCHAR(30);
-- 4-(7)
INSERT INTO Bookcompany (name, address, begin, webaddress) VALUES('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');
-- 4-(8)
SELECT * FROM  bookcompany; 

select *
from book  bk, customer cs, orders od
where od.bookid = bk.bookid and cs.custid = od.custid;

-- 5
SELECT *
FROM  Customer c1
WHERE  NOT EXISTS (SELECT *
                        FROM Orders c2 
                        WHERE c1.custid=c2.custid);
