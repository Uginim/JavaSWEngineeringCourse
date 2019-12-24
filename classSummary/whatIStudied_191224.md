# What I studied today.
Date : 2019-12-24
# Database
## 데이터베이스 프로그래밍
### 데이터베이스 프로그래밍이란?
- DBMS에 데이터를 정의하고 저장된 데이터를 읽어와 데이터를 변경하는 프로그램을 작성하는 과정
- 일반 프로그래밍과는 데이터베이스 언어인 SQL을 포함한다는 점이 다름
### 데이터베이스 프로그래밍 방법
1. SQL 전용 언어를 사용하는 방법
2. 일반 프로그래밍 언어에 SQL을 삽입하여 사용하는 방법
3. 웹 프로그래밍 언어에 SQL을 삽입하여 사용하는 방법
4. 4GL(4th Generation Languaage)
## PL/SQL
### 프로시저
- Cursor 옆의 `%NOTFOUND`는 뭐?
- 커서의 속성
    - https://docs.oracle.com/cd/B14117_01/appdev.101/b10807/13_elems011.htm
# 능력단위 평가 
- 12월 30일 
- sql 응용
### 트리거
- 트리거(triger)
    - 데이터의 변경(INSERT, DELETE, UPDATE)문이 실행될 때 자동으로 따라서 실행되는 프로시저
#### 트리거 상태확인 및 비활성
```sql
--트리거 상태 확인
select table_name,status from user_triggers;

-- 트리거 활성/비활성
alter trigger AfterInsertBook enable; --활성화
alter trigger AfterInsertBook disable;
```
## 보충교재
- 교육과정 \-&gt;Database \-&gt; "PL/SQL 보충자료"
    - plsql.zip 다운로드
    - scott.sql
### Deferred Segment Creation feature not enabled (ORA-00439)
- scott.sql 실행 시 bonus테이블 생성 안됨
- 11g expression 버전은 Deffered Segment Creation이 지원되지 않는 버전이라서 안됨
    - 출처 - [Deferred Segment Creation feature not enabled (ORA-00439)](https://stackoverflow.com/questions/37941314/deferred-segment-creation-feature-not-enabled-ora-00439)
# 단위평가
- 12월 30일 2시 
- 26일 27일 단위평가 관련 학습
<br><br><hr>

[돌아가기](../README.md)  
[2019-12-23](whatIStudied_191223.md)  
[2019-12-26](whatIStudied_191226.md) 


