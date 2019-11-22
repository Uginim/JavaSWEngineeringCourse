# What I studied today.
Date : 2019-11-21

# JAVA
## 상속 용어
8. 참조변수의 형변환
    * 자동 형변환 : 
        ```java
        부모타입 = 자식타입;
        ```
    * 강제 형변환 :
        ```java
        자식타입 = (자식타입)부모타입;
        ```
    * 강제 형변환의 전제조건
        * 부모타입이 자식타입의 인스턴스를 참조하고 있을때만 강제형변환을 통해 자식의 멤버에 접근할 수 있다.
9. instanceof : 
    * 참조변수가 참조하는 인스턴스의 실제 타입을 체크 하는데 사용!!
    * 결과가 boolean 타입을 반환함
10. 조상타입에 자식 타입을 대입했을 경우
    * 멤버필드는 현재타입의 멤버를 접근하고
    * 멤버메소드는 실제 인스턴스의 메소드를 실행
11. 추상메소드(abstract method)
    * 미완성 메소드
    * 구현부(`{ }`)가 없는 메소드(선언부만 존재)
12. 추상클래스(abstract class)
    * 미완성 클래스
    * 특징
        1. 인스턴스를 만들 수 없다.
        2. 타입으로는 사용할 수 있다.
        3. 클래스내에 추상메소드 하나라도 존재한다면 
        클래스 선언부에 `abstract`를 붙여야 함
        4. 추상 메소드가 존재하지 않더라도 `abstract`키워드를 붙일 수 있다.
            * 인스턴스를 만들 수 없다(사용하려면 상속을 강제)
        5. 추상 클래스를 상속받는 클래스에서는 부모클래스의 abstract method를 구현해야한다.  
        &nbsp;&nbsp;구현하지 않으면 상속받는 클래스는 abstract를 선언해야함
		6. 단일 상속만 가능
		7. 수직적인 관계(일반화:공통사항을 추출)
13. 인터페이스(interface)
    * 일종의 추상클래스로 추상화정도가 추상 클래스 보다 높다.
    * 특징 :
		8. 인스턴스를 만들 수 없다.
		9. 타입으로는 사용할 수 있다.
		10. 모든 멤버가 public이다 
			* public을 사용하지 않더라도 컴파일러가 public을 붙임
		4. 멤버로 상수, 추상메소드, 디폴트 메소드, 정적메소드가 올 수 있다.
			- 멤버필드는 상수만 사용된다.(static final을 컴파일러가 자동으로 붙여준다.)
		5. 다중구현(인터페이스를 구현하는 구현클래스), 다중상속(인터페이스 간) 가능
		6. 수평적인 관계
	* 용도
        1. 이미 구현된 클래스, 인터페이스에 기능 추가
        	* 여러개의 독립적인 클래스 계층 구조가 공유하는 기능을 제공하기위해 사용
        	* 클래스들 사이의 공통된 사항을 추출하지만 클래스들 사이의 관계를 원하지 않을경우 사용
        2. 인터페이스를 처음 설계할 때
            * 클래스를 사용하는 측과 구현하는 측을 분리하여 동시에 병행 작업이 가능
14. 익명클래스 (annonymous class)
    * 정의 
        * 이름이 없는 클래스로 오로지 하나의 클래스를 상속 받거나
        단 하나의 인터페이스를 구현한 일회성 클래스
    * 문법
        * new 상속받을클래스명() { 멤버 }
        * new 구현할인터페이스명() { 멤버 }

## 이크립스 팁
* Navigator View를 이용해서 byte코드 확인
    * Navigator View 키는 방법 
        1. 메뉴바에 window
        2. show view
        3. Navigator
## 예외처리
* human error
* program error
    * Error
    * Exception
### 프로그램의 오류
* 컴파일 에러(compile-time error)와 런타임 에러(runtime error)
    * 컴파일 에러 - 컴파일할 때 발생하는 에러
    * 런타임 에러 - 실행할 때 발생하는 에러
* Java의 런타임 에러 - 에러(error)와 예외(exception)
    * 오류(Error) - 코드에서 처리할 수 없는 심각한 오류. JVM에 의존하여 처리
    * 예외(Exception) - 코드에서 처리할 수 있는 가벼운 정도의 오류
* 예외처리의 목적
    * 프로그램 실행시 발생할 수 있는 상황들을 미리 정해놓고, 예외가 발생했을 경우에 대비하는 코드를 작성하여 프로그램이 종료없이 정상적으로 작동하도록 하기위함.
### 예외 처리 방법
* 직접 처리
    * try ~ catch ~ finally
* 다중 catch문
    * catch순서는 넓은 범위의 객체가 아래 위치해야함
    * 상위타입이 밑에 위치하도록
* 예외가 발생될 경우
    * try블럭 안에서 예외가 발생했을 때
    * 예외가 발생한 부분 이후로는 실행되지 않음
* 선언처리
    * throws 절 이용
        * 현재 영억에서 직접 처리하지 않고 호출하는 쪽에 양도
* JDK7 부터는 하나의 catch 블록에 여러 개의 예외처리 가능
    * 동일하게 처리하고 싶은 예외를 `|`로 연결
```java

public class NullPointExceptionEx {

	public static void main(String[] args) {

		System.setErr(System.out);
		// 1) NullPointException
		// 참조하는 객체가 없은 참조변수를 접근할 때.
		String data = null;
		try {
			System.out.println(data.toString());
		} catch (NullPointerException ne) {
			System.err.println(ne.getMessage());
			ne.printStackTrace();
		}
		System.out.println("====================");
		// 2) 배열 인덱스를 초과하여 접근할 때
		int x[] = new int[5];
		try {
			System.out.println(x[5]);
		} catch (ArrayIndexOutOfBoundsException aioobe) {
			System.err.println(aioobe.getMessage());
			aioobe.printStackTrace();
		}
		System.out.println("====================");
		String data1 = "100";
		String data2 = "a100";
		int value1 = Integer.parseInt(data1);
		try {
            // 3) 숫자 형식에 맞지 않을 때
			int value2 = Integer.parseInt(data2);
		} catch (NumberFormatException nfe) {
			System.err.println(nfe.getMessage());
			nfe.printStackTrace();

		}
		System.out.println("====================");
		Animal animal = new Animal();
		try {
            // 4) 참조타입 변수의 잘못된 형변환
			Dog dog = (Dog) animal;
		} catch (ClassCastException cce) {
			System.err.println(cce.getMessage());
			cce.printStackTrace();
			System.out.println("점검중입니다!! 관리자에게 문의하세요!!");
//			return; // finally까지 실행 됨
		} finally {
			System.out.println("예외 발생 유무 없이 실행");
		}
		System.out.println("예외 이후에도 현재 문장 실행");

	}

}

class Animal {
}

class Dog extends Animal {
}

class Cat extends Animal {
}
```
## 예외처리 정리
* 예외처리(Exception Handling)
    * 목적
        * 프로그램 실행시 발생할 수 있는 예외(Runtime error)에   
        대비해서 코드를 작성해 프로그램 종료없이 정상적으로 작동하도록 하기 위함

# Database
## 단원평가
1. 기본 SQL 작성하기
    1. 테이블의 구조와 제약조건을 생성, 삭제하고 수행하는 DDL 명령문을 작성할 수 있다.
    2. 한 개의 테이블에 대해 데이터를 삽입, 수정 삭제하고 조회하는 DML명령문을 작성할 숭 ㅣㅆ다.

2. 고급 SQL 작성하기
   1. 테이블 조회 시간을 단축하기 위해 사용하는 인덱스의 개념을 이해하고 인겍스를 생성하는 DDL명령문을 작성할 수 있다.
   2. 먼저 생성된 데이터들을 이용하여 새로운 테이블과 뷰를 생성하는 DDL명령문을 작성할 수 있다.
   3. 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 


## DB 용어 정리
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
- 뷰(view) 
    - 정의 
        - 하나 이상의 물리적인 테이블을 병합하여 만든 가상의 테이블
    - 이점 
        - 편리성 및 재상용성, 보안성, 독립성
## 뷰
* 뷰(VIEW)
    * 하나 이상의 테이블을 합하여 만든 가상의 테이블
    * SELECT문을 통해 얻은 최종 결과를 가상의 테이블로 정의해 실제 테이블 처럼 사용
* 뷰의 장점
    * 편리성
        * 미리 정의된 뷰를 일반 테이블 처럼 사용할 수 있음
        * 사용자가 필요한 정보만 요구에 맞게 가공하여 뷰로 만들어 씀
    * 재사용성
        * 자주 사용되는 질의를 뷰로 미리 정의
    * 보안성
        * 각 사용자별로 필요한 데이터만 선별하여 보여줌
## 데이터 사전(Data Dictionary)
* 데이터 사전 [참조](https://isstory83.tistory.com/138)
    * 대부분 읽기 전용으로 제공되는 테이블 및 뷰들의 집합
    * 데이터베이스 전반에 대한 정보 제공


[돌아가기](../README.md)