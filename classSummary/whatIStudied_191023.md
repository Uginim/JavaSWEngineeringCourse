# What I studied today.
Date : 2019-10-23

## 반복문 복습 & 나머지
* if문 
* switch 조건절에 올 수 있는 타입 
    * 정수형 상수
* for 문 : 반복횟수를 정확히 알 때
* while : 반복횟수를 정확히 모를 때
    * do-while
        * '3.6.9.' 로직
* `break`는 중괄호(`{}`)를 빠져나가는 것이 아니라 가장 가까운 반복문을 빠져나감
```java
for(int i=1;i<=100;i++) {    
    int tmp = i;
    boolean notThree = true;
    do {
        if(tmp%10%3==0 && tmp%10!=0) { // tmp%10이 3의 배수인지 확인(0 제외)
            System.out.print("짝");
            notThree = false;
        }
    } while((tmp/=10)!=0);  // tmp /= 10은 tmp = tmp / 10과 동일
    if(notThree) {
        System.out.printf("%d ", i);
    }
    System.out.println();
}
```
* ch04 `FlowEx33.java` 예제에 `break`와 `continue`가 잘 나타남
* 무한루프 예시
```java
for(;;) {

}
for(;true;) { 

}
while(true) {

}
```

## 순서도
* 직접 그리기 [예제 파일](../examples/flowchart.pptx)


## 논리연산자
논리연산자는 피연산자의 조건을 결합해서 true와 false를 조사
* boolean 타입에만 사용  
  
| a | b | `!`a | a `&&` b | a`||`b | a`^`b |
|---|---|---:|---:|---:|---:|
|false | false | true | false | false | false|
|false | true | true | false | true | true|
|true | false | false | false | true | true|
|true | true | false | true | true | false|

* 우선순위가 헷갈리면
    * 괄호를 쓰면 우선순위를 명시적으로 정할 수 있다.
* **쇼트서킷**
    * `&&` 연산  
`조건식1 && 조건식2` 조건식 1이 false이면 조건식 2의 진리값과 상관없이 결과가 무조건 false가 된다. 
    * `||` 연산  
`조건식1 || 조건식2` 조건식 1이 true이면 조건식2의 진리갑과 상관없이 결과가 무조건 true
    * `&`하나짜리 AND연산이 있나?? 비트연산자임
        * 쇼트서킷 없이 앞 뒤 둘다 계산
        * 참고해보기 [JAVA 비트연산자(|, &)와 논리연산자(||, &&)의 차이](https://it-jin-developer.tistory.com/9)
<br/>
<br/>

## 문자열 비교
문자열은 참조형이기 때문에 단순히 비교연산자를 사용하면 안된다. `주소값`만 비교하기때문에 원하는 결과가 나오지 않는다.
* 기본타입의 동등 비교는 `==`, `!=`
* 참조타입의 동등비교
    1. 주소값 비교 : `==`, `!=` 사용
    2. 문자열 비교 : `String.equals()`사용



## 직접해보기
### 문제) 계산기 만들기
```
(1) 덧셈 
(2) 뺄셈
(3) 곱셈
(4) 나눗셈
원하는 메뉴(1~4)를 선택하세요. (종료:0)>

계산할 값(피연산자1)을 입력하세요.(계산 종료:0, 전체 종료:99)>
30
계산할 값(피연산자2)을 입력하세요.(계산 종료:0, 전체 종료:99)>
40
result = 70

```
#### 풀이)
```java
/**
 * 2019.10.23 Java SW Engineering Course
 * Make a Calculator 
 * @author Hyeonuk
 *
 */

public class Calculator {

	public static void main(String[] args) {
		int result;
		Scanner scan = new Scanner(System.in);
		outer: while(true) {
			System.out.println("(1) 덧셈 \r\n" + 
					"(2) 뺄셈\r\n" + 
					"(3) 곱셈\r\n" + 
					"(4) 나눗셈\r\n" + 
					"원하는 메뉴(1~4)를 선택하세요. (종료:0)>");
			String inputedLine = scan.nextLine();
			int menu = Integer.parseInt(inputedLine);
			if(menu>4|| menu<1)
				continue;
			while(true) {
				System.out.println("계산할 값(피연산자1)을 입력하세요.(계산 종료:0, 전체 종료:99)>");
				inputedLine = scan.nextLine();
				int op1 = Integer.parseInt(inputedLine);
				if(op1==0)break;
				if(op1==99)break outer;
				System.out.println("계산할 값(피연산자2)을 입력하세요.(계산 종료:0, 전체 종료:99)>");
				inputedLine = scan.nextLine();				
				int op2 = Integer.parseInt(inputedLine);
				if(op2==0)break;
				if(op2==99)break outer;								
				switch(menu) {
				case 1:
					System.out.printf("계산결과>> %d + %d = %d%n",op1,op2,op1+op2);					
					break;
				case 2:
					System.out.printf("계산결과>> %d - %d = %d%n",op1,op2,op1-op2);
					break;
				case 3:
					System.out.printf("계산결과>> %d * %d = %d%n",op1,op2,op1*op2);
					break;
				case 4:
					System.out.printf("계산결과>> %d / %d = %f%n",op1,op2,op1/(double)op2);
					break;
				default:
				}
			}
		}

	}

}
```
### 문제) 카드 발급 대상자 판별
```
카드 발급 대상자 판별

-- 입력
1) 연봉을 입력하세요(만원) :
2) 신용등급을 입력하세요(A~C) :
3) 기존고객여부(yes, no)	

-- 조건
연봉 5000만원 이상, 'A'등급, 기존고객이면 카드발급대상이 됨

-- 출력
카드발급조건 만족!!
카드발급조건을 만족하지 않습니다.!!
```
#### 풀이)
```java
public class Issuer {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int annualIncome = 0;
		char creditRating= ' ';
		boolean isExistingCustomer = false;
		String tmp;
		while (true) {
			System.out.println("카드 발급 대상자 판별");
			System.out.println("1) 연봉을 입력하세요(만원) :");
			tmp = scan.nextLine();
			annualIncome = Integer.parseInt(tmp);
			
			System.out.println("2) 신용등급을 입력하세요(A~C) :");
			tmp = scan.nextLine();
			tmp = tmp.toUpperCase();//
			creditRating =  tmp.charAt(0);			
			while(true) {
				System.out.println("3) 기존고객여부(yes, no)");
				tmp = scan.nextLine();
				if(tmp.equalsIgnoreCase("yes")) {
					isExistingCustomer = true;
					break;
				} else if(tmp.equalsIgnoreCase("no")) {
					isExistingCustomer = false;
					break;
				} else {
					System.out.println("yes or no만 입력하세요!");
				}
			}
			if(annualIncome>=5000 && creditRating =='A' && isExistingCustomer) {
				System.out.println("카드발급조건 만족!!");
			} else {
				System.out.println("카드발급조건을 만족하지 않습니다.!!");
			}
			System.out.println("종료시 end입력 계속하려면 아무키나");
			tmp = scan.nextLine();
			if(tmp.equals("end")) {
				System.out.println("종료합니다!");
				break;
			}
		}
	}
}

```
* String.equalsIgnoreCase()
* String.toUpper()  
### 문제)  은행 예금, 출금, 잔액 계산
```
문제) 은행 예금, 출금, 잔액 계산

------------------------------------
1.예금 | 2.출금 | 3.잔액 | 4.종료
------------------------------------
선택>1
예금액>>1000

선택>2
출금액>>500

선택>1
예금액>>2000

선택>3
잔액>>250	0

선택>4
프로그램종료!!
```
#### 풀이)
* 내 소스
```java
import java.util.Scanner;
/**
 * 2019.10.23 Java SW Engineering Course
 * Make Banking service
 * @author Hyeonuk
 *
 */
public class Banking {

	public static void main(String[] args) {
		int menu=-1;
		int balance = 0;int money;
		Scanner scan = new Scanner(System.in);
		System.out.println("------------------------------------\r\n" + 
				"1.예금 | 2.출금 | 3.잔액 | 4.종료\r\n" + 
				"------------------------------------");
		outer: while(true){
			
			System.out.print("선택>");
			String tmp = scan.nextLine();
			menu = Integer.parseInt(tmp);
			switch(menu) {
			case 1:
				System.out.print("예금액>>");
				tmp = scan.nextLine();
				money = Integer.parseInt(tmp);
				balance += money;
				break;
			case 2:
				System.out.print("출금액>>");
				tmp = scan.nextLine();
				money = Integer.parseInt(tmp);
				if(balance<money) {
					System.out.println("잔액부족!");
					break;
				}
				balance -= money;
				break;
			case 3:
				System.out.println("잔액>>"+balance);
				break;
			case 4:
				System.out.println("프로그램종료!");
				break outer;
			default:
				System.out.print("------------------------------------\r\n" + 
						"1.예금 | 2.출금 | 3.잔액 | 4.종료\r\n" + 
						"------------------------------------");
			}
			System.out.println();
			
		}
		

	}

}
```
* 선생님 소스
```java
public class BankExam {
	public static void main(String[] args) {
		// 1) 변수선언
		int balance = 0; //잔액
		boolean flag = true;
		System.out.println("----------------------------------");
		System.out.println("1)예금 | 2)출금 | 3)잔액 | 4)종료 ");
		System.out.println("----------------------------------");
		
		Scanner scanner = new Scanner(System.in);
		while(flag) {
			System.out.print("선택> ");
			String tmp = scanner.nextLine();
			
			switch (tmp) {
			case "1":
				System.out.print("예금액>>");
//				tmp = scanner.nextLine();
//				int money = Integer.parseInt(tmp);
				balance += Integer.parseInt(scanner.nextLine());
				break;
			case "2":		
				System.out.print("출금액>>");
				balance -= Integer.parseInt(scanner.nextLine());
				break;
			case "3":				
				System.out.println("잔액>> "+balance);
				break;
			case "4":
				flag =false;				
				break;
			}
			
		}
		System.out.println("프로그램 종료!");
	}
}
```
<br/>

## 메모
* char타입의 초기값은 `' '`(공백)을 준다.