# What I studied today.
Date : 2020-01-08

# JSP2.3 & Servlet 3.1
## JSTL
### JSTL(JSP Standard Tag Library)?
- 표준화된 태그 라이브러리들을 제공함으로써 보다 편리하게 웹 응용프로그램을 개발할 수 있도록 지원
- 간단한 태그로 캡슐화한다.
- JSP내에 Java Source를  사용하지 않고 태그만을 가지고 작성하도록 정의한다.
- 가독성이 증가한다.
### Core Library
1. JSP 페이지에서 필요한 가장 기본적인 기능들을 제공
2. `<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>`
3. Tags
    - c:catch: 예외처리에 사용
    - c:out : JspWriter 에 내용 출력
    - c:set : JSP에서 사용될 변수 설정
    - c:remove : 설정한 변수 제거
    - c:if : 조건처리
    - c:choose : 다중 조건 처리
- c:set
    - 변수 선언할 떄 사용, 디폴트로 page 스코프에 저장됨
        - scope 속성으로 변수가 저장될 스코프 변경 가능
            - `<c:set var="num" value="100" scope="request"/>`
    - ```jsp
        <%
            int a=10;
            request.setAttribute("a",a);
        %>
        ${a}<br>
        <c:set var="b" value="20" scope="request"></c:set>
        ${a*b}<br>
        ```
    - 출력 시 반드시 `<c:out>`또는 EL사용해서 출력할것
#### 예시
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="num" value="100" scope="request"/>
<pre>-- set변수 선언 --</pre>
<%
	request.setAttribute("num2", 200);
%>

${num }<br>
${num2 }<br>
${num * num2 }<br>
<%=request.getAttribute("num")%><br>
<c:out value="${num }" /><br>
<pre>-- 조건문 --</pre>
<c:if test="${empty num3}" >
	num3변수가 할당되지 않음!!<br>
</c:if>
<c:set var="num3" value="300" />
<c:if test="${!empty num3}" >
	num3변수가 할당되었음.<br>
</c:if>
<!--비교연산자 ==eq, !=ne, <lt, >gt,  <=le, >=ge -->
<!--논리연산자 &&and, ||or, !not -->
<!-- empty연산자 null체크 -->
<c:if test="${num3 le 500}" >
	num3값은 500보다 작거나 같다<br>
</c:if>

<!-- 다중조건 -->
<c:choose>
	<c:when test="${num3 == 300 }">
		num3는 300이 맞다 <br>
	</c:when>
	<c:when test="${num3 == 400 }">
		num3는 400이 맞다 <br>
	</c:when>
	<c:otherwise>
		switch문의 default와 동일
	</c:otherwise>
</c:choose>

<pre>-- 반복문 --</pre>
<c:forEach var="i" begin="1" end="10" step="2">
	${i }<br>
</c:forEach>
<%
	int[] intarr = new int[]{1,2,3,4,5,6,7,8,9,10};
%>
<c:forEach var="i" items="${intarr}">
	${i }<br>
</c:forEach>
<c:set var="strs" value="aaa,bbb,ccc" />
<c:forEach var="str" items="${strs }">
	${str}<br>
</c:forEach>

<c:set var="strs2" value="aaa|bbb|ccc" />
<c:forTokens var="str2" items="${strs2 }" delims="|">
	${str2}<br>
</c:forTokens>

<pre>--예외 처리--</pre>
<c:catch var="e">
<%
	int a = 10/0;
%>
</c:catch>
<c:if test="${!empty e }">
	예외발생: ${e }
</c:if>

<pre>--페이지 전환--</pre>

<!-- 외부리소스 포함 -->
<c:import url="http://localhost:9080/dbtest3/select"></c:import>
<%-- <c:redirect url="http://www.naver.com"></c:redirect> --%>

<pre> jsp문서내 링크주소의 절대경로를 컨텍스트 루트를 기준으로 생성</pre>
<c:url value="/servlet" />
<form action="/dbtest3/servlet"></form>
<form action="${pageContext.request.contextPath }/servlet"></form>

<pre>	숫자,시간,통화 포맷</pre>
<c:set var="price" value="123456789.987654321" />
<fmt:formatNumber value="${price }" pattern="#,###.00"/><br>
<c:set var="dateString" value="20200109031412" />
<fmt:parseDate var="dateString" value="${dateString}" pattern="yyyyMMddHHmmss"/>
<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd HH:mm:ss"/>
</body>
</html>

```    
## 커넥션 풀(DBCP)
- [\[Spring\] 커넥션 풀(Connection pool)이란? - linked2ev](https://linked2ev.github.io/spring/2019/08/14/Spring-3-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80%EC%9D%B4%EB%9E%80/)
<br><br><hr>

[돌아가기](../README.md)  
[2020-01-08](whatIStudied_200108.md)  
[2020-01-10](whatIStudied_200110.md)  


