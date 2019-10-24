# What I studied today.
Date : 2019-10-24

## 1~4장 복습
* 식별자(identifier)란?
    * 클래스, 변수, 상수, 메소드 등에 붙이는 이름
* boolean 값은 is로 시작
* 변수는 카멜케이스
* 메소드는 동사로 시작

## 연산자
* 산술연산 수행시 피연산자는 동일타입으로 변경 후 계산된다.
* int 이외의 타입이 산술연산에 참여시 각 피연산자를 int로 변경 후 계산
* 결론 : 이 경우는 int이상의 타입 변수에 저장해야한다.
```java
    byte a = 10; 
    byte b = 20; 
    // byte c = a + b;
    // short c = a + b;
    int c = a+ b;
    long d = a + b;
    float e = a + b;
    double f = a + b;
    System.out.println(c);       
```
<br/>

* 큰 타입의 값을 작은 타입에 저장하려하면 값의 손실이 발생할 수 있다.

```java

byte a = 10;
byte b = 30;
byte c = 0;
// 저장할수 없는 범위의 값을 넣으려 하면 오류를 출력한다.
if( a * b > Byte.MAX_VALUE) {
    System.out.println("범위 초과");
} else if( a * b < Byte.MIN_VALUE){
    System.out.println("범위 초과");
} else {
    c = (byte)(a * b); // 300이 아니라 44가 나옴
}
short d = (short)(a * b);
System.out.println(c);
System.out.println(d);
c = (byte) 128;
System.out.println(c);		
System.out.println(Byte.MAX_VALUE);
System.out.println(Byte.MIN_VALUE);

```
<br/>

* 정수 리터럴의 기본 타입은 int
* 실수 리터럴의 기본 타입은 double

```java
        int a = 1000000;    // 1,000,000   1백만 
		int b = 2000000;    // 2,000,000   2백만 

		long c = a * b;     // a * b = 2,000,000,000,000 ?
		int d = a * b;     // a * b = 2,000,000,000,000 ?
		long e = (long) a * b;
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
```
```java		
		int a2 = 1000000;	// 1,000,000   1백만
		long b2 = 2000000;	// 2,000,000   2백만
		
		long c2 = a2 * b2; // a * b = 2,000,000,000,000 ?
//		int d2 = a2 * b2;  // a * b = 2,000,000,000,000 ?
		
		System.out.println(c2);
//		System.out.println(d2);
```		
<br/>

* 숫자 리터럴도 int형 
* 리터럴 뒤에 'l'이나 'L'을 붙여줘야 long형 리터럴		
 

```java
    int x = 2_000_000_000;
    long x2 = 2_200_000_000L;     
    float y = 1.5F; 
    double y2 = 1.5;
```
 
* 변수가 포함된 식의 평가(evaluation)는 프로그램 실행시 하게 됨
* 리터럴간의 평가는 컴파일단계에서 하게됨



```java
    char c1 = 'a';
    // Type mismatch: cannot convert from int to char
//	char c2 =  c1+1;           // 라인 5 : 컴파일 에러발생!!! 
    char c2 = 'a'+1;           // 라인 6 : 컴파일 에러없음 
```
## float과 int
* 같은 4byte의 수지만 표현하는 값의 범위와 정밀도는 다르다.

<br/>

## oracle 설치 
* ([2019-10-18 문서](whatIStudied_191018.md)에 추가)

<br/>

## tomcat 설치
* ([2019-10-18 문서](whatIStudied_191018.md)에 추가)

<br/>

## Class 
* [Java SE 8 API Specification](https://docs.oracle.com/javase/8/docs/api/)

<br/>

## 웹 어플리케이션 아키텍처 - 웹 문서 시대(1990년대)
* 웹 서버와 브라우저간 정적인 HTML 문서를 주로 보내거나 CGI(Common Gateway Interface)를 이용하여 개발하는 경우
* 마크업과 프로그램 코드가 섞여있는 개발 방식을 사용함
* 개발 직군간의 업무 분담이 전혀 이루어지지 않는 상태.
* 그림은 생략

<br/>

## Tomcat
* 프로그램이 메모리에 상주하면 프로세스
* tomcat이 실행되면 Tomcat9.exe 프로세스가 실행되고 있음
* 사설 Doamin Name
* 본인 ip확인 
    * ipconfig 유틸
* 선생님 컴퓨터 ip `http://192.168.0.121:9080/`
* tomcat 파일구조 구조
    * webapps 
        * 안에 있는 각각의 파일이 웹 어플리케이션
        * ROOT
            * index.jsp 
                * 해당문서가불러와짐
            * index.html이 우선순위 높음
        * docs
        * manager
    * bin
        * 톰캣의 바이너리파일(실행파일)
    * conf 
        * 톰캣 설정관련 파일
        * context.xml
        * server.xml
            * Connector port를 설정할 수 있다.
        * web.xml
* 톰캣 서비스 시작/중지
    * 방법 1
        * `ctrl` + `shift` + `esc` 를 하면 작업관리자가 나타남
        * 서비스 탭 -> Tomcat9 우클릭 -> 서비스 중지
    * 방법 2
        *  작업관리자 아래쪽에 `서비스`
        * Apache Tomcat9 우클릭 -> 서비스 시작 or 서비스 중지
    * 톰캣 서비스 자동 설정
        * `서비스`(켜는법 위 참조) "Apache Tomcat9" 우클릭 -> 속성 -> 시작유형 변경
    * tomcat9w.exe
        * tomcat properties 창

<br/>

## XML
### 메타 태그
* 정보에 대한 정보
* 정보를 나타내는 방법들
```
홍길동  30  남
홍길순  25  여

----------------이하 XML예시-----------

<?xml version="1.0" encoding="UTF-8"?>
<person>
    <name>홍길동</name>
    <age>30</age>
    <gender>남</gender>
    <ssn>900101</ssn>
</person>
<person>
    <name ssn="900101">홍길순</name>
    <age>25</age>
    <gender>여</gender>
</person>
<>
```
### xml
* 시작태그 & 끝태그
    * `<태그> </태그>`
* 단독태그
    * `<태그/>`
* 주석
    * `<!-- -->`
* 속성 
    * `<태그 속성="값"> </태그>`
  
<br/>

## web어플리케이션 예제(STS)
* File -> new -> others ->  Dynamic web project -> check Generate web.xml -> finish -> open perspective
### 프로젝트 구조
* 프로젝트 이름 : WebTest
* WebContent
    * META-INF
    * WEB-INF
* WebContent에 HTML파일 추가
    * Hello.html
### 서버 추가
* File -> new -> server -> 톰캣 설치 경로 지정(JAVASTUDY/tomcat9) -> jre 지정 -> 좌측 available 창의 웹서버 체크 -> add -> finish -> 이후 Project explorer에 server 프로젝트가 만들어짐 && "Servers " view도 생김
* 아래쪽 Servers 창에서 "Tomcat v9.0 Server at localhost" 클릭 -> overview tab
    * Use Tomcat installation 체크(설치된 tom캣사용)
    * deploy 경로 -> JAVASTUDY/tomcat9/webapps 
    * publish module contexts to seperate XML files 체크
* tomcat admin port 설정 9005
* Server 창의 modules tab 
    * WebContent의 목록을 볼 수 있다.
    * path필드의 경로가 리소스 주소
### 서버 실행
* Server 우클릭 -> start
* http://localhost:9080/WebTest/Hello.html

#### 서버 실행시 Erorr 발생할 경우
다음과같은 에러를 마주한 경우
> The server cannot be started because one or more of the ports are invalid. Open the server editor and correct the invalid ports.
* solution: 
    * tomcat admin port를 설정해야함
### Wellcome File 수정
* Wellcome file을 수정하는 곳은 2군데 있다. 후자가 우선순위가 높다.
    * Server의 web.xml
    * WebContent/WEB-INF/webxml
* Project Explorer -> Servers -> Tomcat v9.0 Server at localhost-config -> web.xml  
    ```xml
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
    ```
* Project Explorer -> WebTest    -> WebContent -> WEB-INF -> web.xml  
    ```xml
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>default.html</welcome-file>
        <welcome-file>default.htm</welcome-file>
        <welcome-file>default.jsp</welcome-file>
    </welcome-file-list>
    ```
<br/>   

### 웹 어플리케이션 추가 제거
Servers창에서 Tomcat v9.0 Server at localhost 우클릭 -> add and remove -> add로 웹어플리케이션 추가하기


## 메모
* 피연산자 호출스택은 어떻게 동작할까?
* 자바의 기본 정수리터럴은 int이면서 byte나 short에 정수리터럴을 대입할때는 캐스팅하지 않는 것일까?
    * 답 : 
        * `byte`리터럴과 `short`리터럴 이란 것은 없다.
        * 컴파일때 암묵적으로 `int`리터럴은 `byte`타입으로 바뀐다
    * 참고 [Java: No byte or short literals?](https://programming.guide/java/byte-short-literals.html)  
        ```java
        int a = 10; // Compiled well!
        short b = 20; // Compiled Well Too!
        byte c = 30; // Compiled Well Too!
        ```
* XML과 HTML의 관계?
* Welcome File 
    * 첫 페이지
    * welcome file이 설정되어 있으면 요청한리소스는 wellcome file로  response한다.
    * web.xml의 Wellcome file 예시
      ```xml
      <welcome-file-list>
            <welcome-file>index.html</welcome-file>
            <welcome-file>index.htm</welcome-file>
            <welcome-file>index.jsp</welcome-file>
        </welcome-file-list>
      ```
  

