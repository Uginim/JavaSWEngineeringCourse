# What I studied today.
Date : 2019-11-18

# JAVA
## 상속 개념 (반복되는 것 같지만 매일 갱신됨..)
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
    - 목적 : 보안
    - `private` 
        - 같은 클래스 내애서만 접근가능
    - default
        - 같은 클래스 + 동일 패키지
    - `protected`
        - default + 다른 패키지라 하더라도 상속관계 객체는 허용
    - `public` 
        - 어디서든 접근가능
5. 키워드
    1. super
        * `super(xxx)` : 부모클래스의 생성자
        * `super.xxx` : 부모클래스의 멤버필드
        * `super.xxx() : 부모클래스의 멤버 메소드 호출
    2. this
        * `this(xxx)` : 현재(자신) 클래스의 생성자 메소드 호출
        * `this.xxx` :  현재(자신)의 멤버필드
        * `this.xxx()` :  현재(자신)의 멤버 메소드 호출
6. 싱글톤 패턴 :  인스턴스를 하나만 만들수 있는 클래스
    * 만드는 절차 :
        1. 생성자를 private로 해서 외부에서 인스턴스 생성을 막음
        2. 내부에 private static 멤버필드를 두어 자신의 객체 생성
        3. 공개된(public)메소드를 두어 내부에서 생성된 인스턴스를 
            공개한다.
7. 다형성(polymorphism)
    * 정의 
        * 조상의 참조변수로 자손타입의 객체를 다룰 수 있는 기법.
            상속, 구현관계에서 부모타입에 자식타입을 대입하여 부모타입의 동일 메소드 호출에 대해 자식 객체의 재정의된 메소드가 호출되어 각기 다른 결과를 보여주는 성질
    * 전제조건 3가지
        1. 클래스의 상속관계 또는 인터페이스의 구현관계가 존재해야함.
        2. 부모타입에 자식타입이 대입돼야함
        3. 자식클래스에서 또는 구현클래스에서 메소드 재정의(overloadding)되어야 함.

## PointTest.java예제 p332
```java
    /* PointTest.java */
    ...
    /*Point3D*/
    ...

    Point3D(int x, int y, int z) { // 해당라인 오류가 생김
		this.x = x;
		this.y = y;
		this.z = z;
	}
```
* 아래와 같은 오류가 생김
> Implicit super constructor Point2() is undefined. Must explicitly invoke another constructor
* 원인 : 
    * 부모 생성자의 기본생성자가 정의되지 않았다.
    * 이에 컴파일러가 Point3D의 생성자에 자동으로 추가하는 `super()`가 오류를 일으키는 것
    * 참고 p332
        > Object클래스를 제외한 모든 클래스의 생성자 첫 줄에는 생성자,this() 또는 super(),를 호출해야한다. 그렇지 않으면 컴파일러가 자동적으로 'super();'를 생성자의 첫 줄에 삽입한다.
* 해결방법(2가지)
    * 부모클래스에 기본 생성자를 정의한다.
    * 부모클래스에 정의된 생성자를 호출한다.
## Singleton 패턴
* 인스턴스를 하나만 만들어서 사용.
* [싱글턴 패턴](https://ko.wikipedia.org/wiki/%EC%8B%B1%EA%B8%80%ED%84%B4_%ED%8C%A8%ED%84%B4)
* [Singleton-pattern 사용시 유의사항](https://redtiger.tistory.com/entry/Singleton-pattern-%EC%82%AC%EC%9A%A9%EC%8B%9C-%EC%9C%A0%EC%9D%98%EC%82%AC%ED%95%AD)
* 예시 
    * ```java
        final public class Singleton { // 확장을 못함
            private static Singleton singleton = new Singleton(); // 같은 인스턴스를 공유하기위함

            private Singleton() { // private으로 외부에서 생성자 호출을 막음
                
            }

            public static Singleton getInstance() { // 인스턴스를 가져올 방법                
                return singleton;
            }
        }
        ```
## 객체지향 4가지 특징
* 추상화 
* 캡슐화
    * 은닉화
* 다형성
* 상속
## 형변환
* 기본타입 형변환
    * 자동 형변환
    * 강제 형변환
* 참조타입 형변환
    * 자동 형변환
        * 자식타입 -> 부모타입 대입
            ```java
            Parent p = new Child();
            ```
    * 강제 형변환
        * 부모타입 -> 자식 타입 대입
            ```java
            Child c = (Child) p;
            ```
# Database
## DB용어 모음
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
- ERD(Entity-Relationship Diagram) 
    > 테이블 간의 관계를 표준화된 기호로 도식화한 그림
- 릴레이션 : 테이블
- 릴레이션쉽(relationship) : 테이블 간의 관계
- 스키마 : 테이블 구조(속성, 자료타입)
- 인스턴스 : 테이블 구조로 저장된 데이터
- 키 : 튜플(행, 레코드)를 식별하는 속성, 속성 집합
    - 슈퍼키 : 튜플(행, 레코드)를 식별하는 속성, 속성 집합의 모든 경우의 수
    - 후보키 : 슈퍼키 중 최소 속성집합
    - 기본키 : 릴레이션의 대표키로 후보키들 중 하나가 될 수 있다.
    - 대체키 : 후보키 중 기본키를 제외한 키 (후보키 - 기본키)
    - 외래키 : 다른 릴레이션 또는 자신의 기본키를 참조하는 속성(도메인이 갈아야한다.)
    - 대리키 : 현재 릴레이션에 적당한 기본키가 없을때 가상의 속성을 만들어 선정되는 기본키(ex: 일련번호)
- 복합키 : 2개 이상의 속성으로 조합된 키
- 데이터 무결성 : 데이터베이스에 정장된 데이터의 일관성과 정확성을 유지시키는 성질
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
## 데이터 정의어
- CREATE
- ALTER
- DROP
## 데이터 조작어
- INSERT
- UPDATE
- DELETE