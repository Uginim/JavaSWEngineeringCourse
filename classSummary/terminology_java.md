# 자바 용어 정리
## 목차
* [변수](#변수)
    * [1. 변수](#1.&nbsp;변수)
    * [2. 상수](#2.&nbsp;상수)
    * [3. 리터럴](#3.&nbsp;리터럴)
    * [4. 타입 ](#4.&nbsp;타입&nbsp;:&nbsp;변수에&nbsp;저장될&nbsp;데이터의의&nbsp;종류,&nbsp;데이터의&nbsp;범위)
    * [5. 형변환](#5.&nbsp;형변환)
    * [6. 강제형변환시 값의 손실원리](#6.&nbsp;강제형변환시&nbsp;값의&nbsp;손실원리)
    * [7. 오버플로우](#7.&nbsp;오버플로우&nbsp;:&nbsp;기본타입에서&nbsp;값의&nbsp;범위를&nbsp;초과하면&nbsp;순회함)
    * [8. 정수를 실수로 변환할 때 float타입보다는 double타입을 사용한다.](#8.&nbsp;정수를&nbsp;실수로&nbsp;변환할&nbsp;때&nbsp;float타입보다는&nbsp;double타입을&nbsp;사용한다.)
    * [9. 변수의 사용범위(생명주기)](#9.&nbsp;변수의&nbsp;사용범위(생명주기))
* [연산자](#연산자)
    * [1. 단일부호 연산자](#1.&nbsp;단일부호&nbsp;연산자)
    * [2. 증감연산자(++, --)](#2.&nbsp;증감연산자(++,&nbsp;--))     
    * [3. 논리부정연산자 (`!`)](#3.&nbsp;논리부정연산자&nbsp;(`!`))     
    * [4. 논리연산자](#4.&nbsp;논리연산자)     
    * [5. 산술연산자 ( +, -, \*, /, %)](#5.&nbsp;산술연산자&nbsp;(&nbsp;+,&nbsp;-,&nbsp;*,&nbsp;/,&nbsp;))     
    * [6. 비교연산자 ( `>`, `<`, `>=`, `<=`, `==`, `!=` )](#6.&nbsp;비교연산자&nbsp;(&nbsp;`>`,&nbsp;`<`,&nbsp;`>=`,&nbsp;`<=`,&nbsp;`==`,&nbsp;`!=`&nbsp;같지&nbsp;않다))     
    * [7. 대입연산자](#7.&nbsp;대입연산자)     
    * [8. 비트연산자](#8.&nbsp;비트연산자)     
    * [9. 3항연산자](#9.&nbsp;3항연산자)     
    * [10. 문자열 연결연산자](#10.&nbsp;문자열&nbsp;연결연산자)     
    * [11. 연산자 우선순위](#11.&nbsp;연산자&nbsp;우선순위)     
    * [12. 타입자동변환](#12.&nbsp;타입자동변환)     
    * [13. 기본 리터럴 타입](#13.&nbsp;기본&nbsp;리터럴&nbsp;타입)     
    * [14. 타입변환](#14.&nbsp;타입변환)     
    * [15. Overflow](#15.&nbsp;Overflow)         
* [객체(Object)](#객체(Object))
    * [1. 객체란?](#1.&nbsp;객체란?)
    * [2. 생성자 메소드(constructor)](#2.&nbsp;생성자&nbsp;메소드(constructor))
    * [3. 오버로딩(overloading,과적)](#3.&nbsp;오버로딩(overloading,과적))
    * [4. `this`](#4.&nbsp;`this`)
    * [5. `this()`](#5.&nbsp;`this()`)
    * [6. getter 메소드, setter 메소드](#6.&nbsp;getter&nbsp;메소드,&nbsp;setter&nbsp;메소드)
    * [7. `Object.toString()`](#7.&nbsp;`Object.toString()`)
    * [8. `static`](#8.&nbsp;`static`)
    * [9. 클래스 멤버](#9&nbsp;클래스&nbsp;멤버)
    * [10. 초기화블럭](#10.&nbsp;초기화블럭)
* [상속](#상속)
    * [1. 상속](#1.&nbsp;상속)
    * [2. 재정의](#2.&nbsp;재정의)
    * [3. `final` 키워드](#3.&nbsp;`final`&nbsp;키워드)
    * [4. 접근제한자 (access modifier)](#4.&nbsp;접근제한자&nbsp;(access&nbsp;modifier))
    * [5. `super` & `this`](#5.&nbsp;`super`&nbsp;&&nbsp;`this`)
    * [6. 싱글톤 패턴 ](#6.&nbsp;싱글톤&nbsp;패턴&nbsp;:&nbsp;인스턴스를&nbsp;하나만&nbsp;만들&nbsp;수&nbsp;있는&nbsp;클래스)
    * [7. 다형성(polymorphism)](#7.&nbsp;다형성(polymorphism))
    * [8. 참조변수의 형변환](#8.&nbsp;참조변수의&nbsp;형변환)
    * [9. instanceof](#9.&nbsp;instanceof&nbsp;:)
    * [10. 조상타입에 자식 타입을 대입했을 경우](#10.&nbsp;조상타입에&nbsp;자식&nbsp;타입을&nbsp;대입했을&nbsp;경우)
    * [11. 추상메소드(abstract method)](#11.&nbsp;추상메소드(abstract&nbsp;method))
    * [12. 추상클래스(abstract class)](#12.&nbsp;추상클래스(abstract&nbsp;class))
    * [13. 인터페이스(interface)](#13.&nbsp;인터페이스(interface))
    * [14. 익명클래스 (annonymous class)](#14.&nbsp;익명클래스&nbsp;(annonymous&nbsp;class))
* [예외처리](#예외처리)
    * [예외처리(Exception Handling)](#예외처리(Exception&nbsp;Handling))
* [제너릭(Generic) 용어 정리](#제너릭(Generic)&nbsp;용어&nbsp;정리)
    * [제너릭(Generic)](#제너릭(Generic))
    * [제너릭 타입 파라미터 제한](#제너릭&nbsp;타입&nbsp;파라미터&nbsp;제한)
    * [제너릭 메소드](#제너릭&nbsp;메소드)
    * [제너릭 메서드 타입 파라미터 제한](#제너릭&nbsp;메서드&nbsp;타입&nbsp;파라미터&nbsp;제한)
    * [와일드 카드 타입](#와일드&nbsp;카드&nbsp;타입)
* [스레드](#스레드)
    * [1. 멀티태스킹(multi tasking)](#1.&nbsp;멀티태스킹(multi&nbsp;tasking))
    * [2. 프로세스의 종료](#2.&nbsp;프로세스의&nbsp;종료)
    * [3. 스레드 생성 방법](#3.&nbsp;스레드&nbsp;생성&nbsp;방법)
    * [4. 동시성과 병렬성](#4.&nbsp;동시성과&nbsp;병렬성)
    * [5. `run()` 메소드, `start()`메소드](#5.&nbsp;스레드&nbsp;실행시&nbsp;run()&nbsp;메소드를&nbsp;호출하지&nbsp;않고&nbsp;start()메소드를&nbsp;호출하는&nbsp;이유)
    * [6. 동기화 메소드와 동기화 블록](#6.&nbsp;동기화&nbsp;메소드와&nbsp;동기화&nbsp;블록)
* [컬렉션](#컬렉션)
    * [1. 컬렉션(Colllection)](#1.&nbsp;컬렉션(Colllection))
    * [2. 객체 해시코드](#2.&nbsp;객체&nbsp;해시코드)
    * [3. 논리적 동등이란?](#3.&nbsp;논리적&nbsp;동등이란?)
## 변수
### 1. 변수
- 값을 저장하려고 메모리에 마련한 공간
> 하나의 값을 저장하기 위한 메모리 공간

### 2. 상수
* 처음에 한번 메모리에 저장되어 변경되지 않는 값
* 고정된 변수
> 한번만 값을 저장할 수 있는 메모리 공간.
### 3. 리터럴
* 순수값 그자체 

* 다음 코드에서 구분해보기    
    ```java
    int score = 100;
    score = 150;

    char ch = 'A';
    String name = "홍길동";

    final int MAX = 200;
    // MAX = 250; // 에러 발생

    final int MAX2;
    MAX2 = 200; // 됨 (한 번)
    // MAX2 = 250; // 안됨
    ```
    * 변수 : socre, ch, name
    * 상수 : MAX
    * 리터럴 : 100, 'A', "홍길동", 200
### 4. 타입 : 변수에 저장될 데이터의의 종류, 데이터의 범위
* 기본형 : 리터럴을 값으로 가짐
    * 정수형(byte, short, char, int, long) 
    * 실수형(float, double) 
    * 논리형(boolean)
* 참조형 : 객체의 주소값(heap메모리상의 주소값)을 가짐
### 5. 형변환
* 자동형변환(promotion) : 
    * 작은타입을 큰타입으로 대입시 자동 형변환이 일어난다
* 강제형변환 : 
    * 강제형변환 : 큰타입을 작은타입에 대입시 (타입) 캐스팅연산자 사용
        * 단, 값의 손실이 발생하지 않을때 의미있음
        * 따라서 값의 손실이 발생하면 계산하지 않도록 하는 로직이 필요할 수 있다.
### 6. 강제형변환시 값의 손실원리  
* 큰 타입의 바이트수를 작은바이트로 분리하고 난 후  
    제일 오른쪽에서 부터 작은바이트만을 취하기 때문.(오버플로우)
### 7. 오버플로우 : 기본타입에서 값의 범위를 초과하면 순회함
* ex)
    ```java
    byte num = 127;
    num + 1 = -128;
    ```
### 8. 정수를 실수로 변환할 때 float타입보다는 double타입을 사용한다.
* double타입의 정밀도가 float타입 정밀도의 2배임
### 9. 변수의 사용범위(생명주기)
* 변수가 선언된 블럭범위 중괄호가 시작되어서(`{`) 중괄호가 끝나는 범위(`}`)
* 변수를 선언하고 사용을 안하면 Warning이 뜸
* scope 밖에서 사용하려하면 컴파일 Error발생
    > [변수명] cannot be resolved to a variable   

<br><br><br>

## 연산자
### 1. 단일부호 연산자
* '`-`'(부호반전) 와 '`+`'(부호유지)
    * int 보다 **작은 타입**의 값과의 연산결과를 `int`로 바꾼다.
```java
package com.kh.operator;
/**
 * 2019.10.25 Java SW Engineering Course
 * 단일부호 연산자( +, - )
 * @author Hyeonuk
 */
public class SignOperatorExam {
	public static void main(String[] args) {
		int x = -100;
		int result1 = +x;
		int result2 = -x;
		System.out.println("result1 = " + result1);
		System.out.println("result2 = " + result2);
		
		short s = 100; // 2byte, 1byte == 8bit
//		short result3 = -s; // => Type Mismatch Error 
		/* 
         * int 보다 작은 타입의 연산의 결과는 int로 바뀜
		 * 아래와 같이 형변환을 해주어야함 
		 */
		short result3 = (short)-s;
	}
}
```
### 2. 증감연산자(++, --)
* `++` (1증가),  `--` (1감소)
* `prefix`(전위) , `postfix`(후위)
    * `++x` (전위증가연산자): 증가 후 연산 참여
    * `x--` (후위감소연산자): 연산 참여 후 증감
    * 단독으로 사용 시 결과는 동일        
```java
package com.kh.operator;
/**
 * 2019.10.25 Java SW Engineering Course
 * 증감연산자( ++, -- )
 * @author Hyeonuk
 */
public class IncreaseDecreaseOperator {
	/**
	 * 구분선 추가 
	 */
	public static void seperator() {
		System.out.println("---------------------");
	}
	public static void main(String[] args) {
		int x = 10;
		int y = 10;
		int z;		
		// 증감연산자 단독사용
		x++;
		++x;
		System.out.println("x=" + x);		
		y++;
		++y;
		System.out.println("y=" + y);
		seperator();
		
		z = ++x;        // x=13, y=12, z=13 		
		z = x++; 	    // x=14, y=12, z=13
		z = ++x + y++;  // x=15, y=13, z=27 
		System.out.println("z=" + z); 		
	}
}

```
### 3. 논리부정연산자 (`!`)
* boolean값을 뒤집음
    * `!true` => `false`
    * `!false` => `true`
### 4. 논리연산자
* `&&` 
    * 논리곱(AND), 피연산자가 **모두** `true`이면 `true`, **나머지**는 `false`
* `&&`
    * 논리합(OR), 피연산자가 **모두** `false`일때만 `false` **나머지** `true`
* `^`
    * 배타적 논리합(XOR), 피연산자가 **다르면** `true`, **동일**하면 `false`
* `&` [(비트연산자 아님)](https://docs.oracle.com/javase/specs/jls/se8/html/jls-15.html#jls-15.22.2) 
    * 논리곱(AND) **쇼트서킷을 안함**
* `|` [(비트연산자 아님)](https://docs.oracle.com/javase/specs/jls/se8/html/jls-15.html#jls-15.22.2)
    * 논리곱(OR) **쇼트서킷을 안함**
* 쇼트서킷(short circuit)
    ```java
        int x = 5;
        x % 2 == 0 && x % 3 == 0    // '&&' 앞까지만 연산(쇼트서킷)
        x % 2 == 0 & x % 3 == 0     // '&' 이후까지 연산
    ```
* 위의 `^`, `|`, `&`는 비트연산자가 아님!!
    * 피연산자에 따라 달라짐
### 5. 산술연산자 ( +, -, *, /, %)
* `%` 나머지 연산시 사용
### 6. 비교연산자 ( `>`, `<`, `>=`, `<=`, `==`, `!=` 같지 않다)
* `instanceof`
    * 객체 상속과 관련해서 다형성에서 다루어지는 연산자
    * 객체 타입을 판단할 때 사용
### 7. 대입연산자
* 산술연산 
    * `=`, `+=`, `-=`, `*=`, `/=`,  
* 비트연산 
    * `&=`, `|=`, `^=`, `<<=`, `>>=` `>>>=` 
### 8. 비트연산자
* `&`,`|`,`^`,`~`
    * 변수내 각 bit의 자리수 별로 계산됨
    * 2항연산
        * `&` (bit곱)
            * 비교하는 자리의 값이 둘다 `1`이면 `1` 나머지 `0`
        * `|` (bit합)
            * 비교하는 자리의 값이 둘다 `0`이면 `0` 나머지 `1`
        * `^` (베타적비트합)
            * 비교하는 자릿수의 값이 다르면 `1` 같으면 `0`
    * 단항연산
        * `~` Tilde연산
            * 비트 반전 (`0`은 `1`로, `1`은 `0`으로, **1의 보수** )
* 쉬프트 연산자
    * `<<`
        * **왼쪽**으로 오른쪽피연산자 만큼 이동 
        * 새로 생긴 칸은 0으로 채움
    * `>>`
        * **오른쪽**으로 오른쪽피연산자 만큼 이동
        * 새로 생긴 칸은 부호 비트로 채움
    * `>>>`
        * **오른쪽**으로 오른쪽피연산자 만큼 이동
        * 대신 무조건 `0`으로 채움
        * 3개짜리 쉬프트연산자는 오른쪽방향만 있다! [링크](https://docs.oracle.com/javase/specs/jls/se8/html/jls-15.html#jls-15.19)
### 9. 3항연산자
* `(조건식) ? 수식1 : 수식2;`
* 조건식이 참이면 `수식1` 거짓이면 `수식2`
* 예시
    ```java
    package com.kh.operator;
    /**
    * 2019.10.25 Java SW Engineering Course 
    * 3항 연산자 (조건식) ? 수식1 : 수식 2 
    * @author Hyeonuk
    */
    public class ConditionalOperator {
        public static void main(String[] args) {
            int score = 95;    
            // score = 65;
            char grade = (score > 90) ? 'A' : 'B';
            System.out.println("grade="+grade);
            
            grade = (score > 90) ? 'A' : (score > 80)? 'B': 'C';
            System.out.println("grade="+grade);
            
            grade = (score > 90) ? 'A' 
                                    : (score > 80)? 'B'
                                    : (score > 70)? 'C'
                                    : 'D';
            System.out.println("grade="+grade);
        }
    }
    ```
### 10. 문자열 연결연산자
* `+`
    * 피연산자가 문자열이면 문자열을 연결해주는 연산자
    ```java
    System.out.println("jdk"+8.0); //"jdk8.0"
    ```
### 11. 연산자 우선순위
* 이항연산에서 왼쪽에서 오른쪽
* `괄호` >> `단항(후위 제외)` >> `산술` >> `비교` >> `논리` >> `대입` >> `후위단항`
* 예시
    ```java
    int num1 = 6;
    boolean result = false;
    
    result  = num1 % 3 == 0 && ++num1 % 2 == 0;
    ```
* 참고해보기
    * [자바의 연산자 및 연산자 우선순위](https://toma0912.tistory.com/66)
### 12. 타입자동변환
* 타입자동변환의 조건
    * 연산을 수행 시 피연산자의 타입이 다를 때 모든 연산자의 타입을 동일하게 맞춤
    * 피연산자중 가장큰타입으로 맞추고 연산이 수행됨.
    * 단, `int`타입 보다 작은 타입의 피연산자들을 연산하면, 각각 `int`타입으로 바꾸고 결과도 `int`타입이 됨
        * 근데 왜 단항연산자 중 단일부호 연산자는 왜?
### 13. 기본 리터럴 타입
* 기본 **정수 리터럴** 타입은 `int`
* 기본 **실수 리터럴** 타입은 `double`
* `long` 타입의 값 뒤에는 '`l`','`L`'
* `float` 타입의 값 뒤에는 '`F`', '`f`'
### 14. 타입변환
* 자동 형변환 : 피연산자간 다른 타입을 같은 타입으로 맞춰줌(가장큰)
* 강제 형변환 : 큰 타입의 값을 작은 타입에 저장
    * 형변환 연산자 `()`
        * 큰타입을 작은타입으로 변경.
### 15. Overflow
* 변수가 타입의 범위를 넘어가면 컴파일러는 오류를 뱉지 않고 Overflow가 일어난다.
* 발생 이유 
    * 변수의 표현 범위를 넘어가면 변수가 가진 bit까지의 값만 남긴다.
* 예시
    ```java
    package com.kh.operator;
    /**
    * 2019.10.25 Java SW Engineering Course
    * Overflow 연습
    * @author Hyeonuk
    */
    public class Overflower {
        /** 
        * @param num distinguished if it will overflowed 
        * @return if num is 127 or -128 return true
        */
        public static boolean isOverflow(byte num) {
            boolean result = false;
            if(num >= Byte.MAX_VALUE || num <= Byte.MIN_VALUE) {
                System.out.println("오버플로 발생 경고!");
                result = true;
            }
            return result;
        }
        public static void main(String[] args) {
            
            byte num = 125; // -128 ~ 127
            
            // 오버플로우 발생
            for(int i = 0 ; i < 5 ; i++) {			
                System.out.println("num = " + ++num);
            }		
            System.out.println("=-------------=");
            num = -125;
            for(int i = 0 ; i < 5 ; i++) {
                System.out.println("num = " + --num);
            }		
            System.out.println("=-------------=");
            num = 124;
            for(int i = 0 ; i < 5 ; i++) {			
                System.out.println("num = " + ++num);			
                if(isOverflow(num)) {				
                    break;
                } 
            }
        }
    }    
    ```
* 출력 결과 
    ```
    num = 126
    num = 127
    num = -128
    num = -127
    num = -126
    =-------------=
    num = -126
    num = -127
    num = -128
    num = 127
    num = 126
    =-------------=
    num = 125
    num = 126
    num = 127
    오버플로 발생 경고!
    ```
<br/>


## 객체(Object)
### 1. 객체란?
#### 1.1 현실세계의 객체
* 물리적으로 존재하는 것(사람,자동차 등)
* 추상적으로 존재하는 것(회사, 날짜, 도덕, 관념, 상상 등)
#### 1.2 인스턴스와 객체
 * 현실세계의 객체를 추상화(속성, 행위)하여  
    만든 클래스(멤버필드,멤버메소드)를  
    인스턴스화(new, 힙 메모리에 생성)한 객체(인스턴스)
* 하나하나를 얘기할 때는 인스턴스 뭉뚱그려 이야기할 때는 Object
#### 1.3 클래스
* 자바에서 객체지향 프로그래밍의 최소 단위
* 가상세계의 객체를 만드는 설계도
* 멤버필드만으로도 구성될 수 있다.
* 멤버메소드만으로도 구성될 수 있다.
#### 1.4 객체지향 프로그래밍
* 부품 객체(클래스)를 만들고 이것들을 하나씩 조합해  
    완성된 프로그래밍으로 만드는 기법
### 2. 생성자 메소드(constructor)
* 용도 : 객체를 초기화 하기위해 상요되는 메소드
* 특징 : 
    * 생성자 이름은 클래스 이름과 동일
    * 생성자 이름앞에 리턴 타입이 없다.
    * 디폴트 생성자(매개변수가 없고 바디에 실행문이 없는 생성자)는   
        프로그래머가 구현하지 않더라도 컴파일러가 자동 추가해준다.
        * 프로그래머가 만든 생성자가 하나라도 존재하면 컴파일러는   
            디폴트 생성자를 만들지 않는다.
### 3. 오버로딩(overloading,과적)
* 종류 : 생성자 오버로딩, 메소드 오버로딩
* 의미 : 동일한 이름을 가진 생성자나 메소드를 여러개 선언가능하다.  
            단, 매개변수가(갯수, 타입)는 달라야한다.
#### 3.1 System 클래스
* Obejct클래스를 상속받음
* out 멤버필드
    * PrintStream이라는 클래스 참조 변수
        * PrintStream 클래스
            * `println()` 메소드
                * 오버로딩으로 다양한 타입의 매개변수를 받음
                * `println()`의 매개변수가 참조변수일 경우 해당 매개변수의 `Object.toString()`메소드를 호출해 결과 문자열을 준다.
#### 3.2 final 키워드 
* 변수 앞의 `final`은 상수를 만든다.
* class 앞의 `final`은 더이상 부모클래스가 되지않는다(자식 클래스를 갖지않는다)는 의미
#### 3.3 Object 클래스
* 모든 클래스의 조상
* 상속 
    * 기존 클래스를 재사용 하여 새로운 클래스를 작성
    * 따라서 모든 객체에서 Object클래스의 멤버를 사용할 수 있다.
        * `toString()`
            * 객체를 문자로 변환해서 결과로 돌려줌
#### 3.4 `System.out.println()` 메소드
* 매개값이 참조변수면 내부적으로 Object.toString() 호출
```java
Person p1 = new Person();
// 매개값이 참조변수면 내부적으로 Object.toString() 호출
System.out.println(p1);
System.out.println(p1.toString()); // 결과 같음
```
#### 3.5 컴파일러가 자동으로 추가해주는 코드 
* java.lang 패키지를 자동 import
* 디폴트 생성자
* extends Object
```java
import java.lang.*;
public class Person extends Object {
	public Person() { }	
}
```
#### Annotation
* 어노테이션: 컴파일러에게 특별한 의미 부여
    * `@Override` 
        * 부모의 메소드를 재정의해서 사용할 때 메소드 선언부를
            문법적으로 채크하여  선언부가 다르면 오류를 냄.
        * 프로그래머가 실수로 오버라이드할 메소드명에 오타를 내는것을 방지
            * 해당 메소드가 부모클래스에 존재하지않으면 오류
```java
@Override 
public String toString() {            
    return super.toString();
}
```

### 4. `this`
* 의미 : 객체 자기 자신
* 용도 :
    * 멤버필드와 생성자 매개변수, 멤버 메소드의 매개변수가 가 동일할 때 멤버필드와 구분하기위해 사용
* `super`
    * 부모 클래스의 멤버들을 접근할 때 사용
### 5. `this()`
* 의미 : 개체 자기 자신의 생성자를 호출
* 용도 : 이미 존재하는 생성자를 재사용(코드의 중복 방지)
    
### 6. getter 메소드, setter 메소드
* private로 선언된 멤버필드의 값을 읽기, 쓰기 용도로 사용됨
* 멤버필드를 캡슐화하는 방법으로 사용됨 
    * 은닉화?
* 유효성 체크로직이 포함될 수 있음.

### 7. `Object.toString()` 
* 현 객체의 상태를 문자열로 표현하는 용도로 사용된다.
* `패키지가 포함된 클래스명` + `@` + `주소값(16진수)`
* 자식 클래스에서 재정의해서 객체상태를 표현하는데 사용된다.
    * 주로 멤버필드의 현재값 확인용도
#### 7.1 자동생성 툴
* 생성자
    * source -> generate constructor using field
* getter, setter    
    * source -> generate getters and stters 
* toString()
    * source -> generate toString()
#### 7.2 `super()`
* 부모클래스의 생성자 호출
* 기본생성자에 생략된 문장
    * 부모 객체가 만들어지고나서 자식 객체가 만들어짐
        ```java
        class Car {            
            pubilc Car() {
                super(); // 생략됨
            }
        }
        ```
### 8. `static`
* 클래스에 고정된 필드와 메소드(정적필드, 정적메소드)
* 정적멤버는 힙메모리에 생성된 객체내부에 존재하지 않고  
    메소드 메모리 영역에 존재하는 
* 정적멤버는 객체를 생성하지 않고 클래스 이름으로 바로 접근해 사용 가능
    * 클래스를 통해서 접근하는 것이 좋음
    * 객체를 통해서 접근할 경우 Warning이 뜸
    > The static field Calculator.maker should be accessed in a static way
### 9. 클래스 멤버
* 클래스 멤버
    * 멤버필드 
        * 인스턴스 필드
        * 정적 필드(static 키워드가 앞에 붙는다)
    * 멤버메소드
        * 인스턴스 메소드
        * 정적 메소드(static 리턴타입 앞에 붙는다)
### 10. 초기화블럭
- 정적초기화블럭 
    ```java 
    static { }
    ```
    - 실행시점
        - main메소드 실행전
    - 용도
        - 수식을 통한 멤버 필드 초기화
- 인스턴스 초기화 블럭 
    ```java
    { }
    ```
    - 실행시점 :
        - 생성자 호출되어 생성자 몸체 실행문이 실행되기 전
    - 용도
        - 수식을 통한 인스턴스 멤버필드 초기화

## 상속
### 1. 상속 
* 상위 객체의 속성(멤버)가 하위 개체에 물려짐(단일상속만 허용,`extends` 키워드 사용)
* 목적
    * 재사용( 기존 소프트웨어의 설계, 구현, 테스트에 투입된 시간, 노력을 재활용)
        * 기존 클래스의 필드와 메소드를 그대로 받아 사용할 수 있다.
        * 수정할 필요가 있는 멤버는 재정의해서 사용한다.
            * 멤버 필드의 재정의는 비권장
* 관계
    * IS-A 관계
        * 인간이 동물을 상속할 경우 
        "인간은 동물이다"가 성립함
    * HAS-A 관계
### 2. 재정의
* 정의
    * 부모 메소드 구현부를 새로 정의해서 사용하는 개념
* 전제조건
    * 부모 메소드의 선언부(리턴타입, 메소드 이름, 매개변수)가 동일해야한다.
    * 접근제한자는 부모메소드와 동일하거나 범위가 넒어야한다.
### 3. `final` 키워드
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
### 4. 접근제한자 (access modifier)
- `private` 
   - 같은 클래스 내애서만 접근가능
- default
   - 같은 클래스 + 동일 패키지
- `protected`
   - default + 다른 패키지라 하더라도 상속관계 객체는 허용
- `public` 
   - 어디서든 접근가능
### 5. `super` & `this`
1. super
    * `super(xxx)` : 부모클래스의 생성자
    * `super.xxx` : 부모클래스의 멤버필드
    * `super.xxx() : 부모클래스의 멤버 메소드 호출
2. this
    * `this(xxx)` : 현재(자신) 클래스의 생성자 메소드 호출
    * `this.xxx` :  현재(자신)의 멤버필드
    * `this.xxx()` :  현재(자신)의 멤버 메소드 호출

### 6. 싱글톤 패턴 :  인스턴스를 하나만 만들 수 있는 클래스
* 만드는 절차 :
   1. 생성자를 private로 해서 외부에서 인스턴스 생성을 막음
   2. 내부에 private static 멤버필드를 두어 자신의 객체 생성
   3. 공개된(public)메소드를 두어 내부에서 생성된 인스턴스를 
       공개한다.
### 7. 다형성(polymorphism)
* 정의 
   * 조상의 참조변수로 자손타입의 객체를 다룰 수 있는 기법.  
        상속, 구현관계에서 부모타입에 자식타입을 대입하여 부모타입의 동일 메소드  호출에 대해 자식 객체의 재정의된 메소드가 호출되어 각기 다른 결과를  보여주는 성질
* 전제조건 3가지
    1. 클래스의 상속관계 또는 인터페이스의 구현관계가 존재해야함.
    2. 부모타입에 자식타입이 대입돼야함
    3. 자식클래스에서 또는 구현클래스에서 메소드 재정의(overloadding)되어야 함.

### 8. 참조변수의 형변환
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
### 9. instanceof : 
* 참조변수가 참조하는 인스턴스의 실제 타입을 체크 하는데 사용!!
* 결과가 boolean 타입을 반환함
### 10. 조상타입에 자식 타입을 대입했을 경우
* 멤버필드는 현재타입의 멤버를 접근하고
* 멤버메소드는 실제 인스턴스의 메소드를 실행
### 11. 추상메소드(abstract method)
* 미완성 메소드
* 구현부(`{ }`)가 없는 메소드(선언부만 존재)
### 12. 추상클래스(abstract class)
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
### 13. 인터페이스(interface)
* 일종의 추상클래스로 추상화정도가 추상 클래스 보다 높다.
* 특징 :
    1. 인스턴스를 만들 수 없다.
    2. 타입으로는 사용할 수 있다.
    3. 모든 멤버가 public이다 
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
### 14. 익명클래스 (annonymous class)
* 정의 
    * 이름이 없는 클래스로 오로지 하나의 클래스를 상속 받거나
    단 하나의 인터페이스를 구현한 일회성 클래스
* 문법
    * new 상속받을클래스명() { 멤버 }
    * new 구현할인터페이스명() { 멤버 }


## 예외처리 
### 예외처리(Exception Handling)
* 목적
    * 프로그램 실행시 발생할 수 있는 예외(Runtime error)에 대비해서 코드를 작성해 
    프로그램 종료없이 정상적으로 작동하도록 하기 위함
* 종류:
    1. checked exception
        * Exception을 상속한 클래스로 컴파일 시점에 반드시 예외처리해야함
        * 컴파일 시 이클립스가 unhandled exception이라는 메시지를 띄움
    2. unchecked exception 
        * RuntimeException을 상속한 클래스로 예외처리는 선택사항
            (ex NullPointerException)
* 방법:
    1. 예외발생 예상되는 실행문에 try-catch-finally구문 처리
    2. 호출한 메소드로 위임해서 처리(메소드 선언부에 throws절 사용)
* 문법오류 주의 사항
    * catch블록에서 상위타입은 아래에 배치한다.

## 제너릭(Generic) 용어 정리
### 제너릭(Generic)
* 정의
    * 클래스, 인터페이스, 메소드 내부에서 사용할 데이터 타입을 파라미터화 해서  
    외부에서 지정하고 컴파일 시 구체적인 타입이 결정되도록 지원하는 문법
* 이점
    * 제너릭타입 변수 선언시 
        * 컴파일 시점에 타입오류 방지
    * 제너릭타입 변수 사용시
        * 강제 형변환 과정이 불필요하며 프로그램 성능향상에 기여
### 제너릭 타입 파라미터 제한
* extends 상위타입(클래스,인터페이스) : 상위타입 이하로 타입 제한
* super는 사용불가
### 제너릭 메소드
* 리턴타입 앞에 다이아몬드 연산자를 사용해서 외부에서 파라미터 타입을 결정하며    
메소드의 리턴타입과 매개변수에 사용하는 메서드
### 제너릭 메서드 타입 파라미터 제한
* extends 상위타입(클래스, 인터페이스) 
    * 상위 타입 이하로 타입 제한
* super 하위타입(클래스, 인터페이스) 
    * 하위 타입 이하로 타입 제한
### 와일드 카드 타입
* 이미 선언되어 있는 제너릭 타입을 매개변수나 리턴 타입으로 사용할 때  
타입 파라미터를 제한할 목적으로 사용
- `제너릭타입 <?>` : 제한 없음
    - ```java
        public static void registerCourse(Course<?> course)
        ```
- `제너릭타입 <? extends 상위타입>` 
    - ```java
        public static void registerCourse(Course<? extends Student> course)
        ```
- `제너릭타입 <? super 하위타입>` 
    - ```java
        public static void registerCourse(Course<? super Worker> course)
        ```
    - 더 이상 확장 못하게 함



## 스레드
### 1. 멀티태스킹(multi tasking)
- 두가지 이상의 작업을 동시에 처리하는 행위
- 구현방법
    1. 멀티 프로세스 :
        - 독립적인 프로그램을 여러번 실행하고 작업을 처리
    2. 멀티 스레드
        - 하나의 프로그램을 실행하여 내부적으로 여러작업을 처리
### 2. 프로세스의 종료
- 프로세스는 적어도 하나의 스레드를 가진다.
- 싱글 스레드 :
    - 메인스레드가 종료하면 프로세스가 종료됨
- 멀티 스레드 
    - 실행중인 스레드가 하나라도 존재하면 프로세스는 종료되지 않는다.
    - 모든스레드가 종료될 때 프로세스는 종료한다.
### 3. 스레드 생성 방법
1. Thread 클래스로부터 직접 Runnable를 구현하여 생성
2. Thread를 상속받아 생성
### 4. 동시성과 병렬성
- 동시성
    - 하나의 코어에 멀티 스레드가 번갈아 가며 실행하는 성질
- 병렬성
    - 멀티 코어에서 개별 스레드가 동시에 실행하는 성질
- 실제 스레드 환경에서는 동시성과 병렬성이 공존한다.
### 5. 스레드 실행시 run() 메소드를 호출하지 않고 start()메소드를 호출하는 이유
- 스레드는 자바의 스레드 스케줄링에 의해서 우선순위 방식 또는
순환할당 방식으로 실행되기 때문.
### 6. 동기화 메소드와 동기화 블록
- 목적
    - 멀티 스레드가 하나의 객체를 공유해서 생기는 오류 방지하기 위함
- ex)
    - 동기화 메소드
        ```java
            public synchronized void setMemory(int memory) { /* 실행 구문 */ }
            ```
    - 동기화 블록
        ```java
            synchronized(this) { /* 실행 구문 */ }
                ```


## 컬렉션
### 1. 컬렉션(Colllection)
- 정의 
    - 객체를 수집해서 담을 수 있는 자료구조(컨테이너)
- 계층구조
    - Iterator &lt; Collection &lt; List
    - Iterator &lt; Collection &lt; Set
    - Map
- List계열
    - 특징 :
        - 순서가 잇고 중복 저장 가능
    - 구현클래스
        - ArrayList
            - 단일 스레드
        - Vector
            - 멀티 스레드
        - LinkedList
            - 삽입 삭제가 빈번히 이뤄지는 자료구조가 필요시 사용
- Set 계열
    - 특징
        - 순서가 없고 중복저장 불가능
    - 구현클래스
        - HashSet
        - TreeSet
            - 검색속도가 빠르다     
- Map 계열
    - 특징
        - 순서가 없고, 키와 값의 쌍으로 저장 키는 중복저장 불가, 값은 중복저장 가능
    - 구현 클래스 
        - HashMap
            - 단일 스레드
        - HashTable
            - 멀티스레드
        - TreeMap
            - 검색용
        - Properties
            - 환경설정용
### 2. 객체 해시코드 
- 정의
    - 객체를 식별하는 주소값으로 객체의 메모리 번지를 이용해 해시코드를 만들어 리턴한다.  
    따라서 개별 객체는 해시코드가 모드 다르다.
### 3. 논리적 동등이란?
- 객체의 주소값은 다르더라도 실제 내용이 같은 객체
- 논리적 동등비교 내부 동작 원리
    1. `hashCode()` 리턴값 비교 하여 동일하면 true
        - `Objects.hash()` 사용하여 재정의 권장.
        - 위 메소드는 동일한 매개변수값으로 호출하면 동일한 hashcode를 리턴함
    2. 객체의 `equals()` 리턴값 확인
        - 객체의 멤버필드가 동일한지를 비교하도록 재정의
    - 1,2가 모두 참일 때 동등객체로 판단
    - 원래 순수 hashcode값을 알고싶으면 `System.identityHashCode()` 사용