# What I studied today.
Date : 2019-12-23
# Database
## 내장함수
- SQL의 함수
    - 내장함수 (built-in function)
        - DBMS가 직접 제공함
    - 사용자 정의 함수 (user-defined function)
        - 사용자가 필요에 따라 직접 만듬
### 집계 함수 사용시 주의점
- `NULL + 숫자`의 결과는 NULL
### 오라클 SELECT문의 처리순서
- 이름순으로 맨 앞의 2명 찾기
    ```SQL
    SLEECT ROWNUM "순번", custid, name, phone
    FROM customer 
    WHERE ROWNUM <=2
    ORDER BY name;
    ```
- 기대 결과
    ```
    순번 CUSTID NAME    PHONE
    1	    2	김연아	000-6000-0001
    2	    5	박세리	null
    ```
- SELECT문 순서
    1. FROM Customer
        - Customer 테이블을 읽어들임
    2. WHERE ROWNUM &lt;=2
        - 오라클이 데이터를 읽은 순서대로 2개 투플 선택
    3. SELECT ROWNUM, custid, name, phone
        - ROWNUM, custid, name, phone 컬럼을 선택
    4. ORDER BY name
        - 이름순으로 정렬
- 제대로 출력하려면
    ```sql
    -- 이름순으로 맨앞의 2명 찾기(제대로된 버전)
    SELECT ROWNUM "순번", custid, name, phone
    FROM    (SELECT custid, name, phone
            FROM   Customer
            ORDER BY name)
    WHERE   ROWNUM <= 2;
    ```
- 게시판을 조회할 때에도 이런식으로 해야함..
## 부속질의
### 스칼라 부속질의 - select 부속질의
- 스칼라부속질의 (scalar subquery) 
    - SELECT 절에서 사용되는 부속질의
    - 단일 값을 반환

# 웹표준

<br><br><hr>

[돌아가기](../README.md)  
[2019-12-20](whatIStudied_191220.md)  
[2019-12-24](whatIStudied_191224.md) 


