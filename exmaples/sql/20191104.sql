-- 접속한 user가 누군지 알려줌
show user;

drop table 부서;
drop table 직원;
-- 자동으로 commit되어서 rollback불가

create table 부서 (
    부서번호 varchar2(10),
    부서이름 varchar2(10)
);

select * from 부서;
insert into 부서(부서번호, 부서이름) values('1001','회계팀');
rollback;
commit;
insert into 부서(부서번호, 부서이름) values('1002','총무팀');
--insert into 부서(부서번호, 부서이름) values('1003','IT팀');
delete from 부서 where 부서번호 = '1003';
-- 테이블에 기본 키 추가
alter table 부서 add  primary key(부서번호);
-- 테이블 구조 보기
desc 부서;
create table 직원(
    직원번호 varchar2(10),
    직급 varchar2(10),
    부서번호 varchar2(10)    
);
select * from 직원;
insert into 직원(직원번호,직급,부서번호) values('A001','대리','1001');
insert into 직원(직원번호,직급,부서번호) values('A002','과장','1002');
insert into 직원(직원번호,직급,부서번호) values('A003','차장','1003');
rollback;
desc 직원;
alter table 직원 add primary key(직원번호);
insert into 직원(직원번호,직급,부서번호) values('A004','과장','1002');
delete from 직원 where 부서번호 = '1003';
commit;
-- 외래키 추가
alter table 직원 add foreign key(부서번호) references 부서(부서번호);
-- 외래키 삭제
-- alter table 직원 drop constraint 부서이름; -- ORA-02443: Cannot drop constraint  - nonexistent constraint
alter table 직원 drop constraint SYS_C007002; -- right way

--테이블 구조 조회
desc 직원;
select * from col where tname = '직원';
select * from cols where table_name = '직원';

insert into 직원(직원번호,직급,부서번호) values('A005','차장','1003');

drop table testtable1;
create table testtable(
    field1 varchar(2)
);
rollback;