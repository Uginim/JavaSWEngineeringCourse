# What I studied today.
Date : 2019-11-27

# JAVA
## 자바 개념 정리
1. 객체지향 프로그래밍 특징
    - 추상화
        1. 속성, 행위 추출하는 과정
    - 캡슐화
        1. 속성, 행위를 묶는과정 => 클래스
        2. 속성 외부에서의 직접접근을 막고 공개된 행위를 통해서만  
        속성이 변경되도록 하는 개념
    - 상속
        1. 재사용성
    - 다형성
        1. 동일한 메세지에 대해서 다양한 결과를 나타내는 성질
* 현실세계의 객체 -> 추상화(속성, 행위) -> 클래스(설계도) -> 인스턴스화(new) -> 가상세계(힙메모리)의 객체
* 객체들간의 관계(상속관계, 포함관계)
## 1. 다형성
### 다형성 예시
```java
public class Child extends Parent{
	int field = 20;
	
	public void method2() {
		System.out.println("Child-method2()");
	}
	public void method3() {
		System.out.println("Child-method3()");
	}
}

public class Parent {
	int field = 10;
	public void method1() {
		System.out.println("Parent-method1()");
	}
	public void method2() {
		System.out.println("Parent-method2()");
	}
}

/*
 * 자식의 인스턴스를 부모타입에 대입할 경우
 * 메소드는 자식클래스의 인스턴스 메소드가 호출되며
 * 멤버필드는 부모타입의 멤버필드를 접근한다.
 */
public class ChildMain {
	public static void main(String[] args) {
		Child child = new Child();
		child.method1();
		child.method2();
		child.method3();
		
    // 부모 타입에 자식타입의 객체를 대입
		Parent parent = child;
		parent.method1();
		((Child)parent).method3();
		
		// 부모타입의 메소드가 자식객체에서 재정의 되었으면 
		// 중요!! -부모 메소드가 아닌 자식객체의 메소드가 호출된다.
		parent.method2(); // 재정의 된 녀석이 호출됨
		child.method2();
		
		// 참조타입의 멤버필드를 접근함. 
		System.out.println(parent.field);
		System.out.println(child.field);
		
	}
}
```
## 2. 제너릭
* 컬렉션에서 많이 씀
* 자바의 타입
    * 기본
    * 참조
        * 자바 표준
        * 서드 파티
        * 사용자정의 라이브러리
## 3. 컬렉션
## 4. 익명객체

# Database
# 기타

[돌아가기](../README.md)  
[2019-11-26](whatIStudied_191126.md) 