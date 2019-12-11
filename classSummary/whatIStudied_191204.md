# What I studied today.
Date : 2019-12-04

# 웹표준
## 연습문제 4장 짝수문제 풀이
### 2번
- (1) 
    - ` div{ font-size:30px}`
- (2)
    - `<p style="color:blue; font-size:30px">안녕하세요</p>`
- (3)
    - `p { text-indent : 5em}` 혹은 `p { text-indent : 5px}`
    - 맨뒤에는 꼭 `;`(세미콜론)이 필요하지 않다.
- (4)
    - `p { color : blue }`
### 4번
- 모든 HTML 태그는 박스 모델의 적용을 받음
- 여백(margin) 색은 지정할 수 없음 *p186*
    - 부모 태그의 색이 비춰 출력됨. 
    - [css background - drafts](https://drafts.csswg.org/css-backgrounds/#the-background-color)
    - [css background - current](https://www.w3.org/TR/2017/CR-css-backgrounds-3-20171017/#the-background-color)
        - background-color property는 투명색이 기본
        - 상속은 되지 않는다.
- 테두리(border)와 패딩(padding)의 색은 배경색과 같음 *p186*
### 6번
- em
### 8번
- selector로 타겟팅이 중요함
- a.css
    - ```css
        @charset "utf-8";
        body {
            background-color:yellow;
        }
        p {
            text-align:center;
        }
        /* 새로 추가함 */
        p:nth-child(1){
            color:red; font-size:3em
        }
        p:nth-child(2) > span{
            color:green
        }
        ```
```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CSS3</title>
    <link rel="stylesheet" href="css/a.css">
    <style>
        p { color : blue; text-align : right; font-size : 2em;}
        
    </style>
</head>
<body>
    <!-- <p style="color:red; font-size:3em">text <span>code</span></p> -->
    <p >text <span>code</span></p>
    <!-- <p>test <span style="color:green">code</span></p> -->
    <p>test <span >code</span></p>
</body>
</html>
```
### 10번
### 12번

## 셀렉터
- class 
    - 그룹을 지음
    - 값이 여러개 올 수 있음
- id
    - 현재 문서에서 하나
    - 태그 당 하나만 부여

- 클릭하는 동안 적용되는 가상셀렉터는 :active
## display속성 inline-block
- inline처럼 가로로 나란히 배치되면서
- block처럼 크기를 가질 수 있음
- 대신 margin이 없음
## float을 쓰면 다음 요소가 가려지는 이유
- float을 쓰면 z-index가 상승함

## 과제 중 encounting 문제점
- 마진 상쇄문제
    - body의 첫번째 자식요소가 위(top)에 margin이 있을 때 부모요소를 벗어남
        - 첫번째 자식요소의 top의 마진을 지우고 부모요소의 padding으로 대체함
    - 형제요소끼리 margin이 겹침
        - top과 bottom중 하나만 margin을 줌
- 마진값의 percentage 계산은 width가 기준
    - top과 bottom의 값도 width가 기준이라 문제됨
    - position을 relative로 하고 top, left속성써서 percentage 적용함
    - [mdn 참조](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)


[돌아가기](../README.md)  
[2019-12-03](whatIStudied_191203.md)  
[2019-12-05](whatIStudied_191205.md) 

