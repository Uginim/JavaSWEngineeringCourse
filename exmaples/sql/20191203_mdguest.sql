CREATE TABLE mdguest2.newtable(
  myname varchar2(40),
  myphone varchar2(20)
);

-- ������ ��� �ٷ� �ȵ�
INSERT INTO mdguest2.newtable(myname,myphone)
  VALUES('ȫ�浿','010-1234-5678');
  
-- 
SELECT * FROM mdguest2.newtable;
ROLLBACK;