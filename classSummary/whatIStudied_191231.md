# What I studied today.
Date : 2019-12-31

# JSP2.3 & Servlet 3.1
## sts에서 server 관련 툴 및 설정
- 서버 관련 인터페이스들
	- server view
	- preference 에서 server
### server 만들기
1. preference 에서 server에 runtime environments
	- 서버의 종류와 서버(tomcat)의 경로 지정
2. 생성 마법사에서 server 선택 후 생성
### server view
- server를 더블클릭하면 창이 하나 뜸
    - 탭 두 개 포함됨
        - Overview
            - Server의 환경설정 가능
        - Moduels
            - 서버에 구동될 서비스들
#### Overview
- General Information
    - server이름 설정
    - host 이름 설정
    - config파일 경로 설정
- server location
    - 서버 경로 설정함
        - User workspace metadata
            - 워크스페이스의 메타데이터의  `.....\.metadata\.plugins\org.eclipse.wst.server.core\tmp0`
        - Use Tomcat installation
            - 톰캣 설치 경로 사용
        - 사용자가 지정한 위치 사용
    - Deploy path
        - web application의 경로 지정

## web 프로젝트 생성
- 생성 마법사에서 Dynamic web app 클릭
    - 프로젝트명이 기본적으로 서버에서 resource 경로가 됨(context root)
        - `http://localhost:포트/프로젝트명`
    - class 파일 경로를 설정가능
    - context root 설정가능
    - Generate web.xml deployment descriptor 
### JSP 파일 생성
- 생성마법사로 JSP 클릭
    - Template 수정 가능
        - preferences에서도 수정가능
    - 수업에서는 html태그를 다음처럼 수정
        - ```html5
			<html lang ="ko">
			```
- jsp파일 생성 이후에는 java 프로그램(file)이 만들어짐
    - java프록르램은 jsp파일에 만든 html 코드를 클라이언트에 전송함
    - `톰켓설치경로\tomcat9\work\Catalina\localhost\webedu\org\apache\jsp`에 있음
    - `jsp파일명_jsp.java`,`jsp파일명_jsp.class`,
        - 내부적으로
			```java
			out.write("\r\n");
			out.write("<meta charset=\"UTF-8\">\r\n");
			out.write("<title>현재 시각</title>\r\n");
			out.write("</head>\r\n");
			out.write("<body>\r\n");
			out.write("현재시간은 ");
			out.print(hour );
			out.write('시');
			out.write(' ');
			out.print(minute );
			out.write('분');
			out.write(' ');
			out.print(second );
			out.write("초 입니다.\r\n");
			out.write("</body>\r\n");
			out.write("</html>\r\n");
			```
## servlet 
### servlet 생성하기
- 서블릿은 `javax.servlet.http.HttpServlet`의 서브클래스이다
- 생성 마법사의 각 단계
    - `Enter servlet deployment descriptor specific information.`
        - url경로와 servlet을 매핑함
    - Specify modifiers, interfaces to implement, and method stubs to generate.
        - `HttpServlet`의 재정의 함수 자동생성 가능
### servlet 클래스 구현부(javafile)
- `@WebServlet`어노테이션
    - URL 매핑을 함
    - 이전버전에서는 소스코드 외부 파일에서 따로 설정함.(부울편)
    - 예시
        - `@WebServlet({ "/HelloServlet", "/hello.do" })`

## STS 설정하기
- STS 4.5 버전으로 재설치함(이전 4.4버전)
- preferences
    - General
        - Content type
            - Default encoding
                - `utf-8` 입력
        - Workspace
            - Textfile encoding
                - `utf-8' 선택
    - 다음도 utf-8선택하기
        - Web
            - CSS Files
            - HTML Files
            - JSP Files
        - XML
            - XML Files
    - server
        - runtime environments
        	- 서버의 종류와 서버(tomcat)의 경로 지정
- Perspective
    - Others
        - Spring 선택
- Server view
    - server 설정

## ObjectAid 설치(UML 도구)
- window
    - install new software
        - add클릭
            - ObjectAid UML 
            - http://www.objectaid.com/update/current
## 기본브라우저 설정
- 방법 1
	1. 메뉴의 Window클릭
	2. web browser 에서 chrome 설정
- 방법 2
	1. Preferences 에서 Web browser
	2. use external web browser 클릭
##  교재 소스 주소
- [링크](http://www.hyejiwon.co.kr/?module=Goods&action=SiteGoodsDate&sMode=VIEW_FORM&sCurrSortCd=001004&iGoodsCd=357&CurrentPage=1&sSearchField=&sSearchValue=&sort=)

## web.xml
- servlet을 url과 매핑할 수 있다.
    - 옛날방식
        - 불편하기에 도태됨
    - `<servlet>`태그
        - `servlet-name` 
            - 해당 서블릿에 이름을 부여함
        - `servlet-class` 
            - 실제 서블릿 클래스이름(경로)
    - `servlet-mapping`태그 
        - `servlet-name` 
            - 위에서 설정한 servlet 이름(servlet-name)
        - `url-pattern`
            - 매핑될 주소
- `servlet-name`과 `servlet-class`의 값은 같을 필요없다. 해당 서블릿에 
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" version="4.0">
  <display-name>webedu</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  <!-- 옛날 방식 -->
   <servlet>
      <servlet-name>ServletLifeCycle</servlet-name>
      <servlet-class>ServletLifeCycle</servlet-class>
  </servlet>

  <servlet-mapping>
      <servlet-name>ServletLifeCycle</servlet-name>
      <url-pattern>/ServletLifeCycle</url-pattern>
  </servlet-mapping>
</web-app>
```
## servlet
### servlet관련 api 문서
- [Documentation Index - Apache Tomcat 9](http://tomcat.apache.org/tomcat-9.0-doc/index.html)
- [Apache Tomcat 9.0.30 API](http://tomcat.apache.org/tomcat-9.0-doc/api/index.html)
- [Servlet 4.0 API - Apache Tomcat 9.0.30](http://tomcat.apache.org/tomcat-9.0-doc/servletapi/index.html)
### servlet과 JSP 수정 시
- servlet을 수정하면 서버를 재부팅해야함
- JSP를 수정하면 재부팅할 필요없음
## Eclipse 플러그인 emmet 
- html 태그 생성이 쉬워짐
- 주소 
    - http://emmet.io/eclipse/updates
## 코드 스타일 바꾸기
- preperences 열기
    - java
        - code style
            - formatter
## tab width 바꾸기
- Preperences 열기
    - General 
        - Editors
            - Text Editors
                - displayed tab width
    - 위의 code style -> formatter에서 tab-size 바꾸기
## Get 요청하기
1. form태그의 method를 get으로 설정후 submit
2. 주소창에서 경로와 파라미터를 직접 작성
3. `<a>`태그를 이용함

# 숙제
- chapter04, chapter05읽어오기

<br><br><hr>

[돌아가기](../README.md)  
[2019-12-30](whatIStudied_191230.md)  
[2020-01-02](whatIStudied_200102.md) 


