# What I studied today.
Date : 2019-11-05
## 배열
### 향상된 for문
* 배열과 컬렉션에 저장된 요소에 접근할 때 편리
* JDK1.5부터 추가됨
* 기본형태 
    ```java
    for( 타입 변수명(배열의요소) : 배열 또는 컬렉션) {
        // 반복되는 로직
    }
    ```
* for문 기본형 vs 향상된 for문
    ```java
    int[][] scores =    { { 10, 10, 10}
                        , { 20, 20, 20}
                        , { 30, 30, 30}
                        , { 40, 40, 40}
                    };
    // 기본 for문
    System.out.println("국어 영어 수학");
    for(int i=0;i < scores.length;i++) {    
        for(int j=0;j < scores[i].length;j++) {
            System.out.printf("%3d ", score[i][j]);
        }
        System.out.println();
    }
    System.out.println("------------------");

    // 향상된 for 문
    System.out.println("국어 영어 수학");
    for (int[] row : scores) {     
        for (int score : row ) { 
            System.out.printf("%3d", score) ;
        } 
        System.out.println();
    } 
    System.out.println("------------------");
    ```
### 2차원 배열을 사용해서 구구단 출력하기
* 일반 for문
    ```java    
    import java.util.Scanner;
    /**
    * 2차원 배열을 사용해서 구구단을 출력하기 
    * @author Hyeonuk
    */
    public class MyArray2For {
        public static void main(String[] args) {
            final int MAX_ROW = 9;
            final int MAX_COL = 5;
            final int COL_OP1 = 0;
            final int COL_MULTI_SIGN = 1;
            final int COL_OP2 = 2;
            final int COL_EQUAL_SIGN = 3;
            final int COL_RESULT= 4;
            String input;
            Scanner scan = new Scanner(System.in);
            String[][] results = new String[MAX_ROW][MAX_COL];
            System.out.print("몇 단을 출력할까요>>");
            input = scan.nextLine();
            int dan = Integer.parseInt(input);
            for(int i= 0;i< results.length;i++) {
                for(int j=0;j< results[1].length;j++) {
                    switch(j) {
                    case COL_OP1:
                        results[i][j]=dan+"";
                        break;
                    case COL_MULTI_SIGN:
                        results[i][j]=" * ";
                        break;
                    case COL_OP2:
                        results[i][j]=(i+1)+"";
                        break;
                    case COL_EQUAL_SIGN:
                        results[i][j]=" = ";
                        break;
                    case COL_RESULT:
                        results[i][j]=(dan*(i+1))+"";
                        break;
                    }
                }
            }
            System.out.printf("%d단출력%n",dan);
            for(int i =0;i<results.length;i++) {
                for(int j=0;j<results[i].length;j++) {
                    System.out.print(results[i][j]);
                }
                System.out.println();
            }		
        }
    }
    ```
* 향상된 for문 사용
    ```java        
    import java.util.Scanner;
    /**
    * 2차원 배열을 사용해서 구구단을 출력하기
    * 1. 사용자로부터 단수 입력받기
    * 2. 향상된 중첨 for문 사용
    * 향상된 for문 사용
    * @author Hyeonuk
    */
    public class MyArray2For2 {

        public static void main(String[] args) {
            final int MAX_ROW = 9;
            final int MAX_COL = 5;
            final int COL_OP1 = 0;
            final int COL_MULTI_SIGN = 1;
            final int COL_OP2 = 2;
            final int COL_EQUAL_SIGN = 3;
            final int COL_RESULT= 4;
            String input;
            Scanner scan = new Scanner(System.in);
            String[][] results = new String[MAX_ROW][MAX_COL];
            System.out.print("몇 단을 출력할까요>>");
            input = scan.nextLine();
            int dan = Integer.parseInt(input);
            int i=0,j=0;
            for(String[] row : results) {
                for(String col : row) { // col 안씀
                    switch(j) {
                    case COL_OP1:
                        results[i][j]=dan+"";
                        break;
                    case COL_MULTI_SIGN:
                        results[i][j]=" * ";
                        break;
                    case COL_OP2:
                        results[i][j]=(i+1)+"";
                        break;
                    case COL_EQUAL_SIGN:
                        results[i][j]=" = ";
                        break;
                    case COL_RESULT:
                        results[i][j]=(dan*(i+1))+"";
                        break;
                    }
                    j++;
                }
                i++;j=0;
            }
            System.out.printf("%d단출력%n",dan);
            for(String[] row : results) {
                for(String str : row) {
                    System.out.print(str);
                }
                System.out.println();
            }		
        }
    }
    ```

## 문자열/문자를 정수형으로 변환
* 숫자를 나타내는 문자들 '0'~'9'까지의 문자들은, 유니코드 값이 연속된다.
    * |문자|정수형값|
        |---|---|
        |'0'|48|
        |'1'|49|
        |'2'|50|
        |'3'|51|
        |'4'|52|
        |'5'|53|
        |'6'|54|
        |'7'|55|
        |'8'|56|
        |'9'|57|
* 따라서 **숫자를 나타내는 문자**('0'~'9')의 문자는 '0'을빼면 해당숫자를 의미하는 정수형이 된다.
    * int nine = `9`- `0` // 결과값 정수 9
    * int one = `1`- `0` // 결과값 정수 1
    * int zero = `0`- `0` // 결과값 정수 0
* 이러한 특성으로 문자형/문자열로 된 숫자를 정수형으로 변환할 수 있다.

[돌아가기](../README.md)