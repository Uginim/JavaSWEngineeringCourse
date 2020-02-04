# What I studied today.
Date : 2020-02-04

# Spring
## 어노테이션
|어노테이션|의미|위치|
|---|---|---|
|`@RequestMapping`|요청 URL을 어떤 메서듣가 처리할 지 매핑해준다.|클래스,메소드|
|`@GetMapping`|GET방식의 요청시 매핑|메소드|
|`@PostMapping`|POST방식의 요청시 매핑|메소드|
|`@PutMapping`|PUT방식의 요청시 매핑|메소드|
|`DeleteMapping`|DELETE방식의 요청시 매핑|메소드|

## 회원수정/ 회원탈퇴 만들기
## RESTful
- `@RestController`
### RESTful 웹 서비스 개요
- Open API(Application Programming Interface)이란?
    - Open 
- REST(REpresentational Safe Transferful) API란?
    - HTTP URI+HTTP METHOD
    - HTTP URI를 통해 제어할 자원(Resource)를 명시하고  
    HTTP Method(GET,POST,PUT,DELETE)를 통해  
    해당 자원(Resource)을 제어하는 명령을 내리는 방식의 아키텍처
    - HTTP프로토콜에 정의된 4개의 메서드들이 자원(Resource)에 대한 CRUD Operation을 정의  
        |HTTP Method|CRUD|
        |---|---|
        |POST|Create(Insert)|
        |GET|Read(Select)|
        |PUT|Update or Create|
        |DELETE|Delete|
    - RESTful API는 HTTP Method기반으로 자원에 접근할 수 있도록 제공하는  
    애플리케이션 개발 인터페이스(REST 원리를 따르는 시스템은 RESTful이란 용어로 지칭)
- 기존의 웹 접근 방식과 RESTful API 방식과의 차이점
    ||기존 게시판|Restful API를 지원하는 게시판
    |---|---|---|
    |글목록|GET /bbs/list |GET /bbs|
    |글읽기|GET /bbs/list/{articleId}| GET /bbs/{articleId}|
    |글목록|POST /bbs/regist |POST /bbs|
    |글목록|GET /bbs/remove/{articleId} |DELETE /bbs/{articleId}|
    |글목록|POST /bbs/modify/{articleId} |PUT /bbs/{articleId}|
    - 기존의 게시판은 GET과 POST만으로 자원에 대한 CRUD를 처리하며 URI는 액션(동사)를 나타냄
    - RESTful게시판은 4가지의 HTTP Method를 사용하여 CRUD를 처리함 URI는 제어하려는 자원(명사)을 나타냄
### JSON과 XML
- RESTful웹 서비스와 JSON/XML
    - RESTful웹서비스에서는 응답포맷은 주로 2가지(json.xml)로 가져감
    - XML은 JSON보다 오버헤드가 크다(메타데이터-시작태그,종료태그)
    - (콤마)와 중괄호{}를 사용하는 JSON포맷을 주로사용함
    - 대용량데이터의 경우 ,(콤마)정도로만 구분하여 전송하는 경우도 있음
    - 보안이 중요시되는 경우 XML을 사용
- JSON(JavaScript Object Notation)이란?
    - https://www.json.org/json-en.html
    - 경량(lightweight)의 DATA 교환 방식
    - javascript에서 객체를 만들 때 사용하는 표현식을 의미
    - JSON표현식은 사람과 기계 모두 이해하기 쉬우며 용량이 작아서, 최근에는 JSON이 XML을 대체해서 데이터 전송등에 많이 사용
    - 특정 언어에 종속되지 않음
        - 대부분의 프로그래밍언어에서 JSON포맷을 지원하거나 라이브러리가 제공됨
- JAVA의 JSON 라이브러리
    - Jackson
    - https://github.com/FasterXML/jackson

<br><br><hr>

[돌아가기](../README.md)  
[2020-02-03](whatIStudied_200203.md)  
[2020-02-05](whatIStudied_200205.md)  














