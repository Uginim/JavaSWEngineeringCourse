# What I studied today.
Date : 2019-10-31

# 배열 복습
* 배열의 선언 및 초기화
* 배열의 길이
* 다차원 배열
    * 다차원 배열의 리터럴
* 비정방형 배열
    * 배열 복습
        * 502호 학습자 자리 배치 2차원 배열로 표현하기
        * 예제 소스
            ```java
            package com.kh.array;
            /**
            * 502호 학습자 자리 배치 2차원 배열로 표현하기
            * @author Hyeonuk
            */
            public class Array2Exam2 {
                public static void main(String[] args) {
            //		String[][] students = new String[][] { 	{ "김현욱", "허은열", "이유동", "박용민", }
            //																					, {	"백인환", "박서영", "백다래", "이두희", }
            //																					, {	"신재웅", "오상훈", "박대진", "정재송", "이동근", }
            //																					, {	"이명균", "전민식", "이한별", "강나래", } 
            //																					};
                    String[][] students = new String[4][];
                    students[0] = new String[] {"김현욱", "허은열", "이유동", "박용민" };
                    students[1] = new String[] {"백인환", "박서영", "백다래", "이두희" };
                    students[2] = new String[] {"신재웅", "오상훈", "박대진", "정재송", "이동근" };
                    students[3] = new String[] {"이명균", "전민식", "이한별", "강나래" };
                    
                    for(int i=0;i<students.length;i++) {
                        System.out.print("{ ");
                        for(int j=0;j<students[i].length;j++) {
                            System.out.printf("%s%s",students[i][j],(students[i].length==j+1)?"":", ");
                        }
                        System.out.println(" }");
                    } 
                    System.out.println("반장님 : " + students[2][2]);
                    System.out.println("부반장님 : " + students[0][3]);
                    System.out.println("1조 조장님 : " + students[0][3]);
                    System.out.println("2조 조장님 : " + students[1][3]);
                    System.out.println("3조 조장님 : " + students[2][2]);
                    System.out.println("4조 조장님 : " + students[3][2]);
                    // 오늘의 주인공
                    int row = (int)(Math.random()*students.length);
                    int col = (int)(Math.random()*students[row].length);
                    
                    System.out.println("오늘의 주인공 : " + students[row][col]);
                }        
                
            }
            ```
        * 출력
            ```
            { 김현욱, 허은열, 이유동, 박용민 }
            { 백인환, 박서영, 백다래, 이두희 }
            { 신재웅, 오상훈, 박대진, 정재송, 이동근 }
            { 이명균, 전민식, 이한별, 강나래 }
            반장님 : 박대진
            부반장님 : 박용민
            1조 조장님 : 박용민
            2조 조장님 : 이두희
            3조 조장님 : 박대진
            4조 조장님 : 이한별
            오늘의 주인공 : 백다래
            ```
## 스스로 해보기
* 극장좌석 예매 시스템 구현하기
    * 문제 상세
        ```
        극장좌석 예매시스템 구현하기
            1   2   3   4   5   6   7   8   9   10
           11  12  13  14  15  16  17  18  19   20
           21  22  23  24  25  26  27  28  29   30
           31  32  33  34  35  36  37  38  39   40
           41  42  43  44  45  46  47  48  49   50
           51  52  53  54  55  56  57  58  59   60  
        영화관 좌석을 선택하세요 (1~60) >>
        1 예약된 좌석은 X로 표시
        2 예약된 좌석을 예매하려고 할 때 
        '이미예매되었습니다'라는 메시지 출력하고 
        다른 좌석을 선택하도록 유도한다
        ```
    * 소스코드
        ```java
        package com.kh.array;
        /**
        * 2019.10.29 Java SW Engineering Course
        * 좌석 예약 시스템
        * @author Hyeonuk
        */
        import java.util.Scanner;

        public class SeatPlanner {
            /**
            * 좌석현황 배열
            */
            static boolean[][] reservedSeats = new boolean[6][10];
            /**
            * 좌석현황 출력하기
            */
            static void printStateOfAllSeats () {
                System.out.println("---------------좌석 현황----------------");
                System.out.println("|| [ X] : 이미 예약된좌석             ||");
                System.out.println("|| [수] : 좌석의 번호                 ||");
                System.out.println("----------------------------------------");

                for(int row=0; row < reservedSeats.length ; row++) {
                    for(int col=0; col < reservedSeats[row].length ; col++) {
                        if(reservedSeats[row][col])
                            System.out.printf("[%2s]","X");
                        else 
                            System.out.printf("[%2d]",row*reservedSeats[row].length+col+1);
                    }
                    System.out.println();
                }
            }
            /**
            * seatNum로 부터 row를 구한다.
            * @param seatNum "실제 좌석 번호" - 1
            * @return 구해진 row (0부터 시작)
            */
            static int getRow(int seatNum) {
                return seatNum/reservedSeats[0].length;
            }
            /**
            * seatNum로 부터 col를 구한다.
            * @param seatNum "실제 좌석 번호" - 1
            * @return 구해진 col (0부터 시작)
            */
            static int getCol(int seatNum) {
                return seatNum%reservedSeats[0].length;
            }
            /**
            * 좌석을 예약합니다.
            * @param row (0부터 시작)
            * @param col (0부터 시작)
            */
            static void reserveSeat(int row, int col) {
                reservedSeats[row][col] = true;
            }
            /**
            * 좌석의 예약여부확인
            * @param row (0부터 시작)
            * @param col (0부터 시작)
            * @return 이미예약되었으면 true
            */
            static boolean isReservedSeat(int row, int col) {
                return reservedSeats[row][col];
            }
            public static void main(String[] args) {
                Scanner scan = new Scanner(System.in);
                
                while(true) {			
                    printStateOfAllSeats();
                    System.out.print("예매하실 좌석을 선택하세요 (1~60) >>");			
                    String tmp = scan.nextLine();
                    if(tmp.equals("X"))
                        break;
                    tmp = tmp.trim();
                    int seatNum = Integer.parseInt(tmp)-1;
                    int row = getRow(seatNum);
                    int col = getCol(seatNum);
                    if(isReservedSeat(row, col)) {
                        System.out.println("\n이미 예약된 좌석입니다.\n다른 좌석을 선택해 주세요.\n");
                    } else {
                        reserveSeat(row,col);
                        System.out.printf("%d번 좌석(%d행 %d열)이 성공적으로 예약되었습니다. %n좌석표를 확인해주시길바랍니다.%n",seatNum+1,row+1,col+1);
                    }
                    
                }
                System.out.println("종료되었습니다.");

            }

        }

        ```
    * 선생님 코드
        ```java
        package com.kh.array;

        import java.util.Scanner;

        public class Array2Exam3 {

            public static void main(String[] args) {		
                String[][] seats = new String[6][10];
                int num = 0;
                for(int i=0 ; i < seats.length ; i++) {
                    for(int j=0 ; j < seats[i].length ; j++) {
        //				System.out.printf("seats[%d][%d]=%3s%n",i,j,seats[i][j]);
        //				seats[i][j] = "" + ++num;
                        seats[i][j] = String.valueOf(++num);
                    }			
                }
                
                do {
                    System.out.printf("%19s%n","<<영화관 좌석 예매 시스템>>");
                    System.out.println("==============================");
                    for(int i=0 ; i < seats.length ; i++) {
                        for(int j=0 ; j < seats[i].length ; j++) {
                            System.out.printf("%3s",seats[i][j]);
                        }			
                        System.out.println();
                    }
                    System.out.println("==============================");
                    System.out.print("영화관 좌석을 선택하세요(1~60) >> ");
                    
                    Scanner scanner = new Scanner(System.in);
                    int mySeat = Integer.parseInt(scanner.nextLine());
                    
                    
                    int myRow = (mySeat % 10 == 0) ? (mySeat/10)-1 : (mySeat/10);
                    int myCol = (mySeat % 10 == 0) ? 9 : (mySeat%10)-1;
                    
                    if(seats[myRow][myCol].equals("X")) {
                        System.out.println("이미 예약된 좌석입니다.");
                    }else {
                        seats[myRow][myCol] = "X";
                        System.out.printf("고객님은 %s%s번 좌석을 예매하셨습니다.%n",myRow,(myCol+1));
                    }			
                }while(true);
                
            }
        }
        ```
    * `String.valueOf()` 
        * 기본타입의 값을 문자열로 바꾸어줌!
    
* 배열에  X자로 '`*`'(아스트릭스)문자 넣기
    * 문제 상세 
        ```
        배열의 알맞은 위치에 '*'를 넣고 아래와 같이 출력
        *   *
         * *   
          *  
         * * 
        *   *
        ```
    * 소스코드
        ```java
        package com.kh.array;
        /**
        * 2019.10.29 Java SW Engineering Course
        * X 모양으로 별찍기
        * @author Hyeonuk
        */
        public class StarPrinter {
            public static void main(String[] args) {
                
                int n=5; // X의 크기
                char [][] starArr = new char[n][n];		
                for(int i=0;i<n;i++) {			 
                    for(int j=0;j<n;j++) {
                        if(i==j) {
                            starArr[i][j] = '*';
                        }
                        if(n-1 == i+j){
                            starArr[i][j] ='*';
                        }
                            
                    }
                }
                // 출력
                for(int i=0;i<n;i++) {
                    System.out.println(starArr[i]);
                }
                
            }
        }

        ```
* 계산기 만들기 풀이(어제과제) 
    * 선생님 코드 
        ```java
        package com.kh.array;

        public class MainStringArrayParam3 {
            public static void main(String[] args) {
                double result = 0.0;

                // 1) 실행 매개값 갯수 체크
                if (args.length != 3) {
                    System.out.println("매개값 3개가 필요합니다.");
                    System.exit(0);
                }
                // 2) 연산자 유효성 체크
                if(!checkOperator(args[1])) {
                    System.out.println("4칙연산자 아닙니다.");
                    System.out.println("프로그램 종료!");
                    System.exit(0);
                }	

                // 3) 피연산자 정수유무 체크		 
                if (!checkOperand(args[0]) || !checkOperand(args[2]) ) {
                    System.out.println("피연산자는 숫자이어야합니다.");
                    System.out.println("프로그램 종료!");
                    System.exit(0);
                }

                System.out.println("유효성 체크 통과!!");

                // 4) 연산 수행
                int num1 = Integer.parseInt(args[0]);
                int num2 = Integer.parseInt(args[2]);
                double resultValue = 0.0; // 4칙연산 결과를 저장하는 변수
                switch (args[1]) {
                // 덧셈
                case "+":
                    resultValue = add(num1, num2);
                    break;
                // 뺄셈
                case "-":
                    resultValue = minus(num1, num2);
                    break;
                // 곱셈
                case "x":
                case "X":
                    resultValue = multi(num1, num2);
                    break;
                // 나눗셈
                case "/":
                    resultValue = divide(num1, num2);
                    break;
                default:
                    System.out.println("4칙연산자 아닙니다.");
                    System.out.println("프로그램 종료!!");
                    System.exit(0);
                }
                // 5) 연산결과 출력하기
                System.out.printf("%d %s %d = %.2f%n",num1,args[1], num2,resultValue);
            }
            /**
            * 4칙 연산자(+,-,x,X,/) 유효성 체크
            * @param string 연산자
            * @return 4칙연산자이면 true
            */
            private static boolean checkOperator(String string) {
                // 1개의 문자인지 체크, 그리고 +,-,x,/에 해당하는 문자인지 체크
                boolean flag = false;
                if (string.length() == 1) {
                    switch (string) {
                    case "+": case "-": case "x": case "X": case "/":
                        flag = true;
                        break;
                    default:
                        break;
                    }
                }
                return flag;
            }
            /**
            * 숫자인지 체크
            * @param string 숫자인지 체크할 대상
            * @return 숫자면 true 
            */
            private static boolean checkOperand(String string) {
                // 1문자씩 읽어 들여서 모든 자릿수가 0~9 범위내에 포함되는지
                boolean isOperand = false;
                for (char ch : string.toCharArray()) {
                    if (ch >= '0' && ch < '9') {
                        isOperand = true;
                    } else {
                        isOperand = false;
                        break;
                    }
                }
                return isOperand;
            }
            /**
            * 나눗셈연산
            * @param num1 피연산자1
            * @param num2 피연산자2
            * @return 나눗셈 결과
            */
            private static double divide(int num1, int num2) {		// 
                return (double) num1 / num2;
            }

            /**
            * 곱셈연산
            * @param num1 피연산자1
            * @param num2 피연산자2
            * @return 곱셈 결과
            */
            private static double multi(int num1, int num2) {
                return num1 * num2;
            }

            /**
            * 뺄셈연산
            * @param num1 피연산자1
            * @param num2 피연산자2
            * @return 뺄셈결과
            */
            private static double minus(int num1, int num2) {
                return num1 - num2;
            }

            /**
            * 덧셈연산
            * @param num1 피연산자1
            * @param num2 피연산자2
            * @return 덧셈 결과
            */
            private static double add(int num1, int num2) {
                return num1 + num2;
            }
        }

        ```
    * String.toCharArray()
        * String에 대응하는 `char[]`배열을 가져온다.
    * 자동 형변환 유의할 것
## 이클립스 팁
* 메소드 찾기
    1. 해당 메소드에 마우스커서를 놓고 `ctrl`키
    2. openDeclaration 클릭
    * 이후 돌아오기 
        * `alt` + `←`
    * 최근 탐색 메소드 가기
        * `alt` + `→`


[돌아가기](../README.md)