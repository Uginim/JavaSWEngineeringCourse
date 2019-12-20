select
  DECODE(1,1,'aa','bb'), -- ���� ������ �ƴϳ� ex) ����
  TO_NUMBER('12.3'),
  TO_DATE('12 05 2014', 'DD MM YYYY'),
  To_number('123'),
  TO_CHAR(123),
  TO_CHAR(SYSDATE),
  NEXT_DAY(SYSDATE,'��'),
  LAST_DAY(SYSDATE),
  ADD_MONTHS('14/05/21', 1),
  LENGTH('Birthday'),
  INSTR('CORPORATE FLOOR','OR', 3, 2),
  ASCII('A'),
  TRIM(LEADING 0 FROM '00AA00'),
  SUBSTR('ABCDEFG',3,4),
  RTRIM('Page 1',' 1'),
  RPAD('Page 1', 15, '*.'),
  replace('JACK','J','BL'),
  ltrim('Page 1','Pa'),  -- ���� ��������, �ι�° �Ű����� ù��° ���ڿ����� ã�� ���ʿ��� ��
  lpad('Page 1',15,'*.'), -- ���ڿ�, ��ü�ڸ���, ä�� ���ڿ�
  upper('Birthday'), -- �빮�ڷ� ��ȯ
  lower('Birthday'), -- �ҹ��ڷ� ��ȯ
  concat('HAPPY', 'BIRTHDAY'), -- ���ڿ� ����
  chr(67), -- �ƽ�Ű�ڵ� ���ڷ� ��ȯ
  trunc(1050.123,-3),
  trunc(15.7),  -- ����, �Ҽ��ڸ� ����
  sign(-15), --����, ��� �Ǵ� ������ -1, ����� 1, 0�̸� 0
  round(15.7), -- �ݿø�
  power(3,2), 
  mod(11,4),
  abs(-15),
  ceil(15.7), -- �ø�
  cos(3.14159),
  floor(15.7), -- ����
  log(10,100)
from dual;
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'; 
select trunc(systimestamp,'DD') from dual;
select to_date('2019-12-20 9:21:10','YYYY-MM-DD HH24:MI:SS') from dual;
select to_date(sysdate,'YYYY-MM-DD HH24:MI:SS') from dual;
select trunc(to_date(sysdate,'YYYY/MM/DD HH24:MI:SS') , 'mi' ) from dual;
select TO_CHAR(sysdate,'YYYY-MM-DD HH24:MI:SS') from dual;
-- ����ð��� ����
select trunc(systimestamp,'DD') from dual;
select trunc(systimestamp,'HH24') from dual;
select trunc(systimestamp,'MI') from dual;


with temp as ( select to_date('2019-12-20 9:21:10','YYYY-MM-DD HH24:MI:SS') dt from dual )
select dt,
    trunc(dt, 'dd'), -- �ð� ����
    trunc(dt, 'HH24'), -- ��, �� ����
    trunc(dt, 'MI') -- �� ����
    from temp;

SELECT
    INSTR('CORPORATE FLOOR','OR',1,2),
    INSTR('CORPORATE FLOOR','OR',-1,2),
    INSTR('CORPORATE FLOOR','OR',3,2),
    INSTR('CORPORATE FLOOR','OR',-3,2)    
    FROM dual;

select * from book;

select decode(orderid, 1,'����',
                    2, '���',
                    3, '���',
                    4, '�λ�',
                    5, '����','��Ÿ') from orders;
select name,nvl(phone, '��ȭ��ȣ ����') from customer;

CREATE TABLE Mybook (
  bookid      NUMBER,
  price       NUMBER
);

-- Mybook ������ ����
INSERT INTO Mybook VALUES(1, 10000);
INSERT INTO Mybook VALUES(2, 20000);
INSERT INTO Mybook VALUES(3, NULL);
COMMIT;

SELECT * FROM mybook;
select price+100 from mybook where bookid= 3;
select nvl(price,0)+100 from mybook where bookid = 3;
select sum(price), avg(price), count(*), count(price)
  from mybook;
