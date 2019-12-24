select * from madang.book;
select * from book; -- 실행 안됨

grant select on madang.book to mdguest2; -- 오류
grant select on madang.customer to mdguest2;