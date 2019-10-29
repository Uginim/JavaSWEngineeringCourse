# What I studied today.
Date : 2019-10-28

## 자바의 메모리 영역
* 몇가지 메모리 영역
    * 스택 영역
    * 힙 영역
* 메모리 관련 String 생성 예제 
    ```java
    String name1 = "홍길동"
    String name2 = "홍길동"
    String name3 = new String("홍길동");
    String name4 = new String("홍길동");
    System.out.println((name1==name2) ? "같다" : "다르다"); // 같다
    System.out.println((name2==name3) ? "같다" : "다르다"); // 다르다
    System.out.println((name3==name4) ? "같다" : "다르다"); // 다르다
    System.out.println((name3.equals(name4)) ? "같다" : "다르다"); // 같다
    ```
* 더 읽어보기
    * [자바, String 객체 생성과 문자열 리터럴](http://maedoop.dothome.co.kr/34/)

## 기본 타입의 값의 범위
* `long`(8byte) < `float`(4byte) < `double`(8byte)
    * `float`은 지수부가 존재하고 1.4\*E^-45 3.4\*E^38까지 표현가능
    * `long`은 -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807까지 표현

## 연산자 활용 예시
* 반올림
    ```java
    double constantE = 2.7182818;
    double roundedE = (int)(constantE * 10000 + 0.5) / 10000.0; //아래로가능
    // double roundedE = Math.round(constantE * 10000) / 10000.0; 
    ```
* 문자연산
    ```java
    char upperCase = 'B';
    upperCase++; // 'C'
    char lowerCase = (char) (upperCase-('A'-'a')); // 'c' lower case!
    ```
* 나누기 관련
    * 코드
        ```java
        int x = 11;
        int y = 8;
        System.out.printf("%d을 %d로 나누면, %n", x, y); 
        System.out.printf("몫은 %d이고, 나머지는 %d입니다.%n", x / y, x % y); 
        System.out.printf("값은 %f입니다.%n", (double)x / y);
        System.out.printf("값은 %f입니다.%n", x /(double) y);
        System.out.printf("값은 %f입니다.%n", x * 1.0 / y);
        System.out.printf("값은 %f입니다.%n", x / (y*1.0)); // 괄호 중요
        ```
    * 결과 
        ```
        11을 8로 나누면, 
        몫은 1이고, 나머지는 3입니다.
        값은 1.375000입니다.
        값은 1.375000입니다.
        값은 1.375000입니다.
        값은 1.375000입니다.
        ```
    * 마지막에 `printf`함수에서 괄호가 없으면 소숫점이 없어진다.
* 실수
    * 부동소수점은 숫자를 정확하게 표현을 못함
    * 예시
        ```java
        float f = 0.1f;
        double d = 0.1;				
        System.out.printf("10 == 10.0f  \t %b%n", 10==10.0f);
        System.out.printf("0.1 == 0.1f  \t %b%n", 0.1==0.1f);
        System.out.printf("f =%19.17f%n",f);
        System.out.printf("f =%19.17f%n",d);
        System.out.printf("d == f       \t %b%n", d==f);
        System.out.printf("(float)d==f  \t %b%n", (float)d==f);		
        ```
    * 출력
        ```java
        10 == 10.0f  	 true
        0.1 == 0.1f  	 false
        f =0.10000000149011612
        f =0.10000000000000000
        d == f       	 false
        (float)d==f  	 true
        
        ```
* 기타 
    * 문자 `'0'`과 문자 `'\0'`은 다르다
    * `'\0'` 
        * null 문자 
        * 정수 `0`을 나타낸다
        * 보통 문자열의 끝을 의미!
    * 예시
        ```java
        System.out.printf("'0'== 0      \t %b%n", '0'== 0);
        System.out.printf("'\\0'== 0    \t %b%n", '\0'== 0); // null 문자
        ```
        
        ```java
        '0'== 0      	 false
        '\0'== 0    	 true
        ```
* 쇼트 서킷(Short Circuit)
    * 사용이유
      1. 불필요한 연산을 하지 않음으로 실행속도를 높임
      2. 코드의 안정성을 높임
    * `&&`, `||` : 쇼트서킷(O)
        * 논리연산자 `&&`, `||`는 **무조건** 왼쪽부터 계산함. 
    * `&`, `|` : 쇼트서킷(X)        
    * 예시
        * 쇼트서킷 
            ```java
            x = 6;
            System.out.printf("x=%2d,  x%%2==0 || x%%3==0  && x%%6!=0 =%b%n", x, x%2==0||x%3==0&&x%6!=0); 
            System.out.printf("x=%2d, (x%%2==0 || x%%3==0) && x%%6!=0 =%b%n", x,(x%2==0||x%3==0)&&x%6!=0);
            int a = 5;
            int b = 0;
            System.out.printf("a!=0 || ++b!=0 = %b%n", a!=0 || ++b!=0);
            System.out.printf("a==0 && ++b!=0 = %b%n", a==0 && ++b!=0);
            
            System.out.printf("a!=0 | ++b!=0 = %b%n", a!=0 | ++b!=0 );
            // a=5; b=1;
            System.out.printf("a!=0 & ++b!=0 = %b%n", a!=0 & ++b!=0 );
            System.out.printf("a=%d, b=%d\n", a, b); // a=5; b=2;    
            ```
        * 쇼트서킷으로 0으로 나누기 막기(코드의 안정성)
            ```java
            if(a != 0 && b/a ==3){
                ...
            }
            
            ```
* 참조형 변수
    * 참조형 변수에 동등비교 연산자(`==`, `!=`)는 **동일한객체**를 참조하는지 판단
    * 문자열 자체를 비교할 땐 별도의 함수들을 사용
        * `String.equals()`
        * `String.equalsIgnoreCase()`

## 진법에 따른 정수 리터럴 
* 접두어 정리
    * 10진수 : 아무것도 없음
    * 2 진수 : `0b`...
    * 8 진수 : `0`...
    * 16진수 : `0x`...
* 선언 예시
    ```java
    int num1 = 10; // 10진수 리터럴	Decimal
    int num2 = 0100; // 8진수 리터럴 1 * 8^2 + 0*8^1 + 0*8^0 = 64 Octal
    int num3 = 0xaf; // 16진수 리터럴 10 * 16^1 + 15 * 16^0 = 175 Binary
    int num4 = 0b101; // 2진수 리터럴 1 * 2^2 + 0 * 2^1 + 1 * 2^0 = 5; Hexadecimal 
    ```
## 비트 연산자
* 보수
    * 더해서 해당 숫자가 되는 수
    * 2의보수 만드는 법
        * 1의 보수로 만들고(`0`은 `1`로 `1`은 `0`으로)
        * 1을 더함
    * 2진법에서 2의 보수인지 확인하는 법
        * 보수인 두 수를 더해서 0이 나오면 보수
* 비트 연산 예시
    ```java
    package com.kh.bit;
    /**
    * 2019.10.28 Java SW Engineering Course
    * @author Hyeonuk
    */
    public class BitExam {

        public static void main(String[] args) {
            int num1 = 10; // 10진수 리터럴	Decimal
            int num2 = 0100; // 8진수 리터럴 1 * 8^2 + 0*8^1 + 0*8^0 = 64 Octal
            int num3 = 0xaf; // 16진수 리터럴 10 * 16^1 + 15 * 16^0 = 175 Binary
            int num4 = 0b101; // 2진수 리터럴 1 * 2^2 + 0 * 2^1 + 1 * 2^0 = 5; Hexadecimal
            
            System.out.println(num1);
            System.out.println(num2);
            System.out.println(num3);
            System.out.println(num4);		
            System.out.println("----------------------------");
            System.out.println("num1 ("+Integer.toBinaryString(num1) +") : "+ toBinaryString(num1));
            System.out.println("num2 ("+Integer.toBinaryString(num2) +") : " + toBinaryString(num2));
            System.out.println("num3 ("+Integer.toBinaryString(num3) +") : " + toBinaryString(num3));
            System.out.println("num4 ("+Integer.toBinaryString(num4) +") : " + BitExam.toBinaryString(num4));
            System.out.println("----------------------------");
            System.out.println("num1 & num2 = "+toBinaryString(num1 & num2));
            System.out.println("num1 | num2 = "+toBinaryString(num1 | num2));
            System.out.println("num1 ^ num2 = "+toBinaryString(num1 ^ num2));
            System.out.println("~num1 = "+toBinaryString(~num1));
            System.out.println("num1 << 2 = "+toBinaryString(num1<<2));
            System.out.println("num1 >> 2 = "+toBinaryString(num1>>2));
            System.out.println("~num1 >> 2 = "+toBinaryString(~num1>>2));
            System.out.println("~num1 >>> 2 = "+toBinaryString(~num1>>>2));

        }
        public static String toBinaryString(int val) {
            String str = Integer.toBinaryString(val);
            while(str.length() < 32) {
                str = "0" + str;
            }
            // 현재 메소드를 종료하고 return 다음의 값을 현제 메소드를 호출한 곳으로 전달한다.
            return str;
        }

    }
    ```   

## 변수 : 용어 정리 (변수/상수/리터럴)
1. 변수
    * 값을 저장하려고 메모리에 마련한 공간
    > 하나의 값을 저장하기 위한 메모리 공간
2. 상수
    * 처음에 한번 메모리에 저장되어 변경되지 않는 값
    * 고정된 변수
    > 한번만 값을 저장할 수 있는 메모리 공간.
3. 리터럴
    * 순수값 그자체 
    > 
* 구분해보기
    * 변수 : socre, ch, name
    * 상수 : MAX
    * 리터럴 : 100, 'A', "홍길동", 200
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
## 변수의 값 서로 바꾸기
* 두 변수의 값을 바꾸기
* 변수하나를 추가해줘서 바꿔야한다
* 물이 담긴 두 컵의 물을 서로 바꾸는 것을 생각해볼 것
## String 연산자
```java
    System.out.println(7 + 7 + ""); // 14
	System.out.println("" + 7 + 7); // 77
```
## float형 리터럴
```java
float f1 = .10f;    // 0.10, 1.0e-1
float f5 = 0.10f;   // 0.1
float f6 = 1.0E-1f; // 0.1
float f7 = 0.1e0f;  // 0.1
float f8 = 0.01e1f; // 0.1     
        
float f2 = 1e1f;   
```
## printf
* 주요 서식지시자
    * `%b` boolean 형식(`true`, `false`))
    * `%d` decimal 형식
    * `%o` octal
    * `%x`,`%X` hexa-decimal
    * `%f` floating-point
    * `%e`,`%E` exponent
    * `%c` character
    * `%s` string
* 접두어  
    * 공통  
        * `-` : 좌측정렬
    * `%f`용
        * `%전체자리.소수점아래자리f`
    * `%d`용
        * `%숫자d` 숫자만큼 빈공간 채움(숫자만큼 출력공간 확보)
        * `%0숫자d` 숫자만큼 `0`으로 채움
    * `%x` 용
        * `%#x` : 16진수 앞에 0x 붙임
    * `%s` 용
        * `%숫자s` : 숫자만큼 출력공간 확보
        * `%.숫자s` : 왼쪽에서 숫자만큼 출력


## Oracle
* 오라클 설치
    * [2019-10-18일 문서 확인](whatIStudied_191018.md)

* 실습
    * 실습환경 셋팅
        * 글꼴바꾸기 
            * 메뉴 도구 -> 환경설정 -> 코드편집기 -> 글꼴
        * 행번호 토글
            * 행번호 라인에서 우클릭    
        * SQL 워크시트
            * 명령문 실행(한 문장 실행)
                * `ctrl` + `Enter`
                * 혹은 첫번째 아이콘 클릭
            * 전체 실행
                * `F5`키
                * 두번째 아이콘 클릭
        * 실습 데이터 초기화 스크립트
            1. 다운받기
                * [데이터페이스 실습 Sample 데이터](https://cafe.naver.com/ulsankhjava/17) (오타아님) 
            2. 워크시트에서 복사한 뒤 실행
            3. 새 접속정보 설정 
                * name : madang
                * user : madang
                * password : madang
            4. madang 으로 접속
    * 실습내용
        ```sql
        --레코드들 조회
        select * from book;
        -- bookid가 9번인 것 만 조회
        select * from book where bookid = '9';

        select * from book where price >= 10000;
        --레코드, 행 생성
        insert into book values(11, '데이터베이스', '한빛출판사', 30000);
        --레코드, 행 수정
        update book set price=25000 where bookid = 11;
        --레코드, 행 삭제
        delete from book where bookid = 11;
        ```
        * 실습 후 `.../JAVASTUDY/sql/20191028.sql`로 저장
## 이클립스 팁
* 클래스/메소드 API 문서 보기
    * 커서 올려놓기 **(간단하게)**
    * 클래스/메소드에 커서를 두고 `shift` + `F2` **(자세하게 브라우저에서)**
* 이클립스 기본 브라우저 설정
    * 나중에 알려주심
* 새로 생성하기 
    * `ctrl` + `n` key
* 실행 단축키
    * `ctrl` + `F11` 
## 기타
* 유니코드에는 아스키코드가 포함됨

## SQL Developer 설치
[2019-10-18일 문서 확인](whatIStudied_191018.md)


## JAVASTUDY 파일 트리 최신
* JAVASTUDY
    * app `오라클 설치 경로`
    * download
        * apache-tomcat-9.0.27.exe `톰캣`
        * BANDIZIP-SETUP-KR.EXE `반디집 (압축유틸)`
        * demo_madang.sql `sql 실습용 환경 셋팅 스크립트`
        * java_jungsuk3e_src_20160226.zip `남궁 성 자바의 정석 3e 예제 소스파일`
        * jdk-8u201-windows-x64.exe `JDK`
        * jdk-8u231-windows-x64.exe `JDK`
        * npp.7.7.1.Installer.exe `노트패드++ (텍스트 편집기)`
        * OracleXE112_Win32.zip `오라클 11g`
        * spring-tool-suite-4-4.4.0.RELEASE-e4.13.0-win32.win32.x86_64.zip `STS 4`
        * sqldeveloper-19.2.1.247.2212-no-jre.zip `sql developer`
        * VSCodeUserSetup-x64-1.39.2.exe `VS Code (소스코드 편집기)`
    * html
        * Hello.html
    * javabook `자바의 정석 예제를 위한 워크스페이스`
    * javaedu `실습용 워크스페이스`
    * sql `sql 실습 스크립트`
    * sqldeveloper `sql developer bin`
    * sts-4.4.0 RELEASE `sts 설치경로`
    * tomcat9 `톰켓 설치경로`

## 궁금점
* 쇼트서킷은 자바외의 언어에도 일어날까?
    * javascript 
        * 테스트 소스
            ```javascript
            var i = 0, j = 11;
            var result = j == 11 || i++ == 1;
            console.log(result,i);    
            ```
        * 콘솔 실행결과
            ```
            true 0
            ```
        * 결론 
            * 쇼트서킷 존재