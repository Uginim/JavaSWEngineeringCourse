# What I studied today.
Date : 2019-12-11

# 웹표준
## 태그 구조
- &lt;시작 태그&gt;
    - 속성
- 콘텐츠
    - 텍스트
    - html문
- &lt;종료 태그&gt;
- 예시
    - ```html
        <시작태그 속성="값"> 콘텐츠(Text + HTML문장) </종료태그>
        ```
## javascript에서 Tag가 아닌 contents를 가져오려할 때
- text컨텐츠가 제일 처음에 있을 경우
    - 해당 요소의 firstChild속성을 사용함
        - ```javascript
            function result(obj) {
                var expression = obj.parentElement.firstChild.textContent; // string type으로 하기위함. nodeValue를 써도 됨                        
                expression=expression.slice(0,expression.length-1);
                console.log(expression, eval(expression));
                obj.innerHTML= eval(expression);
            }
            ```
    - this로 현재 이벤트 소스 객체를 전해줄 것
        - ```html
            <p>4 * 20 + 64 =<span onclick="this.innerHTML=result(this)">답</span></p>
            ```
        - 인라인 onclick속성에서 this로 이벤트소스객체를 전해주지 않을 경우
            - 핸들러에서 this를 참조하면 window객체가 참조됨
## Chapter08 연습문제
### 실습 문제 
#### 4번
- 답 : `innerHTML`
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chapter08 실습문제 4</title>
    <script>
        function result(obj) {
            var expression = obj.parentElement.firstChild.textContent; // string type으로 하기위함. nodeValue를 써도 됨                        
            expression=expression.slice(0,expression.length-1);
            console.log(expression, eval(expression));
            obj.innerHTML= eval(expression);
        }
    </script>
</head>
<body>
    <p>2 + 4 =<span onclick="result(this)">답</span></p>
    <p>4 * 20 + 64 =<span onclick="this.innerHTML=result(this)">답</span></p>
    <p>20 / 5 - 8 * 2 =<span onclick="this.innerHTML=result(this)">답</span></p>
    
    <!-- <p>4 * 20 + 64 =<span onclick="this.innerHTML=eval(4*20+64)">답</span></p>
    <p>20 / 5 - 8 * 2 =<span onclick="this.innerHTML=eval(20/5-8*2)">답</span></p> -->
</body>
</html>
```
### 실습 문제 
#### 6번
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chapter08 실습문제 6</title>
    <script>
        function chageContent(obj){
            var str = window.prompt("HTML 텍스트 혹은 그냥 텍스트를 입력하세요");
            if(str == null || str == "") return false ;            
            obj.innerHTML = str;
        }
    </script>
</head>
<body>
    <h3>innerHTML</h3>
    <hr>
    <!-- <p onclick="this.innerHTML=prompt('HTML 텍스트 혹은 그냥 텍스트를 입력하세요')">이번 겨울에는 어디로 여행을 갈까요?</p> -->
    <p onclick="chageContent(this)">이번 겨울에는 어디로 여행을 갈까요?</p>
</body>
</html>
```
### 실습 문제 
#### 8번
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chapter08 실습문제 8</title>
    <script>
        var count=1;
        function imgScale(obj){
            count++;
            obj.style.transform = "scale("+count+","+count+ ") translate("+count*25 +"%)";
        }
    </script>
</head>
<body>
    <h3>클릭하면 2,3,4배로 확대하여 출력하는 웹페이지를 작성하라</h3>
    <hr>
    <img src="img/smartphone1.svg" alt="휴대폰" onclick="imgScale(this)">
</body>
</html>
```
### 실습 문제 
#### 10번
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chapter08 실습문제 10</title>
    <script>
        function removeAnswer(){
            console.log(this);
            this.parentElement.removeChild(this);
            
        }
        function addAnswer(obj, text){
            // Create a p element 
            var p = document.createElement('p');            
            p.innerHTML=text;
            p.onclick = removeAnswer; // 이렇게 넣으면 this가 먹음...
            // console.log(p.onclick,"removeAnswer(this,"+text+")");
            var i, 
                noAnswer=true,
                children = obj.parentElement.children;

            for(i=0;i<children.length;i++ ) {
                if(children[i].innerText == text)
                    noAnswer=false;
            }
            if(noAnswer)
                obj.parentElement.appendChild(p);
        }
        function addAnswer2(obj, text) { // 선생님 작성
            // obj의 부모요소
            var parent = obj.parentElement;
            // 부모요소의 마지막 자식요소가 버튼(클릭된)이 아니면 이벤트 취소
            if(parent.lastElementChild != obj) {
                return false;
            }

            // p요소 생성
            var pTag = document.createElement("p");
            // p요소의 컨텐츠 추가
            pTag.innerHTML = text;
            // p요소를 부모요소의 자식요소로 추가
            parent.appendChild(pTag);
        }
    </script>
</head>
<body>
    <h3>클릭하면 2,3,4배로 확대하여 출력하는 웹페이지를 작성하라</h3>
    <hr>
    <div>
        <p>Q. 거울아 거울아 세상에서 누가 제일 예쁘니?</p>
        <button onclick="addAnswer(this,'백설공주')">답보기</button>
    </div>
    <div>
        <p>Q. 죽느냐 사느냐 어떤 것이 문제인가?</p>
        <button onclick="addAnswer2(this,'둘다')">답보기</button>
    </div>
</body>
</html>
```
### Challenge 08
- 겜블링 게임 만들기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>겜블링 게임</title>
    <style>
        div {
            font-family: "고딕";
            background-color:antiquewhite;
            padding-left: 10px;
            width:fit-content;
            outline: solid black 1px;
        }
        span {
            padding-right: 20px;
            font-style: italic;
            font-size: 4em;
            height:1em;
            widows: 1em;
            color:blue;
        }
    </style>
    <script>
        // 초기화
        function reset(){
            this.parentElement.removeChild(this); //결과 태그 지움
            // 문서 내 모든 span태그의 값을 0으로 바꿈
            var spanTags = document.getElementsByTagName('span');             
            for(var i = 0;i<spanTags.length;i++){
                spanTags[i].innerHTML="0";
            }
        }
        // 랜덤 숫자 
        function getRandomNumber(){
            return Math.floor(Math.random()*3);
        }
        // 게임결과를 출력
        function finishGame(obj){
            obj.innerHTML = getRandomNumber(); // 현재 박스에 랜덤숫자 넣기
            var parent = obj.parentElement ;
            var children = parent.children;

            // 검사
            var i,
            totallySame=true, /* 전부 같은지 여부 */
            firstValue= children[0].innerText;   // 첫번째 요소의 숫자(이것과 비교함)         
            for(i=1;i<children.length;i++){
                if(firstValue!=children[i].innerText){
                    totallySame=false;
                }
            }

            // 결과 출력
            var pTag = document.createElement('p');
            pTag.onclick = reset; // 클릭하면 reset하는 이벤트
            if(parent.parentElement.lastChild !=parent) // 이전 결과가 있을 경우
                parent.parentElement.removeChild(parent.parentElement.lastChild);
            parent.parentElement.appendChild(pTag);
            
            // 성공
            if(totallySame){
                pTag.innerText="Success(click here to do again)";
                console.log("success");                
            }      
            // 실패          
            else {
                console.log("faild")
                pTag.innerText="fail(click here to do again)";                
            }
        }
    </script>
</head>
<body>
    <h3>겜블링 게임</h3>
    <p>각 숫자를 클릭하면 0에서 2사이의 난수로 바뀝니다 모두 같은 수가 나오면 승리합니다.</p>
    <hr>
    <div>
        <span onclick="innerHTML=getRandomNumber()">0</span>
        <span onclick="innerHTML=getRandomNumber()">0</span>
        <span onclick="finishGame(this)">0</span>
    </div>
</body>
</html>
```
## Chapter09 연습문제 
### 이론 문제
#### 1번
- 답 : 3번
- 이벤트 객체
    - 브라우저가 생성
    - 이벤트에 관련된 정보가 담김
#### 2번
- 답 : 3번
#### 3번
- 답 : 1번
- `addEventListener()`에서 첫번째 인자값은 "onclick"이 아니라 "click"이 들어가야함
#### 4번
##### (1) `document.getElementById("div1")` 
##### (2) `addEventListen("click",f)` 
##### (3) `onclick=f` 
##### (4) `onclick=function(){obj.style.backgroundColor="onchid";}` 
#### 5번
- 답 : 1번
- 이벤트의 시작과 종료는 window 객체
#### 6번
- 답 : 3번
#### 7번
- 답 : 캡쳐단계에서 window객체가 시작점이기에 시작점에서 Propagation을 종료하면 더이상 흐름이 없다. 
#### 8번
- 답 : 1,3,4
#### 9번
##### (1)
```javascript
function(){alert("strong+이벤트 흐름")};
```
##### (2)
```javascript 
function(){alert("p+이벤트 흐름")}
```
##### (3)
- 답 : 2번
#### 10번
- 답:
    - ```javascript
        p.addEventListener("click",function(){alert("hello");})
        ```
## javascript 이벤트
### javascript 이벤트 흐름
- 캡쳐단계
- 버블단계
## 크롬 개발자도구에서 이벤트 리스너 보기
- `Element` 탭 -&gt; `Event Listeners` 탭
- 
# Database
# 궁금한 점.
## javascript에서 리스너함수의 this가 제각각인 이유
- 문제 : 
    - this가 가르키는 대상이 이벤트리스너등록방법마다 다름..
- 현상 
    - inline 이벤트의 리스너함수에서 this
        - window
    - addEventListener 및 DOM의 property에서 추가한 리스너함수
        - 호출한 DOM 객체
- 왜 inline만?
    - 아마 eval()을 통해구현한 것이 아닌가?
        - 이건 아닌듯..
    - 실제로 이 코드를 실행하면 출력은 window 객체가 됨
        - ```javascript
            eval("(function(){console.log(this)})()");
            ```
- inline태그서 해결법
    1. 인라인 속성값 내에서 this를 넘겨주기
        - ```html
            <p onclick="f(this)"></p>
            ```
    2. event객체 사용
        - ```html
            <p onclick="f(event)"></p>
            ```
        - 반드시 인자(argument)값이 `event`여야 함
## javascript addEventListener와 이벤트프로퍼티 등록시 변수의 스코프
[돌아가기](../README.md)  
[2019-12-10](whatIStudied_191210.md)  
[2019-12-12](whatIStudied_191212.md) 

