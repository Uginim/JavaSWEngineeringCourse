# What I studied today.
Date : 2020-01-21
# 구직 관련
- `연매출/인원수 > 1억` 인 곳을 가야함
# Andoird 개발
## Android Studio 설치
- [다운로드 경로](https://developer.android.com/studio/?gclid=EAIaIQobChMI-Z7r9beT5wIVR3RgCh0RKgoeEAAYASAAEgL_h_D_BwE)
# 웹표준
## CSS
- [css tutorial](https://www.w3schools.com/css/)
### Selector 연습
- 속성 선택자
    - `^=`과 `|=`의 차이
        - `|=` 
            - 해당 문자열이거나 해당문자열에 `-`(하이픈/대시)가 붙어서 시작하는 것만 찾음
        - `^=`
            - 해당 문자열로 시작하면 다 찾음
        - 예시
            - ```html
                <!DOCTYPE html>
                <html>
                <head>
                <style>
                [lang|=en] {
                    background: yellow;
                }
                [lang^=en] {
                    outline: 1px solid red;
                }
                </style>
                </head>
                <body>

                <p lang="en">Hello!</p>
                <p lang="en-us">Hi!</p>
                <p lang="en-gb">Ello!</p>
                <p lang="english">Ello!</p>
                <p lang="us">Hi!</p>
                <p lang="no">Hei!</p>

                </body>
                </html>
                ```
- 가상클래스
    - nth-child와 nth-of-type의 차이
        - nth-child : 
            - 모든 자식의 순서에서 찾음
        - nth-of-type: 
            - 해당하는 자식 태그 요소들 사이에서의 순서를 찾음


||지시자|javascript 메소드|JQuery|
|---|---|---|---|
|id|#|document.getElementById("id속성값");|$("#속성값");|
|class|.|document.getElementsByClass("class속성값");|$(".클래스값");|
|tag| |document.getElementsByTagName("Tag 이름");|$("태그이름")|

### 셀렉터 익숙해지기
- 과제 위시리스트 만들기
- 소스코드
    - ```html
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>위시리스트 만들기</title>
            <script>
                function init(e){
                    var addBtn = document.querySelector('input[type="button"][value="추가"]');
                    var textInput = document.querySelector('input#bucket');
                    var bucketList = document.querySelector('ol');

                    // 
                    addBtn.addEventListener('click', event => {
                        // 생성
                        var newBucketItem = document.createElement('li');
                        // 값 넣기
                        newBucketItem.innerText = textInput.value;
                        // 색 추가
                        newBucketItem.style.background=randomRGBStr();
                        // 삭제
                        newBucketItem.addEventListener('click',event=>{                    
                            event.currentTarget.remove();
                        });
                        // 리스트에 추가
                        bucketList.appendChild(newBucketItem);
                        // 인풋 정리
                        textInput.value ="";
                    });


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
                window.addEventListener("load",init);
                function randomByteHex(){
                    var hexStr = Math.floor(Math.random()*256).toString(16);
                    if (hexStr.length==1)
                        return '0'+hexStr;
                    return hexStr;
                }
                function randomRGBStr(){
                    return '#' + randomByteHex() + randomByteHex() + randomByteHex();
                }
            </script>
        </head>
        <body>
            <h3>버킷리스트</h3>
            <ol>

            </ol>
            <input type="text" id="bucket">
            <input type="button" value="추가">
        </body>
        </html>
        ```

<br><br><hr>
[돌아가기](../README.md)  
[2020-01-20](whatIStudied_200120.md)  
[2020-01-22](whatIStudied_200122.md)  


