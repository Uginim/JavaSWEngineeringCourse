# What I studied today.
Date : 2019-11-01

# Database(데이터베이스) 기초 활용하기
## 오라클 시작하기
* 오라클 서비스 실행
    * `ctrl` + `shift` + `esc`
    * `서비스`탭
    * 다음 두 서비스 실행
        * OracleXETNSListener
        * OracleServiceXE
* 오라클 계정
    * system 계정 = admin 계정
    * madang 
* 바탕화면에 바로가기만들기
    * sqldeveloper
    * sts
## 용어 정리
* Database 
    > 잘 정리되고 정돈된 데이터의 모음(파일)
    * 정형화 된 데이터
* Database Management System(DBMS) 
    > database에 접근하여 여러 사용자가 데이터를 조작할 수 있게 도와주는 소프트웨어
    * 예시 
        * Oracle 11g
        * MySQL
        * PostgreSQL    
* SQL(Structed Query Language) 
    > DBMS를 경유하여 Database를 CRUD(Create, read, update, delete) 기능을 제공하는 언어
* Query(질의)
    > SQL언어로 DBMS에 요청하는 행위
* SQL Developer Client Tool
    > SQL Query를 보다 편리하게 지원해주는 툴
* Table (표)
    > 행(row, record, tuple), 열(column, field,attribute) 구조로 데이터가 저장되어 있음    
* ERD(Entity-Relationship Diagram)
    > 테이블 간의 관계를 표준화된 기호로 그린 그림
* 더알아보기 
    * [MySQL : 데이터베이스 용어 정리 (리레이션, 튜플, 에트리뷰트, 디그리, 카디널러티)](https://ra2kstar.tistory.com/24)
## SQL Developer
* 좌측 접속이름을 double click 하면 tree view가 펼쳐짐
* 테이블
    * 테이블을 클릭하면 워크시트가 추가됨
    * 추가된 워크시트에는 여러가지 탭이 있음
        * 열(column) 탭
            * table에 속한 column들에 대한 정보들
                * column name : 컬럼 이름
                * column type : 컬럼 타입
                * nullable : 생략 가능한지(No가 필수)
        * 데이터 탭
* ERD 보기
    1. 접속 madang 선택
    2. 메뉴바에 `파일(F)` 
    3. `Data Modeler`
    4. `임포트 `
    5. `데이터 딕셔너리` 클릭
    6. 접속 이름 중 `madang` 선택 후  next
    7. 스키마 에서  `madang` 체크 후  next
    8. ERD를 볼 테이블명 모두 체크 후 next    
    * ERD의 기호 
        * P 
            * Primary key (기본키)
        * F
            * Foreign key (외래키)
        * 선/까치발/화살표
            * 테이블 간 관계를 나타냄
* SQL 예시
    * 테이블 생성
        ```sql
        -- 테이블 생성
        CREATE TABLE 부서 (
            부서번호   VARCHAR2(10) ,
            부서이름   VARCHAR2(10) ,
            Primary key(부서번호)
        );
        ```
        * 생성후에 새로만든 테이블이 보이지 않으면
            * 새로고침 아이콘을 클릭할 것
        * primary key는 레코드들을 유일하게 구분할 수 있는 값이어야 한다.
        * `rollback`명령으로 되돌릴 수 없다
    * 테이블 조회
        ```sql
        -- 테이블 조회
        select 부서번호,부서이름 from 부서;
        select 부서번호 from 부서;
        select 부서이름 from 부서;
        select * from 부서;
        ```
        * select 다음에 오는 '`*`'문자는 모든 열을 조회하겠다는 뜻
    * 레코드 생성(삽입)
        ```SQL
        INSERT INTO 부서(부서이름,부서번호) VALUES('인사팀','1001');
        INSERT INTO 부서(부서이름,부서번호) VALUES('회계팀','1002');
        ```
        * INTO 다음괄호 안 컬럼 순서대로 VALUES에 값을 넣는다.
    * 레코드 변경
        ```SQL
        UPDATE 부서 SET 부서이름 ='총무팀';
        UPDATE 부서 SET 부서이름 ='총무팀' WHERE 부서번호='1002'
        ```
        * `WHERE`절로 대상이될 레코드를 지정하지 않으면 모든 레코드가 대상이 된다.
    * COMMIT
        ```SQL
        COMMIT;
        ```
        * 가장 최근`commit`이후의 질의들을 최종으로 반영
        * 이후 `COMMIT`된 질의들은 `ROLLBACK` 불가        
    * ROLLBACK
        ```SQL
        ROLLBACK;
        ```
        * 가장 최근 `COMMIT` 이후의 질의들의 결과를 취소함
        * **table의 생성과 삭제는 rollback할 수 없다.**
    * 레코드 삭제
        ```SQL
        DELETE FROM 부서; -- 전체 레코드 삭제
        DELETE FROM 부서 WHERE 부서번호 ='1001' --부서번호가 '1001'인 레코드 삭제
        ```
        * 마찬가지로 `WHERE`로 대상을 지정하지 않으면 테이블 내 모든 레코드가 삭제된다.
    * Foreign Key
        ```sql
        CREATE TABLE 직원(
            직원번호 VARCHAR2(10),
            직급 VARCHAR2(10),
            부서번호 VARCHAR2(10),
            Primary Key(직원번호),
            Foreign Key(부서번호) references 부서(부서번호)
        );
        ```
        * 다른 테이블의 키를 참조함
            * 참조하는 레코드와의 관계를 나타냄
        * 존재하지 않는 부모키를 Foreign key 필드의 값이 참조하면 오류가 뜬다
            * parent key not found
    * JOIN
        ```SQL
        SELECT * FROM 부서,직원 WHERE 부서.부서번호 = 직원.부서번호;
        SELECT 부서이름,직급 FROM 부서,직원 WHERE 부서.부서번호 = 직원.부서번호 ;
        SELECT 부서.부서이름 AS 부서명 ,직원.직급 AS 직책 FROM 부서,직원 WHERE 부서.부서번호 = 직원.부서번호 ;
        ```
        * JOIN
            * 두개의 테이블의 데이터를 연결하여 데이터를 조회함
        * 별칭 
            * `AS` 키워드를 써서 표시될 컬럼명을 수정할 수 있다.
    * 테이블 삭제
        ```sql
        -- 테이블 삭제
        DROP TABLE 부서;
        DROP TABLE 직원;
        ```
        * `DROP`명령어는 `ROLLBACK`으로 돌릴 수 없다
        * 삭제하려는 테이블을 참조하는 테이블이 있으면 아래와 같은 에러메시지를 본다
            > unique/primary keys in table referenced by foreign keys
    * 테이블 생성과 삭제는 자동으로 `commit`되기 때문에 `rollback`명령으로 되돌릴 수 없다
* DB종류
    * [DB Ranking](https://db-engines.com/en/ranking)
    * 주요 DB들
        * Oracle
        * MySQL
        * MS Access
            * 개인용 DB
            * visual bagic으로 어플리케이션 까지 가능
        * MariaDB
            * MySQL에서 파생됨
            * MySQL개발자가 만듬
        * MongoDB
            * NoSQL DB
            * javascript 문법으로 조작
        * Redis
            * NoSQL DB
            * 인메모리
        * SQLite
            * 가벼움 
            * 주로 모바일기기에 탑재
                * 안드로이드OS
        * PostgreSQL         
        * Hive
    * 관계형DB 객체지향DB를 제외하면 대부분 비정형DB 
        ||관계형 DB|NoSQL DB|
        |---|---|---|
        |특징|- 데이터간 연관성이 많다.<br/>- 정형화된 데이터를 저장 관리한다 |- 데이터들간의 관계성이 낮다 <br/>- 비정형화된 데이터를 저장 관리한다. <br/>- 대용량 데이터 분석을 위해 사용 <br/>- 빅데이터분야에 사용된다.|
        |종류|-Oracle<br/>-MySQL<br/>-MS-SQL<br/>-PostgreSQL|-MongoDB<br/>-Redis<br/>-Cassandra|
* URI
    * [URI란?](https://ko.wikipedia.org/wiki/%ED%86%B5%ED%95%A9_%EC%9E%90%EC%9B%90_%EC%8B%9D%EB%B3%84%EC%9E%90) 
        * 통합 자원 식별자(Uniform Resource Identifier, URI)
        * 인터넷에 있는 자원을 나타내는 유일한 주소
    * UR**L**
        * 네트워크 상에서 **자원**(resource)이 어디 있는지를 알려주기 위한 규약
        * **자원**이란 웹문서, 이미지, 자바스크립트 코드등을 뜻함
    * URI의 구조
        ```
                        hierarchical part
                ┌───────────────────┴─────────────────────┐
                            authority               path
                ┌───────────────┴───────────────┐┌───┴────┐
        abc://username:password@example.com:123/path/data?key=value#fragid1
        └┬┘   └───────┬───────┘ └────┬────┘ └┬┘           └───┬───┘ └──┬──┘
        scheme  user information     host     port            query   fragment

        urn:example:mammal:monotreme:echidna
        └┬┘ └──────────────┬───────────────┘
        scheme              path
        ```  
      
## 11월 5일 응용SW기초기술활용평가
* [평가대비자료](test01Preparation.md)

## 작업관리자의 성능 탭
* 각 화면이 core의 사용량
* 리소스 모니터에서 CPU에 번호 붙은 애들도 각각 core의 사용량
        
    

## VS Code 팁
* html문서 골격 자동완성 하기 
    * 방법 2가지
        1. `html:5` 입력 후 `tab`키 누르기
        2. `!` 입력 후 `tab` 키 누르기
    * 이후 다음과 같은 html골격이 생성됨
         ```html
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Document</title>
        </head>
        <body>
            
        </body>
        </html>
        ```   
* 적을 문장이 없을 때
    * `lorem` 입력후  `tab`키 누르기
    * 이후 다음과 같은 문장이 생성됨
        ```html
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat reprehenderit quibusdam iste vero, laborum ducimus nam? Quas velit, corrupti repellendus impedit ex assumenda doloremque consequuntur eveniet aut veritatis, aperiam modi?
        ```
    

[돌아가기](../README.md)