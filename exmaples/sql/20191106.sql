SELECT phone
FROM customer
WHERE name = '김연아';

SELECT phone
FROM customer;


SELECT *
  FROM customer;

SELECT name, phone
  FROM customer
  WHERE name='박지성';

-- 컬럼에 별칭 주기 : as 다음에 별칭을 적음.
SELECT name AS "이름", phone AS "전화번호"
  FROM customer;
-- 테이블 이름에 별칭주기 : 테이블 이름 뒤에 공백을 주고 별칭을 적음
SELECT name, phone
  FROM customer t1
  WHERE name = '박지성';

select t1.name, t1.phone
  FROM customer t1
  WHERE name = '김연아';
  
-- 도서 가격이 10,000원 이상인 도서의 책이름, 출판사 조회하기
SELECT bookname, publisher
  FROM book
  where price >= 10000;