# What I studied today.
Date : 2019-11-19

# JAVA
## 다형성 
1. 필드
2. 메소드(\| 생성자) 매개변수
3. 메소드 리턴타입
### 다형성 예제
```java
public class Parent {
	String parentField1;
	String parentField2;
	
	void method1() {
		System.out.println("Parent-method1()");
	}
	void method2() {
		System.out.println("Parent-method1()");
	}
	
}

public class Child extends Parent {
	String ChildField1;
	String ChildField2;
	
	@Override
	void method2() {
		System.out.println("Child-method2()");
	}
	void method3() {
		System.out.println("Child-method2()");
	}
	void method4() {
		System.out.println("Child-method2()");
	}

}

public class Main {
	public static void main(String[] args) {
		Child c = new Child();
		
		Parent p1 = new Parent();
		Parent p2 = new Child();
		
		p1.method2();
		p2.method2();
		
//		 p2. method3();
		((Child)p2).method3();
		((Child)p2).method4();
		
		Parent p3 = (Parent)c;
		// 자식 타입의 인스턴스를 부모타입의 변수가 참조하고 있을 대
		// 다시 자식타입으로 강제 형변환이 가능하다.!!
//		Child c2 = (Child)p1; // 컴파일 오류는 없지만, 실행시점에서 형변환 Exception 발생
		
		// instanceof : 인스턴스의 실제 타입을 체크 하는데 사용!!
		// 결과가 boolean타입을 반환함
		
		if(p2 instanceof Child) {
			System.out.println("OK");
		}else {
			System.out.println("No");
		}
	}
}
```
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
13. 인터페이스(interface)
    * 일종의 추상클래스로 추상화정도가 추상 클래스 보다 높다.
### abstract 예제
```java
public class PhoneMain {
	
	public static void main(String[] args) {
		// 1) abstract class는 인스턴스 생성 불가.
//		Phone p = new Phone();
		
		SmartPhone sp = new SmartPhone();
		
		// 2) abstract class는 선언시 타입으로 사용 가능하다.
		Phone p2 = new SmartPhone();
		
	}
}

// 4) abstract method가 클래스 내에 존재하지 않더라도
// 클래스 선언부에 abstract를 사용할 수 있다.
// 이때는 인스턴스 생성불가.
abstract public class Phone {
	
	// 3) abstract class는 abstract method가 
	// 하나라도 존재하면 class선언부에 abstract를 선언해야함.
	abstract public void method1();
	
	public void method2() {}
	public void method3() {}
}

public class SmartPhone extends Phone {
	// 5) abstract class를 상속받는 ㅋ믈래스에서는 abstract method를 반드시 구현해야한다.
	@Override
	public void method1() {
		
	}
}

```

# Database
## INSERT문
* 형태
    ```sql
    INSERT INTO 테이블이름[(속성리스트)]
            VALUE  (값리스트);
    ```
## UPDATE문
* 형태
    ```sql
    UPDATE 테이블이름
    SET     속성이름1=값1[,속성이름2=값2, ...]
    [WHERE <검색조건>];
## DELETE문
[돌아가기](../README.md)  
[2019-11-18](whatIStudied_191118.md)  
[2019-11-20](whatIStudied_191120.md) 