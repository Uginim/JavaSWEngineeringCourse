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
