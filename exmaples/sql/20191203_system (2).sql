-- 사용자에게 부여된 시스템 권한 확인(사용자명)
SELECT * FROM dba_sys_privs WHERE grantee = 'MDGUEST2';

-- 사용자에게 부여된 롤 확인(사용자명)
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- 사용자에게 부여된 로에 부여된 시스템 권한 확인(롤이름)
SELECT * FROM dba_sys_privs WHERE grantee = 'CONNECT';

-- 타사용자에게 부여한 객체(테이블등)권한 확인 
SELECT * FROM dba_tab_privs WHERE owner = 'MADANG';