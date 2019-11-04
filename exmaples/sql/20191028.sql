--레코드들 조회
select * from book;
-- 9번만 조회
select * from book where bookid = '9';

select * from book where price >= 10000;
--레코드, 행 생성
insert into book values(11, '데이터베이스', '한빛출판사', 30000);
--레코드, 행 수정
update book set price=25000 where bookid = 11;
--레코드, 행 삭제
delete from book where bookid = 11;