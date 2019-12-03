# What I studied today.
Date : 2019-12-03

# 웹표준
## 연습문제 짝수 풀이
### 2번
- 답 : 1
### 4번
- 답 : 1
### 6번
- 답 : 2
### 8번
- 답 : action, method, get(post), post(get), target
### 10번
- 답 : 4
    
## VSCode 팁
### 감싸는 태그 만들기
- `ctrl` + `alt` + `r`
### 태그 삭제
- `ctrl` + `shift` + `r`
### 태그 수정
- `ctrl` + `r`
### 뒷줄과 라인 합치기
- `ctrl` + `j`
### 라인 복사
- 아래 줄로 복사
    -  `shift` + `alt` + `↓` 
- 윗줄로
    -  `shift` + `alt` + `↑`
### 다음줄 입력
- `ctrl` + `enter`
### 멀티커서
- 위쪽
    - `ctrl` + `alt` + `↓` 
- 아래쪽 
    - `ctrl` + `alt` + `↑`
- 취소
    - `esc`
- 마우스로 연속되지 않은 위치에 주기
    - `alt` + `mouse click`
## display 속성 
- 블록레벨태그 
    - 한줄 다 차지
    - div
- 인라인레벨 태그 
    - content만큼만 공간 차지
    - span
- 예시 
    - ```html
        <!DOCTYPE html>
        <html lang="ko">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Document</title>
            <style>
                div, span, p, mark {
                outline:  1px solid red;
                }
                div {
                    width:100px;
                    height:100px;   
                }
                span{
                    width: 100px;
                    height: 100px;
                }
            </style>
        </head>
        <body>
            <div>울산</div> <span>KH</span> <span>정보교육원</span>
            <p>오늘은 화요일입니다.</p>
            <mark>화요일</mark>
        </body>
        </html>
        ```
## 라디오버튼
- type속성을 radio로 해야함 
    - `<input type="radio">`
- name속성이 같아야 중복해서 안 눌러짐

## 선택자는 괄호가 된다.
- 다음은 Abbreviation 기능 결과
- `html[lang="ko"]>(head>meta[charset="utf-8"]+title{설문지})+body`
```html
<!-- html[lang="ko"]>(head>meta[charset="utf-8"]+title{설문지})+body -->
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>설문지</title>
</head>
<body>
    
</body>
</html>
```
## 레이아웃
- 브라우저는 기본적인 style sheet가 있다.
    - ex body에는 8px의 margin이 있음
- 상위 태그의 높이(height)가 정해져 있지 않으면 height값이 적용 안됨
- box-sizing 속성으로 width값 height값의 기준을 결정 
    - content영역만 기준으로 쓸 지 padding을 포함할지 말지
- 예시
    - ```html
        <!DOCTYPE html>
        <html lang="ko">
        <head>
            <meta charset="UTF-8">    
            <title>레이아웃</title>
            <style>      
                
                * { outline:red 1px solid; }        
                html,body { margin:0px; padding:0px; /* 브라우저의 기본 style sheet 적용값을 덮어씀 */
                height: 100% }
                header {
                    width:100%;
                    height: 15%; /* 상위태그의 높이가 정해져 있지 않으면 지정이 안됨 */
                    text-align: center;
                }
                nav{
                    width: 20%; 
                    height :75%;
                    text-align: center;            
                    float:left;
                }
                section{
                    width: 60%; 
                    height:75%;
                    float:left;
                }
                aside {
                    width: 20%; 
                    height:75%;
                    float:left;
                }
                footer{
                    width:100%;
                    height:10%;
                    clear:both;
                }
                /* section{            
                    padding: 5px;
                    border: 3px dashed blue;
                    margin:10px;
                    width: 600px;
                    box-sizing:border-box; 
                } */
                /* box-sizing: width계산에 padding을 포함할지 말지 */
            </style>
        </head>
        <body>
            <header>header</header>
            <nav>nav</nav>
            <section>section</section>
            <aside>aside</aside>
            <footer>footer</footer>
        </body>
        </html>
        ```

## 웹 표준 필기
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
2. 
## 박스모델 개념
### 박스모델
- HTML 요소들을 박스(사각형) 형태로 그리는 것
- 배치, 색상, 경계 등의 속성을 가진다.
### 박스의 속성
- content : 실제 내용이 표현되는 곳
- padding : 콘텐츠와 테두리 사이의 여백
- border : 박스의 테두리 두께
- margin : 테두리와 박스의 최종 경계 사이의 여백
### 속성값의 개수에 따라 적용되는 위치
```css
/* 4개 */
h1 { margin: 5px 10px 5px 10px; }
    /* top right bottom left */
/* 3개 */
h1 { margin: 5px 10px 5px; }
    /* top right&left bottom */
/* 2개 */
h1 { margin: 5px 10px ; }
    /* top&bottom right&left  */
/* 1개 */
h1 { margin: 5px ; }
    /* top&bottom&right&left  */
```

# Database
## 테이블 스페이스
- 오라클에서 데이터를 저장할 때 사용하는 논리적 저장공간
    - (하드디스크에서는 실제 여러개의 물리적인 데이터파일로 구성될 수 있음)
- 오라클 시스템 운영에 필요한 필수 정보를 담고 있음 
## 시스템 권한 확인하기
- system 계정
```sql
-- 사용자에게 부여된 시스템 권한 확인(사용자명)
SELECT * FROM dba_sys_privs WHERE grantee = 'MDGUEST2';

-- 사용자에게 부여된 롤 확인(사용자명)
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';

-- 사용자에게 부여된 로에 부여된 시스템 권한 확인(롤이름)
SELECT * FROM dba_sys_privs WHERE grantee = 'CONNECT';

-- 타사용자에게 부여한 객체(테이블등)권한 확인 with grant option
SELECT * FROM dba_tab_privs WHERE owner = 'MADANG';
```

## Role
### 롤 생성후 롤 부여하기
```sql
-- 1. 역할 생성
CREATE ROLE Programmer;

-- 2. 역할에 시스템 권한 부여
GRANT CREATE ANY TABLE, CREATE ANY VIEW TO Programmer;

-- 3. 역할에 부여된 시스템 권한 조회
SELECT * FROM dba_sys_privs WHERE grantee = 'PROGRAMMER';

-- 4. mdguest 사용자에게 programmer 역할 부여
GRANT programmer TO mdguest;

-- 5. mdguest 사용자에게 부여된 롤 확인
SELECT * FROM dba_role_privs WHERE grantee = 'MDGUEST';
```
- system권한과 table 권한은 다름
- create table 시스템권한을 부여받으면 자신이 아닌 다른 계정에도 table생성 가능

# 단위 평가 안내
## 화면구현
### 중간평가 16일
- 화면정의서
- 테스트결과서
- 동영상 촬영물
- 소스코드
- 테스트조건, 예상결과
- 공유폴더의 산출물 폴더에 본인 이름으로 제출

## 테이블 삭제시 오류: RESOURCE가 사용중이어서 NOWAIT가 지정되었거나 시간 초과가 만료된...
- 다른계정에서 table을 사용 중 commit을하지 않을때 발생
- rollback이나 commit을 하고 다시 실행할 것

[돌아가기](../README.md)  
[2019-12-02](whatIStudied_191202.md) 
