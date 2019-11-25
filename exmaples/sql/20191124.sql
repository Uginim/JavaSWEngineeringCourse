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


INSERT INTO department VALUES('D0001','총무부',null); -- 부서테이블 먼저
INSERT INTO department VALUES('D0002','IT부',null);
INSERT INTO department VALUES('D0003','회계부',null);
INSERT INTO department VALUES('D0004','인사부',null);
INSERT INTO Employee VALUES('E0001','홍길동','010-5555-9776','남','부장','D0001');  --사원테이블
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
--INSERT INTO Employee(empno,name,phoneno,address,sex,position,deptno) VALUES('E0015','이사랑','010-9337-3744','남','대리','D0002');
SELECT name FROM Employee WHERE sex = '여';
CREATE INDEX idx_name ON Employee(name);
--UPDATE Employee SET  deptno ='D0004' WHERE empno='E0010';
UPDATE department SET "manager"='E0001' WHERE deptno ='D0001'; -- 업데이트
UPDATE department SET "manager"='E0003' WHERE deptno ='D0002';
UPDATE department SET "manager"='E0011' WHERE deptno ='D0003';
UPDATE department SET "manager"='E0010' WHERE deptno ='D0004';
DESC Works;
SELECT * FROM user_constraints WHERE TABLE_NAME = 'WORKS';
CREATE OR REPLACE VIEW vw_emp
AS SELECT ep.empno, ep.name, dp.deptname 
    FROM Employee ep, Department dp
    where ep.deptno = dp.deptno;


INSERT INTO Project VALUES('P0001','당근마켓개발','D0002');
INSERT INTO Project VALUES('P0002','당근마켓서버유지보수','D0002');

INSERT INTO Works VALUES('E0003','P0001','100');
INSERT INTO Works VALUES('E0004','P0001','128');
INSERT INTO Works VALUES('E0012','P0001',188);
INSERT INTO Works VALUES('E0010','P0002',138);
INSERT INTO Works VALUES('E0003','P0002','10');

SELECT dp.deptname 부서, ep.name 이름, wh.hours "일한 시간"
FROM Employee ep, Department dp,
(SELECT empno, sum("hours-worked") hours FROM Works 
group by empno) wh
where dp.deptno = ep.deptno and ep.empno = wh.empno
ORDER BY 부서 ASC ,이름 ASC;

SELECT dp.deptname 부서, ep.name 이름, SUM("hours-worked") AS "일한 시간"
FROM Employee ep, Department dp, Works wk
GROUP BY dp.deptname, ep.name 
WHERE dp.deptno=ep.deptno AND ep.empno = wk.empno
ORDER BY 부서 ASC ,이름 ASC;

SELECT dp.deptname 부서, ep.name 이름, SUM(wk."hours-worked") AS "일한 시간"
FROM Employee ep, Department dp, Works wk
WHERE dp.deptno=ep.deptno AND ep.empno=wk.empno
GROUP BY dp.deptname, ep.name
ORDER BY 부서 ASC ,이름 ASC;




-- 기출문제 버전
SELECT dp.deptname 부서, ep.name 이름, wh.hours "일한 시간"
FROM Employee ep, Department dp,
(SELECT empno, SUM(hoursworked) hours FROM Works 
GROUP BY empno) wh
WHERE dp.deptno = ep.deptno AND ep.empno = wh.empno
ORDER BY 부서 ASC ,이름 ASC;

SELECT dp.deptname 부서, ep.name 이름, SUM(wk.hoursworked) AS "일한 시간"
FROM Employee ep, Department dp, Works wk
WHERE dp.deptno=ep.deptno AND ep.empno=wk.empno
GROUP BY dp.deptname, ep.name
ORDER BY 부서 ASC ,이름 ASC;


--SELECT pr.projno 프로젝트의번호, pr.projname 프로젝트이름, COUNT(wk.empno) 사원수
SELECT pr.projno 프로젝트의번호, pr.projname 프로젝트이름,  COUNT(wk.empno) 사원수
FROM Project pr, Works wk
WHERE pr.projno = wk.projno
GROUP BY pr.projno, pr.projname 
HAVING COUNT(wk.empno) >= 2;

SELECT * 
FROM Project pr, Works wk
WHERE pr.projno = wk.projno;
