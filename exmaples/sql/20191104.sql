-- ������ user�� ������ �˷���
show user;

drop table �μ�;
drop table ����;
-- �ڵ����� commit�Ǿ rollback�Ұ�

create table �μ� (
    �μ���ȣ varchar2(10),
    �μ��̸� varchar2(10)
);

select * from �μ�;
insert into �μ�(�μ���ȣ, �μ��̸�) values('1001','ȸ����');
rollback;
commit;
insert into �μ�(�μ���ȣ, �μ��̸�) values('1002','�ѹ���');
--insert into �μ�(�μ���ȣ, �μ��̸�) values('1003','IT��');
delete from �μ� where �μ���ȣ = '1003';
-- ���̺� �⺻ Ű �߰�
alter table �μ� add  primary key(�μ���ȣ);
-- ���̺� ���� ����
desc �μ�;
create table ����(
    ������ȣ varchar2(10),
    ���� varchar2(10),
    �μ���ȣ varchar2(10)    
);
select * from ����;
insert into ����(������ȣ,����,�μ���ȣ) values('A001','�븮','1001');
insert into ����(������ȣ,����,�μ���ȣ) values('A002','����','1002');
insert into ����(������ȣ,����,�μ���ȣ) values('A003','����','1003');
rollback;
desc ����;
alter table ���� add primary key(������ȣ);
insert into ����(������ȣ,����,�μ���ȣ) values('A004','����','1002');
delete from ���� where �μ���ȣ = '1003';
commit;
-- �ܷ�Ű �߰�
alter table ���� add foreign key(�μ���ȣ) references �μ�(�μ���ȣ);
-- �ܷ�Ű ����
-- alter table ���� drop constraint �μ��̸�; -- ORA-02443: Cannot drop constraint  - nonexistent constraint
alter table ���� drop constraint SYS_C007002; -- right way

--���̺� ���� ��ȸ
desc ����;
select * from col where tname = '����';
select * from cols where table_name = '����';

insert into ����(������ȣ,����,�μ���ȣ) values('A005','����','1003');

drop table testtable1;
create table testtable(
    field1 varchar(2)
);
rollback;