
REVOKE SELECT ON Book FROM mdguest;
REVOKE SELECT ON Customer FROM mdguest;

-- madang������ Ÿ����ڿ��� �ο��� ���� ����
SELECT * FROM user_tab_privs where owner = 'MADANG';

-- �ٽ� ���� �ο�
GRANT SELECT ON Book to mdguest;