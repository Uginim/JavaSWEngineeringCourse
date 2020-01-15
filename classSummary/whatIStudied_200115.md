# What I studied today.
Date : 2020-01-15

# JSP2.3 & Servlet 3.1

## Session
- client가 server에 요청을 한번 하면 서버에서는 sessionId를 부여함
- client는 다음 요청부터 sessionID를 실어서 보냄
- server는 sessionID를 통해 이전 요청과 동일 브라우저인지 아닌지 판단함
### `getSession()` 
- `getSession()`과 `getSession(boolean )`차이
    - `getSession()`는 세션이 없을 시 새로 생성함
    - `getSession(boolean create)`의 파라미터가 `false`이면 새로 생성하지 않음

[돌아가기](../README.md)  
[2020-01-14](whatIStudied_200114.md)  
[2020-01-16](whatIStudied_200116.md)  


