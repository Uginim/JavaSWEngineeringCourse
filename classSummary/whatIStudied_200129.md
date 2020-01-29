# What I studied today.
Date : 2020-01-29

# Spring
## JUnit
### 사용 패키지
```java

import static org.junit.jupiter.api.Assertions.assertNotNull; // assertNotNull() 사용 가능

import org.junit.jupiter.api.Test; // @Test 어노테이션 사용가능
import org.junit.jupiter.api.extension.ExtendWith;

import org.slf4j.Logger; // Logger 
import org.slf4j.LoggerFactory; // Logger 객체 생성을 위한 팩토리 클래스
```
### JUnit 실습 코드


## 테스팅
- 초창기
    - "코딩작업의 일부"
- 현재
    - "결함을 발견하는 행위"
### 테스팅 용어
- Error(오류)
    - Mistake = Related to Human    
- Defect(결함) / Fault(결점)
    - Related to Product
    - Bug = Slang for Defect
- 실패(Faliure) / 문제(Problem)
    - 제품의 결함이 있는 부분이 실행될 때 발생되는 현상을 말한다.
## project lombok
- 어노테이션을 사용해서 DTO,VO등의 객체에 setter,getter,constructor등을 자동생성 
- toString도 만들어줌   
### lombok 설치하기
1. lombok 라이브러리 설치경로 들어가기
    1. Maven Dependancies에서 lombok jar파일의 properties 창을 열음
    2. properties창에서 external file 열기 
2. 설치경로에서 lombok installer 실행
3. specify location으로 sts경로 찾은뒤 install/update 클릭
4. 이후 sts 종료후 실행(재시작으론 안될 때가 있음)
### getter setter 자동 생성하기
- 자동생성할 클래스에 `@Data` 어노테이션을 class에 붙인다.
- source code 
    ```java
    package com.kh.portfolio.member.vo;

    import java.sql.Date;
    import java.sql.Timestamp;

    import lombok.Data;

    @Data
    public class MemberVO {
        private String id; // 아이디(이메일
        private String pw; // 비밀번호
        private String tel; // 전화번호
        private String nickname; // 별명
        private String gender; // 성별('남','여')
        private String region; // 지역
        private Date birth; // 생년월일
        private Timestamp cDate; // 생성일시
        private Timestamp uDate; // 변경일시
    }
    ```
## 기타
- 스프링에서 Context라는 용어는 Spring 컨테이너(?)를 뜻한다.

<br><br><hr>

[돌아가기](../README.md)  
[2020-01-28](whatIStudied_200123.md)  
[2020-01-30](whatIStudied_200129.md)  


