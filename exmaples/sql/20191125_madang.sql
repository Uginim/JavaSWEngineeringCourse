CREATE INDEX ix_Book ON Book (bookname);
CREATE INDEX ix_Book2 ON Book (publisher, price);
ALTER INDEX ix_Book REBUILD;
DROP INDEX ix_Book2;

select *
from Book
WHERE publisher='���ѹ̵��' AND price >= 20000;

select * from user_indexes;
select * from all_indexes;
-- select * from dba_indexes; -- ���� ����

-- 1) �ε��� �м� �ڷ� ����
ANALYZE index ix_book2 VALIDATE STRUCTURE;
-- 2) �ε��� �м��� ����ڷ���ȸ
SELECT * FROM index_stats;
-- 3) del_lf_rows/lf_rows�� ������ �ε��� rebuild ����
ALTER INDEX ix_book2 REBUILD;

SELECT * FROM Book;
delete from orders where bookid in (select bookid FROM Book WHERE publisher in ('���ѹ̵��','�̻�̵��'));
DELETE FROM Book WHERE publisher in ('���ѹ̵��','�̻�̵��');

rollback;

SELECT name FROM customer WHERE name = '�ڼ���';
CREATE index ix_customer_01 on customer(name);
drop index ix_customer_01 ;
select rowid, name from customer;