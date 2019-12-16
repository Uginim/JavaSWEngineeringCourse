# What I studied today.
Date : 2019-12-16

# 웹표준
## flex box layout
- 플렉스 아이템을 원하는 위치에 배치하는 것
- 아이템의 크기뿐만 아니라 배치하는 방향과 순서, 정렬 방법, 간격 등을 제어함
### 플렉스 박스 레이아웃의 구성
- 플렉스 컨너테이너(부모 박스)
    - 플렉스 박스 레이아웃을 적용할 대상을 묶는 요소
- 플렉스 아이템(자식 박스)
    - 플렉스 박스 레이아웃을 적용할 대상
- 주축
    - 플렉스 컨테이너 안에서 플렉스 아이템을 배치하는 주 방향
    - 기본값 : 수평
- 교차 축 
    - 주축과 교차되는 축
    - 기본값 : 수직

### 플렉스 컨테이너
#### display 속성
- 플렉스 박스 레이아웃을 쓰려면 display속성을 아래 값들로 해야함
- flex
    - 컨테이너 안의 아이템을 블록 레벨 요소로 배치함
- inline-flex
    - 컨테이너 안의 아이템을 인라엔 레벨 요소로 배치함
#### flex-direction 속성
- row
    - 주축 : 가로
    - 방향 : 오른쪽(향함)
- row-reverse
    - 주축 : 가로
    - 방향 : 왼쪽
- column
    - 주축 : 세로
    - 방향 : 아래(향함)
- column-reverse
    - 주축 : 세로
    - 방향 : 위쪽
#### flex-wrap 속성
- nowrap
    - 한줄에 표시
    - 기본값 
- wrap
    - 아이템을 여려줄에 표시
- wrap-reverse
    - 아이템을 여러줄에 표시
    - 방향이 반대로
#### flex-flow 속성
- flex-direction속성과 flex-wrap속성을 합침
- 기본값
    - `row nowrap`

#### justify-content 속성
- 주축의 아이템 간 간격을 지정
- flex-start
    - 시작점에서부터 배치
- flex-end
    - 끝점에서부터 배치
- center
    - 중앙에 맞추어 배치
- space-between
    - 처음 항목과 마지막항목은 양끝에 붙이고 그 사이에 나머지를 동일 간격으로 배치
- space-around
    - 모든 항목이 같은 좌우마진을 가지도록 하고 간격을 꽉 맞추어 배치
    - 아이템을 중심으로 좌우(양쪽) 간격을 동일하게 
- space-evenly
    - 벽과 아이템 사이를 포함해 모든 간격을 동일하게 배치
#### align-content 속성
- 교차축의 아이템간 간격을 지정함
- strech
    - 아이템을 늘려서 배치(간격 없음)
    - (아이템의 크기가 container의 크기에 맞춰서 늘어나거나 줄어듬)
    - 아이템의 크기가 정해져 있을경우 아이템 자신의 크기에 맞춤
    - 기본값
- flex-start
- flex-end
- center
- space-around
- space-between


### flex box layout 예시1
- display, flex-direction
```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        div {
            outline: 1px solid red;
        }

        div.container {
            outline: 1px solid blue;
            display: flex;
            /* 공간이 있던 없던 한 라인 다 배치 */
            /* 인라인으로 배치 */
            /* display: inline-flex;  */
        }

        div.container.opt1 {
            flex-direction: row;
        }

        div.container.opt2 {
            flex-direction: row-reverse;
        }

        div.container.opt3 {
            flex-direction: column;
        }

        div.container.opt4 {
            flex-direction: column-reverse;
        }

        .opt3,
        .opt4 {
            height: 400px;
        }

        div.item {
            width: 50px;
            height: 50px;
            margin: 5px;
            /* float: left; */
        }

        /* .clearfix{        
        clear:both;
    } */
    </style>
</head>

<body>
    <div class="container opt1">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
        <!-- <div class="clearfix"></div> -->
    </div>
    <div class="container opt2">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
        <!-- <div class="clearfix"></div> -->
    </div>
    <div class="container opt3">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
        <!-- <div class="clearfix"></div> -->
    </div>
    <div class="container opt4">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
        <!-- <div class="clearfix"></div> -->
    </div>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo perferendis nihil earum blanditiis id,
        provident, vitae neque dolores, eaque cum quibusdam. Cupiditate nemo, blanditiis et officiis adipisci maxime
        nisi autem.</p>
</body>

</html>
```

### flex box layout 예시2
- flex-wrap
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        div {outline: 1px solid red;}
        .container{
            outline: 1px solid blue;
            /* display: inline-block; */
            display: flex;
            width:200px;

            /* 아래는 기본값 */
            flex-direction: row;            
            /* flex-wrap: nowrap; */

            /* 부모영역 width(축방향)보다 아이템 영역이 크면 줄바꿈 */
            /* flex-wrap: wrap;  */

            /* wrap과 동일하지만 순서가 바뀜 */
            /* flex-wrap: wrap-reverse; */

            /* flex-flow : flex-direction, flex-wrap의 단축속성 */
            flex-flow:row nowrap; 


        }
        .item{
            width:50px; height:50px; margin: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
        <div class="item box5">box5</div>
        <div class="item box6">box6</div>
    </div>
</body>
</html>
```

### flex box layout 예시3
- justify-content
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    div{outline:1px solid red;}
    div.container{
        outline: 1px solid blue;
        display: flex;
        flex-wrap: row nowrap;

        /* 기본값: 주축 시작점에 정렬 */
        justify-content: flex-start;

        /* 주축 끝점에 정렬 */
        justify-content: flex-end;

        /* 주축의 중간에 정렬 */
        justify-content: center;

        /* 양끝단 항목을 시작점과 끝점에 맞춰놓고 동일한 간격으로 배치 */
        justify-content: space-between;

        /* 아이템을 중심으로 좌우(양쪽) 간격을 동일하게 정렬 */
        justify-content: space-around;

        /* 벽사이 포함 아이템간 모든 간격을 동일하게 정렬 */
        justify-content: space-evenly;
    }
    div.item {width:50px; height: 50px;margin: 5px;}
    .container > .item.box1{
        order:4;
    }
    .container > .item.box2{
        order:2;
    }
    .container > .item.box3{
        order:1;
    }
    .container > .item.box4{
        order:3;
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
    </div>
</body>
</html>
```
### flex box layout 예시4
- align-content
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        div{outline: 1px solid red;}
        div.container{
            outline:1px solid blue;
            display: flex;
            flex-flow: row nowrap;
            justify-content: flex-start;


            
            /* align-content  
                컨테이너가 높이가 있고 flex-wrap속성값이 wrap이면서 2줄 이상일 때 사용 */
            height: 300px; width: 250px; 
            flex-flow: row wrap;
            
            /* 기본값 : 
                - stretch:
                    플렉스 아이템을 늘려서 간격 없이 배치
                    (아이템의 크기가 container의 크기에 맞춰서 늘어나거나 줄어듬)
                    자신의 크기가 있을경우 자신의 크기에 맞춤  */                    
            align-content: stretch;
            align-content: flex-start;
            align-content: flex-end;
            align-content: center;
            align-content: space-around;
            align-content: space-between;
            /* space-evenly는 없음 */
        }
        .item {            
            /* width: 50px; height: 50px; margin: 5px; */
            height: 50px; 
            width:100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="item box1">box1</div>
        <div class="item box2">box2</div>
        <div class="item box3">box3</div>
        <div class="item box4">box4</div>
        <div class="item box5">box5</div>
        <div class="item box6">box6</div>
    </div>
</body>
</html>
```


# 기타
- 화면 정의서의 개정이력은 슬라이드 마스터로 들어가야함....
- 화면 사진은 뺄것(아직 없으니까..)
    - 최종 결과물은 들어있을 것
- 테스트 정의서
    - 문서는 항상 인쇄 미리보기할 것
- 문서의 이름 변경
    - 인쇄 -> 페이지 설정 -> 머릿글/바닥글 -> 바닥글 편집
    
# 궁금한 점
- `display:inline-block` 하면 맨위 항목의 윗마진과 맨 아래 항목의 밑마진이 먹는 이유
- 
<br><br>

[돌아가기](../README.md)  
[2019-12-13](whatIStudied_191213.md)  
[2019-12-17](whatIStudied_191217.md) 

