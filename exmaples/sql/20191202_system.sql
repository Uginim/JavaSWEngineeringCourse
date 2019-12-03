-- ���̺����̽� ���� ���
CREATE TABLESPACE md_tbs
  DATAFILE 'D:\JAVASTUDY\madang\oradata\md_tbs_data01.dbf'
  SIZE 10M;
CREATE TABLESPACE md_test
  DATAFILE 'D:\JAVASTUDY\madang\oradata\md_test_data01.dbf;'
  SIZE 10M;
-- ���̺����̽� �����ϱ�  
DROP TABLESPACE md_test
  INCLUDING CONTENTS AND DATAFILES;
  
-- ���ο� ����� mdguest ����
CREATE USER mdguest
  IDENTIFIED BY mdguest;
  
CREATE USER mdguest2
  IDENTIFIED BY mdguest2
  DEFAULT TABLESPACE md_tbs;

--���� ���� �ֱ�
GRANT CONNECT TO mdguest;

-- RESOURCE ���� �ֱ�
GRANT CREATE TABLE TO mdguest;

-- �ѹ��� �ֱ�
GRANT CONNECT,RESOURCE TO mdguest2;

