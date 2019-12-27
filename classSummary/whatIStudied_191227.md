# What I studied today.
Date : 2019-12-27
# Database
### 단위평가문제
#### 1번문제
- 책에 예제가 있음 p265
- 책의 예제에 exception을 추가하면됨
- 답
- ```sql
	CREATE OR REPLACE PROCEDURE BookInsertOrUpdate(
	p_bookid     IN Book.bookid%TYPE,
	p_bookname  IN Book.bookname%TYPE,
	p_publisher   IN Book.publisher%TYPE,
	p_price      IN Book.price%TYPE,
	r_errcode    OUT number,
	r_errmsg    OUT varchar2
	)
	AS
	l_count number;
	BEGIN
	SELECT COUNT(*) 
		INTO l_count
		FROM Book WHERE publisher = p_publisher
						AND  bookname = p_bookname;
	IF l_count != 0 THEN
		-- 금액 수정
		UPDATE Book set price = p_price  
			WHERE publisher = p_publisher
			AND bookname = p_bookname;
	ELSE 
		-- 도서정보 추가
		INSERT INTO book(bookid, bookname, publisher, price)
		VALUES (p_bookid, p_bookname, p_publisher, p_price);
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		r_errcode := SQLCODE;
		r_errmsg := SQLERRM;
		DBMS_OUTPUT.PUT_LINE(r_errcode || '-' || r_errmsg );
	END;
	``` 

#### 2번
272p 이익계산
```sql
CREATE OR REPLACE FUNCTION Grade(
  p_custid IN customer.custid%TYPE
) RETURN VARCHAR2
IS
  l_sum NUMBER;
  l_grade VARCHAR2(6);
BEGIN
  SELECT SUM(saleprice) INTO l_sum
    FROM Orders
  WHERE custid = p_custid;
  IF l_sum >= 1000000 THEN
    l_grade := '우수';
  ELSE 
    l_grade := '일반';
  END IF;
  RETURN l_grade;
--EXCEPTION
--  WHEN OTHERS THEN
END;
```
#### 3번
22chapter 8번문제 참조
```sql
CREATE SEQUENCE ordersLog_seq
  INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999
	MINVALUE 1
	NOCYCLE
	NOCACHE;
CREATE TABLE ORDERSLOG
   (	
   seq number,
   logdate date,
  ORDERID NUMBER(2,0), 
	CUSTID NUMBER(2,0), 
	BOOKID NUMBER(2,0), 
	SALEPRICE NUMBER(8,0), 
	ORDERDATE DATE, 
	PRIMARY KEY (seq)
  );
```
#### 4번문제
551~552중 함수 하나를 씀
#### 5번문제
#### 6번 문제
## SQL Developer에서 PL/SQL(프로시저, 함수)등을 GUI상에서 실행 가능(입력 및 출력 변수 설정 가능)
## sql developer 테이블 복사하기
- navigation에서 table 우클릭
- 테이블 -> 복사
## SQL Develpoer에서 행 삽입(복제)
- 테이블을 클릭한 후 데이터탭에서 레코드 우클릭 
- 이후 "행 복제" 선택
- 행번호 좌측에 `+`표시가 뜨는 이유
    - 커밋을 하지 않아서 

## hr account 활성화하기
- system 계정 접속
```sql
alter user hr account unlock;
```
```sql
alter user hr identified by hr1234;
```

<br><br><hr>

[돌아가기](../README.md)  
[2019-12-24](whatIStudied_191223.md)  
[2019-12-27](whatIStudied_191226.md) 


