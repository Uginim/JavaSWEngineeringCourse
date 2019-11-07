# What I studied today.
Date : 2019-11-07

# JAVA
## 객체지향 프로그래밍 절차
객체와 클래스
* 현실세계: 설계도 -> 객체
* 자바: 클래스 -> 객체
* 클래스에는 객체를 생성하기 위한 필드와 메소드가 정의되어 있다.
* 클래스로부터 만들어진 객체를 해당 클래스의 인스턴스(instance)라고 한다.
* 하나의 클래스로부터 여러 개의 인스턴스를 만들 수 있다.
<br>

[객체를 생성하는 순서]  
개발자  ===설계===>  클래스(설계도) ====인스턴스화==> 인스턴스(객체)

## 객체의 상호 작용
### 객체간의 관계를 형성하는 방법 case 3가지
* case 1) 
    * 메소드에서 객체를 매개변수로 받아서 사용하는 방법
* case 2)
    * 메소드의 매개변수로 필드에 객체를 할당하고, 사용하는 방법
* case 3)
    * 생성자의 인자로 객체를 받고, 필드에 할당해 사용하는 방법

## 객체란?
1. 현실세계의 객체 물리적으로 존재하는 것(사람, 자동차 등)
    * 추상적으로 존재하는 것(회사, 날짜, 도덕, 관념, 상상 등)
2. 가상세계의 객체 
    * 현실세계의 객체를 추상화(속성, 행위)하여 만든 클래스(멤버필드,멤버메소드)를  
    인스턴스화(new, 힙 메모리에 생성)한 객체(인스턴스)
3. 클래스
    * 자바 객체지향 프로그래밍의 최소 단위
    * 멤버필드만으로도 구성될 수 있다.
    * 멤버메소드만으로도 구성될 수 있다.
4. 객체지향 프로그래밍
    * 부품 객체(클래스)를 만들고 이것들을 하나씩 조립해  
    완성된 프로그래밍으로 만드는 기법

## Scanner Class 구현 보기
* 이클립스에서 Class 구현부분 보는 방법 
    1. 소스코드에서 보길 원하는 클래스에 커서를 찍는다.  
    (클릭 or 더블클릭)
    2. `ctrl`키 누른 상태에서 클릭
    3. Open Implementation 클릭
    * 혹시나 안될 경우
        * Attach를 직접해야함 
        * attach 버튼을 누르고
        * JDK 경로의 src.zip을 열면 됨
        * [참조링크](https://zzdd1558.tistory.com/150)
* Scanner class
    ``` java
    package java.util;

    import java.nio.file.Path;
    import java.nio.file.Files;
    import java.util.regex.*;
    import java.io.*;
    import java.math.*;
    import java.nio.*;
    import java.nio.channels.*;
    import java.nio.charset.*;
    import java.text.*;
    import java.util.Locale;

    import sun.misc.LRUCache;
    public final class Scanner implements Iterator<String>, Closeable {
        //필드들
        // Internal buffer used to hold input
        private CharBuffer buf;

        // Size of internal character buffer
        private static final int BUFFER_SIZE = 1024; // change to 1024;
        
        /*
        * 생략
        */
        //메소드들
        // A cache of the last few recently used Patterns
        private LRUCache<String,Pattern> patternCache =
        new LRUCache<String,Pattern>(7) {
            protected Pattern create(String s) {
                return Pattern.compile(s);
            }
            protected boolean hasName(Pattern p, String s) {
                return p.pattern().equals(s);
            }
        };

        /* 생략   */
        //생성자    
        public Scanner(Path source)
            throws IOException
        {
            this(Files.newInputStream(source));
        }

        /* 생략   */
    }
    ```
## 생성자
* 생성자 : 
    * 객체를 초기화 해주기 위해 사용되는 메소드
        * 오류
    * 리턴 타입이 없다.
	* 클래스 이름과 동일하다.
	* 디폴트 생성자는 프로그래머가 구현하지 않더라도 컴파일러가 자동으로 추가해준다.
	* 프로그래머가 만든 생성자가 하나라도 존재하면 디폴트생성자는 자동 생성되지 않는다!!!	
* 디폴트 생성자:
    * 매개번수도 없고 실행문도 없는 생성자
* 예시
    ```java
    public class Person {
        // 생성자(디폴트 생성자)
        public Person() {
            // 빈칸
        }
    }
    ```
* 예시2
    * 생성자 호출하기
    * Person2 Class
        ```java
        public class Person2 {
            // 디폴트 생성자
            public Person2() {
                System.out.println("디폴트생성자 호출됨!");
            }
        }
        ```
    * PersonMain2 Class
        ```java
        public class PersonMain2 {	
            public static void main(String[] args) {
                Person2 p1 = new Person2();

            }
        }
        ```
* 상속
    * Object <- Person
    * 자바에서는 모든 클래스가 Object를 상속한다.
    * 그래서 Object의 멤버들을 공유한다.
* 생성자의 매개변수와 맴버필드가 같은 식별자일 경우
    * 해결방법
        1. 매개변수명을 바꾼다
        2. **`this`키워드를 사용한다.**
            * 주로쓰는 방법
* `this` 키워드 
    * 객체 자신을 가리킴
* 생성자 오버로딩 : 동일이름의 생성자를 여러개 선언 가능
                    단, 매개변수는 달라야한다.
* 자신의 생성자 호출하기
    * 자신의 생성자를 호출할 때는 클래스명을 쓰지않음
    * `this()`로 생성함
    * 해당 생성자 블록에 맨 위(첫 문장)에 와야한다.
    * 예시
        ```java
        class Person {
            public Person(String name) {
                this.name = name;
            }
            public Person(String name, int age){
                // this() ; 자신의 생성자 호출, 반드 첫문장에 사용해야함
                this(name); 
                this.age=age;
            }
        }
        ```
* `private` 접근제한자
    * `private`에 붙은 멤버를 다른 클래스에 접근하려할 경우 오류가 뜸
        ```
            The field Person.age is not visible
        ```
* default 접근제한자
    * 같은 패키지 내에서 접근가능하다.
* 유효성 체크
    * `private`으로 직접 접근을 막기
    * 메소드로 접근할 통로를 만든다.
        * Setter 메소드라고 함
        * 예시
            ```java
            private int age; // 필드
            // setter 메소드
            public void setAge(int age) {
                if( age < 1 ||  age > 150) {
                    System.out.println("잘못된 입력값입니다.");
                    return ; // 메소드 실행을중지하고 제어를 호출한 곳으로 넘긴다.
                } else {
                    this.age = age;
                }
                
            }
            ```
* `return`문 
    * 메소드 실행을중지하고 제어를 호출한 곳으로 넘긴다.

* 맴버필드와 지역변수의 차이
    * 맴버필드는 프로그래머가 초기값을 지정해주지 않으면 타입별 default값으로 초기화 됨
    * 지역변수는 프로그래머가 초기값을 대입해줄때 까지 초기화되지 않음.
* 한개의 java 소스파일 내에서 여러개의 클래스가 올 수 있음 
    * 대신 파일 명은 `main()` 메소드가 잇는 class 명으로 정해야함.
## 인스턴스 생성 예제 p235
    * 책의 설명에는 객체가 생성된 곳(힙)에 메소드도 같이 언급되어있는데 잘못됨
        * 책에 나오는 내용과는 다르게 메소드는 메소드영역에 올라간다.
* 예제 TvTest2 예제에 Tv Class 가 주석되어 있는 이유
    * 소스에서 사용하는 TV class TvTest.java에 있는 Tv clas를 사용한다.
    * Tv class의 형태를 보여주기 위해 넣은것으로 추정
* cartest 예제-

# Database
* SQL 분류
    * DDL
    * DML
    * DCL
* 147p 질의 3-1 부터 따라해보기
* 와일드 문자 종류
    * |와일드 문자|의미|사용 예|
        |---|---|---|
        | + | 문자열을 연결 | '안녕' + '하세요' : '안녕 하세요'|
        | % | 0개 이상의 문자열과 일치 | '%월드%' : '월드'를 포함하는 문자열 |
        | \[\] | 1개의 문자와 일치 | '[A-Z]%':A-Z 사이 숫자로 시작하는 문자열 |
        | \[^\] | 1개의 문자와 불일치 | '[^a-z]%':a-a 사이 숫자로 시작하지 않는 문자열|
        |\- | 특정위치의 1개의 문자와 일치| '_드%': 두 번째 위치에 '드'가 들어가는 문자열|
* 집계함수 종류 
    * |집계 함수|문법|사용 예|
        |---|---|---|
        |SUM|SUM([ALL \| DISTINCT] 속성이름) | SUM(price)|
        |AVG|AVG([ALL \| DISTINCT] 속성이름) | AVG(price)|
        |COUNT|COUNT([ALL \| DISTINCT] 속성이름) | COUNT(*)|
        |MAX|MAX([ALL \| DISTINCT] 속성이름) | MAX(price)|
        |MIN|MIN([ALL \| DISTINCT] 속성이름) | MIN(price)|
* SQL을 사용할 때 그룹순서는 지켜줘야한다.
* GROUP BY 절은 집계함수와 같이 씀
    * 엑셀에서도 집계 가능 하지만 조금 더 불편
* 159p부터 162p까지 읽어보기
    * GROUP BY 와 HAVING
    * GROUP BY 절이 포함된 SQL문의 실행순서 p162

1번의 1-4
2번의 1-7