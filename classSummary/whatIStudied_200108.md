# What I studied today.
Date : 2020-01-08

# JSP2.3 & Servlet 3.1
## Maven
### Maven 라이브러리 경로
- Windows
    - `C:\Users\사용자계정\.m2` 경로에 저장됨
### library에 java doc 경로 설정하기
- 과정
    1. Maven Dependencies에서 해당 library 우클릭 및 Properties열기
    2. Javadoc Location에서 Javadoc URL 선택 및 주소 입력하기
- 주소 예시
    - ojdbc8
        - https://docs.oracle.com/en/database/oracle/oracle-database/12.2/jajdb/
    - jstl-1.2 
        - https://tomcat.apache.org/taglibs/standard/apidocs/       
### context path가 바뀌어도 주소를 유지하는 법
- 다음을 써서 주소를 유지함
    - `${pageContext.request.contextPath }`
    - `<%=request.getContextPath() %>`

### `PreparedStatement.executeUpdate()`
- update, insert, delete 쿼리 모두 사용함.
- 
<br><br><hr>

[돌아가기](../README.md)  
[2020-01-07](whatIStudied_200107.md)  
[2020-01-08](whatIStudied_200108.md)  


