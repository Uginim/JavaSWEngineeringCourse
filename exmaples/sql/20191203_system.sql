-- ����ڿ��� �ο��� �ý��� ���� Ȯ��(����ڸ�)
SELECT * FROM dba_sys_privs WHERE grantee = 'MDGUEST2';

-- ����ڿ��� �ο��� �� Ȯ��(����ڸ�)
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- ����ڿ��� �ο��� �ο� �ο��� �ý��� ���� Ȯ��(���̸�)
SELECT * FROM dba_sys_privs WHERE grantee = 'CONNECT';

-- Ÿ����ڿ��� �ο��� ��ü(���̺��)���� Ȯ�� with grant option
SELECT * FROM dba_tab_privs WHERE owner = 'MADANG';

-- 1. ���� ����
CREATE ROLE Programmer;

-- 2. ���ҿ� �ý��� ���� �ο�
GRANT CREATE ANY TABLE, CREATE ANY VIEW TO Programmer;

-- 3. ���ҿ� �ο��� �ý��� ���� ��ȸ
SELECT * FROM dba_sys_privs WHERE grantee = 'PROGRAMMER';

-- 4. mdguest ����ڿ��� programmer ���� �ο�
GRANT programmer TO mdguest;

-- 5. mdguest ����ڿ��� �ο��� �� Ȯ��
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- INSERT�� SELECT ���� �ο�
GRANT INSERT,SELECT ON mdguest2.newtable TO Programmer;

REVOKE SELECT ON mdguest2.NEWTABLE FROM programmer;

-- role ����
DROP ROLE programmer;

DROP TABLE mdguest2.NEWTABLE;
