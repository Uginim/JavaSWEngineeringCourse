-- ����ڿ��� �ο��� �ý��� ���� Ȯ��(����ڸ�)
SELECT * FROM dba_sys_privs WHERE grantee = 'MDGUEST2';

-- ����ڿ��� �ο��� �� Ȯ��(����ڸ�)
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- ����ڿ��� �ο��� �ο� �ο��� �ý��� ���� Ȯ��(���̸�)
SELECT * FROM dba_sys_privs WHERE grantee = 'CONNECT';

-- Ÿ����ڿ��� �ο��� ��ü(���̺��)���� Ȯ�� 
SELECT * FROM dba_tab_privs WHERE owner = 'MADANG';