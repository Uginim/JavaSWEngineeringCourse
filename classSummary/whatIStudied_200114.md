# What I studied today.
Date : 2020-01-14

# JSP2.3 & Servlet 3.1
## 로그인/로그아웃 구현
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
## 웹 개발 환경
- Web Server
    - URL을 매칭함
    - 정적문서 제공
- Web container
    - JSP/Servlet이 구동되는 환경
    - JSP를 Servlet으로 변환함
    - 동적문서를 제공함
- WAS(Web Application Server)
    - Tomcat 
- DTO(Data Transfer Object) 
    - 다른 계층에 데이터 전송을 위한 데이터 저장 객체
- DAO(Data Access Object)
    - 데이터베이스 연동작업을 수행하는 객체
- Controller
    - 클라이언트의 요청을 받아 Command객체에 전달하고 처리된 결과를 클라이언트에 전달하는 역할을 수행하는 객체
- Command 객체
    - 클라이언트의 요청을 실제로 수행하는 로직이 담겨있는 객체
## MVC1
- 특징
    - 뷰(VIEW)와 컨트롤러(Controller)가 같이 있는 형태
    - 컨트롤러와 뷰가 혼재됨
- 장점
    - 개발기간이 짧은 소규모 프로젝트나, 변경사항이나 요구사항이 적을 경우 빠르게 개발할 수 있다.
- 단점
    - 재활용성이 ㄸ러어지고 시간이 지날수록 유지보수 비용이 많이 든다.
## MVC2
- 특징
    - Model,view, Controller가 각각 모듈화 되어 있는 형태
    - 모든 request는 Front Controller에서 처리되며 작업별로 분기되어 처리됨
- 장점
    - 재사용성이 높고 확장성이 용이하다.
    - 모듈별로 업무분장이 용이하다.
- 단점
  - 개발 초기에는 부하(인력/시간)가 비교적 높다.
  - 아키텍처에 대한 수준 높은 이해를 요구한다.
## 개발 요구사항
|기능|요청URL|파라미터|요청방식|사용자화면|서비스|DAO|화면이동|
|---|---|---|---|---|---|---|---|
|회원가입|	/member/joinForm.do|	|GET|	/member/JoinForm.jsp|	|||		
|회원가입처리|	/member/join.do|	MemberDTO|	POST|	|	|MemberSVCImpl|	MemberDAOImpl|	/member/loginForm.do|
|회원목록|	/admin/memberList.do|		|GET|	|/admin/memberList.jsp|	MemberSVCImpl|	MemberDAOImpl|	|
|회원수정|	/member/modifyForm.do|		|GET|	/member/modifyForm.jsp| | | |			
|회원수정처리|	/member/modify.do|	id|	POST||		|MemberSVCImpl|	MemberDAOImpl|	/|
|회원탈퇴|	/member/outForm.do|		|GET|	/member/outForm.jsp|	|	|	|
|회원탈퇴처리|	/member/out.do|	id|	POST|		|MemberSVCImpl|	MemberDAOImpl|	/|
|회원조회|	/member/select.do|	id|	GET|	/member/selectForm.jsp|	MemberSVCImpl|	MemberDAOImpl|	|
|로그인|	/member/loginForm.do|		|GET|	/member/loginForm.jsp|	|	|	|
|로그인처리|	/member/login.do|	id,pw|	POST|		|MemberSVCImpl|	MemberDAOImpl|	/|
|로그아웃|	/member/logout.do	|id|	GET|	|	|	|	/|

[돌아가기](../README.md)  
[2020-01-13](whatIStudied_200113.md)  
[2020-01-15](whatIStudied_200115.md)  


