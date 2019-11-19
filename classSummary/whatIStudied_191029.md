# What I studied today.
Date : 2019-10-29

## 변수 : 용어 정리 및 복습
4. 타입 : 변수에 저장될 데이터의의 종류, 데이터의 범위
    * 기본형 : 리터럴을 값으로 가짐
        * 정수형(byte, short, char, int, long) 
        * 실수형(float, double) 
        * 논리형(boolean)
    * 참조형 : 객체의 주소값(heap메모리상의 주소값)을 가짐
5. 형변환 :
    * 자동형변환(promotion) : 작은 타입 -> 큰타입으로 형변환
    * 강제형변환 : 큰타입 -> 작은타입의 경우는 반드시 캐스팅연산자 `(타입)`을 사용
        * 값의 손실이 없을 때 하는 것이 좋다.
        * 혹은 값의 손실을 막는 로직 필요
    * 정수에서 실수로 변환시 float으로 하면 오차가 생길 수 있다.
        * float이 제대로 표현할 수 있는 가수부의 범위는 7자리
        * 7자리 이상의 int값을 형변환 하면 오차가 생김
        * `double`형을 사용하라!    
6. 강제형벼환시 값의 손실원리  
    : 큰 타입의 바이트수를 작은바이트로 분리하고 난 후  
    제일 오른쪽에서 부터 작은바이트만을 취하기 때문.(오버플로우)
7. 오버플로우 : 기본타입에서 값의 범위를 초과하면 순회함
    ex)
    ```java
    byte num = 127;
    num + 1 = -128;
    ```
8. 정수를 실수로 변환할 때 float타입보다는 double타입을 사용한다.
    * double타입의 정밀도가 float타입 정밀도의 2배임
9. 변수의 사용범위(생명주기)
    * 변수가 선언된 블럭범위 중괄호가 시작되어서(`{`) 중괄호가 끝나는 범위(`}`)
    * 변수를 선언하고 사용을 안하면 Warning이 뜸
    * scope 밖에서 사용하려하면 컴파일 Error발생
        > 변수명 cannot be resolved to a variable   
## 출력
* 특수문자 
    |문자|리터럴|
    |:---|---:|
    |tab|`\t`|
    |backspace|`\b`|
    |form feed|`\f`|
    |new line|`\n`|
    |carriage return|`\r`|
    |역슬래쉬(\\)|`\\`|
    |작은따옴표|`\'`|
    |큰따옴표|`\"`|
    |유니코드(16진수)문자|`\u` + 16진수4자리 <br/>예시) `\u0042`|


## 배열
* 배열이란? 하나의 변수명을 가지고 동일타입으로 연속된 메모리공간에 저장하는 자료구조
* index(첨자)
    * 배열의 item(항목)에 접근할 때 사용함
    * index는 0부터 시작함
    * 반복구문에 사용이 편리
    * 자바는 1차원 배열만 사용!!
* 지역변수
    * 글로벌 변수가 아닌 것    
* default value 
   * 정수 
  	    * 0 
  	    * 0L
   * char 
  	    * '\0'
   * 실수
  	    * 0.0 
  	    * 0.0f
	    * boolean 
  	    * false
	    * 참조형
  	    * null
 * 배열의 선언 및 초기화 예시
    ```java
    int[] score = new int[3]; //배열 선언 및 초기화
		
    int[] score2; // 배열 선언
    // int[] score2 = null; // 배열 선언
    score2 = new int[3]; // 배열 초기화
    
    // int[] score3 = new int[] {90,80,70}; // 배열선언, 초기화, 초기값설정
    int[] score3; // 배열선언
    score3 = new int[] {90,80,70}; // 배열선언, 초기화, 초기값설정
    
    
    int[] score4 = {90,80,70}; // 배열선언, 초기화, 초기값설정
    // int[] score4;
    // iscore4 = {90,80,70}; // 불가
    ```
* 배열 예제
    ```java
    /**
     * 2019.10.29 Java SW Engineering Course
     * 배열을 사용하여 국영수 합과 평균을 구하시오
     * 아래 3개의 변수 사용
     * int[] score;	// 국영수
     * int sum;			// 합계
     * double ave; 	// 평균
     * @author Hyeonuk
    */
    public class ArrayExam2 {
    	public static void main(String[] args) {
    		int[] score;	// 국영수
    		int sum = 0;			// 합계
    		double ave = 0.0; 	// 평균
    		score = new int[] {90,80,70};
    		
    		// 합계 구하기
    		for(int i=0;i< score.length;i++) {
    			sum += score[i];
    		}
    		
    		// 향상된 for문
    		sum = 0;
    		for(int num : score) {
    			sum += num;
    		}
    		
    		// 평균 구하기
    		ave = (double)sum/score.length;
    		System.out.printf("합계:%d%n평균:%f",sum,ave);
    		
    	}
    }
    ```
* 배열의 참조값 예시
    * `[I@15db9742`
    * `[`은 배열을 의미 `I`는 int형을 의미
* 최대값 구하기
    ```java
    package com.kh.array;
    /**
    * 2019.10.29 Java SW Engineering Course
    * 최대값 최소값 구하기
    * @author Hyeonuk
    *
    */
    import java.util.Arrays;
    public class ArrayExam5 {
    
        /**
        * 최대값을 구함
        * @param arr 최대값을 구할 array
        * @return 구해진 최대값 
        */
        public static int getMax(int[] arr) {
            int max = Integer.MIN_VALUE;
            for(int i=0;i<arr.length;i++) {
                max = Math.max(max, arr[i]);
            }
            return max;
        }
        /**
        * 최소값을 구함
        * @param arr 최소값을 구할 array
        * @return 구해진 최소값
        */
        public static int getMin(int[] arr) {
            int min = Integer.MAX_VALUE;
            for(int i=0;i<arr.length;i++) {
                min = Math.min(min, arr[i]);
            }
            return min;
        }
        public static void main(String[] args) {
            int[] array = new int[5];
            int max = Integer.MIN_VALUE;
            int min = Integer.MAX_VALUE;
            // 배열에 정수값 초기화 (랜덤)
            for(int i=0; i<array.length; i++) {
                array[i] = (int) (Math.random()*10)+1;
            }
            // 최대값 구하기
            max = getMax(array);
            // 최소값 구하기
            min = getMin(array);
            
            
            System.out.println(Arrays.toString(array));
            System.out.println("최대값="+max);
            System.out.println("최소값="+min);
            
        }
    }

    ```
* Main 메소드에서 argument 입력받기 
    * 소스코드
        ```java
        package com.kh.array;
        /**
        * 2019.10.29 Java SW Engineering Course
        * Main메소드 파라미터 입력
        * @author Hyeonuk
        *
        */
        public class MainStringArrayParam {
            public static void main(String[] args) {
                if(args.length != 2) {
                    System.out.println("매개값 2개가 필요합니다.");
                    System.exit(0); // 프로그램 종료
                } else {
                    System.out.println(args[0]);
                    System.out.println(args[1]);			
                }
            }
        }

        ```
    * 방법 2가지
        * 이클립스서 run configurations에서 arguemnt 지정(아래 이클립스 팁 참조)
        * 명령터미널에서 실행하기 
            * 주의! 
                >패키지의 root 경로에서 패키지명까지 넣어서 실행해야함!  
                * 예시
                    * 프로젝트명/src 
                    * 프로젝트명/bin


## 문제) 
* [링크](https://cafe.naver.com/ulsankhjava/228)
    ```
    배열을 사용하여 학생 수 만큼 점수를 입력받고 
    분석(최고득점, 평균) 할수있다.
    ------------------------------------------------------
    1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료
    ------------------------------------------------------
    선택>>

    1번선택시 학생수입력
    학생수> 4

    2번선택시 점수를 키보드로 학생수 만큼 입력받는다
    점수1> 90
    점수2> 70
    점수3> 60
    점수4> 80

    3번 선택시 입력된 점수 목록을 보여준다
    score[0] = 90
    score[1] = 70
    score[2] = 60
    score[3] = 80

    4번 선택시
    최고점수 = 90
    평균 = 75

    5번 선택시 아래 메세지 출력후 종료함
    프로그램 종료!!
    ```
* 풀이

## 이클립스 팁
* 자동완성으로 다른 패키지의 클래스를 사용하면,
    * `import`문도 **자동**으로 **생성**해준다.
* 이클립스 단축키
    * 세로 화면 분할 단축기(토글됨)
        * `ctrl` + `shift` + `{`
    * 세로 화면 분할 단축기(토글됨)
        * `ctrl` + `shift` + `_`(`-`)
    * 라인삭제
        * `ctrl` + `D`
    * 라인복사
        * `ctrl` + `alt` + `arrow↑` or `ctrl` + `alt` + `arrow↓`
    * 라인주석 (토글)
        * `ctrl` + `/`
    * 블럭주석 
        * `ctrl` + `shift` + `/`
* outline view
    * 현재 소스코드의 대략적인 내용을 보여줌
    * 항목을 **클릭**하면 해당 라인으로 **커서**와 **화면**이 **이동**함
* program argument 입력 방법
    * run아이콘 옆의 라디오박스버튼 `클릭`
    * Run configurations `클릭`


[돌아가기](../README.md)