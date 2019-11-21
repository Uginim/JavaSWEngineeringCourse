-- 4 - (20)
CREATE VIEW vw_Customer
AS SELECT * 
  FROM Customer
  WHERE address LIKE '%대한민국%';

-- 결과 확인
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
  WHERE  address LIKE '%영국%';
  
SELECT * 
FROM  vw_Customer;
  
  
select * from user_objects;
select * from all_tables where table_name = 'CUSTOMER';
select * from all_tab_columns where table_name ='CUSTOMER';
-- select * from user_ 
-- 위 문장에서 `_`다음에서 스페이스바 누르면 여러가지가 나옴

-- 연습문제 8
-- 대부분 VARCHAR2(10)으로 함
-- 부서명 VARCHAR2(15)
-- 직위 CHAR(6) (대리, 사원, ..) -- 기본값은'사원'
-- 프고젝트명 VARCHAR2(30)
-- 성별 CHAR(3) (남/여) -- 남/여 가아닌건 체크
-- 근무시간 NUMBER(5) -- 한시간 이상 입력하게
-- 연락처 VARCHAR(12)

-- unique/primary keys in table referenced by foreign keys 오류가 뜰 경우
-- https://joont.tistory.com/140
DROP TABLE Employee CASCADE CONSTRAINT;
DROP TABLE Department CASCADE CONSTRAINT;
DROP TABLE Project CASCADE CONSTRAINT;
DROP TABLE Works CASCADE CONSTRAINT;

CREATE TABLE Employee ( 
  empno VARCHAR2(10) PRIMARY KEY,
  name VARCHAR2(10),
  phoneno VARCHAR2(13),
  sex CHAR(3) CHECK(sex='남' or sex='여'),
  position CHAR(6) DEFAULT '사원',
  deptno VARCHAR2(15) NULL
);
CREATE TABLE Department(
  deptno VARCHAR(10) PRIMARY KEY,
  deptname  VARCHAR(15),
  "manager" VARCHAR(10),
  FOREIGN KEY ("manager") REFERENCES Employee(empno) ON DELETE SET NULL
);
-- 제약조건 검색하기
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'EMPLOYEE';
ALTER TABLE Employee ADD FOREIGN KEY (deptno) REFERENCES Department(deptno) ON DELETE SET NULL;
-- 제약조건 수정 
-- ALTER TABLE Employee MODIFY CONSTRAINT 제약조건명 CASCADE;


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
INSERT INTO department VALUES('D0001','총무부',null);
INSERT INTO department VALUES('D0002','IT부',null);
INSERT INTO department VALUES('D0003','회계부',null);
INSERT INTO department VALUES('D0004','인사부',null);
INSERT INTO Employee VALUES('E0001','홍길동','010-5555-9776','남','대리','D0001');
INSERT INTO Employee VALUES('E0002','홍길서','010-1237-9784','여',null,'D0001');
INSERT INTO Employee VALUES('E0003','홍길남','010-1237-1744','남','부장','D0002');
INSERT INTO Employee VALUES('E0004','홍길북','010-2237-1744','남','과장','D0002');
INSERT INTO Employee VALUES('E0005','김유정','010-3237-1744','여','대리','D0003');
INSERT INTO Employee VALUES('E0006','김소현','010-4237-1744','여','사원','D0003');
INSERT INTO Employee VALUES('E0007','배수지','010-5237-1744','여','대리','D0004');
INSERT INTO Employee VALUES('E0008','문근영','010-6237-1744','여','과장','D0004');
INSERT INTO Employee VALUES('E0009','박보영','010-7237-1744','여','차장','D0001');
INSERT INTO Employee VALUES('E0010','전지현','010-8237-1744','여','부장','D0004');
INSERT INTO Employee VALUES('E0011','이민정','010-9237-1744','여','차장','D0003');
INSERT INTO Employee VALUES('E0012','임수정','010-9337-1744','여','차장','D0002');
INSERT INTO Employee VALUES('E0013','박한별','010-9337-2744','여','차장','D0002');
INSERT INTO Employee VALUES('E0014','김사랑','010-9337-2744','여','부장','D0002');
--UPDATE Employee SET  deptno ='D0004' WHERE empno='E0010';
UPDATE department SET "manager"='E0009' WHERE deptno ='D0001';
UPDATE department SET "manager"='E0003' WHERE deptno ='D0002';
UPDATE department SET "manager"='E0011' WHERE deptno ='D0003';
UPDATE department SET "manager"='E0010' WHERE deptno ='D0004';

INSERT INTO Project VALUES('P0001','당근마켓개발','D0002');
INSERT INTO Project VALUES('P0002','당근마켓유지보수','D0002');

INSERT INTO Works VALUES('E0003','P0001','1');
INSERT INTO Works VALUES('E0004','P0001','8');
INSERT INTO Works VALUES('E0012','P0001',188);


delete from Employee;
delete from department;
