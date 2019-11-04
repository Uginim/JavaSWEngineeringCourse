-- 부서 테이블 생성
drop table 부서;
CREATE TABLE 부서 (
    부서번호   VARCHAR2(10) ,
    부서이름   VARCHAR2(10) ,
    Primary key(부서번호)
);

-- 테이블 조회
SELECT 부서번호,부서이름 FROM 부서;
SELECT 부서번호 FROM 부서;
SELECT 부서이름 FROM 부서;
SELECT * FROM 부서;

-- 레코드 생성
INSERT INTO 부서(부서이름,부서번호) VALUES('인사팀','1001');
INSERT INTO 부서(부서이름,부서번호) VALUES('회계팀','1002');
--레코드 변경
UPDATE 부서 SET 부서이름 ='총무팀';
UPDATE 부서 SET 부서이름 ='총무팀' WHERE 부서번호='1002';

--가장 최근 COMMIT 이후의 질의를 최종으로 반영(더이상 ROLLBACK못함)
COMMIT;
--가장 최근 COMMIT 이후의 질의를 취소
ROLLBACK;

-- 레코드 삭제
DELETE FROM 부서;
ROLLBACK;
DELETE FROM 부서 WHERE 부서번호 ='1001';

-- 직원 테이블 생성
CREATE TABLE 직원(
    직원번호 VARCHAR2(10),
    직급 VARCHAR2(10),
    부서번호 VARCHAR2(10),
    Primary Key(직원번호),
    Foreign Key(부서번호) references 부서(부서번호)
);

INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C001','사원','1001');
INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C002','대리','1001');
INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C003','과장','1001');
SELECT * FROM 직원;
COMMIT;
INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C003','과장2','1001'); -- 오류
INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C004','사원','1002');
INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C005','대리','1002');
INSERT INTO 직원 (직원번호,직급,부서번호) VALUES('C006','과장','1002');
COMMIT;

-- 조인
SELECT * FROM 부서,직원 WHERE 부서.부서번호 = 직원.부서번호;
SELECT 부서이름,직급 FROM 부서,직원 WHERE 부서.부서번호 = 직원.부서번호 ;
SELECT 부서.부서이름 AS 부서명 ,직원.직급 AS 직책 FROM 부서,직원 WHERE 부서.부서번호 = 직원.부서번호 ;

-- 테이블 삭제
DROP TABLE 부서;
DROP TABLE 직원;

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