# What I studied today.
Date : 2020-01-07

# 결석
- 사유 : 감기몸살

# JSP2.3 & Servlet 3.1
## DB연동하기
1. dbtest -web dynamic  project 생성    
    1. 마우스 우클릭
    2. configure
    3. convert to maven project
        - 다음 화면이 뜸
            ```
            create new POM
            Group Id(조직정보, 도메인 등) : 
            version : snapshot -> 아직 개발되지 않은 정보
            packinging(웹 어플리케이션 압축 확장자)
            ```
            - 별도 설정 없이 next.
        - 폴더 옆에 M 아이콘생성됨(Maven 기반) 
            - pom.xml (project object model)
                - Library 관리를 해준다.(최근에는 그래들이라는 툴 많이 씀)
2. 구문 추가
    ```xml
    <repositories>
        <repository>
            <id>oracle</id>
            <name>ORACLE JDBC Repository</name>
            <url>https://maven.xwiki.org/externals/</url>
        </repository> 
    </repositories>

    <!-- oracle 드라이버 설정 -->
    ```
3. google에서 maven repository 검색 https://mvnrepository.com/
    - 이동 후 ojdbc8 검색 -> 1번 ojdbc8 이동 -> 12.2.0.1 클릭  
    ( 파일 위치 확인하는 작업임 Repositories xwiki이동
    co -> oracle ->ojdbc -> ojdbc8 -> 12.2.0.1)
4. 주소 붙여넣기
```xml
<repository> 
    <name>ORACLE JDBC Repository</name>
    <url> https://maven.xwiki.org/externals/</url>
</repository> 
```
### 5. dependeices 구문  아래에 넣고 저장.
```xml
<dependencies>
    <!-- oracle 드라이버 설정 -->
    <dependency>
        <groupId>com.oracle.jdbc</groupId>
        <artifactId>ojdbc8</artifactId>
        <version>12.2.0.1</version>
    </dependency>
</dependencies>
```
6. dbconn.jsp 
7. pom.xml 파일 공유폴더에 있음.
8. oracle 내에 madang 계정 되어있는지 확인.
9. 멤버변수 초기화 : DB연결 이 뜨면 완료.


<br><br><hr>

[돌아가기](../README.md)  
[2020-01-06](whatIStudied_200106.md)  
[2020-01-08](whatIStudied_200108.md)  


