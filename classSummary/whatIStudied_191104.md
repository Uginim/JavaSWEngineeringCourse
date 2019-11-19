# What I studied today.
Date : 2019-11-04

# Database 
## 지난주 복습 및 용어정리
* Database
    * 잘 정리되고 정돈된 데이터의 모음(파일)
* Database Management System(DBMS) 
    * database를 접근하여 여러 사용자가 데이터를 조작할 수 있게 돕는 소프트웨어
    * 한 데이터베이스에 여러 계정이 접근가능
    * 계정 별로 접근권한 설정 가능
    * 예시
        * Oracle 11g Express Edition
* SQL (Structed Query Language)
    * DBMS를 경유하여 Database를 CRUD(create,read,update,delete)할 수 있더록 제공해주는 언어
* Query(질의)
    * SQL언어로 DBMS에 요청하는 행위
* SQL Developer Client Tool
    * SQL Query를 보다 편리하게 지원해주는 툴 중 하나
* Table(표)
    * 행(row,record,tuple), 열(column,field,attribute) 구조로 데이터가 저장된다.
* ERD(Entity-Relationship Diagram)
    * 테이블 간의 관계를 표준화된 기호로 도식화한 그림

## SQL
* 접속한 유저 이름 보기
    ```sql
    show user;
    ```
* `commit`
    * 지금까지 한 작업들을 DB에 영구적으로 반영함
    * 작업들이 확실하게 제대로 된 경우 사용 
* `rollback`
    * 마지막 영구적반영시점(commit한 시점)으로 되돌림
    * 지금까지 한 작업이 잘못된 경우 사용
* `alter`
    * 이미 존재하는 테이블의 구조나 형식등을 바꾸기 위해 사용 - [초보개발자 이야기.](https://ra2kstar.tistory.com/3)
* 테이블에 기본 키 추가
    ```sql
    alter table 부서 add  primary key(부서번호);
    ```
* 테이블 구조보기
    ```sql
    desc 부서;
    ```
* 테이블에 외래 키 추가
    ```sql
    alter table 직원 add foreign key(부서번호) references 부서(부서번호);
    ```
* 제약 조건 
    * primary key
        ```
        이름     널?       유형           
        ------- -------- ------------ 
        직원번호 NOT NULL VARCHAR2(10) 
        직급              VARCHAR2(10) 
        부서번호          VARCHAR2(10) 
        ```
    * 부모테이블에 없는 값을 외래키의 값으로 넣을 경우
        > 오류 보고 - ORA-02291: integrity constraint (MADANG.SYS_C007002) violated - parent key not found
    * 무결성 제약 조건
        
* 자동 커밋
    * 테이블 관련 변경을 하면 자동으로 커밋된다
        * 테이블 생성
        * 테이블 삭제
        * 테이블 수정(`alter`명령)
## sql developer 팁
* 새 워크시트 열기
    1. 접속 칸에서 접속이름 우클릭
    2. `SQL 워크시트 열기(U)` 클릭
* 커밋하지 않고 접속을 해제하려 할 경우
    * 해당 접속에서 했던 작업에 대해서  
    **'커밋'**,**'롤백'**,**'접속해제 중단'** 중 택1하라고 함
* 스크립트 출력 창
    * 워크시트 내의 스크립트(sql문)의 결과물을 볼 수 있음
    * 출력된 내용 저장 가능
* 제약조건 참조이름 보기
    * 좌측 explorer 창에서 테이블 명 클릭
    * 제약조건 탭 클릭
    * constraint_name 칸이 참조이름
* ERD가 바로 반영 안될 시
    1. 데이터 딕셔너리 과정 후 병합창 가기 
    2. 왼쪽의 트리 항목 
        1. 모두 선택 해제
        2. 다시 모두 선택
    3. 병합 클릭
<br/>

## 평가 대비
* [항목](./test01Preparation.md) 참조

<br/>
<br/>

# Java 

## 배열
### 배열이란? 
* 하나의 변수명, 동일타입, 연속된 메모리공간에 저장하는 자료구조
* 인덱스(첨자)로 데이터에 접근한다(인덱스는 0부터 시작)
* 반복구문에 사용하기 편리하다
* 자바는 1차원 배열만 사용한다
    * 다차원의 배열은 1차원 배열을 담은 또다른 1차원 배열로 구현
* 배열의 방크기를 알 수 있는 속성 : length
* 배열의 크기는 한번 정해지면 이후 변경 불가능하다
    * 변경하려면 새로운 배열을 생성하여 복사하는 방식을 취함
### 배열의 메모리 구조 그리기
```java
// 1차원 배열
int[] array = new int[2];

// 2차원 배열
int [][] array = new int[2][3];

// 2차원 비정방형 배열
int [][] array = new int[3][];
array[0] = new int[2];
array[1] = new int[4];
array[2] = new int[3];
```
<br/>
<br/>

## 궁금한 점
* 테이블 생성과 삭제는 자동으로`commit`된다고 하였는데, `commit`명령 처럼 최근 커밋  이후의 모든 SQL문이 다 커밋이 되는 것인가?
    * 진짜 해당 시점에 commit되어버림 조심해서 사용할 것
    * `alter`역시 반영됨


[돌아가기](../README.md)