-- 테이블스페이스 생성 명령
CREATE TABLESPACE md_tbs
  DATAFILE 'D:\JAVASTUDY\madang\oradata\md_tbs_data01.dbf'
  SIZE 10M;
CREATE TABLESPACE md_test
  DATAFILE 'D:\JAVASTUDY\madang\oradata\md_test_data01.dbf;'
  SIZE 10M;
-- 테이블스페이스 삭제하기  
DROP TABLESPACE md_test
  INCLUDING CONTENTS AND DATAFILES;
  
-- 새로운 사용자 mdguest 생성
CREATE USER mdguest
  IDENTIFIED BY mdguest;
  
CREATE USER mdguest2
  IDENTIFIED BY mdguest2
  DEFAULT TABLESPACE md_tbs;

--접속 권한 주기
GRANT CONNECT TO mdguest;

-- RESOURCE 권한 주기
GRANT CREATE TABLE TO mdguest;

-- 한번에 주기
GRANT CONNECT,RESOURCE TO mdguest2;

