# What I studied today.
Date : 2020-02-03

# Spring
## web.xml
- servlet 태그로 서블릿 등록 가능
- filter 태그로 filter 등록 가능
    - UTF-8 인코딩 처리 필터를 등록할 수 있음
## servlet-context.xml
- `<annotation-driven />`
    - `@Controller`가 붙은 클래스를 서버구동시 스프링컨테이너가 자동으로 빈 등록하도록 설정
    - Enables the Spring MVC `@Controller` programming model
- `<resources mapping="/resources/**" location="/resources/" />`
    - 정적페이지 매핑경로설정
    - Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory
- `beans:bean` 태그
    - 뷰를 찾기위한 세팅 정보 
    - Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory
- `context:component-scan`
    - 어느 컨포넌트를 등록할지 정할 수 잇음
    - 예시
        ```xml
        <!-- 	component : @Controller, @Service, @Repository 중에서 
                        @Controller가 있는 클래스만 인스턴스화 하도록 설정함 -->
        <context:component-scan base-package="com.kh.portfolio" use-default-filters="false"> 
                    <context:include-filter type="annotation" expression="org.springframework.stereotype.Controller"/>
        </context:component-scan>
        ```
- 수업에서는 resources태그의 location값을 변경함
    ```xml
    <resources mapping="/resources/**" location="/WEB-INF/resources/" />
    ```
    - 이후 resources 폴더도 `/WEB-INF`폴더 안에 옮김
    - 앞으로 url에서 컨택스트 경로안의 resource경로를 통해 정적 자원을 접근함
## root-context.xml
- defines shared resources visible to all other web components 
- servlet-context.xml의 빈을 사용가능
    - 하지만 servlet-context.xml에서는 root-context.xml의 빈을 사용불가
- 보통 여기서 jdbcTemplate 혹은 mybatis를 등록해서 사용함

# Java 예외 처리
## 예외 처리
- 서버에서 발생된 예외를 최종 사용자에게 전달되는 것을 방지
    - DAO와 Service에서발생된 예외는 Controller에서 처리하는 것을 권장함
    - System 예외는 Business예외로 다시 던지는 (re-throwing)방식 사용
    - @ExceptionHandler와 ControllerAdvice를 사용하여 예외처리
### 예외 종류
- Throwable
    - Error (unchecked)
- Exception (Checked)
    - RuntimeException(Unchecked)        
#### Checked Exception
- 반드시 try~catch문 처리 또는 throws 키워드 사용 caller 메소드로 위임
#### Unchecked Exception 
- try~catch문 사용은 선택적
- 예외 발생시는 자동으로 caller 메소드로 위임
### 스프링 예외처리의 특징
- 컨트롤러 기반
- 글로벌 Exception핸들러
- JDBC관련 코드는 대부분 SQLException발생
- 스프링 JDBC의 주요 예외 클래스
### @ControllerAdvice 특징
- 스프링 3.2이사에서 사용가능
- @Controller나 @RestControler에서 발생하는 예외를 catch함
- 스프링 4.0이상에서는 특정한 컨트롤러만 지정해서 catch가 가능함 또한 @RestControllerAdvice를 별도로 제공함
### @ControllerAdvice 사용을 위한 설정
- servlet-context.xml에서 ControllerAdvice를 include
## Spring Form
- jsp파일에 아래 태그를 추가해줘야함
```xml
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
```

## Maven pom.xml
- Groupid 
    - 조직이름
- artifactId 
    - 프로젝트 이름
- dependencies
    - dependency 추가하면 
    - .m2 폴더에 라이브러리를 다운로드함
<br><br><hr>

[돌아가기](../README.md)  
[2020-01-31](whatIStudied_200131.md)  
[2020-02-04](whatIStudied_200204.md)  














