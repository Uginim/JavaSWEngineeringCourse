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

|id|#|document.getElementById("id속성값");|$("#속성값");|
|class|.|document.getElementsByClass("class속성값");|$(".클래스값");|
|tag| |document.getElementsByTagName
# JSP2.3 & Servlet 3.1

<br><br><hr>
[돌아가기](../README.md)  
[2020-01-20](whatIStudied_200120.md)  
[2020-01-22](whatIStudied_200122.md)  


