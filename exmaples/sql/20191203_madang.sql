
REVOKE SELECT ON Book FROM mdguest;
REVOKE SELECT ON Customer FROM mdguest;

-- madang계정이 타사용자에게 부여한 권한 보기
SELECT * FROM user_tab_privs where owner = 'MADANG';

-- 다시 권한 부여
GRANT SELECT ON Book to mdguest;