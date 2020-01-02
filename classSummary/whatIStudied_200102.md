# What I studied today.
Date : 2020-01-02

# JSP2.3 & Servlet 3.1
## 웹 프로젝트
### 웹 프로젝트 구조
- Project 이름
    - JAX-WS Web Service
    - Deployment Descriptor
    - Java Resources
    - Javascript Resources
    - build
    - WebContent
        - META-INF
        - WEB-INF

#### web.xml 
- 웹 어플리케이션  설정파일
- 반드시 WEB-INF 디렉토리에 존재해야함
- 파일명은 web.xml
#### JSP 파일
- WebContent 폴더 아래에 작성해야함.
#### 실행하기
- 메인메뉴 run
    - run on Server
#### Servlet 작성
1. File -> New -> servlet
2. Class name
    - servlet클래스의 이름
3. Url mapping
    - servlet클래스를 url 주소에 매핑
4. HTTP요청메서드(GET, POST 등)관련 재정의 메서드 선택
    - 해당 method를 자동으로 만듬
#### Servelet API 빌드패스에 포함하기
- 프로젝트 우클릭
    - java BUILD PATH
        - Library
            - Add External JARs
                - "servlet-api.jar"
## Servlet
- GET / POST
- URL Mapping
- 서블릿 라이프 사이클
### servlet 라이프사이클
1. init()
    - 처음에 딱 한번 실행됨
2. service(req, res)
    - 요청 하나당 매번 실행
3. doGet()/doPost()/... 등 호출
    - 해당 요청의 method(방식)에 맞춰서 실행
    - Post면 doPost(), Get이면 doGet()
4. destroy(req, res)
    - 인스턴스 소멸 직전 한번만 실행
### web.xml
- WEB-INF 폴더 안에 존재하는 파일
- Deployment Descriptor 파일
- 컨텍스트
## Client에서 2개의 숫자를 더한 결과를 보여주는 프로그램 작성
- addForm.html
    - 2개의 숫자를 입력하는 폼
- AddServlet.java
    - 요청을 처리하는 서블릿
    - 입력 파라미터를 조회
    - 파라미터를 적합한 타입으로 형변환
    - 모델 객체를 생성하여 메서드 호출
    - 결과를 request 객체에 저장ㅎ
    - 뷰로 forward
- AddDAO.java
    - 정수 두 개를 입력받아 두 수를 더한 결과를 반환하는 메서드 
- addResult.jsp
    - 요청객체에 저장된 데이터를 출력함
### addForm.html
```html
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>계산에 참여할 두 수를 선택하세요</h1>
	<form action="./calculator/add.do" method="GET">
		<input name="num1" type="text" /> <span>+</span>
		<input name="num2" type="text" />
		<input type="submit" value="결과받아오기"/>
	</form>
	<div id="result"></div>
</body>
</html>
```
### AddServlet.java
```java
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/calculator/add.do")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 1) 파라미터 조회
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		
		// 2) 파라미터값 처리를 위해 적합한 타입으로 형변환
		int op1 = Integer.parseInt(num1);
		int op2 = Integer.parseInt(num2);
		
		// 3) Model의 Biz()로직을 호출해서 작업을 처리
		AddDAO dao = new AddDAO();
		int result = dao.add(op1, op2);;
		
		// 4) 처리결과를 객체에 저장
		request.setAttribute("result", result);
		
		// 5) 결과를 보여주는 view 페이지로 이동(forward)
		RequestDispatcher disp = request.getRequestDispatcher("/addResult.jsp");
		disp.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

```

### AddDAO.java
```java
public class AddDAO {
	public int add(int param1, int param2) {
		return param1+param2;
	}
}

```

### addResult.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2개 숫자의 합</title>
</head>
<body>
<%-- 1) 스크립틀릿 --%>
<%
	out.println(request.getAttribute("result"));
%>

<%-- 2) 표현식 --%>
<%=request.getAttribute("result") %>

<%-- 3) JSTL --%>
${requestScope.result}
${result}
</body>
</html>
```

## JSP
### include 지시어
- JSP에 특정 JSP파일 또는 HTML 파일을 삽입할 수 있음

<br><br><hr>

[돌아가기](../README.md)  
[2019-12-30](whatIStudied_191230.md)  
[2020-01-02](whatIStudied_200102.md) 


