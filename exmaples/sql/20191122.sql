-- �������� 6
-- 6-(1)
-- mine
CREATE VIEW highorders
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher, od.saleprice
      from Book bk, Customer cs, Orders od
      WHERE bk.bookid = od.bookid and od.custid = cs.custid
          and od.saleprice >= 20000;
-- teacher
create view vw_highorders as
select  t3.bookid ������ȣ,
        t3.bookname �����̸�,
        t1.name ���̸�,
        t3.publisher ���ǻ�,
        t2.saleprice �ǸŰ���
  from  customer t1, orders t2, book t3
where  t1.custid = t2.custid
    and t2.bookid = t3.bookid
    and t2.saleprice >= 20000;
-- 6-(2)   
-- mine
SELECT bookname, name FROM Highorders;
-- teacher
SELECT "�����̸�", "���̸�" FROM vw_highorders;

-- 6-(3)   
-- mine
CREATE OR REPLACE VIEW highorders
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher
      from Book bk, Customer cs, Orders od
      WHERE bk.bookid = od.bookid and od.custid = cs.custid
          and od.saleprice >= 20000;




SELECT bookname, name FROM Highorders;