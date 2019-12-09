drop table neworders; 
drop table newcustomer;
drop table newbook;
select * from all_constraints where table_name = 'NEWCUSTOMER';
DELETE FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'NEWCUSTOMER';
-- 테이블 복사하기
create table newcustomer1 as 
    select * from customer;

-- 테이블 복사하기2 (구조만 복사하고, 레코드는 복사하지 않음)
create table newcustomer2 as 
    select * from customer where 1=2;
    
    
select * from newcustomer1;
select * from newcustomer2;

desc newcustomer2;
insert into newcustomer2
  values(10,'홍길동','울산 남구','010-1234-5678');
COMMIT;
rollback;

alter table newcustomer2 add primary key(custid);
create sequence custid_seq
  start with 1        --시작값
  increment by 1     --증가값
  minvalue 1         --최소값
  maxvalue 10000000 --최대값
  nocycle;            --1회만 순환
  
-- 현재 시퀀스 번호
-- 다음 시퀀스 번호 반환
select custid_seq.nextval from dual;
-- 현재 시퀀스 번호 반환
select custid_seq.currval from dual;

select * from newcustomer2;
insert into newcustomer2
    values(custid_seq.nextval,'홍길동','울산 남구', '010-1234-5678');
rollback;


-- 시퀀스 수정
-- 시퀀스 시작번호는 변경할 수 없다.
-- ALTER SEQUENCE custid_seq start with 30;
-- 변경할 수 있는 값
alter sequence custid_seq
  increment by 2;
-- start 제외하곤 다 됨
-- increment, minvalue, maxvalue, nocycle 등
  
-- 시퀀스 삭제
drop sequence custid_seq;
create sequence custid_seq
  start with 30        --시작값
  increment by 1     --증가값
  minvalue 1         --최소값
  maxvalue 99        --최대값
  nocycle;            --1회만 순회
  
-- synonim 생성  
create synonym ord for orders;  
select * from ord;
  
select * from newcustomer1;
alter table newcustomer1 add primary key(custid); -- primary key는 자동으로 index가 만들어짐

-- 1) 분석하기
ANALYZE index SYS_C007067 validate structure;

-- 2) 분석된 통계자료 조회
select * from index_stats;

-- 3) index rebuild
alter index SYS_C007067 rebuild; 

delete from newcustomer1; 
commit;
