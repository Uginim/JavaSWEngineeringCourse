# What I studied today.
Date : 2019-12-05

# 웹표준
## 무료 이미지 사이트
- [pixabay](https://pixabay.com/)
## 연습문제 
### 이론문제
#### 2번
- 답 
    - 2번
#### 4번
- 답
    - 2번
#### 6번
- (1) 웹 페이지의 모든 이미지를 보이지 않게 한다.
```css
/* 이미지 안 보이게 */
/* 둘 중 하나만 있으면 됨 */
img{                
    display: none; /* 공간 차지 X    */
}
img{        
    visibility: hidden; /* 공간 차지 */     
}
```
- (2) 웹 페이지의 모든 이미지는 한 라인에 하나씩만 출력한다.
```css
/* 한 라인에 하나씩만 */
img {
    display: block;
}
```
- (3) 웹 페이지의 모든 이미지의 크기는 400X300(픽셀)로 출력한다.
```css
/* 모든 이미지의 크기 */
img {
    width:400px;
    height:300px;
}
```
#### 8번
- (1) 웹 페이지내 모든 `<input type="button">` 버튼의 글자 색을 파란색으로 칠한다.
```css
input[type="button"]{
    color:blue;
}
```
- (2) 웹 페이지내 `<input type="button">` 태그를 가진 모든 버튼에 대해, 마우스가 올라갈 때만 배경색을 노란색으로 칠한다.
```css
input:hover[type="button"]{
    background-color:yellow;
}
```
- (3) 웹 페이지내 `<input type="button">` 버튼에 대해, 마우스로 클릭하면 배경색을 노란색으로 칠한다. 그 후 사용자가 마우스르 다른 곳을 클릭하면 원래대로 돌아온다.
```css
input:focus[type="button"]{
    background-color:yellow;
}
```
### 실습문제
- 소스코드 참조

## 웹 표준 단어정리
1. block요소 inline요소의 특징
    - block
        - 화면의 한줄을 전부 차지한다.
        - 영역의 크기(width, height)를 가질 수 있다.
        - 줄바꿈 현상이 일어나 y축으로 콘텐츠가 정렬되는 태그
        - ex) div, p, h1~h6, header, nav, section, article, footer, main, aside (시맨틱태그들)
    - inline
        - 현재줄에 필요한 만큼의 너비를 차지한다.
        - 영역의 크기(width, height)를 지정할 수 없다.
        - 줄바꿈 현상이 일어나지 않아 x축 방향으로 콘텐츠가 정렬되는 태그
        - ex) span, mark, a, input, label
2. 박스 모델
3. float, clear 개념
4. position : 
    - 여러 요소(이미지, 박스)들을 자유자재로 원하는 위치에 배치
    - 속성값 종류
        - static :  
            - 나열한 순서대로 왼쪽 -> 오른쪽, 위->아래로 배치
            - 위치 속성 top, left 등 사용불가
            - **기본값**!!
        - relative : 
            - 이전 요소를 기준으로 배치 위치 속성 top, left 사용가능
        - absolute : 
            - 부모요소를 기준으로 배치
        - fixed : 
            - 화면위치를 기준으로 배치
    - relative, absolute, fixed는 z축을 가진다.
5. z-index
    - 요소의 스택 순서를 지정
6. overflow
7. flex


# 궁금한 점
## 왜 `position:absolute;`에서 위치를 지정하지 않으면 relative나 static요소 다음에 올까?

[돌아가기](../README.md)  
[2019-12-04](whatIStudied_191204.md) 

