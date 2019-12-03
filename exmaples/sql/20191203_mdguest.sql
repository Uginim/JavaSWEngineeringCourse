CREATE TABLE mdguest2.newtable(
  myname varchar2(40),
  myphone varchar2(20)
);

-- 권한이 없어서 바로 안됨
INSERT INTO mdguest2.newtable(myname,myphone)
  VALUES('홍길동','010-1234-5678');
  
-- 
SELECT * FROM mdguest2.newtable;
ROLLBACK;