-- 4 - (20)
CREATE VIEW vw_Customer
AS SELECT * 
  FROM Customer
  WHERE address LIKE '%���ѹα�%';

-- ��� Ȯ��
SELECT * 
FROM  vw_Customer;
  

-- 4 - (21)
CREATE VIEW vw_Orders( orderid, custid, name, bookid, bookname, saleprice, orderdate) 
AS SELECT od.orderid, od.custid, cs.name,
            od.bookid, bk.bookname, od.saleprice, od.orderdate
    FROM  Orders od, Customer cs, Book bk
    WHERE od.custid=cs.custid AND od.bookid=bk.bookid;
    
SELECT * 
FROM  vw_Orders;

-- 4 - (22)
CREATE OR REPLACE VIEW vw_Customer (custid, name, address) 
AS SELECT custid, name, address
  FROM    customer
  WHERE  address LIKE '%����%';
  
SELECT * 
FROM  vw_Customer;
  
  
select * from user_objects;
select * from all_tables where table_name = 'CUSTOMER';
select * from all_tab_columns where table_name ='CUSTOMER';
-- select * from user_ 
-- �� ���忡�� `_`�������� �����̽��� ������ ���������� ����

-- �������� 8
-- ��κ� VARCHAR2(10)���� ��
-- �μ��� VARCHAR2(15)
-- ���� CHAR(6) (�븮, ���, ..) -- �⺻����'���'
-- ������Ʈ�� VARCHAR2(30)
-- ���� CHAR(3) (��/��) -- ��/�� ���ƴѰ� üũ
-- �ٹ��ð� NUMBER(5) -- �ѽð� �̻� �Է��ϰ�
-- ����ó VARCHAR(12)

-- unique/primary keys in table referenced by foreign keys ������ �� ���
-- https://joont.tistory.com/140
DROP TABLE Employee CASCADE CONSTRAINT;
DROP TABLE Department CASCADE CONSTRAINT;
DROP TABLE Project CASCADE CONSTRAINT;
DROP TABLE Works CASCADE CONSTRAINT;

CREATE TABLE Employee ( 
  empno VARCHAR2(10) PRIMARY KEY,
  name VARCHAR2(10),
  phoneno VARCHAR2(13),
  sex CHAR(3) CHECK(sex='��' or sex='��'),
  position CHAR(6) DEFAULT '���',
  deptno VARCHAR2(15) NULL
);
CREATE TABLE Department(
  deptno VARCHAR(10) PRIMARY KEY,
  deptname  VARCHAR(15),
  "manager" VARCHAR(10),
  FOREIGN KEY ("manager") REFERENCES Employee(empno) ON DELETE SET NULL
);
-- �������� �˻��ϱ�
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'EMPLOYEE';
ALTER TABLE Employee ADD FOREIGN KEY (deptno) REFERENCES Department(deptno) ON DELETE SET NULL;
-- �������� ���� 
-- ALTER TABLE Employee MODIFY CONSTRAINT �������Ǹ� CASCADE;


CREATE TABLE Project(
  projno VARCHAR(10) PRIMARY KEY,
  projname VARCHAR(30),
  deptno VARCHAR(10),
  FOREIGN KEY (deptno) REFERENCES Department(deptno ) ON DELETE SET NULL
);
CREATE TABLE Works(
  empno VARCHAR2(10) ,
  projno VARCHAR(10) ,
  "hours-worked" NUMBER(5) CHECK("hours-worked" >=1),
  PRIMARY KEY(empno,projno),
  FOREIGN KEY (empno) REFERENCES Employee(empno ) ON DELETE SET NULL,
  FOREIGN KEY (projno) REFERENCES Project(projno ) ON DELETE SET NULL
);
ALTER TABLE Employee MODIFY phoneno VARCHAR2(13);
ALTER TABLE Department MODIFY deptname VARCHAR2(15);
INSERT INTO department VALUES('D0001','�ѹ���',null);
INSERT INTO department VALUES('D0002','IT��',null);
INSERT INTO department VALUES('D0003','ȸ���',null);
INSERT INTO department VALUES('D0004','�λ��',null);
INSERT INTO Employee VALUES('E0001','ȫ�浿','010-5555-9776','��','�븮','D0001');
INSERT INTO Employee VALUES('E0002','ȫ�漭','010-1237-9784','��',null,'D0001');
INSERT INTO Employee VALUES('E0003','ȫ�泲','010-1237-1744','��','����','D0002');
INSERT INTO Employee VALUES('E0004','ȫ���','010-2237-1744','��','����','D0002');
INSERT INTO Employee VALUES('E0005','������','010-3237-1744','��','�븮','D0003');
INSERT INTO Employee VALUES('E0006','�����','010-4237-1744','��','���','D0003');
INSERT INTO Employee VALUES('E0007','�����','010-5237-1744','��','�븮','D0004');
INSERT INTO Employee VALUES('E0008','���ٿ�','010-6237-1744','��','����','D0004');
INSERT INTO Employee VALUES('E0009','�ں���','010-7237-1744','��','����','D0001');
INSERT INTO Employee VALUES('E0010','������','010-8237-1744','��','����','D0004');
INSERT INTO Employee VALUES('E0011','�̹���','010-9237-1744','��','����','D0003');
INSERT INTO Employee VALUES('E0012','�Ӽ���','010-9337-1744','��','����','D0002');
INSERT INTO Employee VALUES('E0013','���Ѻ�','010-9337-2744','��','����','D0002');
INSERT INTO Employee VALUES('E0014','����','010-9337-2744','��','����','D0002');
--UPDATE Employee SET  deptno ='D0004' WHERE empno='E0010';
UPDATE department SET "manager"='E0009' WHERE deptno ='D0001';
UPDATE department SET "manager"='E0003' WHERE deptno ='D0002';
UPDATE department SET "manager"='E0011' WHERE deptno ='D0003';
UPDATE department SET "manager"='E0010' WHERE deptno ='D0004';

INSERT INTO Project VALUES('P0001','��ٸ��ϰ���','D0002');
INSERT INTO Project VALUES('P0002','��ٸ�����������','D0002');

INSERT INTO Works VALUES('E0003','P0001','1');
INSERT INTO Works VALUES('E0004','P0001','8');
INSERT INTO Works VALUES('E0012','P0001',188);


delete from Employee;
delete from department;
