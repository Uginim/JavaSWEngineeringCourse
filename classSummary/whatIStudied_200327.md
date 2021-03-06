# What I studied today.
Date : 2020-03-27

# 팀프로젝트 진행
# SSE(Server-Sent Event)
- 3교시 진행
- SSE.pdf
## 데이터 통신 용어
- Push
    - 클라이언트의 요청이 오면 응답해주는 방식이 아닌 서버가 클라이언트에게 공지사항과 같은 무엇인가 통지해 주기 위한 방법.
    - 다시 말해 클라이언트의 요청이 없이도 서버는 클라이언트에게 응답하는 방식
- Polling
    - 클라이언트가 주기적으로 웹 서버에게 새로운 내용이 있는지 물어보는 방식
    - 하나의 장치(또는 프로그램)가 충돌 회피 또는 동기화 처리 등을 목적으로 다른 장치(똔느 프로그램)의 상태를 주기적으로 검사하여 일정한 조건을 만족할 때 송수신 등의 자료처리를 하는 방식
- Long Polling
    - 클라이언트가 웹서버에게 새로운 내용이 있는지 물어보았을 때 웹서버에 새로운 내용이 없다면 대답해주지 않다가 새로운 내용이 생기면 이 때 대답해주는 방식

## SSE(Server-Sent Event)표준 이전의 서버 Push 모델
- Polling 방식은 클라이언트가 주기적으로 웹서버에게 새로운 내용이 있는지 물어보는 방식
- AJAX를 이용해 서버에 비동기 요청을 주기적으로 수행하는 방법은 서버의 데이터가 변경되고 다음 요청이 발생할 때 까지 신규 데이터를 받지 못하는 단점이 있음
- 그러나 단점을 해결하기 위해 서버에서 데이터가 변경되면 응답하는 Long Polling, 응답을 
## Server-Sent Event
- Server-Sent Event(SSE)는 비표준 플러그인을 사용하지 않고, 웹 환경에서 서버로부터의 Push 서비스 구현하기 위해 제안된 표준 기술
- Ajax Long Polling 방식을 표준화 한 기술
- SSE는 웹소켓을 지원하지 않는 서버환경에서 웹소켓을 대신할 수 있는 기술
- SSE는 인터넷 익스플로러에서 지원하지 않는다.
    - 폴리필을 사용하면 가능
        - polyfill(폴리필)은 개발자가 특정 기능이 지원되지 않는 브라우저를 위해 사용할 수 있는 코드 조각이나 플러그인을 말함
        - polyfill은 HTML5 및 CSS3와 오래된 브라우저 사이의 간격을 메꾸는 역할을 담당
- 클라이언트 API와 푸시(Push) 데이터를 정의한 사양이다. 사실 속을 들여다 보면 폴링이다.
- 서버로부터 푸시된 데이터를 수집하여 일반적인 DOM이벤트처럼 처리가 가능하다.
- SSE를 사용하면 서버의 갱신된 데이터를 클라이언트에 보여주기 위해 AJAX와 setInterval()을 사용할 필요가 없다.
- 이벤트 소스 객체 생성
## 푸시데이터 형식
- SSE는 EventSource가 자동으로 해석할 수 있도록 서버로부터의 푸시되는 데이터의 규칙이 정해져 있다.
    - mime 타입은 text/event-stream, charset 파라미터는 필요 없다.
    - 문자 인코딩은 UTF-8로 고정이다
    - 줄 바꿈 코드는 '\r\n' '\r' '\n' 모두 유효함
    - ':'(콜론)
- 응답 데이터 형식에 있어서 유효한 필드 이름이 또한 정해져 있음
    - event
    - data
    - id
    - retry
[돌아가기](../README.md)  

[2020-03-25](whatIStudied_200325.md)  
[2020-03-27](whatIStudied_200327.md)  














