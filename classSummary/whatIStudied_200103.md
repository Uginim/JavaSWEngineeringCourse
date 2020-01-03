# What I studied today.
Date : 2020-01-03

# JSP2.3 & Servlet 3.1
## 프로젝트 추가하기 
1. 프로젝트 import
	1. import 
    2. Existing projects into Workspace
    3. Browse 버튼눌러서 import할 프로젝트 경로 선택
    4. Copy projects into workspace 체크
2. build path 설정하기
    1. 프로젝트 우클릭 및 build path클릭
    2. library탭 들어가기
    3. JRE System Library 클릭후 edit버튼 클릭
    4. Workspace default JRE 체크 후 finish
    5. 이후 apply
3. project facets 설정하기
	- runtime 환경을 tomcat 9.0으로 설정
## Web어플리케이션 추가하기
1. server view
2. server를 우클릭
3. add and remove 
4. 추가할 어플리케이션을 오른쪽으로 추가하기
## Web Modules
- Web Modules창 열기
    - server view에서 server를 더블클릭하기
    - module탭 클릭
- 각 module들의 path가 표시됨

## WebContent 폴더
- 해당 경로에 있는 파일은 웹모듈 경로에서 바로 접근 가능
## HTTP(Hyper Text Transfer Protocol)
- 웹에서 HTML 문서를 주고 받기 위한 규칙
- connectionless
    - 클라이언트에서 서버에 파일을 요청하면 서버는 응답한 후 연결을 종료시키는 프로토콜
- 이전에 방문한 사용자를 구분 못함.
    - 해결하기 위해 서버는 세션객체를 사용하여 클라이언트의 상태정보를 저장
    - 서버는 응답 시 세션의 고유한 값(세션ID)을 클라이언트에 보내줌
    - 클라이언트는 응답된 내용 중 세션 ID를 쿠키에 저장함
    - 클라이언트는 다음 요청 시 요청 헤더에 세션ID를 넣어 요청함
## 세션과 쿠키
- 쿠키 : 클라이언트에 정보를 저장하기 위한 공간
    - `response.addCookie(new Cookie("key", "value"));`
- 세션 : 클라이언트와 서버의 상태를 유지하기 위한 것
### 쿠키 확인하기
- 크롬 개발자 도구 열기
- Application탭에서 Cookies열기
### web.xml에 세션 타임아웃 설정
- 세션을 유지하는 시간을 지정함
- `<session-config>`태그 내 `<session-timeout>`태그로 값을 설정함
    - '분' 단위
- 예시
	```xml
	<session-config>
		<session-timeout>30</session-timeout>
	</session-config>
	```
### 로그인/로그아웃 시 화면 다르게 하기
- 로그인 성공시 session을 통해 Attribute id와 nickname에 값을 추가함.
- 메인화면 
	```jsp
	<% if(id == null) { %>
		<!-- 로그인 이전 화면 -->
		<div class="gnb">
			<a href="login.jsp">Sign in</a> <span>|</span>
			<a href="memberJoin.html">Sign up</a>
		</div>
	<% } else { %>
		<!-- 로그인 이후 달라질 부분 -->
		<div class="gnb">
			<a href="logout">logout</a> <span>|</span>
			<span><%=nickname%></span>
		</div>
	<% } %>
	```

<br><br><hr>

[돌아가기](../README.md)  
[2020-01-02](whatIStudied_200102.md)  
[2020-01-06](whatIStudied_200106.md)  


