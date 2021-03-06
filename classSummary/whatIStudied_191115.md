# What I studied today.
Date : 2019-11-15

# JAVA
## 상속 개념
1. 상속
   - 상위 객체의 속성(멤버)가 하위 개체에 물려짐(단일상속만 헝용,extends)
   - 목적 : 
       - 재상용(기존 소프트웨어의 설계, 구현, 테스트에 투입도니 시간, 노력을 재활용)
       - 기존 클래스의 필드와 메소드를 그대로 상속받아 사용할 수 있다.
       - 수정할 필요가 있는 멤버는 재정의해서 사용한다.
           (멤버 필드의 재정의는 비권장)
   - 관계 : IS-A 관계
   - 상속 제외대상 :
        -  생성자
        -  초기화블럭
        -  `priavte`
        -  `static`
    -  `final`키워드가 붙은 것은 상속은 되지만 재정의는 못함.
2. 재정의(overriding)
    - 정의 : 부모 메소드 구현부를 새로이 정의해서 사용하는 개념
    - 전제조건 : 
        - 부모 메소드의 선언부(리턴타입, 메소드이름, 매개변수)가 동일해야한다.
        - 접근제한자는 부모메소드와 동이하거나 범ㅁ위가 넓어야한다.
    - `@Overriding` 
        - 부모클래스의 메소드 선언부를 검색하여 일치하지 않으면 오류를 발행시켜 개발자에게 알려준다.
    - 오버로딩(overloading) - 메소드
        - 전제조건
            - 정의 : 비스한 기능을 동일한 이름으로 매개변수만 달리해서 사용하는 개념
            - 선언부 `리턴타입 이름`가 같아야함 매개변수(타입, 순서, 갯수)는 달라야한다.
3. `final` 키워드
    1. `final` + 인스턴스 멤버필드 
        - 인스턴스별로 사용되는 상수
    2. `final` + 정적멤버필드 
        - 클래스별로 사용되는 상수
    3. `final` + 멤버 메소드 
        - 자식클래스에서 재정의 금지
    4. `final` + 클래스 
        - 자식 클래스를 가질 수 없다.
    5. `final` + 메소드
        - 상속하는 자손 클래스에서 재정의 할 수 없다.
4. 접근제한자 (access modifier)
    - `private` 
        - 같은 클래스 내애서만 접근가능
    - default
        - 같은 클래스 + 동일 패키지
    - `protected`
        - default + 다른 패키지라 하더라도 상속관계 객체는 허용
    - `public` 
        - 어디서든 접근가능
5. 
    1. super
        * `super(xxx)` : 부모클래스의 생성자
        * `super.xxx` : 부모클래스의 멤버필드
        * `super.xxx() : 부모클래스의 멤버 메소드 호출
    2. this
        * `this(xxx)` : 현재(자신) 클래스의 생성자 메소드 호출
        * `this.xxx` :  현재(자신)의 멤버필드
        * `this.xxx()` :  현재(자신)의 멤버 메소드 호출

# Database
- Database : 잘 정리되고 정돈된 데이터의 모음(파일)
- Database Management System(DBMS) 
    - Oracle 11g Express Edition
    - Database를 접근하여 어러 사용자가 데이털르 조작할 수 있게 도움주는 소프트웨어
- SQL (Structed Query Language)
    - DBMS를 경유하여 Database를 CRUD(create, read, update, delete)할 수 있도록 제공해주는 언어
- Query(질의)
    - SQL 언어로 DBMS에 요청하는 행위
- SQL Developer Client Tool
    - SQL Query 
- 릴레이션  
    - 테이블
- 릴레이션쉽(relationship) 
    - 테이블간의 관계
- 스키마    
    - 테이블 구조
- 인스턴스  
    - 테이블 구조로 저장된 데이터
- 키 
    - 튜플(행, 레코드)를 식별하는 속성, 속성 집합
- 슈퍼키 
    - 튜플(행, 레코드)를 식별하는 속성, 속성 집합의 모든 경우의 수
- 후보키
    - 슈퍼키중 최소 속성집합
- 기본키
    - 릴레이션의 대표키로 후보키들 중 하나가 될 수 있다.
- 대체키
    - 후보키중 기본키를 제외한 키(후보키 - 기본키)
- 외래키
    - 다른 릴레이션 또는 자신의 기본키를 참조하는 속성(도메인이 같아야한다)
- 대리키
    - 현재 릴레이션에 적당한 기본키가 없을 때 가상의 속성을 만들어 선정된느 기본키(ex 일련번호)
- 복합키
    - 2개 이상의 속성으로 조합된 키

## 릴레이션의 특징
- 속성은 단일값을 가짐
- 속성은 서로 다른 이름을 가짐
- 한 속성의 값은 모두 같은 도메인 값을 가짐
- 속성의 순서는 상관없음
- 릴레이션 내의 중복된 투플은 허용x
- 투플의 순서는 상관없음

## 무결성 제약조건
데이터 무결성
도메인 무결성 제약조건
개체 무결성 제약조건
참조 무결성 제약조건


[돌아가기](../README.md)  
[2019-11-14](whatIStudied_191114.md)  
[2019-11-18](whatIStudied_191118.md) 