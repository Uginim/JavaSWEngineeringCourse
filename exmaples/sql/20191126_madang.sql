-- 트랜잭션 예시
set transaction name 'mytran';
insert into book values(99, '데이터베이스', '한빛', 25000);
select bookname "도서명" from book
where bookid =99;
savepoint a;

update book set booname = '데이터베이스 개론'
where bookid = 99;
select bookname "도서명2" from book
where bookid =99;
savepoint b;

update book set bookname ='데이터베이스 개론 및 실습'
where bookid = 99;
select bookname "도서명3" from book 
where bookid =99;
rollback to b;

select bookname "도서명4" from book 
where bookid =99;
rollback to a;

select bookname "도서명5" from book 
where bookid =99;
update book set bookname ='데이터베이스 개론 및 실습2'
where bookid = 99;
select bookname "도서명6" from book 
where bookid =99;
rollback;

select bookname "도서명7" from book
where bookid=99;

SELECT * FROM BOOK;


-- 데이터 사전 검색
-- 테이블 구조 조회
SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME='WORKS';
-- 제약조건 조회
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'WORKS'; 