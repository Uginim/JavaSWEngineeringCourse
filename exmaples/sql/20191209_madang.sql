drop table neworders; 
drop table newcustomer;
drop table newbook;
select * from all_constraints where table_name = 'NEWCUSTOMER';
DELETE FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'NEWCUSTOMER';
-- ���̺� �����ϱ�
create table newcustomer1 as 
    select * from customer;

-- ���̺� �����ϱ�2 (������ �����ϰ�, ���ڵ�� �������� ����)
create table newcustomer2 as 
    select * from customer where 1=2;
    
    
select * from newcustomer1;
select * from newcustomer2;

desc newcustomer2;
insert into newcustomer2
  values(10,'ȫ�浿','��� ����','010-1234-5678');
COMMIT;
rollback;

alter table newcustomer2 add primary key(custid);
create sequence custid_seq
  start with 1        --���۰�
  increment by 1     --������
  minvalue 1         --�ּҰ�
  maxvalue 10000000 --�ִ밪
  nocycle;            --1ȸ�� ��ȯ
  
-- ���� ������ ��ȣ
-- ���� ������ ��ȣ ��ȯ
select custid_seq.nextval from dual;
-- ���� ������ ��ȣ ��ȯ
select custid_seq.currval from dual;

select * from newcustomer2;
insert into newcustomer2
    values(custid_seq.nextval,'ȫ�浿','��� ����', '010-1234-5678');
rollback;


-- ������ ����
-- ������ ���۹�ȣ�� ������ �� ����.
-- ALTER SEQUENCE custid_seq start with 30;
-- ������ �� �ִ� ��
alter sequence custid_seq
  increment by 2;
-- start �����ϰ� �� ��
-- increment, minvalue, maxvalue, nocycle ��
  
-- ������ ����
drop sequence custid_seq;
create sequence custid_seq
  start with 30        --���۰�
  increment by 1     --������
  minvalue 1         --�ּҰ�
  maxvalue 99        --�ִ밪
  nocycle;            --1ȸ�� ��ȸ
  
-- synonim ����  
create synonym ord for orders;  
select * from ord;
  
select * from newcustomer1;
alter table newcustomer1 add primary key(custid); -- primary key�� �ڵ����� index�� �������

-- 1) �м��ϱ�
ANALYZE index SYS_C007067 validate structure;

-- 2) �м��� ����ڷ� ��ȸ
select * from index_stats;

-- 3) index rebuild
alter index SYS_C007067 rebuild; 

delete from newcustomer1; 
commit;
