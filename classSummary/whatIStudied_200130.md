# What I studied today.
Date : 2020-01-29

# Spring
## Context 분리와 전략
- Context
    - spring container와 같다
- Servlet Context
    - DispatcherServlet
        - 웹의 요청을 최초로 접수
    - DispatcherServlet
        - 설정파일을 이용해서 ServletContext(스프링컨테이너)로딩
    - Spring MVC와 관련있는(web과 관련있는) 빈을 설정(ex)) @Controller가 여기에 해당됨
    - 빈: 자주사용하는 클래스를 스프링 컨테이너에 로딩하여 사용함
    - DispatcherServlet 여러개 설정가능하나 이들끼리는 빈을 공유할 수 없음
- Root Context
    - Servlet Context에서 공통적으로 접근할 수 있는 빈을 등록하여 관리하는 spring container
    - Spring-MVC와 분리되어 빈을 관리하고 싶을때 사용(ex)@Service, @Repository, 데이터 리소스 등
    - 일반적으로 Servlet context와 Root Context를 분리하여 운용
    - back-end
- 서버가 구동되면 web.xml이 제일 처음 읽어들임
    - DispatcherServletservlet 
### Spring MVC에서 컨텍스트 계층구조 가이드 라인
-  Servlet WebApplicationContext는 웹 관련 빈 설정
    - 비교적 우선순위를 가짐
    - 여러개 만들 수 있음
-  Root WebApplicationContext는 웹 이외의 빈 설정
-  spring.io에 있음
### Root WebApplicationContext
- 전체 계층구조에서 최상단에 위치한 컨텍스트
- 서로 다른 서블릿 컨텍스트에서 공유해야하는 Bean들을 등록해놓고 사용할 수 있다.
- 웹 어플리케이션 전체에 적용 가능한 DB연결, 로깅기능 등에 이용
    - 전체 어플리케이션에서 이용가능한 기능을 등록함
- Servlet Context에 등록된 Bean이용 불가능!
- Servlet Context와 동일한 빈이 위치하지 않도록하는 전략이 필요하다.
- 하나의 컨텍스트에 정의된 AOP설정은 다른 컨텍스트의 빈에는 영향을 미치지 않음
### Servlet WebApplicationContext
- 서블릿에서만 이용되는 컨텍스트
- 타 서블릿과 공유하기 위한 Bean들은 Root WebApplication Context에 등록해놓고 사용해야함
- DispatcherServlet은 자신만의 컨텍스트를 생성, 초기화하고 동시에 Root WebApplication Context를 찾아서 자신의 부모 컨텍스트로 사용
<br><br><hr>

[돌아가기](../README.md)  
[2020-01-28](whatIStudied_200123.md)  
[2020-01-30](whatIStudied_200129.md)  


