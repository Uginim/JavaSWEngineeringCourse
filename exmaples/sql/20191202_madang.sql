GRANT SELECT ON Book TO mdguest;


-- 다른 계정에게 권한을 부여할수 있는 권한을 줌
GRANT SELECT, UPDATE ON Customer TO mdguest WITH GRANT OPTION;

-- 모든 계정에게 권한 부여
GRANT SELECT ON Orders TO PUBLIC;