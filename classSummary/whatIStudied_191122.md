# What I studied today.
Date : 2019-11-22

# JAVA
## 예외처리 정리
* 예외처리(Exception Handling)
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
* 제너릭(Generic)
    * 정의
        * 클래스, 인터페이스, 메소드 내부에서 사용할 데이터 타입을 파라미터화 해서  
        외부에서 지정하고 컴파일 시 구체적인 타입이 결정되도록 지원하는 문법
    * 이점
        * 제너릭타입 변수 선언시 
            * 컴파일 시점에 타입오류 방지
        * 제너릭타입 변수 사용시
            * 강제 형변환 과정이 불필요하며 프로그램 성능향상에 기여
* 제너릭 타입 파라미터 제한
    * extends 상위타입(클래스,인터페이스) : 상위타입 이하로 타입 제한
    * super는 사용불가
* 제너릭 메소드
    * 리턴타입 앞에 다이아몬드 연산자를 사용해서 외부에서 파라미터 타입을 결정하며  
    메소드의 리턴타입과 매개변수에 사용하는 메서드
* 제너릭 메서드 타입 파라미터 제한
    * extends 상위타입(클래스, 인터페이스) 
        * 상위 타입 이하로 타입 제한
    * super 하위타입(클래스, 인터페이스) 
        * 하위 타입 이하로 타입 제한
* 와일드 카드 타입
    * 이미 선언되어 있는 제너릭 타입을 매개변수나 리턴 타입으로 사용할 때
    타입 파라미터를 제한할 목적으로 사용
    ```java
    // 제너릭 타입<?> : 제한없음
    public static void registerCourse(Course<?> course) {}

    // 제너릭 타입<? extends 상위타입>
    public static void registerCourse(Course<? extends Student> course) {}

    // 제너릭 타입<? extends 하위타입>
    public static void registerCourse(Course<? super Student> course) {}
    ```
### 제너릭 예시
* 예시1 (제너릭을 사용하지 않을 경우)
    * ```java
        public class Apple {

        }

        public class Box {
            private Object object;

            public Object getObject() {
                return object;
            }

            public void setObject(Object object) {
                this.object = object;
            }
        }

        public class BoxMain {
            public static void main(String[] args) {
                Box box = new Box();
                box.setObject("홍길동");
                
                String name = (String)box.getObject();
                
                box.setObject(new Apple());
                
                Apple apple = (Apple)box.getObject();
            }
        }
        ```
* 예시1 (제너릭을 사용하지 않을 경우)
    * ```java
        public class Apple {

        }
        // <> 다이아몬드 연산자
        public class Box <T> {
            private T object;
            
            public T getObject() {
                return object;
            }
            
            public void setObject(T object) {
                this.object = object;
            }
        }
        public class BoxMain {
            
            // 피호출자 : 파라미터(parameter) = 매개변수 = 인수
            // 호출자 : 아규먼트(argument) = 매개값 = 인자 
            public static void main(String[] args) {
                
                Box<String> box = new Box<String>();
                
                
                box.setObject("홍길동");
                String name = box.getObject();
                System.out.println(name);
                
                Box<Integer> box2 = new Box<Integer>();
                box2.setObject(44);
                System.out.println(box2.getObject());
                
                Box<Apple> box3 = new Box<Apple>();
                box3.setObject(new Apple());
                System.out.println(box3.getObject());
            }
        }

        ```
* 와일드카드 예시
    * ```java
        public class Person {
            // 멤버 필드
            private String name;

            public Person(String name) {
                this.name = name;
            }

            public String getName() {
                return name;
            }

            @Override
            public String toString() {
                return "Person [name=" + name + "]";
            }

        }
        public class Worker extends Person{
            public Worker(String name) {
                super(name);
            }

        }
        public class Student extends Person {
            public Student(String name) {
                super(name);
            }
        }

        public class HighStudent extends Student{

            public HighStudent(String name) {
                super(name);
                // TODO Auto-generated constructor stub
            }
            
        }
        public class Course<T> {
            private String name;
            private T[] students;
            @SuppressWarnings("unchecked")
            private T test = (T) new Object();
            private T test2 = (T) new String();
            @SuppressWarnings("unchecked")
            public Course(String name, int capacity) {
                this.name = name;
        //		students = new T[capacity];
                students = (T[]) new Object[capacity];
            }
            public String getName() {return name;}
            @SuppressWarnings("unchecked")
            public T[] getStudents() {
                return students;
        //		return null;
            }
            
            public void add(T t) {
                for(int i= 0; i< students.length;i++) {
                    if(students[i] == null) {
                        students[i] = t;
                        break;
                    }
                }
            }
        }
        public class WildCardMain {
            // Course 제너릭 타입인 인스턴스 다됨
            public static void registerCourse(Course<?> course) {
                System.out.println(course.getName() + " 수강생: "+Arrays.toString(course.getStudents()));
            }
            // Course 제너릭 타입인 인스턴스 중 Student와 Student 자손은 다 됨
            public static void registerCourseStudent(Course<? extends Student> course) {
                System.out.println(course.getName() + " 수강생: "+Arrays.toString(course.getStudents()));
            }
            // Course 제너릭 타입의 인스턴스 중 Student와 Student 자손은 다 됨
            public static void registerCourseWorker(Course<? super Worker> course) {
                System.out.println(course.getName() + " 수강생: "+Arrays.toString(course.getStudents()));
            }
            public static void main(String[] args) {
                Course<Person> personCourse = new Course<Person>("일반과정", 5);
                personCourse.add(new Person("일반인"));
                personCourse.add(new Worker("직장인"));
                personCourse.add(new Student("학생"));
                personCourse.add(new HighStudent("고등학생"));

        //		Object[] person = personCourse.getStudents();
        //		for(Object p: person) {
        //			System.out.println(p);
        //		}
                Course<Worker> workerCourse = new Course<>("직장인 과정", 5);
                workerCourse.add(new Worker("직장인"));
        //		workerCourse.add(new Person("직장인척 하는 사람"));

                Course<Student> studentCourse = new Course<>("학생 과정", 5);
                studentCourse.add(new Student("학생"));
                studentCourse.add(new HighStudent("고등학생"));
                
                Course<Student> highStudentCourse = new Course<>("고등학생 과정", 5);
        //		studentCourse.add(new Student("학생"));
                studentCourse.add(new HighStudent("고등학생"));

                registerCourse(personCourse);
                registerCourse(workerCourse);
                registerCourse(studentCourse);
                registerCourse(highStudentCourse);
                
                registerCourseStudent(studentCourse);
                registerCourseStudent(highStudentCourse);
                
                registerCourse(personCourse);
                registerCourse(workerCourse);
            }
        }
        ```

###  parameter와 argument
* 피호출자 : 파라미터(parameter) = 매개변수 = 인수
* 호출자 : 아규먼트(argument) = 매개값 = 인자 
### 자바의 타입
* 기본타입 (8가지)
* 참조타입
    * 자바표준 라이브러리
    * 서드파티 라이브러리 (제3자)
    * 사용자 정의 라이브러리
* 제너릭 타입 클래스
* 
## 이클립스 팁
* `ctrl`+`t` 
    * 클래스의 상속구조를 트리형태로 볼 수 있음


# Database
## DB 용어 정리
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
- ERD(Entity-Relationship Diagram) 
    > 테이블 간의 관계를 표준화된 기호로 도식화한 그림
- 릴레이션 : 테이블
- 릴레이션쉽(relationship) : 테이블 간의 관계
- 스키마 : 테이블 구조(속성, 자료타입)
- 인스턴스 : 테이블 구조로 저장된 데이터
- 키 : 튜플(행, 레코드)를 식별하는 속성, 속성 집합
    - 슈퍼키 : 튜플(행, 레코드)를 식별하는 속성, 속성 집합의 모든 경우의 수
    - 후보키 : 슈퍼키 중 최소 속성집합
    - 기본키 : 릴레이션의 대표키로 후보키들 중 하나가 될 수 있다.
    - 대체키 : 후보키 중 기본키를 제외한 키 (후보키 - 기본키)
    - 외래키 : 다른 릴레이션 또는 자신의 기본키를 참조하는 속성(도메인이 갈아야한다.)
    - 대리키 : 현재 릴레이션에 적당한 기본키가 없을때 가상의 속성을 만들어 선정되는 기본키(ex: 일련번호)
- 복합키 : 2개 이상의 속성으로 조합된 키
- 데이터 무결성 : 데이터베이스에 정장된 데이터의 일관성과 정확성을 유지시키는 성질
    1. 도메인 무결성 :
        - 릴레이션(table)에 정의된 속성(column)이 가질 수 있는 값의 범위  
        - SQL문에서 데이터타입(number,varchar2),길이, 널(null, not null), 기본값(default),체크(check) 등을 사용
    2. 개체 무결성
        - 릴레이션 내에서 동일한 튜플(행, row, 레코드)을 가질 수 없다.
        - 기본키 제약을 두어야 한다.
    3. 참조 무결성
        - 자식 릴레이션의 외래키는 부모 릴레이션의 기본키와 도메인이 동일해야하고  
         자식 릴레이션의 값이 변경될 때 부모 릴레이션의 제약을 받는다.
            - ex) 부서테이블과 사원 테이블 관계에서 부서 테이블에 부서코드 컬럼에 없는 값을 사원테이블에서 할당하고자 할 때
        - 외래키 제약
- 뷰(view) 
    - 정의 
        - 하나 이상의 물리적인 테이블을 병합하여 만든 가상의 테이블
    - 이점 
        - 편리성 및 재상용성
            - 복잡한 질의를 뷰로 정의해 놓고 질의를 간단히 사용할 수 있음
        - 보안성
            - 필요한 속성만을 선별하여 보여줄 수 있음
        - 독립성 
            - 원본 테이블 구조가 변하더라도 응용에 영향을 주지 않음
## 인덱스

# 기타
## 궁금한 점
* 왜 Generic 타입으로 캐스팅하는 것은 다 허용되는가?
    * ```java
        private T test = (T) new Object(); //컴파일 됨
        ```
    * https://docs.oracle.com/javase/specs/jls/se8/jls8.pdf
        * 4.3 Reference Types and Values
        * 4.5 Parameterized Types
        * 5.5 Casting Contexts
        * 4.8 Raw Types        
        * 5.1.9 Unchecked Conversion
        * 9.1.2 Generic Interfaces and Type Parameters
    * http://happinessoncode.com/2018/02/08/java-generic-raw-type/
    * [자바 제네릭 배열 질문](https://okky.kr/article/400566)
    * Type erasure와 관련이 있는가?
        * [자바의 제네릭 (Generic)](http://wonwoo.ml/index.php/post/1743)
        * [제네릭 타입을 애용하자](https://brunch.co.kr/@oemilk/143)
        * [type eraser](https://medium.com/asuraiv/java-type-erasure%EC%9D%98-%ED%95%A8%EC%A0%95-ba9205e120a3)



[돌아가기](../README.md)  
[2019-11-21](whatIStudied_191121.md)  
[2019-11-25](whatIStudied_191125.md) 