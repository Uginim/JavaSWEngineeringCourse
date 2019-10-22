# What I studied today.
Date : 2019-10-21

## 자바언어의 특징 (출처 - 자바의 정석 3E)
> 1. 운영체제에 독립적이다. 
> 2. 객체지향언어이다.
> 3. 비교적 배우기 쉽다
> 4. 자동 메모리 관리(Garbage Collection)
> 5. 네트워크와 분산처리를 지원한다.
> 6. 멀티쓰레드를 지원한다.
> 7. 동적 로딩(Dynamic Loading)을 지원한다.  
### 1.운영체제에 독립적이다. 
* 자바의 코드는 자바컴파일러에 의해 바이트코드로 변환. 
* 자바프로그램의 실행이란, 자바가상머신(JVM)에서 바이트코드를 실행하는 것. 
* 다른 종류의 운영체지일지라도, JVM이 설치되어 있다면, 각 운영체제에서 소스코드의 변경이 없이 동일한 소스코드를 실행할 수 있다.

### 2.객체제지향 프로그래밍 언어(object-oriented programming language)이다.
순수한 객체지향언어라는 평가됨. 자바는 다음의 특징을 가진다.
* 상속
* 캡슐화
* 다형성  

그 밖에
* 재사용성 
* 유지보수의 용이성

### 3.비교적 배우기 쉽다.
* 자바는 자바가 계승한 언어들(C++, Small talk)의 복잡하고 불필요한 부분을 버렸다.

### 4.자동 메모리 관리(Garbage Collection)
* Garbage collector가 메모리를 관리해줌(반환을 자동으로 해줌)
* C/C++의 `free()`함수나 `delete` 연산자를 사용할 필요가 없다.

### 5.네트워크와 분산처리를 지원한다.
* 제곧내

### 6.멀티쓰레드를 지원한다.
* 원래 multi-thread의 지원은 운영체제에 따라 구현방법/처리방식이 각각다름
* 자바는 관련 API가 제공된다. 
* 시스템에 관계없이 구현가능
* 자바 인터프리터가 scheduling을 담당

### 7.동적로딩(Dynamic Loading)을 지원한다.
#### 동적로딩이란?
> 자바 프로그램은 한 개 혹은 그 이상의 클래스들의 조합으로 실행된다.  
> 그리고 실행 시 모든 클래스 파일들이 한 번에 JVM 메모리에 로딩되지 않고 요청되는 순간 로딩된다.  
> 클래스의 로드 타임에 필요한 다른 클래스들을 동적 로딩하는 것을 로드타임 동적 로딩이라고 한다.  
>   
> 출처 - [자바 동적로딩 이해(델리게이션 모델) - 미래학자 님](https://futurists.tistory.com/43 )

자바는 동적 로딩을 지원하기 때문에 실행 시에 모든 클래스가 변경되어도 전체 애플리케이션을 다시 컴파일 하지 않아도 되며, 애플리케이션의 변경사항이 발생해도 비교적 적은 작업만으로 처리할 수 있는 유연한 애플리케이션을 작성할 수 있다.
<br/>
<br/>

## JVM(Java Virtual Machine)
자바를 실행하기 위한 가상기계
> '가상기계(virtual machine)'는 소프트웨어로 구현된 하드웨어를 뜻하는 넓은 의미의 용어  
> 
> *자바의 정석 3E*
* 자바로 작성된 어플리케이션은 JVM에서만 실행됨
* 완전히 compile된 상태가 아니라, 실행 시에 해석(interpret)되기 때문에 속도가 느림.
* JIT(Just-In-Time)컴파일러 : 바이트 코드(Byte code)를 기계어로 바꿈
* *Write once, run anywhere*
    * 한번 작성하면 어디서든 실행된다.
* JVM명세(The Java Virtual Machine Specification)을 따르면 어떤 벤더든 JVM을 개발 가능
* Dalvik VM은 레지스터 머신(스텍머신이 아님)
    * 독자적인 툴을 이용해 자바 바이트코드를 Dalvik VM용의 레지스터 기반 명령어 코드로 변환 - [Naver D2 JVM Internal](https://d2.naver.com/helloworld/1230)

### JVM의 특징 - [Naver D2 JVM Internal](https://d2.naver.com/helloworld/1230)
* 스택기반의 가상머신 
    * x86 아키텍처 ARM 아키텍처는 레지스터 기반으로 동작
    * JVM은 스택 기반으로 동작
* 심볼릭 레퍼런스
    * 기본 자료형(Primitive data type)을 제외한 모든 타입(클래스와 인터페이스)을 심볼릭 레퍼런스를 통해 참조한다.
    * 심볼릭레퍼런스는 명시적 메모리 주소 기반의 레퍼런스와 다름
* 가비지 컬렉션(garbage collection)
    * 클래스 인스턴스 **생성**: 사용자 코드에 의해 명시적으로 생성
    * 클래스 인스턴스 **파괴**: 자동으로 가비지 컬렉션에 의해 파괴
* 기본 자료형을 명확하게 정의하여 플랫폼 독립성 보장
    * C/C++등의 언어는 플랫폼에 따라 int형의 크기가 바뀜
    * JVM은 기본 자료형을 명확하게 정의
        * 호환성 유지
        * 플랫폼 독립성 보장
* 네트워크 바이트 오더(network byte order)
[Java Conceptual Digram](https://www.oracle.com/ocom/groups/public/@otn/documents/digitalasset/2167990.jpg)

[Java Language and Virtual Machine Specifications](https://docs.oracle.com/javase/specs/index.html)
<br/>
<br/>

## eclipse 팁
* view 중에서 필요한 view가 사라진 경우
    * 다음과 같은 진행을 하면 다시 생겨난다.
    * window - perspective -> reset perspective 
* 프로젝트 백업
    * 프로젝트 저장하기 :
        *  프로젝트 우클릭 -> export -> General -> Archive File -> next -> 대상 지정 -> export 파일명 지정
    * 프로젝트 삭제하기 :
        * 프로젝트 우클릭 -> delete -> disk에서지울지 여부 -> OK
    * 프로젝트 불러오기 :
        *  file -> import -> General -> existing project into workspace -> select archive file (browse) -> 해당파일 선택 -> finish
            *  zip파일도 바로 불러와짐
* view
    * outline - 개요
    * package explorer
        * 페키지 탐색기 
        * 패키지는 소포모양
* 드래그된 블록 복사 
    * `ctrl` + `alt` + `arrow key(위,아래)`
* 실행중 workspace 변경 
    * 메뉴 file -> switch workspace -> 목록에서 workspace 선택
* 주석 단축키
    * `ctrl` + `/` key
* API 문서 보기
    * 보고싶은 클래스 드래그/더블클릭 -> `shift`+`F2`
* debugging 
    * break point 지정 
        * 에디터에서 좌측 line번호 더블클릭
    * 툴바에 벌레 클릭
        * `F6` Key로 Step Over 수행
        * `F5` Key로 Step into 수행
        * `F8` Key로 다음 break point까지
    * 돌아오려면! 
        * 오른쪽에 perspactive icon 중 java 클릭
<br/>
<br/>

## 규칙
* 식별자 원칙
    1. 대소문자가 구분되며, 길이이에는 제한없음
    2. 영문자와 숫자를 혼용하여 사용할 수 있다.
    3. 식별자의 첫 번째 문자로 숫자는 사용불가
    4. 유니코드, 한글, 한자도 변수로 사용가능하다.
    5. 변수명은 보통 소문자로 시작.
    6. 특수문자는 변수명으로 사용할 수 없다.  
    예외적으로 `$` , `_` 는 변수명으로 사용가능
    1. 자바언어의 키워드(예약어)는 식별자로 사용불가
    2. 불린 리터럴(`true`, `false`)와 널 리터럴(`null`)은 식별자로 사용불가

    
* 네이밍 관습
    * 기본: 가독성 높은 이름
        * 목적을 나타내는 이름 붙이기
        * 충분히 긴 이름으로 붙이기 
        * [카멜케이스(카멜표기법)](https://zetawiki.com/wiki/카멜표기법_camelCase,_파스칼표기법_PascalCase)
        * 클래스의 맨 앞글자는 무조건 대문자.
        * 변수와 메서드의 이름의 첫 글자는 항상 소문자.
        * 상수는 모두 대문자    
<br/>
<br/>

## Java Doc 생성하기 
javadoc란? 
* jdk에 포함 된 자동 문서 생성 유틸
* 소스파일에 있는 주석(/** */)을 이용하여 Java API문서와 같은 형식의 문서를 자동으로 생성
* 생성하는 법
    * 메뉴 -> prject-> generate javadoc -> command 지정(설치된 javadoc) -> finish
    * encoding error 발생 시
        * VM option (next 두번 이후)
            * -locale ko_KR -encoding UTF-8 -charset UTF-8 -docencoding UTF-8

### javadoc 예시
* [Collections source](http://www.docjar.net/html/api/java/util/Collections.java.html)
* 수업용 코드 예시(아래)
```java
/**
 * 2019.10.21 Java code example
 * @author Hyeonuk 
 * @version 0.0.1
 * 
 */
public class HelloDoc {
	/**
	 * Sum two input numbers
	 * @param i First integer argument for summing two integer numbers 
	 * @param j Second integer argument for summing two integer numbers
	 * @return Sum of the inputed two number 
	 */
	public static int sum(int i, int j) { // Define a method
		return i + j;
	}
	public static void main(String[] args) {
		int i; int j; // Declare integer variables
		
		char a; // Declare a character variable
		String b; // Declare a string variable
		
		final int ELEVEN = 11; // Declare a constant variable and Initialize a value
//		ELEVEN = 22; // ERROR
		
		i = 1; // until semicolon 
		j = sum(i,ELEVEN); // Call a method
		
		a = '?';
		b = "Hi. Hello";
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(ELEVEN);
		System.out.println(j);
	}

}
```

## JDK 유틸들
|파일명|설명|예시|
|---|---|---|
|javac.exe|자바 컴파일러, 자바소스코드를 바이트코드로 컴파일| javac MyProgram.java|
|java.exe|자바 인터프리터, 컴파일러가 생성한 바이트코드를 해석하고 실행| java MyProgram|
|javap.exe|역어셈블러, 컴파일된 클래스파일을 원래의 소스로 변환| javap MyProgram > MyProgram.java|
|javadoc.exe|자동문서생성기, 소스파일 내 주석(/** */)로 형식이 갖춰진 문서를 자동생성| javadoc MyProgram.java|
|jar.exe|압축프로그램, 클래스파일과 실행에 관련된 파일을 하나의 jar파일로 압축/해제| 압축 할 때: jar cvf MyProgram.java program2.class <br/>압축 풀 때: jar xvf Hello.jar|

## Java's Variables
### 변수의 타입
* 기본형(primitibe type)
    * 논리형 
        * boolean
    * 문자형
        * char
    * 정수형
        * byte
        * short
        * int
        * long
    * 실수형
        * float
        * double
* 참조형(reference type)
### Exmaples
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Variable example  
 * @author Hyeonuk
 *
 */
public class Variable {

	public static void main(String[] args) {
		char charCharacter = 'A';
		char charDecimal = 65; // "'A' character value" is equal to "65 Decimal value";
		char charUnicode = '\u0041';
		
		System.out.println(charCharacter);
		System.out.println(charDecimal);
		System.out.println(charUnicode);
		
		char charHangulJaum = 'ㄱ';
		char charUnicodeHangul = '\u1100';
		
		System.out.println(charHangulJaum);
		System.out.println(charUnicodeHangul);
		
		byte byteDecimal = 127;
		System.out.println(byteDecimal);
//		byte byteDecimal2 = 128; // Type mismatch Error: cannot convert from int to byte
		
	}

}

```
### [Unicode Code Charts](http://www.unicode.org/charts/)
* Unicode consortium 사이트서 찾기
    * Unicode consortium  -> 아래 quick link -> Code Charts
* 한글 로마자 등의 code를 16진수와 함께 확인가능
<br/>
<br/>

## Java's conditional expression
* p 109에 비교연산자 내용
### 연산자의 종류 
* 산술연산자
* 비교연산자
* 대입연산자
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Conditional Expression Example  
 * @author Hyeonuk
 *
 */
public class IfExam2 {

	public static void main(String[] args) {
		int number = 3; // Declare integer variable and initialize
		
		// java's arithmetic operator 
		// +,-,*,/,%(modulo) ...
		
		int dividend = 7;
		int divisor = 3;
		
		int remainder = dividend % divisor; // modulo
		System.out.println("remainder"+dividend+"/"+divisor+"="+remainder);
		//
		
		if(number % 2 == 0) {
			System.out.println("짝수");
		} else {
			System.out.println("홀수");
		}
		boolean isEven = number % 2 == 0;
		System.out.println(isEven);
	}

}

```


### Switch
#### swtich문의 제약조건
1. switch문의 조건식 결과는 정수 또는 문자열이어야 한다.(문자가능. 왜냐면, 얘도 결국 정수)
2. case문의 값은 정수 상수만 가능하며, 증복되지 않아야 한다.

```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Switch statement Example *  
 * @author Hyeonuk
 */
public class SwitchExam1 {
	public static void main(String[] args) {
		int num = (int) (Math.random()*6)+1;// greater than
		System.out.println("num="+ num);
		switch(num) {
		case 1:
			System.out.println("1번");
			break;
		case 2:
			System.out.println("2번");
			break;
		case 3:
			System.out.println("3번");
			break;
		case 4:
			System.out.println("4번");
			break;
		case 5:
			System.out.println("5번");
			break;
		default:
			System.out.println("6번");
		}
		
	}
}

```
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Switch statement Example 2
 * @author Hyeonuk
 */
public class SwitchExam2 {
	public static void main(String[] args) {
		char grade = ' ';
		
		switch(grade) {
		case 'A':
		case 'a':
			System.out.println("우수회원");
			break;
			
		case 'B':
		case 'b':
			System.out.println("일반회원");
			break;
			
		default:
			System.out.println("손님");
		}
	}
}

```

### For
#### exmaples
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Example of "for" loop
 * print number from 1 to 10
 * @author Hyeonuk
 *
 */
public class ForExam1 {

	public static void main(String[] args) {
		// print number from 1 to 10
		
		System.out.println("print number from 1 to 10");
		// for loop
		for(int i = 1 ; i<=10 ; i++) {
			System.out.print(i);
			System.out.print(" ");
		}
		System.out.println("print number from 10 to 1");
		for(int i = 10 ; i>=1 ; i--) {
			System.out.print(i);
			System.out.print(" ");
		}
		System.out.println("====================");
		System.out.println("Sum all numbers from 1 to 10");
		System.out.println("====================");
		
		int sum=0;
		for(int i = 1 ; i<=10 ; i++) {
			sum += i;
		}
		System.out.println("sum ="+sum);
		
		System.out.println("====================");
		System.out.println("Sum odd numbers between 1 and 10");
		System.out.println("====================");
		
		sum=0;
		for(int i = 1 ; i<=10 ; i+=2) {
			sum += i;
		}
		System.out.println("sum ="+sum);
	}

}
```
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Example of "for" loop 
 * print multiplication table
 * @author Hyeonuk
 *
 */
public class ForExam2 {
	public static void main(String[] args) {
		for(int i=2 ; i<=9 ; i++) {
			System.out.println("=============");
			System.out.println(i+"X");
			System.out.println("=============");
			for(int j=1 ; j<=9 ; j++) {
				System.out.println(i + " x " + j +" = " + (i * j));
			}
		}
	}
}

```
<br/>
<br/>
<br/>


## 직접 해보기 
### 1. 정수 입력받아서 짝/홀 판단
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Example  
 * 정수를 입력받아서 짝수 홀수 판단
 * @author Hyeonuk
 *
 */
public class EvenOdd {

	public static void main(String[] args) {		
		// 1) 정수형 변수
		int number;
		// 2) 키보드로부터 값을 입력
		System.out.println("Type a number");
//		number = Integer.parseInt(new Scanner(System.in).nextLine());
		Scanner scanner = new Scanner(System.in);
		String strInput = scanner.nextLine();
		number = Integer.parseInt(strInput);
		// 3) 입력받은 값이 홀수/짝수 판단하여 출력하기 
		if(number%2 == 0)
			System.out.println("It is Even");
		else 
			System.out.println("It is Odd");
		

	}

}
```
### 2.점수를 입력받아서 학점 출력하기
```java
/**
 * 2019.10.21 Java SW Engineering Course
 * Example
 * 점수를 입력받아 학점 출력하기 (다중 if문 사용)
 * 90학점 이상 A학점, 80이상 B, 70이상 C, 60이상 D, 60미만 과락   
 * @author Hyeonuk
 *
 */
public class Grade {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String input = scanner.nextLine();
		int score = Integer.parseInt(input);
		
		if(score >=90) {
			System.out.println("A credit");
		} else if(score >=80) {
			System.out.println("B credit");
		} else if(score >=70) {
			System.out.println("C credit");
		} else if(score >=60) {
			System.out.println("D credit");
		} else {
			System.out.println("failed");
		}		
		

	}

}

```



<br/>
<br/>

## 기타
* 책 수령
    * 자바의 정석 3E - 남궁 성 님
* workspace 리스트 업
    * javaedu : 수업용 실습 
    * javabook : 자바의정석 예제실행용
        * [링크](https://cafe.naver.com/javachobostudy/126659)에서 다운로드 후 예제를 import한다.``
* java의 char 타입에 `''`빈 문자열은 할당할 수 없다. 
    * **`' '`공백아님 헷갈리지 말 것!**
## 궁금한 점
* 동적로딩, 자바 외 다른 언어들에서는? 
* short와 char의 차이는 음수의 유무?
* byte형 끼리의 연산은 왜 오류가 나는가? 자바의정석Ch03_OperatorEx06
    * byte로 형변환하라고 함
    * error 메시지에서 유추할때 연산후 값은 int가 되는듯 
```java
    ...
    byte a = 10; 
    byte b = 20; 
    byte c = a + b; // Error : TypeMismatch : cannot convert from int to byte
    ...
```
* c언어에서는 int값은 운영체제에 따라 달라지는데 java의 타입형은 크기가 고정되어있는가?
    * [Naver D2](https://d2.naver.com/helloworld/1230) - Jvm의 특징 중
* 왜 자바의 System.out.printf() 메소드에서 서식문자 `%n`?
    * [escape statement](https://en.wikipedia.org/wiki/Escape_sequences_in_C) 로 `\n`이 이미 있는데 왜?
* p4에 "... JIT컴파일러와 Hotspot과 같은 신기술의 도입 ..."이라는 문장이 있음  
JIT도 나중에 도입되었다는 뜻인가?
* Hotspot은 뭘까?
    * [Wikipedia - Hotspot](https://en.wikipedia.org/wiki/HotSpot)
* 자바스크립트에서 상수(constant)가 가능한가?
    * 자료 조사 : 
        * [[자바스크립트] 데이터 타입 상수란? 상수의 선언 및 특징](https://webisfree.com/2016-06-01/[자바스크립트]-데이터-타입-상수란-상수의-선언-및-특징)
* java GC와 javascript GC는 어떻게 다르지?

## 용어
* 예약어
* 변수,상수,리터럴
    * variable(변수) : 하나의 값을 저장하기 위한 공간
    * constant(상수) : 값을 한번만 저장할 수 있는 공간
        * 한번 선언 및 초기화 하면 readonly
    * literal(리터럴) : 그 자체로 값을 의미하는 것 
* 식별자
    * 클래스, 변수, 상수, 메소드 등에 붙이는 이름
* javadoc tag :
    * javadoc 주석에서 값을 지정하는 어노테이션 
* 변수(Variable)
    * 하나의 값을 저장할 수 있는 메모리 상의 공간
* 영문 용어 
    * 제수 : **divisor**
    * 피제수 : **dividend**
    * 몫 : **quotient**
    * 짝수 : **even**
    * 홀수 : **odd**
    * 나머지 : **remainder**
    * 나머지연산 : **modulo**
    * 산술 연산자 : **arithmetic operator**
* [인코딩(encoding)](https://www.techopedia.com/definition/948/encoding)
### 수학 용어
$$ \frac{a}{b}=c$$
위 식에서 
* a : **피제수**
* b : **제수**
* c : **몫**

## 소감
* 예제 중에 ch04의 FlowEx07.java 가위바위보 판정 로직 되게 독특  
* grater then이 아니라 **greater than**
* 아뭐였지... 아침에 생각한거... 대중적이고 쉬운 프론트엔드 프로젝트... 
grid? calendar ?