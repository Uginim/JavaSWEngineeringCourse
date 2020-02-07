# What I studied today.
Date : 2020-02-07

# JAVA
## 어노테이션(Annotation)
### 어노테이션(Annotation)이란?
- 프로그램에게 추가적인 정보를 제공해주는 메타데이터(metadata)이다
- 어노테이션 용도
    - 컴파일러에게 코드 작성 문법 에러 체크하도록 정보 제공
        - ) 메소드가 재정의 되었느닞 확인할 수 있다.(`@Override)
    - 소프트웨어 개발 툴이 빌드나 배치 시 코드를 자동 생성하게 정보 제공
        - ) XML설정 파일을 자동 생성하거나 배포를 위한 JAR압축 파일을 자동 생성할 수 있다
    - 실행 시(런타임 시) 특정 기능 실행하도록 정보 제공
        - ) 객체가 애플리케이션 내부에서 해야할 역할을 정의할 수 있다.(서블릿, 컨트롤러, ...)
### 어노테이션 타입 정의와 적용
- 어노테이션 타입 정의
    - 소스 파일 생성: AnnotationName.java
    - 소스파일 내용  
        ```java
        public @interface AnnotationName{
            
        }
        ```
- 어노테이션 타입 적용
    - `@AnnotationName`  
        ```java
        @Override
        public void toString() { ... }
        ```
### 어노테이션의 엘리먼트(element) 멤버
- 어노테이션 코드에 적용할 때 외부의 값을 입력받을 수 있도록 하는 여갛ㄹ
- 엘리먼트 선언
    ```java
    public @interface AnnotationName{
        타입 elementName() [default 값] ;
    }
    - 엘리먼트 타입은 기본타입과 참조타입을 모두 사용할 수 있다.
        ```java
        public @interface AnnotationName{
            String elementName1();
            int elementName2() default 5;
        }
        ```
- 어노테이션 적용 시 엘리먼트 값을 지정하는 방법
    ```java
    public @interface AnnotationName {
        타입 elementName() [default 값]; // 엘리먼트 선언
        ...
    }
    ```
    
### 기본 앨리먼트 value
```java
public @interface AnnotationName {
    String value();
    int elementName() default 5;
}
```
- 어노테이션 적용할 때 엘리먼트 이름 생략 가능
    `@AnnotationName("값");
    ```java
    @WebServlet("/main")
    public class MainServlet{
        ...
    }
    ```
- 두 개 이상의 속성을 기술할 때에는 value=값 형태로 기술  
    `@AnnotationName(value="값",elementName=3);`
    ```java
    @WebServlet(value="/main")
    public class MainServlet{
        ...
    }
    ```
### 어노테이션 적용 대상
- 코드 상에서 어노테이션을 적용할 수 있는 대상
- java.lang.annotation.ElementType 열거 상수로 정의됨.  
    |ElementType 열거 상수|적용 대상|
    |---|---|
    |TYPE|클래스, 인터페이스, 열거 타입|
    |ANNOTATION_TYPE|어노테이션|
    |FIELD|필드|
    |CONSTRUCTOR|생성자|
    |METHOD|메소드|
    |LOCAL_VARIABLE|로컬 변수|
    |PACKAGE|패키지|  
    
    ```java
    @AnnotationName
    public class ClassName{
        @AnnotationName
        private String fieldname;

        //@AnnotationName(X)
        public className() { }

        @AnnotationName
        public void methodName(){

        }
    }
    ```
### 어노테이션 적용 대상 지정 방법
- `@Target` 어노테이션으로 적용 대상 지정
- `@Target`의 기본 엘리먼트인 value의 타입은 ElementType배열
    ```java
    @Target((ElementType.TYPE, ElementType.FIELD, ElementType.METHOD))
    public @interface AnnotationName {
        ...
    }
    ```
### 어노테이션 유지 정책
- 어노테이션 적용 코드가 유지되는 시점을 지정하는 것
- java.lang.annotation.RententionPolicy 열거 상수로 정의  
    |RetentionPolicy 열거 상수 | 설명|
    |---|---|
    |SOURCE|소스상에서만 어노테이션 정보를 유지한다. 소스 코드를 분석할 때만 의미가 있으며, 바이트 코드 파일에는 정보가 남지 않는다. |
    |CLASS|바이트 코드 파일까지 어노테이션 정보를 유지한다. 하지만 리플렉션을 이용해서 어노테이션 정보를 얻을 수는 없다.|
    |RUNTIME|바이트 코드 파일까지 어노테이션 정보를 유지하면서 리플렉션을 이용해서 런타임에 어노테이션 정보를 얻을 수 있다.
    - 리플렉션(Reflection):런타임에 클래스의 메타 정보를 얻는 기능
        - 클래스가 가지고 있는 필드, 생성자 메소드, 어노테이션의 정보를 얻을 수 있다.
        - 런타임 시 어노테이션 정보를 얻으려면 유지 정책을 RUNTIME으로 설정해야함
- 유지 정책 지정 방법
    - `@Retention` 어노테이션으로 유지 정책을 지정
    - `@Retention`의 기본 엘리먼트인 value 타입은 RetentionPolicy
        ```java
        @Target({ElementType.Type, ElementType.FIELD, ElementType.METHOD})
        @Retention(RetentionPolicy.RUNTIME)
        public @interface AnnotationName{

        }
        ```
### 런타임시 어노테이션 정보 사용하기
- 클래스에 적용된 어노테이션 정보 얻기
    - 클래스.class의 어노테이션 정보를 얻는 메소드 이용
- 필드, 생성자, 메소드에 적용된 어노테이션 정보 얻기
    - 클래스.class의 다음 메소드 이용해 java.lang.reflect 패키지의 Field, Constructor, Method 클래스의 배열 얻어냄
        |리턴타입|메소드명(매개변수)|설명|
        |Field[]|getFields()|필드 정보를 Field 배열로 리턴|
        |Constructor[]|getConstructors()|생성자 정보를 Constructor 배열로 리턴|
        |Method[]|getDeclaredMethods()|메소드 정보를 Method 배열로 리턴|
        - Field, Constructor, Method의 어노테이션 정보를 얻는 메소드를 이용
- 어노테이션 정보를 더기 위한 메소드
### 런타임 시 어노테이션 정보 사용하기
- Field, Constructor, Method가 가지 다음 메소드 호출
    - 어노테이션 정보를 얻기 위한 메소드  
- 메소드 
    - `boolean isAnnotationPresent(Class<? extends Annotation> annotationClass)`
        - 지정한 어노테이션이 적요되었는지 여부.
        - class에서 호출했을 경우 상위 클래스에 적용된 경우에도 true를 리턴한다.
    - `Annotation getAnnotation(Class<T> annotationClass)`
        - 지정한 어노테이션이 적용되어 있으면 어노테이션을 리턴하고 그렇지 않다면 null을 리턴한다.
        - class 에서 호출했을 경우 상위 클래스에 적용된 경우에도 어노테이션을 리턴한다.
    - `Annotation[] getAnnotations()`
        - 적용된 모든 어노테이션을 리턴한다.
        - class에서 호출했을 경우 사우이 클래스에 적용된 어노테이션도 모두 포함한다.
        - 어노테이션이 없을 경우 길이가 0인 배열을 리턴한다.
    - `Annotation[] getDeclaredAnnotations()`
        - 직접 적용된 모든 어노테이션을 리턴한다. 
        - class 에서 호출했을 경우 상위 클래스에 적용된 어노테이션은 포함되지 않는다.


### Java Doc 8에서 보기
- `java.lang`, `java.lang.annotation` 참조

## Java Enum
### 열거 타입(Enumeration Type)
- 한정된 값만을 갖는 데이터 타입
- 한정된 값은 열거 상수(Enumeration Constant)로 정의
### 열거 타입(Enumeration Type)특징
- 열거형(enumerated type) 클래스, 연관된 상수들의 집합(JDK 1.5부터 지원)
- 클래스의 일종, 생성자를 가질 수 있다.
- 생성자의 접근 제어자는 private, Default가 올 수 있다.
- enum 클래스도 일반클래스와 마찬가지로 컴파일 할 때 자동으로 생성자를 만들어 줌
    - 하지만 생성자를 통하여 객체를 생성할 수 없다.
- enum 클래스의 values()메소드를 호출하면, enum 클래스 내에 선언되어 있는 모든 상수를 리턴한다.
- java.lang.Enum 클래스를 자동으로 상속 받는다.
### 열거 타입 선언
- 열거 타입 소스파일 생성 : `~.java`
    - 열거 타입 이름의 첫 문자는 대문자(관례;클래스와 동일)
- 소스 작성 방법
    - 파일 이름과 동일한 이름으로 다음과 같이 선언(첫 글자 대문자)
        `public enum 열거타입이름 {...}`
    - 한정된 값인 열거 상수 정의
        - 열거 상수 이름은 관례적으로 모두 대문자로 작성
        - 다른 단어가 결합된 이름일 경우 관례적으로 밑줄(_)로 연결
    - `public enum Week {MONDAY, TUESDAY, WENDNESDAY, THURSDAY,FRIDAY,SATURDAY}`
    - `public enum LoginResult{LOGIN_SUCCESS, LOGIN_FAILED}`
### 열거 타입 변수
- 열거 타입 변수 선언
    ```java
    // 열거타입 변수;
    Week today;
    Week reservationDay;
    ```
- 열거 상수 값 저장 
    - 열거 타입 변수값은 열거 상수 중 하나임
        ```java
        // 열거타입 변수 = 열거타입.열거상수;
        Week today = Week.SUNDAY;
        ```
- 열거 타입 변수는 참조 타입
    - 열거 타입 변수는 참조 타입이므로 null 값 저장 가능
        ```java
        Week birthday = null;
        ```
### 열거 객체의 메소드
- 열거 객체는 열거 상수의 문자열을 내부 데이터로 가지고 있다.
- 열거 타입은 컴파일 시 java.lang.Enum 클래스를 자동 상속한다
    - 열거 객체는 java.lang.Enum 클래스의 메소드를 사용할 수 있다.  
        |리턴타입|메소드(매개변수)|설명|
        |---|---|---|
        |String|name()|열거 객체의 문자열을 리턴|
        |int|ordinal()|열거 객체의 순번(0부터 시작)를 리턴|
        |int|compareTo()|열거 객체를 비교해서 순번 차이를 리턴|
        |열거타입|valueOf(String name)|주어진 문자열의 열거 객체를 리턴|
        |열거배열|values()|모든 열거 객체들을 배열로 리턴|
### 열거형 사용 예시
- annotation.EnumWeekMain.java
    ```java
    package annotation;

    import java.util.Calendar;

    public class EnumWeekMain {

        public static void main(String[] args) {
            Week day = null;
            
            Calendar cal = Calendar.getInstance();
            int week = cal.get(Calendar.DAY_OF_WEEK);
            
            switch(week) {
            
            case 1: day = Week.SUNDAY;
            break;
            case 2: day = Week.MONDAY;
            break;
            case 3: day = Week.TUESDAY;
            break;
            case 4: day = Week.WEDNESDAY;
            break;
            case 5: day = Week.THURSDAY;
            break;
            case 6: day = Week.FRIDAY;
            break;
            case 7: day = Week.SATURDAY;
            break;
            }
            
            System.out.println("오늘의 요일 : " + day);
            System.out.println("자바공부시간 : " + day.getStudyHour()+"시간");
            
            System.out.println("월요일 자바공부시간");
            Week[] weeks = Week.values();
            for(Week k: weeks) {
                System.out.println(
                        k.name()
                        + ":" 
                        + k.getStudyHour()
                        + ":"
                        + k.getRestHour()
                        + ":"
                        + k.getRestHour2()
                        + ":"
                        + k.getSleep()
                    );
                
            }
            
            System.out.println(Week.SUNDAY.getRestHour());
            System.out.println(Week.SUNDAY.getRestHour2());
        }
    }
    ```
- annotation.Service.java
    ```java
    package annotation;

    public class Service {

        @PrintAnnotation
        public void method1() {
            System.out.println("method1() 실행!");
        }
    //	@PrintAnnotation("*")
        @PrintAnnotation(value="*")
        public void method2() {
            System.out.println("method2()  실행!");
    }
        @PrintAnnotation(value="#", number = 20)
        public void method3() {
            System.out.println("method3()  실행!"); 
        }
    }
    ```
- annotation.Week.java
    ```java
    package annotation;

    public enum Week {
        
        MONDAY(1){
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 1;
            }
        },
        TUESDAY(2){
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 2;
            }
        },
        WEDNESDAY(3){
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 3;
            }
        },
        THURSDAY(3){
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 4;
            }
        },
        FRIDAY(3){
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 5;
            }
        },
        SATURDAY(0){
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 6;
            }
        },
        SUNDAY(4,12){
            int restHour = 7;
            @Override
            double getRestHour2() {

                return this.getStudyHour() * 7;
            }
        };
        
        private final int hour; //공부시간
        private final int sleep;//cnlclatlrks
        Week(int hour){
            this.hour = hour;
            this.sleep = 10;
        }
        Week(int hour, int sleep){
            this.hour = hour;
            this.sleep = sleep;
        }
        
        private final double restHour = 0.5; // 휴식시간
        
        public int getStudyHour() {
            return this.hour;
        }
        
        public double getRestHour() {
            return this.hour * restHour;
        }
        
        public int getSleep() {
            return this.hour * sleep;
        }
        
        abstract double getRestHour2();
    }
    ```    
- 실행 결과
    ```
    오늘의 요일 : FRIDAY
    자바공부시간 : 3시간
    월요일 자바공부시간
    MONDAY:1:0.5:1.0:10
    TUESDAY:2:1.0:4.0:20
    WEDNESDAY:3:1.5:9.0:30
    THURSDAY:3:1.5:12.0:30
    FRIDAY:3:1.5:15.0:30
    SATURDAY:0:0.0:0.0:0
    SUNDAY:4:2.0:28.0:48
    2.0
    28.0

    ```
# Spring
## Spring Annotation
### @Controller, @Repository 어노테이션에서 value값
- 빈 이름 지정가능
- 이후 `@Qualifier`로 빈 지정할때는 바뀐 빈 이름을 사용해야함
## forward vs redirect
- Controller 예시
    ```java
    package com.kh.portfolio.controller;

    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestMethod;

    //@Controller
    @RequestMapping("/test")
    public class TestController {
    //	/*
    //	@RequestMapping
    //	@RequestMapping({"","/1","/2","/3"})
    //	@RequestMapping(value={"","/1","/2","/3"},method=RequestMethod.GET)
        @RequestMapping(value={"","/1","/2","/3"},
        method={RequestMethod.GET,RequestMethod.POST})
        public String t1() {
            return "test";
        }
    //	*/
        
        /*
    //	하나의 메소드에서 HTTP요청 방식 중복 선언 불가	
        @GetMapping(value= {"","/1","/2","/3"})
        @PostMapping(value= {"","/1","/2","/3"})
        public String t1() {
            return "test";
        }
    //	*/
        
        /*
    //	이와같이 분리해서 처리함	
        @GetMapping(value= {"","/1","/2","/3"})
        public String t2_1() {
            return "test";
        }
        @PostMapping(value= {"","/1","/2","/3"})
        public String t2_2() {
            return "test";
        }
    //	*/
        
        
    //	@RequestMapping("/") // 이렇게 설정할 경우 '/'까지 넣어줘야 요청 가능
    //	@RequestMapping
        @RequestMapping("/abc") 
        public String temp() {
            // 1) 상대경로 : 현재 요청 URL이 기준이 됨
    //		return "redirect:../test"; 
    //		return "redirect:.";  
    //		return "redirect:./";
            
            // 2) 절대 경로: 컨텍스트 루트가 기준이 됨
    //		return "redirect:/test"; // 절대경로
            
            // 3) 외부 링크 
            return "redirect:http://www.naver.com";
        }
        @RequestMapping("/abc2") 
        public String temp2() {
    //		return "forward:../test"; //(X)
    //		return "forward:."; //(X) 상대 경로 문자 그대로 매핑해버림
    //		return "redirect:http://www.naver.com";//(X) 외부링크 안됨
            
            return "forward:/test"; //(O)
    //		return "forward:"; //(O)
        }
    }
    ```
- Controller예시 2
    ```java
    package com.kh.portfolio.controller;

    import java.util.Map;

    import javax.servlet.http.HttpServletRequest;

    import org.slf4j.Logger;
    import org.slf4j.LoggerFactory;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestParam;

    @Controller
    public class TestController2 {
        
        private static final Logger logger = LoggerFactory.getLogger(TestController2.class); 
        
        @RequestMapping("/test/t1")
        public String t1(HttpServletRequest request) {
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            logger.info("이름: "+name);
            logger.info("나이: "+age);
            return "test";
        }
        
        // 어노테이션을 쓰면 타입이 자동 변환됨
        @RequestMapping("/test/t2")
        public String t2(
                @RequestParam String name,
                @RequestParam int age) {
            logger.info("이름: "+name);
            logger.info("나이: "+age);
            return "test";
        }
        
        @RequestMapping("/test/t3")
        public String t3(
                @RequestParam("name") String myName,
                @RequestParam("age") int myAge) {
            logger.info("이름: "+myName);
            logger.info("나이: "+myAge);
            return "test";
        }
        
        @RequestMapping("/test/t4")
        public String t4(
                @RequestParam Map<String,String>map) {
            logger.info("이름: "+map.get("name"));
            logger.info("나이: "+map.get("age"));
            return "test";
        }
    }

    ```

<br><br><hr>

[돌아가기](../README.md)  
[2020-02-06](whatIStudied_200206.md)  
[2020-02-10](whatIStudied_200210.md)  














