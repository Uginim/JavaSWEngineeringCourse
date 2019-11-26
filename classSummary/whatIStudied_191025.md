# What I studied today.
Date : 2019-10-25

## eclipse 팁
* 프로젝트 close하기
    * 열려 있는 프로젝트들은 리소스를 점유함(컴퓨터성능저하)
    * 방법 2가지
        * 프로젝트 선택 -> 메뉴창 project -> close project
        * 우클릭 -> close project
* 패키지 이름 바꾸기
    * refactor -> rename -> OK -> continue
    * 이렇게 하면 패키지에 포함된 각 **클래스**들의 소스 코드도 수정된다.
        ```java
            package com.kh.operator; // <= 요기가 바뀜
            class MyClass {

            }
        ```
        * 실습 중 수정된 패키지)  
        &nbsp; &nbsp; `javaprj` -> `com.kh`
* 패키지 만들기
    * 좌측 project explorer에 원하는 경로 우클릭 -> new -> package 
        * 실습중 추가된 패키지)  
        &nbsp; &nbsp; `com.kh.control`  
        &nbsp; &nbsp; `com.kh.operator`
* 패키지로 옮기기
    * project explorer에서 옮기려는 파일 선택 -> refactor -> move 
* API 문서보기
    *  보려는 클래스를 드래그 후 `shift` + `F2`
## 패키지
* 비슷한 클래스들을 묶어두는 것
* 다른 패키지에 있는 클래스를 쓰려면 `import`를 한다.
    ```java
        import java.util.Scanner;
        import java.util.*; // 패키지내 모든 것 
    ```
### JRE 살펴보기
* rt.jar
    * java.util
    * java.lang

### java.lang
* java.lang패키지의 클래스들은 자주사용하기 때문에 
    * 암묵적으로 **모든클래스에서** **컴파일러가 자동**으로 **import**됨
<br/>

## Java API 문서
* [링크 Java™ Platform, Standard Edition 8 API Specification](https://docs.oracle.com/javase/8/docs/api/index.html?overview-summary.html)
* FRAMES 
    * 좌측에 INDEX를 보여줌

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
### 8.비트연산자
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

## 직접해보기 
* 10월 23일 만들었던 "BankExam.java"소스코드를 변경시키기
    * BankExam을 복사해서 BankExam2만들기
    * while do-while로 바꾸기
    * switch문 다중 if문으로 바꾸기
    * 예금/출금 메소드로 뽑아내기
* 풀이
    ```java
        package com.kh;

        import java.util.Scanner;
        /**
        * 2019.10.25 Java SW Engineering Course 
        * while do-while로 바꾸기
        * switch문 다중 if문으로 바꾸기
        * 예금/출금 메소드로 뽑아내기
        * @author Hyeonuk
        */ 
        public class BankExam2 {
            /**
            * @param balance
            * @param money
            * @return 계산된 잔액 
            */
            public static int save(int balance, int money) {		
                return balance + money;		
            }
            /**
            * @param balance
            * @param money
            * @return 계산된 잔액
            */
            public static int withdraw(int balance, int money) {
                return balance - money;
            }
            public static void main(String[] args) {
                // 1) 변수선언
                int balance = 0; //잔액
                boolean flag = true;
                System.out.println("----------------------------------");
                System.out.println("1)예금 | 2)출금 | 3)잔액 | 4)종료 ");
                System.out.println("----------------------------------");
                
                Scanner scanner = new Scanner(System.in);
                do {
                    System.out.print("선택> ");
                    String tmp = scanner.nextLine();			
                    if(tmp.equals("1")){
                        System.out.print("예금액>>");
                        int money = Integer.parseInt(scanner.nextLine());
                        balance = save(balance,money);
                    } else if(tmp.equals("2")) {					
                        System.out.print("출금액>>");
                        int money = Integer.parseInt(scanner.nextLine());
                        balance = withdraw(balance, money);
                    } else if(tmp.equals("3")) {
                        System.out.println("잔액>> "+balance);
                    }else if(tmp.equals("4")) {
                        flag = false;
                    }
                }while(flag); 
                    
                System.out.println("프로그램 종료!");
            }
        }

    ```
## 숙제 
* 내용 - [링크](https://cafe.naver.com/ulsankhjava/216) 
    ```
    문제 1) SumExam1
    1~100까지의 합구하기
        1) for문
        2) while문
        3) do~while문
        
    문제 2) SumExam2
    1~100까지의 짝수 합구하기
        1) for문
        2) while문
        3) do~while문
        
    문제 3) SumExam3
    1~100까지의 수를 읽어 	홀수면 홀수 출력 
                            짝수면 짝수 출력(if문 사용하기)
        1) for문
        2) while문
        3) do~while문
        
    문제 4) SumExam4
    구구단(2~9단까지) 출력하기(중첩 반복문사용)
        1) for문
        2) while문
        3) do~while문
    ```
* 제출 - [링크](https://cafe.naver.com/ulsankhjava/217)
* 선생님 코드
    ```java
    package com.kh;

    public class SumExamTeacher {
        public static void main(String[] args) {
    //		final int TO = 10;
            final int TO; 
            TO = 10;
            //for
            int sum = 0;
            for(int i=1; i<=TO; i++) {
                sum +=i;
            }
            System.out.println("sum=" +sum);
            System.out.println("-----------------");
            
            //while
            int cnt = 0;
            sum = 0;
            while(cnt < TO) {
                cnt++;
                sum += cnt;
            }
            System.out.println("sum=" +sum);
            System.out.println("-----------------");
            
            //do~while
            cnt = 0;
            sum = 0;
            do {
                cnt++;
                sum += cnt;
            } while(cnt < TO);
            System.out.println("sum=" +sum);
            System.out.println("-----------------");
        }
    }

    ```

## eclipse 팁
* 프로젝트 및 프로젝트의 일부파일만 javadoc생성하는 법
    * Project Explorer에서 프로젝트 선택 -> 메뉴의 Project 클릭 -> Generate javadoc

## 기타
* 메소드
    * 모듈화
        * 복잡한 기능을 작은 단위로 나눔
        * 목적
            * 재사용
                * 반복사용되는 코드패턴을 메소드 하나로 묶음
            * 유지보수
                * 기능을 변경할 때 해당 메소드를 사용하는 곳이 한꺼번에 적용됨


## 궁금한 점
* 위 예시에서 `&&`연산자 왼쪽것이 먼저일까 전위단항연산자 `++`이 먼저일까?
    * [The Java® Language Specification Java SE 8 Edition - 15.7 Evaluation Order](https://docs.oracle.com/javase/specs/jls/se8/html/jls-15.html#jls-15.7)



[돌아가기](../README.md) 
[2019-10-24](whatIStudied_191024.md)  
[2019-10-28](whatIStudied_191028.md)  