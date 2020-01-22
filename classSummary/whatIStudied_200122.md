# What I studied today.
Date : 2020-01-22
# 구직 관련
- [TOIBE](https://www.tiobe.com/tiobe-index/)
    - 언어 사용 순위

# 웹표준
- [ECMA 인터네셔널](https://www.ecma-international.org/)
    - ECMA-262 기술규격
        - Javascript 표준
- [MDN](https://developer.mozilla.org)
    - javascript, http, html 등 웹 개발 교육자료 포함.
## EventListener 연습
1. 캡처링,버블링
2. Event 객체
    - type
        - 이벤트 타입
    - target
        - 실제로 이벤트가 발생한 요소
    - currentTarget
        - 이벤트 리스너를 등록한 요소
    - 이벤트 전파를 중단하는 메소드
        - preventDefault()
            - 현재 이벤트의 기본동작 중단
        - stopPropagation()
            - 현재 이벤트 이후로의 이벤트 전파 중단
          - stopImmediatePropagation()
            - `stopPropagation()` + 현재에 추가로 등록된 이벤트 중단 
            - [참조](https://developer.mozilla.org/ko/docs/Web/API/Event/stopImmediatePropagation)
- 예시 
    - ```html
        <!DOCTYPE html>
        <html lang="ko">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>이벤트 리스너 연습</title>
            <script>
                window.addEventListener("load",init,false);
                function init() {
                    document.getElementsByTagName("ul")[0].addEventListener("click",function(e){
                        if(e.currentTarget === e.target.parentElement)
                            e.target.remove();
                    },false);      
                    document.getElementsByClassName("container")[0].addEventListener("click",function(e){
                        e.stopPropagation();
                        alert('공사중!!');
                    },true);
                    // document.getElementsByClassName("container")[0].addEventListener("mousedown",function(e){
                    document.getElementsByTagName("html")[0].addEventListener("mousedown",function(e){
                        if(e.button === 2){
                            alert('스크랩 금지');
                            e.stopPropagation();                    
                        }
                        
                    },true);
                    
                }
            </script>
        </head>
        <body>
            <div class="container">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                </ul>
            </div>
        </body>
        </html>
        ```
### 실습 버킷리스트 만들기 2
1. UL, LI태그 사용
2. 항목 추가 
    - 추가 버튼 클릭시 항목 추가
3. 항목 삭제
    - 삭제 이벤트는 1개만 등록하여 li요소 클릭시 제거
4. 각 LI 항목의 배경색 
    - 홀수항목 파랑
    - 짝수항목 노랑
    - style요소에서 지정할것(css)사용하기  
        `<li class="색상">버킷리스트 항목</li>
- 소스코드 
    - ```html
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>위시리스트 만들기</title>
            <style>
                ol>li.color:nth-child(odd){
                    background-color: blue;
                }
                ol>li.color:nth-child(even){
                    background-color: yellow;
                }
                .odd{
                    background-color: blue;
                }
                .even{
                    background-color: yellow;
                }
            </style>
            <script>
                function init(e){
                    var addBtn = document.querySelector('input[type="button"][value="추가"]');
                    var textInput = document.querySelector('input#bucket');
                    var bucketList = document.querySelector('ol');
                    console.log("ol",bucketList);
                    // 
                    addBtn.addEventListener('click', event => {
                        // 생성
                        var newBucketItem = document.createElement('li');
                        // 값 넣기
                        newBucketItem.innerText = textInput.value;
                        // newBucketItem.classList.add("color");
                        // 리스트에 추가
                        bucketList.appendChild(newBucketItem);
                        // 인풋 정리
                        textInput.value ="";
                        // 어쩔 수 없이 짝홀 수동
                        listRefresh(bucketList);
                    });
                    // 삭제
                    bucketList.addEventListener('click',event=>{      
                        if(event.currentTarget === event.target.parentElement)
                            event.target.remove();
                        // 어쩔 수 없이 짝홀 수동
                        listRefresh(event.currentTarget);
                    },false);

                    // 키보드 이벤트
                    textInput.addEventListener("keydown", event => {   
                        if (event.keyCode === 13) {
                            if(event.shiftKey ){

                            }else {
                                addBtn.click();
                            }
                        }
                    });

                }
                function listRefresh(list){            
                    var items = list.children;
                    var i;
                    for(i=0;i<items.length;i++){
                        if(i%2===0){
                            items[i].classList.remove('even');
                            items[i].classList.add('odd');
                        }else{
                            items[i].classList.remove('odd');
                            items[i].classList.add('even');
                        }
                    }
                }
                window.addEventListener("load",init);
            </script>
        </head>
        <body>
            <h3>버킷리스트</h3>
            <ol> </ol>
            <input type="text" id="bucket">
            <input type="button" value="추가">
        </body>
        </html>
        ```
- css로 짝수/홀수 스타일 적용하는 방식 작성 이후 class 이름 자체를 짝수 홀수 따로 주라고 요구사항이 바뀜

# JSP2.3 & Servlet 3.1

<br><br><hr>
[돌아가기](../README.md)  
[2020-01-21](whatIStudied_200121.md)  
[2020-01-23](whatIStudied_200123.md)  


