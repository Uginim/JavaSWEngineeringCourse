# What I studied today.
Date : 2020-01-23

# JSP2.3 & Servlet 3.1
## 필터
https://www.tutorialspoint.com/jsp/jsp_writing_filters.htm
- 요청이 servlet에 전달되기 전에 요청을 가로채서 선/후행 작업을 하는 것
- J2EE API에서 javax.servlet.Filter 인터페이스가 정의되어 있음
- 필터
    - Authentication Filter
    - Logging and Auditing Filters
    - Image conversion Filters
    - Data compression Filters
    - Encryption Filters
    - Tokenizing Filters
    - Filters that trigger resource access events
    - XSL/T filters
    - Mime-type chain Filter
- 필터 인터페이스의 메서드
    - `init(FilterConfig)`
    - `doFilter(ServletRequest, ServletResponse, FilterChain)`
        - ``` java
            public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, Servlet Exception{
                // before
                chain.doChain(request,response);
                // after 
            }
            ```    
    - `destroy()`
### 필터 매핑 설정
- 필터가 url-pattern에 지정된 페이지에 접근할 때 실행되도록 함
1. WEB-INF/web.xml에 설정
    - ```xml
        <filter>
            <display-name>SimpleFilter</>
            <filter-name>SimpleFilter</>
            <filter-class>com.abc.filter.SimpleFilter</filter-class>
        <filter/>
        <filter-mapping>
            <filter-name>SimpleFilter</filter-name>
            <url-pattern>/auth/*</url-pattern>
        </filter-mapping>
        ```
Annotation으로 설정
2. 필터 클래스 선언부 위에 다음과 같이 URL mapping을 정의함
    - ```java
        @WebFilter("/auth/*");
        public class SimpleFilter implements Filter { ... }
        ```
- URL패턴으로 설정하는것도 가능하고 서블릿을 직접 매핑하는 것도 가능하다.
#### 같은 url로 매핑된 여러개의 필터가 존재하는 경우
- 어노테이션으로 설정했을 경우
    - 필터간의 순서는 필터네임의 아스키코드순으로 추정됨.
- web.xml로 설정했을 경우
    - 필터간의 순서는 filter-mapping태그의 순서가 됨
# 문제 해결
- IllegalStateException:자식컨테이너를 시작하는 중 오류 발생
    - 서버 우클릭 -&gt; [Clean Tomcat Work Directory]

# 숙제
- 명절연휴간 DI, AOP 읽어오기
<br><br><hr>
[돌아가기](../README.md)  
[2020-01-22](whatIStudied_200122.md)  
[2020-01-28](whatIStudied_200128.md)  


