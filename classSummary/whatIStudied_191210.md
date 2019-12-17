# What I studied today.
Date : 2019-12-10

# 웹표준
## Chapter07 연습문제 
### 이론문제
#### 2번
- 답 : 4
#### 4번
- 답 : 3
#### 6번
- 답 : 4
#### 8번
- 이유 :
    - 정수의 답이 나오지 않음
    - 소수점이 같이 나옴
- `Math.floor()`함수로 소숫점 이하를 버린다. (정수형으로 만든다)
#### 10번
#### 12번
#### 14번
## 자바스크립트 이벤트 3요소
- 이벤트 소스
    - 이벤트가 일어나는 지점
- 이벤트 객체
    - 브라우저가 생성해줌
- 이벤트 핸들러(리스너,처리기)
### 웹 발전
- Ajax 시대(2000년대 후반)
- HTML5 시대
    - 리치 클라이언트
    - CANVAS
    - WEB STORAGE
1. 브라우저 동작원리
## Chapter08 연습문제 
### 이론문제
#### 1번
- 답 : 4
#### 2번
- 답 : 2
#### 3번
- 답 : 4
#### 4번
- 브라우저는 DOM객체를 통해서 출력함 DOM Tree가 완성되고 
- HTML 페이지가 출력된 후, DOM 객체를 통해 HTML 태그가 출력된 모양과 콘텐츠를 제어하기 위함
#### 5번
- 답 : 2
#### 6번
- 답 : 2
#### 7번
- (1) : `<span>라면</span>과 스프를 넣는다.`
#### 8번
- 이유 : 
    - 브라우저가 스크립트를 실행하는 시점이 이르기 때문,
    - 아직 body가 생성되지 않았는데 body 요소를 찾았기 때문
- 해결법
    1. `<body>`태그 이후에 `<script>`를 호출한다.
    2. `<body>`태그의 onload 이벤트 이후 실행 
        - onload속성에 실행할 코드를 넣는다.
#### 9번
1. `createElement('span')`
2. `innerHTML`
3. `hello`
4. `appendChild(span)`
### 실습문제
#### 1번
##### (1)
- document
    - html
        - head
            - title
        - body
            - h3
            - hr
            - ol
                - li
                - li
                - li
                - li
                    - strong
##### (2)
## 노드 접근 관련 API
```javascript
docuemnt.getElementById()
document.getElementByClassName()
document.getElementByTagName()
document.querySelector()
document.querySelectorAll()
```

# Database
# 궁금한 점.



[돌아가기](../README.md)  
[2019-12-09](whatIStudied_191209.md)  
[2019-12-11](whatIStudied_191211.md) 

