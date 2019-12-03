-- 사용자에게 부여된 시스템 권한 확인(사용자명)
SELECT * FROM dba_sys_privs WHERE grantee = 'MDGUEST2';

-- 사용자에게 부여된 롤 확인(사용자명)
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- 사용자에게 부여된 로에 부여된 시스템 권한 확인(롤이름)
SELECT * FROM dba_sys_privs WHERE grantee = 'CONNECT';

-- 타사용자에게 부여한 객체(테이블등)권한 확인 with grant option
SELECT * FROM dba_tab_privs WHERE owner = 'MADANG';

-- 1. 역할 생성
CREATE ROLE Programmer;

-- 2. 역할에 시스템 권한 부여
GRANT CREATE ANY TABLE, CREATE ANY VIEW TO Programmer;

-- 3. 역할에 부여된 시스템 권한 조회
SELECT * FROM dba_sys_privs WHERE grantee = 'PROGRAMMER';

-- 4. mdguest 사용자에게 programmer 역할 부여
GRANT programmer TO mdguest;

-- 5. mdguest 사용자에게 부여된 롤 확인
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- INSERT및 SELECT 권한 부여
GRANT INSERT,SELECT ON mdguest2.newtable TO Programmer;

REVOKE SELECT ON mdguest2.NEWTABLE FROM programmer;

-- role 제거
DROP ROLE programmer;

DROP TABLE mdguest2.NEWTABLE;
