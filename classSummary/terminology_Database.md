# Database 용어 정리

## 목차
- [Database 용어 정리](#database-%ec%9a%a9%ec%96%b4-%ec%a0%95%eb%a6%ac)
  - [목차](#%eb%aa%a9%ec%b0%a8)
  - [Database](#database)
  - [Database Management System(DBMS)](#database-management-systemdbms)
  - [SQL(Structed Query Language)](#sqlstructed-query-language)
  - [Query(질의)](#query%ec%a7%88%ec%9d%98)
  - [SQL Developer Client Tool](#sql-developer-client-tool)
  - [Table (표)](#table-%ed%91%9c)
  - [ERD(Entity-Relationship Diagram)](#erdentity-relationship-diagram)
  - [릴레이션](#%eb%a6%b4%eb%a0%88%ec%9d%b4%ec%85%98)
  - [릴레이션쉽(relationship)](#%eb%a6%b4%eb%a0%88%ec%9d%b4%ec%85%98%ec%89%bdrelationship)
  - [스키마](#%ec%8a%a4%ed%82%a4%eb%a7%88)
  - [인스턴스](#%ec%9d%b8%ec%8a%a4%ed%84%b4%ec%8a%a4)
  - [키](#%ed%82%a4)
  - [데이터 무결성](#%eb%8d%b0%ec%9d%b4%ed%84%b0-%eb%ac%b4%ea%b2%b0%ec%84%b1)
  - [뷰(view)](#%eb%b7%b0view)
  - [인덱스(index)](#%ec%9d%b8%eb%8d%b1%ec%8a%a4index)
  - [트랜잭션](#%ed%8a%b8%eb%9e%9c%ec%9e%ad%ec%85%98)

## Database 
> 잘 정리되고 정돈된 데이터의 모음(파일)
* 정형화 된 데이터 
<br><br>

## Database Management System(DBMS) 
> database에 접근하여 여러 사용자가 데이터를 조작할 수 있게 도와주는 소프트웨어
* 예시 
    * Oracle 11g
    * MySQL
    * PostgreSQL    
<br><br>

## SQL(Structed Query Language) 
> DBMS를 경유하여 Database를 CRUD(Create, read, update, delete) 기능을 제공하는 언어

<br><br>

## Query(질의)
> SQL언어로 DBMS에 요청하는 행위

<br><br>


## SQL Developer Client Tool
> SQL Query를 보다 편리하게 지원해주는 툴
 
<br><br>


## Table (표)
> 행(row, record, tuple), 열(column, field,attribute) 구조로 데이터가 저장되어 있음    

<br><br>

## ERD(Entity-Relationship Diagram)
> 테이블 간의 관계를 표준화된 기호로 그린 그림

<br><br>

## 릴레이션 
> 테이블

## 릴레이션쉽(relationship)
> 테이블 간의 관계

## 스키마 
> 테이블 구조(속성, 자료타입)

## 인스턴스 
> 테이블 구조로 저장된 데이터

## 키 
> 튜플(행, 레코드)를 식별하는 속성, 속성 집합
- 슈퍼키 
    - 튜플(행, 레코드)를 식별하는 속성, 속성 집합의 모든 경우의 수
- 후보키 
    - 슈퍼키 중 최소 속성집합
- 기본키 
    - 릴레이션의 대표키로 후보키들 중 하나가 될 수 있다.
- 대체키 
    - 후보키 중 기본키를 제외한 키 (후보키 - 기본키)
- 외래키 
    - 다른 릴레이션 또는 자신의 기본키를 참조하는 속성(도메인이 갈아야한다.)
- 대리키 
    - 현재 릴레이션에 적당한 기본키가 없을때 가상의 속성을 만들어 선정되는 기본키(ex: 일련번호)
- 복합키 
    - 2개 이상의 속성으로 조합된 키
## 데이터 무결성
> 데이터베이스에 정장된 데이터의 일관성과 정확성을 유지시키는 성질
1. 도메인 무결성 :
    - 릴레이션(table)에 정의된 속성(column)이 가질 수 있는 값의 범위  
    - SQL문에서 데이터타입(number,varchar2),길이, 널(null, not null), 기본값(default),체크(check) 등을 사용
2. 개체 무결성
    - 릴레이션 내에서 동일한 튜플(행, row, 레코드)을 가질 수 없다.
    - 기본키 제약을 두어야 한다.
3. 참조 무결성
    - 자식 릴레이션의 외래키는 부모 릴레이션의 기본키와 도메인이 동일해야하고  
     자식 릴레이션의 값이 변경될 때 부모 릴레이션의 제약을 받는다.
        - ex) 부서테이블과 사원 테이블 관계에서 부서 테이블에 부서코드 컬럼에 없는 값을 사원테이블에서 할당하고자 할 때
    - 외래키 제약
## 뷰(view) 
- 정의 
   - 하나 이상의 물리적인 테이블을 병합하여 만든 가상의 테이블
- 이점 
   - 편리성 및 재상용성
       - 복잡한 질의를 뷰로 정의해 놓고 질의를 간단히 사용할 수 있음
   - 보안성
       - 필요한 속성만을 선별하여 보여줄 수 있음
   - 독립성 
       - 원본 테이블 구조가 변하더라도 응용에 영향을 주지 않음
## 인덱스(index)
* 정의 : 
    * 테이블에 저장된 데이터를 빠르게 조회하기 위한 데이터베이스 객체
* 장점 : 
    * 검색속도가 빨라진다
    * 시스템 부하를 줄여 전체 시스템의 성능을 향상시킨다.(ex, 조인)
* 단점 : 
    * 인덱스 생성시 추가적인 database 공간을 차지한다 ( table의 10%내외)
    * 업데이트를 (insert, update, delete)가 자주 발생되는 컬럼에 사용시
    오히려 속도 저해 요인이 된다.
* 주의할점 : 
    * Where 절에 자주 사용되는 속성
    * 조인에 자주 사용되는 속성
    * 선택도가 낮을 수록 유리함.(ex 모든 속성값이 다른 경우, primary key)
        * 선택도 = 1/"서로 다른 값의 갯수"
    * 단편화(삭제된 레코드의 인덱스 값 자리가 비게되는 상태)현상 최소화를 위해 
    주기적으로 인덱스를 갱신(rebuild)해준다.
## 트랜잭션
* 정의
    * DBMS에서 데이터를 다루는 논리적인 작업단위
* 목적 
    1. 여러작업이 동시에 같은 데이터를 다룰 때 작업분리 단위.
    2. 장애발생시 데이터 복구 작업단위.
* 명령어 
    * commit
        * 트랜잭션 과정을 정상적으로 종료하는 명령어
    * rollback
        * 트랜잭션 전체 또는 (저장점, 중간점)까지 취소하는 명령어.
    * savepoint
        * 하나의 트랜잭션을 분할 저장하여 현시점에서 저장점까지 트랜잭션 일부만 취소(rollback)가능하도록 지원하는 명령어.



[돌아가기](../README.md)   
[자바 용어 정리](terminology_java.md)