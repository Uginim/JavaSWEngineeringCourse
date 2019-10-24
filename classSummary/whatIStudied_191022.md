# What I studied today.
Date : 2019-10-22

## 자바프로그램 작성
* 자바의 모든 코드는 반드시 클래스 안에 존재해야함
* 모든 클래스가 main메서드를 가져야하는 것은 아님
* 자바어플리캐이션 실행할 때, `java.exe` main메서드를 포함한 클래스의 이름을 적어야함.  

* 하나의 소스파일에 하나의 클래스만을 정의하는 것이 **보통**
    * 둘 이상의 클래스를 정의 하는 것도 가능
    * 소스파일의 이름은 `public class`의 이름과 **일치**해야함
    * 소스파일 내에 `public class`가 없을경우, 소스파일 내 어떤 클래스이름이나 소스파일 이름이 될수있다.
<br/>
<br/>


## 변수 (variable)
### 용어 정리
* 변수 : 단 하나의 값을 저장할 수 있는 메모리 공간.
* 변수 선언 : 변수 타입과 이름을 선언
* 변수 타입 : 저장될 값의 타입
* 변수 이름 : 변수의 이름
* 변수 초기화(initialization) : 변수를 사용하기 전에 처음으로 값을 저장하는 것
* 변수의 범위 : 변수가 선언된 블록까지

### 자동형변환
#### 규칙 
* 기존의 값을 최대한 보존할 수 있는 타입으로 자동 형변환한다.
    * 변환가능 방향
        * byte(1Byte) -> short(2Byte) -> int(4Byte) -> long(8Byte) -> float(4Byte) -> double(8Byte)
        * char(2Byte) -> int(4Byte) -> ...
* boolean을 제외한 나머지 7개의 기본형은 서로 형변환이 가능
* 기본형과 참조형은 서로 형변환 불가
* 서로 다른 타입의 변수간의 연산은 형변환을 하는 것이 원칙
    * 값의 범위가 작은 타입에서 큰 타입으로의 형변환은 생략가능
* char의 범위(0~2^16,0~65535)와 short 범위()
* 이항 연산 시 형 변환은 다른 변수에 대입되기 전에 일어남 헷갈리지말것
* p100의 ch3/OperatorEx8.java예제가 자주하는 실수를 알려줌
```java
    int num1 = 2;
    int num2 = 10;
    double result2 = num1 / num2; // 0.0 
    /* 0.2가 아니다! */
```

<br/>
<br/>




## 반복문(Loop)
### for
* 조건식이 비어 있어도 true로 간주함
### 순서도
* 알고리즘 : 주어진 문제를 해결하기위한 작업 절차나 과정
* 알고리즘은 자연어, 프로그램 언어, 순서도, 의사코드 등으로 표현
* 순서도: 약속된 흐름 기호를 사용해서 문제의 처리과정을 보여주는 표현 방법
* 문제 -> 순서도 -> 코딩
#### 순서도 구조
1. 순차구조
2. 조건구조
3. 반복구조
### 제어문-분기문 -break,continue,label
* break : 가장 가까이 있는 switch문 or 반복문 하나만 빠져나간다
* continue : 가장 가까운 반복문의 다음 차수를 진행한다.(증감식 실행)
* 이름붙은 반복문(label) : 지정한곳으로 분기함
    * `label`은 키워드가 아니다!
* break, continue, label은 자주사용하면 가독성을 해침
#### 이름붙은 반복문
* 자바에서는 반복문에 이름을 붙일 수 있다.
* `break` + `반복문이름`을 하면 **중첩된 반복문**을 한꺼번에 나갈 수 있다.
* `continue`도 가능
##### 예시
```java
/**
 * 2019.10.22 Java SW Engineering Course
 * Named Loop Practice 
 * @author Hyeonuk
 */
public class LoopTest {
	public static void main(String[] args) {
		int num = 100;
		outer: for(int i=0;i<10;i++) {
			num-=6;
			for(int j=0; j<10;j++) {
				num-=2;
				if(num<0) {					
					System.out.println("num is less than 0");
					break outer;// Escape outer loop
				}
			}
		}
			System.out.println("ended");;
	}
}
```
<br/>
****

#### 반복문 예제
```java
class FlowEx19 {
	public static void main(String[] args) { 
		for(int i=1;i<=3;i++)  
			for(int j=1;j<=3;j++) 
				for(int k=1;k<=3;k++) 
					System.out.println(""+i+j+k);	
	} // main의 끝
}
```
* `System.out.println(""+i+j+k);`라인에서 `""`(빈문자열)이 들어간 이유?
    * 뒤의 i,j,k에 문자열 연산을 하기 위해서 
    * `""`가 없으면 산술연산을 하게된다.
<br/>
<br/>


## 출력 
### 형식화된 출력 printf()
#### 지시자(specifier)
* 출력될 형식을 지정한다.
* Java API에서 Formatter클래스에 지시자의 목록이 있음
    * [Formmater Class](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html)
* 주요 지시자 
    * `%s` 
        * `%4s` 앞에 숫자 `4`가 들어가면 **4칸**의 공간을 확보하고 우측정렬로 채워진다
        * `-`가 붙으면 좌측정렬을 한다 `%-4s`
    * `%n`
        * 

<br/>
<br/>

## 입력
### 입력에 사용되는 Class
* Scanner
* Console

<br/>
<br/>

## 스스로 해보기
* 별 출력하기 
    * 아래와 같은 모양의 별을 출력하라
```
   *
  **
 ***
****
```
* 답 : 
```java
/**
 * 2019.10.22 Java SW Engineering Course
 * loop statement Example 
 * Print stars like below

   *
  **
 ***
****

 * @author Hyeonuk
 */
public class StarPrinter {
	public static void main(String[] args) {
		// my solution
		int num=4;
		for(int i=0;i<num;i++) {
			for(int j=0;j<num;j++) {
				if(i+j+1<num) {
					System.out.print(" ");
				} else {
					System.out.print("*");
				}
				
			}
			System.out.println();
		}
		// other solutions
		System.out.println("------------1-----------");
		System.out.println("   *");
		System.out.println("  **");
		System.out.println(" ***");
		System.out.println("****");
		
		System.out.println("------------2-----------");
		System.out.printf("%4s%n","*");
		System.out.printf("%4s%n","**");
		System.out.printf("%4s%n","***");
		System.out.printf("%4s%n","****");
		
		System.out.println("------------3-----------");
		System.out.printf("%-4s%n","*");
		System.out.printf("%-4s%n","**");
		System.out.printf("%-4s%n","***");
		System.out.printf("%-4s%n","****");
		
		System.out.println("------------4-----------");
		for(int i=1; i<=4;i++) {
			for(int j=4; j>i; j--) {
				System.out.print(' ');
			}
			for(int j=1; j<=i; j++) {
				System.out.print('*');
			}
			System.out.println();
		}
		System.out.println("------------5----------");
		for(int i=1; i<=4; i++) {
			for(int j=4; j>=1;j--) {
				if(i<j) {
					System.out.print(' ');
				}else {
					System.out.print('*');
				}
			}
			System.out.println();
		}
	}
}
```
<br/>

* 평균 구하기
    * 숫자를 연속해서 입력받아서 평균과 총합 구하기
```java
import java.util.Scanner;

/**
 * 2019.10.22 Java SW Engineering Course
 * 국어 영어 수학 점수 입력받아서 합계 평균 구하기  
 * @author Hyeonuk
 *
 */
public class Sum_Avg {

	public static void main(String[] args) {
		// 1) 변수 선언(합계, 평균)
		// 2) 사용자로부터 점수입력받기
		// 3) 점수 누적하기("q"입력시까지)
		// 4) 평균 출력하기("입력받은 점수 누적" / "입력받은 점수 개수")
		int sum=0;
		int count =0;
		double avg=0.0;
		Scanner scan = new Scanner(System.in);
		System.out.println("합계를 구할 점수를 계속 입력하세요(종료시 q입력)");
		while(true) {
			String input = scan.nextLine();
			if(input.equals("q")) {
				break;
			}				
			else {
				sum+=Integer.parseInt(input);
				count++;
			}
		}
		avg = sum*1.0d/count;
		System.out.println("평균="+avg+" 합계="+sum);

	}

}

```
* 이하 선생님 코드
```java
/**
 * 2019.10.22 Java SW Engineering Course
 * 국어 영어 수학 점수 입력받아서 합계 평균 구하기  
 * 
 *
 */
public class Sum_Avg {

	public static void main(String[] args) {
		
		// 0입력받을 때 종료되는 것으로 문제가 바뀜
		
		// 1) 변수 선언(합계, 평균)
		int score = 0; 		// 점수
		int sum = 0; 			// 합계	
		double ave = 0.0; // 평균
		boolean flag = true;		
		int count = 0; // 입력받은 점수 카운트
		System.out.println("합계, 평균을 구할 점수를 입력하세요(종료: 0을 입력)");
		do {
		// 2) 사용자로부터 점수입력받기
			count++;
			System.out.println(count +" 점수>>");;
			
			Scanner scanner = new Scanner(System.in);
			String tmp = scanner.nextLine();
			score = Integer.parseInt(tmp);
		// 3) 점수 누적하기(종료조건: 사용자가0 입력시)
			if(score != 0) {
				sum += score;
			} else {
				count--;
				flag = false;
			}
		} while(flag);
		// 4) 평균 출력하기("입력받은 점수 누적" / "입력받은 점수 개수")
		System.out.println("총합계= "+sum);		
		ave = sum / (double)count;
		System.out.println("평균= "+ave);
	}

}

```


<br/>
<br/>
<br/>


## 금일 과제 
* 과제 : [별모양 피라미드 출력하기(링크)](https://cafe.naver.com/ulsankhjava/204)
* 과제 결과물 :
```java
/**
 * 2019.10.22 Java SW Engineering Course
 * Draw star pyramid * 
 * @author Hyeonuk
 *
 */

public class Pyramid {
	public static void main(String[] args) {		
		int level = 4;
		
	// pyramid 1
		System.out.println("problem1");
		for(int i=0;i<level;i++) {			
			for(int j=level-1; j>=0 ;j--) {
				if(i<j) {
					System.out.print(" ");
				} else {
					System.out.print("*");
				}
			}
			for(int j=0;j<i;j++) {
				System.out.print("*");
			}
			System.out.println();
		}		
		System.out.println();
		
		
		// pyramid 2
		System.out.println("problem2");
		for(int i=level-1;i>=0;i--) {			
			for(int j=level-1; j>=0 ;j--) {
				if(i<j) {
					System.out.print(" ");
				} else {
					System.out.print("*");
				}
			}
			for(int j=0;j<i;j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		// pyramid 3		
		System.out.println("problem3");
		for(int i=level-1;i>0;i--) {			
			for(int j=level-1; j>=0 ;j--) {
				if(i<j) {
					System.out.print(" ");
				} else {
					System.out.print("*");
				}
			}
			for(int j=0;j<i;j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		for(int i=0;i<level;i++) {			
			for(int j=level-1; j>=0 ;j--) {
				if(i<j) {
					System.out.print(" ");
				} else {
					System.out.print("*");
				}
			}
			for(int j=0;j<i;j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}


```

## 기타
* java의 배열 선언은 `[]`괄호가 변수명 뒤에도 올 수 있고 타입 뒤에도 올 수 있다.
* **숫자 리터럴** 사이에 언더바 가능함
    * JDK1.7부터 정수형 리터럴의 중간에 구분자`'_'`를 넣을 수 있음. 
    * `1000`이면 `1_000`, 백만이면 `1_000_000`도 됨
    * Javascript에서도 된다.
    * [Underscores in Numeric Literals](https://docs.oracle.com/javase/7/docs/technotes/guides/language/underscores-literals.html)
    * 책에서는 p32에 언급 
        * p169에 예제 `/ch4/FlowEx24.java`


<br/>

## 메모
* JDK버전과 JAVA버전은 뭐가다르지?

<br/>
<br/>
