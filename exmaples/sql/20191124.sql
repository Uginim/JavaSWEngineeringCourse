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


INSERT INTO department VALUES('D0001','�ѹ���',null); -- �μ����̺� ����
INSERT INTO department VALUES('D0002','IT��',null);
INSERT INTO department VALUES('D0003','ȸ���',null);
INSERT INTO department VALUES('D0004','�λ��',null);
INSERT INTO Employee VALUES('E0001','ȫ�浿','010-5555-9776','��','����','D0001');  --������̺�
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
--INSERT INTO Employee(empno,name,phoneno,address,sex,position,deptno) VALUES('E0015','�̻��','010-9337-3744','��','�븮','D0002');
SELECT name FROM Employee WHERE sex = '��';
CREATE INDEX idx_name ON Employee(name);
--UPDATE Employee SET  deptno ='D0004' WHERE empno='E0010';
UPDATE department SET "manager"='E0001' WHERE deptno ='D0001'; -- ������Ʈ
UPDATE department SET "manager"='E0003' WHERE deptno ='D0002';
UPDATE department SET "manager"='E0011' WHERE deptno ='D0003';
UPDATE department SET "manager"='E0010' WHERE deptno ='D0004';
DESC Works;
SELECT * FROM user_constraints WHERE TABLE_NAME = 'WORKS';
CREATE OR REPLACE VIEW vw_emp
AS SELECT ep.empno, ep.name, dp.deptname 
    FROM Employee ep, Department dp
    where ep.deptno = dp.deptno;


INSERT INTO Project VALUES('P0001','��ٸ��ϰ���','D0002');
INSERT INTO Project VALUES('P0002','��ٸ��ϼ�����������','D0002');

INSERT INTO Works VALUES('E0003','P0001','100');
INSERT INTO Works VALUES('E0004','P0001','128');
INSERT INTO Works VALUES('E0012','P0001',188);
INSERT INTO Works VALUES('E0010','P0002',138);
INSERT INTO Works VALUES('E0003','P0002','10');

SELECT dp.deptname �μ�, ep.name �̸�, wh.hours "���� �ð�"
FROM Employee ep, Department dp,
(SELECT empno, sum("hours-worked") hours FROM Works 
group by empno) wh
where dp.deptno = ep.deptno and ep.empno = wh.empno
ORDER BY �μ� ASC ,�̸� ASC;

SELECT dp.deptname �μ�, ep.name �̸�, SUM("hours-worked") AS "���� �ð�"
FROM Employee ep, Department dp, Works wk
GROUP BY dp.deptname, ep.name 
WHERE dp.deptno=ep.deptno AND ep.empno = wk.empno
ORDER BY �μ� ASC ,�̸� ASC;

SELECT dp.deptname �μ�, ep.name �̸�, SUM(wk."hours-worked") AS "���� �ð�"
FROM Employee ep, Department dp, Works wk
WHERE dp.deptno=ep.deptno AND ep.empno=wk.empno
GROUP BY dp.deptname, ep.name
ORDER BY �μ� ASC ,�̸� ASC;




-- ���⹮�� ����
SELECT dp.deptname �μ�, ep.name �̸�, wh.hours "���� �ð�"
FROM Employee ep, Department dp,
(SELECT empno, SUM(hoursworked) hours FROM Works 
GROUP BY empno) wh
WHERE dp.deptno = ep.deptno AND ep.empno = wh.empno
ORDER BY �μ� ASC ,�̸� ASC;

SELECT dp.deptname �μ�, ep.name �̸�, SUM(wk.hoursworked) AS "���� �ð�"
FROM Employee ep, Department dp, Works wk
WHERE dp.deptno=ep.deptno AND ep.empno=wk.empno
GROUP BY dp.deptname, ep.name
ORDER BY �μ� ASC ,�̸� ASC;


--SELECT pr.projno ������Ʈ�ǹ�ȣ, pr.projname ������Ʈ�̸�, COUNT(wk.empno) �����
SELECT pr.projno ������Ʈ�ǹ�ȣ, pr.projname ������Ʈ�̸�,  COUNT(wk.empno) �����
FROM Project pr, Works wk
WHERE pr.projno = wk.projno
GROUP BY pr.projno, pr.projname 
HAVING COUNT(wk.empno) >= 2;

SELECT * 
FROM Project pr, Works wk
WHERE pr.projno = wk.projno;
