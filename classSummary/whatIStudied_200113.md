# What I studied today.
Date : 2020-01-13

# JSP2.3 & Servlet 3.1
## 과제
1. dynamic web project 생성
2. 화면구현 import
3. 메이븐 프로젝트 전환
    - myweb => maven 프로젝트 전환
4. pom.xml
    - ojdbc8 드라이버
    - jstl 1.2
    - dbcp2
5. 풀링 리소스 등록
    - WebContent/META-INF/context.xml
    - context.xml 추가
6. 풀링 리소스 참조
    - WebContent/WEB-INF/web.xml
    - Web.xml에 resource-ref 추가
7. 커넥션 반입 / 반출
    - com.kh.common.Dbcon
8. 풀링 테스트
    - com.kh.db.PoolTest.java
9. db계정 생성 
    - myweb/myweb
    - ```sql
        create user myweb identified by myweb;
        grant connect, resource, plustrace, alter session to myweb;
        ```
10. 회원테이블 생성
11. 회원가입 서블릿 작성
12. postman 으로 회원가입 테스트
13. memberJoin.jsp 완성하기
    - 생년월일 추가
## context path 변경하기
- server의 server.xml내 context 태그를 수정함

[돌아가기](../README.md)  
[2020-01-10](whatIStudied_200110.md)  
[2020-01-14](whatIStudied_200114.md)  


