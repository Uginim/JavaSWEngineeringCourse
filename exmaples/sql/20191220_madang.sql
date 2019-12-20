select
  DECODE(1,1,'aa','bb'), -- 값이 같으냐 아니냐 ex) 성별
  TO_NUMBER('12.3'),
  TO_DATE('12 05 2014', 'DD MM YYYY'),
  To_number('123'),
  TO_CHAR(123),
  TO_CHAR(SYSDATE),
  NEXT_DAY(SYSDATE,'금'),
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
  ltrim('Page 1','Pa'),  -- 왼쪽 공백제거, 두번째 매개값을 첫번째 문자열에서 찾아 왼쪽에서 제
  lpad('Page 1',15,'*.'), -- 문자열, 전체자리수, 채울 문자열
  upper('Birthday'), -- 대문자로 변환
  lower('Birthday'), -- 소문자로 변환
  concat('HAPPY', 'BIRTHDAY'), -- 문자열 연결
  chr(67), -- 아스키코드 문자로 전환
  trunc(1050.123,-3),
  trunc(15.7),  -- 정수, 소수자리 절사
  sign(-15), --음수, 양수 판단 음수면 -1, 양수면 1, 0이면 0
  round(15.7), -- 반올림
  power(3,2), 
  mod(11,4),
  abs(-15),
  ceil(15.7), -- 올림
  cos(3.14159),
  floor(15.7), -- 절사
  log(10,100)
from dual;
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'; 
select trunc(systimestamp,'DD') from dual;
select to_date('2019-12-20 9:21:10','YYYY-MM-DD HH24:MI:SS') from dual;
select to_date(sysdate,'YYYY-MM-DD HH24:MI:SS') from dual;
select trunc(to_date(sysdate,'YYYY/MM/DD HH24:MI:SS') , 'mi' ) from dual;
select TO_CHAR(sysdate,'YYYY-MM-DD HH24:MI:SS') from dual;
-- 현재시간을 절사
select trunc(systimestamp,'DD') from dual;
select trunc(systimestamp,'HH24') from dual;
select trunc(systimestamp,'MI') from dual;


with temp as ( select to_date('2019-12-20 9:21:10','YYYY-MM-DD HH24:MI:SS') dt from dual )
select dt,
    trunc(dt, 'dd'), -- 시간 절사
    trunc(dt, 'HH24'), -- 분, 초 절사
    trunc(dt, 'MI') -- 초 절사
    from temp;

SELECT
    INSTR('CORPORATE FLOOR','OR',1,2),
    INSTR('CORPORATE FLOOR','OR',-1,2),
    INSTR('CORPORATE FLOOR','OR',3,2),
    INSTR('CORPORATE FLOOR','OR',-3,2)    
    FROM dual;

select * from book;

select decode(orderid, 1,'서울',
                    2, '경기',
                    3, '울산',
                    4, '부산',
                    5, '대전','기타') from orders;
select name,nvl(phone, '전화번호 없음') from customer;

CREATE TABLE Mybook (
  bookid      NUMBER,
  price       NUMBER
);

-- Mybook 데이터 생성
INSERT INTO Mybook VALUES(1, 10000);
INSERT INTO Mybook VALUES(2, 20000);
INSERT INTO Mybook VALUES(3, NULL);
COMMIT;

SELECT * FROM mybook;
select price+100 from mybook where bookid= 3;
select nvl(price,0)+100 from mybook where bookid = 3;
select sum(price), avg(price), count(*), count(price)
  from mybook;
