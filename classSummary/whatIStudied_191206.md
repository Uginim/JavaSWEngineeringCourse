# What I studied today.
Date : 2019-12-06

# 웹표준
## 웹 표준 단어정리
1. block요소 inline요소의 특징
    - block
        - 화면의 한줄을 전부 차지한다.
        - 영역의 크기(width, height)를 가질 수 있다.
        - 줄바꿈 현상이 일어나 y축으로 콘텐츠가 정렬되는 태그
        - ex) div, p, h1~h6, header, nav, section, article, footer, main, aside 
    - inline
        - 현재줄에 필요한 만큼의 너비를 차지한다.
        - 영역의 크기(width, height)를 지정할 수 없다.
        - 줄바꿈 현상이 일어나지 않아 x축 방향으로 콘텐츠가 정렬되는 태그
        - ex) span, mark, a, input, label
2. 박스 모델
    - content
        - 내용
    - padding
        - 내부여백
    - border
        - 테두리
    - margin
        - 외부여백
    - box-sizing : 
        - content-box
            - width의 범위가 content
        - border-box
            - width의 범위가 border
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
            - 단, 부모요소의 position값이 static이 아닌 부모요소
        - fixed : 
            - 화면위치를 기준으로 배치
    - relative, absolute, fixed는 z축을 가진다.
5. z-index
    - 요소의 스택 순서를 지정
6. overflow
    - auto
        - 부모요소의 영역이 자식요소영역보다 크면 스크롤 생성 안 함.
        - 부모요소의 영역이 자식요소의 영역보다 작으면 스크롤 생성함
    - scroll
        - 가로세로 스크롤바를 자식요소 영역의 크기와 상관없이 생성
    - hidden
        - 부모요소의 영역을 벗어나는 자식요소의 영역을 안보이게 함
7. flex

## 유용한 사이트 
### Google Font - 무료 폰트 
- 무료 폰트들이 공유
- [링크](https://fonts.google.com/)
- 원하는 폰트에서 `+` 아이콘 클릭 후 팝업
    - embed 탭
        - 어떻게 삽입할 지
    - costomize 탭
### flat ui colors 
- 색 조합이 애매할 때 찾아가볼것
- [링크](https://flatuicolors.com/)
### Media Queries
- [링크](https://mediaqueri.es/)


## 미디어 쿼리


# 궁금한 점
## absolute 사용시 좌우 
- 처음에 x축(가로)좌표를 설정하지 않으면기존위치에 있다.



[돌아가기](../README.md)  
[2019-12-05](whatIStudied_191205.md)  
[2019-12-09](whatIStudied_191209.md)  

