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


<br><br><hr>

[돌아가기](../README.md)  
[2019-12-30](whatIStudied_191230.md)  
[2020-01-02](whatIStudied_200102.md) 


