# What I studied today.
Date : 2019-11-14

# JAVA
## 객체지향 프로그래밍(상속)
1. 상속
    - 상위 객체의 속성(멤버)가 하위 개체에 물려짐(단일상속만 허용, extends) 
    - 목적 
        - 재사용(기존 소프트웨어의 설계, 구현, 테스트에 투입된 시간, 노력을 용)
        - 기존 클래스의 필드와 메소드를 그대로 상속받아 사용할 수 있다.
        - 수정할 필요가 있는 멤버는 재정의해서 사용한다.(멤버 필드의 재정의는 비권장)        
    - 관계
        - IS-A 관계
    - `final` 키워드가 붙으면 확장을 못함
2. 재정의
    - 정의 
        - 부모 메소드 구현부를 새로이 정의해서 사용하는 개념
    - 전제조건 
        - 부모 메소드의 선언부(리턴타입, 메소드이름, 매개변수)가 동일해야한다.
        - 접근제한자는 부모메소드와 동일하거나 범위가 넓어야한다.
    - `@Overriding` : 부모클래스의 메소드 선언부를 검색하여 일치하지 않으면  오류를 발생시켜 개발자에게 알려줌
3. `final` 키워드
    1. 용례
        *`final` + `인스턴스멤버필드` 
           * 인스턴스별로 인스턴스별로 사용되는 상수
        * `final` + `정적멤버필드` 
            * 클래스별로 사용되는 상수
        * `final` + `멤버메소드` 
            * 자식클래스에서 재정의 금지
        * `final` + 클래스
            * 자식클래스를 가질 수 없다.
            * 부모클래스를 가질 수 없다.
## 접근제한자 
- `private` 
    - 같은 클래스 내에서만 접근가능
- default *(default라는 키워드는 없다)*
    - 같은 클래스 + 동일 패키지
- `protected`
    - default(같은 클래스 + 동일 패키지) + 다른 패키지라 하더라도 상속관계 객체는 허용
- `public`
    - 어디서든 접근가능
## `import`
- 다른 패키지의 클래스에 접근하려면 `import`해주어야한다.
## 부모클래스의 기본생성자가 없어질 때 오류가 나는 이유
p332
> - Object 클래스를 제외한 모든 클래스의 생성자 첫 줄에 생성자, this() 또는 super(),를 호출해야함
> - 그렇지 않으면 컴파일러가 자동적으로 `super();`를 생성자의 첫 줄에 삽입

## 과제 9) 주사위 게임
> 요구사항 : 라이브러리 클래스 2개를 구현! (Dice.java, PairDice.java)
>			실행 클래스 1개 구현! (DiceGameMain.java)
>
> [주사위 게임]
> 1. 2명의 플레이어가 게임을 한다.
> 2. 한명씩 번갈아가며 주사위를 2번 던진다.
> 3. 나온 주사위의 합이 높은 사람이 이긴다. 단, 점수의 합이 10을 넘으면 패배한다.
> 4. 두 플레이어의 점수의 합이 같거나 둘다 10이 넘어 패배할 경우, 게임을 다시 시작한다.
* 소스코드
    * Dice.java
    * ```java
        package com.kh.quiz2;
        /**
        * 2019.11.14 Java SW Engineering Course
        * @author Hyeonuk
        */
        public class Dice {
            private int number; // 주사위의 현재면
            private final int MAX = 6;
            
            // 주사위 굴리기
            public void castDice() {
                number = (int)(Math.random()*MAX)+1;
            }

            // 주사위값 반환
            public int getNumber() {
                return number;
            }
            

        }

        ```
    * PairDice.java
    * ```java
        package com.kh.quiz2;
        /**
        * 2019.11.14 Java SW Engineering Course
        * @author Hyeonuk
        */
        public class PairDice {
            Dice[] dices ;
            {
                dices = new Dice[2];
                dices[0] = new Dice();
                dices[1] = new Dice();
            }
            public void castTwoDices() {
                for(Dice dice : dices) {
                    dice.castDice();
                }
            }
            public int getSum() {
                return dices[0].getNumber() + dices[1].getNumber();
            }
            
            // 두개의 주사위중 하나의 결과반환
            public int getDiceNumber(int which) {
                if( which<1||2<which) {
                    System.out.println("잘못된 주사위 번호\n1이나2를 입력해주세요");
                    return -1;
                }else {
                    return dices[which-1].getNumber();
                }	
                    
            }
            
            @Override
            public String toString() {
                return String.format("두 주사위의 결과:%n첫번째주사위:[%d]%n두번째주사위:[%d]%n합계:%d %n"
                        ,dices[0].getNumber()
                        ,dices[1].getNumber()
                        ,getSum());
            }
            
            
            
            
        }

        ```
    * PairDice.java
    * ```java
        package com.kh.quiz2;
        /**
        * 2019.11.14 Java SW Engineering Course
        * @author Hyeonuk
        */
        import java.util.Scanner;

        public class DiceGameMain {
            class PlayerResult {
            
            }
            public static void main(String[] args) {		
                PairDice pairDice= new PairDice();
                System.out.println("주사위게임(2인용)");
                String playerNames[] = new String[2];
                int results[] = new int[2];
                Scanner scan = new Scanner(System.in);
                //플레이어 이름 입력
                System.out.println("첫번째 플레이어 이름을 입력하세요:>>");
                playerNames[0] = scan.nextLine();
                System.out.println("두번째 플레이어 이름을 입력하세요:>>");
                playerNames[1]= scan.nextLine();
                
                
                int round =0; // 대결 회차
                while(true) {
                    System.out.printf("=====%d회차 대결=====%n",++round);
                    
                    for(int i=0;i<playerNames.length;i++) {
                        pairDice.castTwoDices();
                        System.out.printf("%s님이 주사위를 굴립니다:%n%s%n",playerNames[i],pairDice);
                        results[i]= pairDice.getSum();
                    }
                    if(results[0]>10 && results[1]>10) {
                        System.out.println("모두 패배. 재대결!");
                    }
                    // 둘 다 동시에 10 넘어감
                    else if(results[0]>10){
                        System.out.println(playerNames[1]+"님의 승리입니다.");
                        break;
                    }else if(results[1]>10){
                        System.out.println(playerNames[0]+"님의 승리입니다.");
                        break;
                    }
                    //둘 다 10 안넘어감
                    else if(results[0]>results[1] ) {
                        System.out.println(playerNames[0]+"님의 승리입니다.");
                        break;
                    }else if(results[1]>results[0] ) {
                        System.out.println(playerNames[1]+"님의 승리입니다.");
                        break;
                    }
                    //둘이 다른 숫자
                    else {
                        System.out.println("무승부 재대결");
                    }
                }
            }
        }


        ```
# Database
- order절에는 alias 지정된 별칭을 사용해 정렬 가능하지만 having절의 조건을 별칭을 이용해서 지정할 수 없다.
## 용어
* Database 
    > 잘 정리되고 정돈된 데이터의 모음(파일)
    * 정형화 된 데이터
* Database Management System(DBMS) 
    > database에 접근하여 여러 사용자가 데이터를 조작할 수 있게 도와주는 소프트웨어
    * 예시 
        * Oracle 11g
        * MySQL
        * PostgreSQL    
* SQL(Structed Query Language) 
    > DBMS를 경유하여 Database를 CRUD(Create, read, update, delete) 기능을 제공하는 언어
* Query(질의)
    > SQL언어로 DBMS에 요청하는 행위
* SQL Developer Client Tool
    > SQL Query를 보다 편리하게 지원해주는 툴
* Table (표)
    > 행(row, record, tuple), 열(column, field,attribute) 구조로 데이터가 저장되어 있음   
- 관계 데이터 모델의 개념
    - 릴레이션
    - 릴레이션 스키마와 인스턴스
    - 릴레이션의 특징
    - 관계 데이터 모델


[돌아가기](../README.md)  
[2019-11-13](whatIStudied_191113.md)  
[2019-11-15](whatIStudied_191115.md)  