# What I studied today.
Date : 2019-10-18

## 수업 환경 설정 
1. 크롬 설치   
2. 자바 설치
    1. Oracle -> Download -> Java -> jdk -> Java SE 8u231
    2. D:\\JAVASTUDY\download 경로 생성
    3. 혹은 탐색기-> 네트워크(우클릭) -> 네트워크  \\192.168.0.121\공유폴더
    4. 더블클릭 -> 실행 -> 다음 -> ... -> 다음 -> close
    - 설치 확인
      1. windows key -> cmd -> java 입력
      2. javac 입력
      3. 둘 다 명령어 먹는지 확인
      4. 안되면 
         1. `windowkey` + `pause` => 시스템 창(꿀티프)
         2. 고급시스템 설정
         3. 환경변수
            * 윗칸 : 사용자만
            * 밑칸 : 모든사용자(시스템)
            1. (시스템)환경변수 JAVA_HOME 만들기 
                * "C:\Program Files\Java\jdk1.8.0_201\bin"  
                &nbsp;&nbsp;bin까지 함
                * 보통 [제타위키 환경변수설정](https://zetawiki.com/wiki/윈도우_JAVA_HOME_환경변수_설정)대로 ""C:\Program Files\Java\jdk1.8.0_201"까지 함.
3. VSCODE 설치
    1. 설치
    2. extension 설치
        * 설치 방법
            1. `ctrl` + `shift` + `X` 
            2. 필요한 패키지 명 검색
            3. `install`
        1. live server 
            * Author : Ritwick Dey
            * 작성한 웹문서를 확인할 수 있음 
        2. Prettier - Code formatter 설치
            * Author : Esben Petersen
            * HTML포맷 제공
    3. html 폴더 작성 후 기본 예제 작성
        1. JAVASTUDY에 html폴더 생성
        2. 폴더 내에 Hello.html 생성
        3. `!`입력 이후 `tab` 하면 템플릿이 자동으로 생성된다.
        4. 창을 우클릭해서 `open with live server`하면 화면이 표시됨
4. 반디집 설치
    1. sts 압축푸는데 씀
5. STS (Spring Tool Shoot) 4
    1. 설치
        1. 구글에서 STS검색
        2. Spring tools 4 클릭
        3. Download 클릭
        4. JAVASTUDY폴더에 javaedu 폴더를 생성한다
        5. workspace는 앞서 생성한 javaedu
    2. 설정
        1. 인코딩 설정
            1. windows -> preperence -> encoding 검색 -> content type -> text -> default endoing에  "UTF-8"입력 -> apply
               1. workspace-> text file encoding -> other-> UTF-8 -> apply
            2. css Files-> encoding -> ISO 10646/UTF-8
            3. HTML Files-> encoding -> ISO 10646/UTF-8
            4. JSP Files-> encoding -> ISO 10646/UTF-8
        2. 글꼴 및 폰트 변경
            1. General -> Appearance -> colors and font -> basic -> text font -> edit
    3. 프로젝트 생성
       1. FILE -> New -> JavaProject -> 프로젝트 이름지정 -> next or finish
       2. src 우클릭 -> new -> class -> 클래스이름
          1. main method 제너레이터 체크하면 Main method가 자동으로 생성된다. 
6. 오라클 설치 (2019-10-24에 추가됨)
    1. oracle download -> 11g -> 맨 밑에 express edition 가운데것 다운로드
7. Tomcat 설치 (2019-10-24에 추가됨)
    1. tomcat home -> download tomcat9 -> 밑에 windows service installer
    2. configuration
       1. HTTP/1.1 Connector : `9080`
       2. AJP/1.3 Connector Port : `9009`
       3. username : `admin`
       4. password : `admin1234`
    3. 톰캣 설치경로 
       1. jvm경로는 jdk경로로 설정
       2. "D:\JAVASTUDY\tomcat9"
    4. 서버 포트 바꾸기
       1. tomcat9/conf/server.xml
    5. 서버외부에서 접속이 되지 않을 시
       1. windows7인 경우
       2. 시작 -> 고급 보안이 포함된 windows 방화벽 -> 좌측 인바운드 규칙 -> 우측 새 규칙 -> 포트 -> 특정 로컬 포트에 `9080` 입력 -> "계속" 다음 -> 이름 지정 -> 마침
8. Notepad++ 설치 
9. 기타 
    * 보호된 운영체제 파일 숨기기(권장) **해제**
    * 숨김 파일, 폴더 및 드라이브 표시 **선택**
    * 알려진 파일 형식의 파일 확장자 숨기기 **해제**
<br/>
<br/>
<br/>
   



# Java
## 자바 가상머신(JVM-Java Vitual Machine)
<br/>

## 자바 바이트 코드를 실행하는자바 가상 기계
* 각자 다른 플랫폼(운영체제)에도 동일한 자바 실행 환경을 제공
* WORA(Write Once Run Anywhere) 한번 작성되어 컴파일된 바이트코드는 어느 jvm이든 실행가능
* 자바 가상 기계 자체는 플랫폼에 종속적
    * 자바 가상 기계 개발 및 공급은 오라클 외 IBM, MS, Google등 다양한 회사에서 제작 공급
* 메모리관리기능(Garbage Collection)
<br/>
<br/>

### 자바 프로그램 수행 절차  
컴파일러(javac.exe)가 소스코드(.java)를 바이트코드(.class)로 생성한다.
<br/>

### /** 주석 */ HTML 문서화 주석처리  
`JAVADOC hello.java`
<br/>
<br/>

## java code 예제 
* 자바는 대소문자 구분 
```java
/**
    @author Hyeonuk
    @since 1.0.0
*/
public class Hello {

    public static void main(String[] args) {

        System.out.println("Hello World");

    }
}
```
* 이클립스에서 프로젝트 생성예시
    * javaprj 프로젝트 생성
    * Hello클레스를 생성함
        * 작성 후 저장하면 자동으로 class 파일 생성됨

```java
package javaprj;

public class Hello {
	
	public static void main(String[] args) {
		System.out.println("Hello World!");
	}
	
}

```
<br/>
<br/>
<br/>

## Eclipse Tips
### 들여쓰기
소스코드 짤 때 들여쓰기 내어쓰기는 중요!
* 들여쓰기 : `tab`키를 누른다. 
* 내어쓰기 : `shift` + `tab`키를 누른다.
* 들여쓰기 칸 수 설정법
  * window -> preference -> General -> Editor -> Text Editor -> displayed tab width -> 숫자 바꾸기
  * preference -> java -> Code Style -> Formatter -> edit -> Indentation -> Tab size 
<br/>
<br/>  

### 소스파일 이름 바꾸기
다음 방법으로 해야 알아서 소스코드도 바뀐다. 
* 소스코드에서 우클릭 -> Refactor -> 이름 바꾸기 -> finish
<br/>
<br/>

### System.out.println() 자동완성
`sysout`타이핑 후 `ctrl`+`space` 
```java
    // 얘가
    sysout
    // 아래처럼 변한다.
    System.out.println()
```
<br/>
<br/>  

### 드래그된 코드 블럭 위아래로 옮기기 
`alt` + `arrow키`
<br/>
<br/>

### 자바프로그램의 기본구조
```java
/*
* 소스 파일 : Hello.java
*/
public class Hello { // class

	public static int sum(int n , int m) { // method
		return n + m;
	}
	// start a context from the main() method
	public static void main(String[] args) { 
		int i = 20;
		int s;
		char a;
		
		s = sum(i,10);
		a = '?';
		System.out.println(a); // Call a method named "sum()"
		System.out.println("Hello"); // Print a character '?'
		System.out.println(s); // Print a "s" variable that is an integer
	}
}

```
<br/>

### 변수 예제
```java
public class Test {
	public static void main(String[] args) {
		System.out.println("Hello");

		// 변수 란 하나의 값을 저장할 수 있는 기억공간
		int i = 10;
		int j = 20;
		

		i = 30;
		j = 40;
		
		i = 50;
		j = 60;
		
		int sum = i + j;
		System.out.println(sum);
//		i = 3.14; // Encounter a Type mismatch error
		double x;
		x = 3.14;
		System.out.println(x);
		System.out.println("============");
		
		char c = '*';

		int num1 = 10;
		int num2 = 3;
//		int result;
		double result;
		
//		result = num1 / num2; // result == 3.0
		result = num1 / (double) num2; // result == 3.3333
		
		System.out.println(result);
		System.out.println("============");
		
		double num3 = 3;
		System.out.println(num3);
		System.out.println("============");
		
		boolean value = false;
		boolean value2 = true;
		
		if(value) {
			System.out.println("참");
		} else {
			System.out.println("거짓");
		}
		
		
		
	}
}

```


<br/>
<br/>
<br/>

## 정리
1. JDK 설치
2. STS 설치
3. VSCode 설치
4. JAVA Project 및 Source(.java) 생성, 컴파일(.class), 실행(java.exe)

## 숙제
1. 집에서 복습
2. 오라클 계정 만들어오기 
    * 보유 중
    1. Oracle은 11g 사용할 것임


<br/>
<br/>
<br/>

### 궁금증
* 자바 바이트코드 실행과정은 어떻게 되나? class 
* main method는 왜 static인가?
* express middleware는? router는?
* 자바의 강제 타입변환은 어떤 시점에 일어날까?
* 프로그래머스 언어강의가 있네?
* 타입은 왜 나눠져 있는것인가?
