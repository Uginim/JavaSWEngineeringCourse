# What I studied today.
Date : 2020-01-10

# JSP2.3 & Servlet 3.1

## 커넥션 풀(DBCP)
- [\[Spring\] 커넥션 풀(Connection pool)이란? - linked2ev](https://linked2ev.github.io/spring/2019/08/14/Spring-3-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80%EC%9D%B4%EB%9E%80/)
<br><br><hr>
- http://commons.apache.org/proper/commons-dbcp/
- http://commons.apache.org/proper/commons-dbcp/apidocs/index.html
### context.xml
- 경로
    - META-INF/context.xml
- 내용
    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <context>
        <Resource
            name="jdbc/java"
            auth="container"
            type="javax.sql.DataSource"
            username="madang"
            password="madang"
            driverClassName="oracle.jdbc.driver.OracleDriver"
            factory="org.apache.commons.dbcp2.BasicDataSourceFactory"
            url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
            maxActive="100"
            maxIdle="10"
        />
    </context>
    ```
## 크롬확장프로그램 Postman Interceptor
- HTTP request를 임의로 생성

## Maven
- https://mvnrepository.com/
## 과제
1. myweb => maven 프로젝트 전환
2. pom.xml
    - ojdbc8 드라이버
    - jstl 1.2
    - dbcp2
3. context.xml 추가
    - WebContent/META-INF/context.xml
    - 풀링 리소스 등록
4. Web.xml에 resource-ref 추가
    - WebContent/WEB-INF/web.xml
    - 풀링 리소스 참조
5. com.kh.common.Dbcon
6. com.kh.db.PoolTest.java
7. 회원테이블 생성


[돌아가기](../README.md)  
[2020-01-09](whatIStudied_200109.md)  
[2020-01-13](whatIStudied_200113.md)  


