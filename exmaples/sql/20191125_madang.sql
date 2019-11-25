CREATE INDEX ix_Book ON Book (bookname);
CREATE INDEX ix_Book2 ON Book (publisher, price);
ALTER INDEX ix_Book REBUILD;
DROP INDEX ix_Book2;

select *
from Book
WHERE publisher='대한미디어' AND price >= 20000;

select * from user_indexes;
select * from all_indexes;
-- select * from dba_indexes; -- 권한 없음

-- 1) 인덱스 분석 자료 수집
ANALYZE index ix_book2 VALIDATE STRUCTURE;
-- 2) 인덱스 분석된 통계자료조회
SELECT * FROM index_stats;
-- 3) del_lf_rows/lf_rows이 높으면 인덱스 rebuild 수행
ALTER INDEX ix_book2 REBUILD;

SELECT * FROM Book;
delete from orders where bookid in (select bookid FROM Book WHERE publisher in ('대한미디어','이상미디어'));
DELETE FROM Book WHERE publisher in ('대한미디어','이상미디어');

rollback;

SELECT name FROM customer WHERE name = '박세리';
CREATE index ix_customer_01 on customer(name);
drop index ix_customer_01 ;
select rowid, name from customer;