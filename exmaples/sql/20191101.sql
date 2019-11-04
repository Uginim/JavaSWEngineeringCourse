-- �μ� ���̺� ����
drop table �μ�;
CREATE TABLE �μ� (
    �μ���ȣ   VARCHAR2(10) ,
    �μ��̸�   VARCHAR2(10) ,
    Primary key(�μ���ȣ)
);

-- ���̺� ��ȸ
SELECT �μ���ȣ,�μ��̸� FROM �μ�;
SELECT �μ���ȣ FROM �μ�;
SELECT �μ��̸� FROM �μ�;
SELECT * FROM �μ�;

-- ���ڵ� ����
INSERT INTO �μ�(�μ��̸�,�μ���ȣ) VALUES('�λ���','1001');
INSERT INTO �μ�(�μ��̸�,�μ���ȣ) VALUES('ȸ����','1002');
--���ڵ� ����
UPDATE �μ� SET �μ��̸� ='�ѹ���';
UPDATE �μ� SET �μ��̸� ='�ѹ���' WHERE �μ���ȣ='1002';

--���� �ֱ� COMMIT ������ ���Ǹ� �������� �ݿ�(���̻� ROLLBACK����)
COMMIT;
--���� �ֱ� COMMIT ������ ���Ǹ� ���
ROLLBACK;

-- ���ڵ� ����
DELETE FROM �μ�;
ROLLBACK;
DELETE FROM �μ� WHERE �μ���ȣ ='1001';

-- ���� ���̺� ����
CREATE TABLE ����(
    ������ȣ VARCHAR2(10),
    ���� VARCHAR2(10),
    �μ���ȣ VARCHAR2(10),
    Primary Key(������ȣ),
    Foreign Key(�μ���ȣ) references �μ�(�μ���ȣ)
);

INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C001','���','1001');
INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C002','�븮','1001');
INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C003','����','1001');
SELECT * FROM ����;
COMMIT;
INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C003','����2','1001'); -- ����
INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C004','���','1002');
INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C005','�븮','1002');
INSERT INTO ���� (������ȣ,����,�μ���ȣ) VALUES('C006','����','1002');
COMMIT;

-- ����
SELECT * FROM �μ�,���� WHERE �μ�.�μ���ȣ = ����.�μ���ȣ;
SELECT �μ��̸�,���� FROM �μ�,���� WHERE �μ�.�μ���ȣ = ����.�μ���ȣ ;
SELECT �μ�.�μ��̸� AS �μ��� ,����.���� AS ��å FROM �μ�,���� WHERE �μ�.�μ���ȣ = ����.�μ���ȣ ;

-- ���̺� ����
DROP TABLE �μ�;
DROP TABLE ����;

CREATE TABLE department(
    "name" VARCHAR2(10),
    "number" VARCHAR2(10),
    PRIMARY KEY ( "number")    
);

CREATE TABLE employee (
    "position" VARCHAR2(10),
    "number" VARCHAR2(10),
    "department_number" VARCHAR2(10),
    PRIMARY KEY ("number"),
    FOREIGN KEY ("department_number")  REFERENCES department("number")
);
--DROP TABLE department;

INSERT INTO department ("name", "number") VALUES('HR','1001');
INSERT INTO department ("name", "number") VALUES('AD','1002');

UPDATE department SET "name" = 'GA' where "number" = '1002';

INSERT INTO employee ("position", "number", "department_number") VALUES('staff','C001','1001');
INSERT INTO employee ("position", "number", "department_number") VALUES('AM','C002','1001');
INSERT INTO employee ("position", "number", "department_number") VALUES('GM','C003','1001');
INSERT INTO employee ("position", "number", "department_number") VALUES('staff','C004','1002');
INSERT INTO employee ("position", "number", "department_number") VALUES('AM','C005','1002');
INSERT INTO employee ("position", "number", "department_number") VALUES('GM','C006','1002');

select * from department, employee where department."number" = employee."department_number";
commit;