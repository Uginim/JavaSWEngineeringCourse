# What I studied today.
Date : 2020-01-06

# JSP2.3 & Servlet 3.1
## JSP, Servlet
- 자바 언어를 기반으로 한 웹 프로그래밍 기술
- JSP 
    - HTML코드 안에 자바 코드 삽입
- Servlet
    - 자바 클래스 안에 HTML 태그를 포함
- 장점
    - MVC(M:자바, V:JSP, C:Servlet)
- 서버
    - Tomcat, Weblogic, WebSphere 등
- Servlet vs JSP
    - JSP는 서블릿과 동일한 역할을 함
    - 작성되는 코드 스타일이 다름
        - JSP 
            - HTML문서 안에 자바 코드가 스크립트 형식으로 추가됨
        - Servlet
            - 자바코드안에 HTML 태그가 문자열 형식으로 추가됨
- ASP
    - MS
    - 서버 
        - IIS(윈도우 서버계열 OS, Windows 2008)
- PHP
    - 오픈소스
    - 서버
        - APM(Apache, PHP Server, MySQL)
## JSP 필기
1. 웹 컴포넌트(jsp,servlet)에서 정보를 저장하는 객체
	- `page` < `request` < `session` < `application`
	- `pageContext` < `request` < `session` < `application`
2. 데이터 교환포맷
	- xml, json : 플랫폼, 프로그램언어에 독립적이고, 사람이 직관적으로 이해할 수 있다.
	- https://www.json.org/json-en.html
3. 
    1. 정적 : 포함될 파일이 복사 삽입된 후 컴파일
   		- `<%@ include file="" %>`
	2. 동적 : 포함될 파일이 컴파일후 html로 변환되어 삽입됨. 
		- `<jsp:include page=""><?jsp:include>`
<br><br><hr>

[돌아가기](../README.md)  
[2020-01-03](whatIStudied_200103.md)  
[2020-01-07](whatIStudied_200107.md)  


