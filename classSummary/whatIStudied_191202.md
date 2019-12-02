# What I studied today.
Date : 2019-11-29

# 웹표준
## 유용한 사이트들
### CodePen
- 웹에서 바로 테스팅 가능함
- [링크](https://codepen.io/)
### W3C
- 각종 웹 표준
- [HTML 5.2 Standard](https://www.w3.org/TR/html52/)

### W3Schools
- 웹 개발 관련 각종 튜토리얼
- [링크](https://www.w3schools.com/)
### HTML5에서 새로워 진 것 - W3School
- [링크](https://www.w3schools.com/html/html5_intro.asp)
## 연습문제(짝수) 풀이 105p
### 2번
### 4번
### 6번
### 8번
### 10번
```html
<a href="http://www.mysite.com/html/design/dress.html">옷</a>
<a href="http://www.mysite.com/html/design/shoes.html">신발</a>
```
- 답
    ```html
    <base href="http://www.mysite.com/html/design/">
    <a href="dress.html">옷</a>
    <a href="shoes.html">신발</a>
    ```
### 12
blue, purple, red
### 14
- [검사기](https://validator.w3.org/) 에서 검사함
- (1)
    - `<!doctype html>` 없음
    - `<title>`태그는 비어 있으면 안된다.
- (2)
    - `<br>`태그는 단독태그
        - 닫는 태그가 있어서는 안된다.
    - `<title>`태그는 비어 있으면 안된다.
<br>

### 16
```html
<audio>
    <source src="hello.mp3" type="audio/mpeg">
    audio를 지원하지 않습니다.
</audio>
```
## 실습문제 풀이 p108
### 2번
#### (1)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>도서 소개</title>
</head>
<body>
    <h1>도시 소개</h1>
    <hr>
    <dl><!-- description list -->
        <dt><b>Califonia</b></dt> <!-- desription term -->
        <dd>맑고 화창한 날씨가 좋고 태평양의 아름다운 해변을 가진 멋진 주</dd>
        <dt><b>Florida</b></dt>
        <dd>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda aperiam commodi veritatis beatae repellendus iste reiciendis.</dd>
        <dt><b>Texas</b></dt>
        <dd>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Vel maxime beatae sunt hic similique perferendis debitis?</dd>
        <h3>gkdjklgsg</h3>

    </dl>
    
</body>
</html>
```
#### (2)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>살빼는 방법</title>

</head>
<body>
    <h1>살빼는 방법</h1>
    <hr>
    <ul>
        <li>고기를 많이 먹는 고기 다이어트</li>
        <li>채소를 많이 먹는 채소 다이어트</li>
        <li>적게 먹고 운동하는 운동 다이어트</li>
    </ul>
    
</body>
</html>
```
### 4번
#### (1)
```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>신체 검사</title>
    <style>
        
    </style>
</head>
<body>
    <h3>신체 검사</h3>
    <hr>
    <table border="1">
        <caption>학생 신체 검사표</caption>
        <thead>
            <tr>
                <th>이름</th>
                <th>키</th>
                <th>체중</th>
                <th>시력</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>황기태</td>
                <td>179</td>
                <td>67</td>
                <td>1.0</td>
            </tr>
            <tr>
                <td>이재문</td>
                <td>177</td>
                <td>77</td>
                <td>2.0</td>
            </tr>
            <tr>
                <td>황기태</td>
                <td>189</td>
                <td>87</td>
                <td>1.2</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th>평균</th>
                <th>181</th>
                <th>77</th>
                <th>1.3</th>
            </tr>
        </tfoot>
    </table>
</body>
</html>
```
#### (2)
```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>과일 수입</title>
    <style>
        
    </style>
</head>
<body>
    <h3>과일 수입</h3>
    <hr>
    <table border="1">
        <caption>과일 수입 표</caption>
        <thead>
            <tr>
                <th>사과</th>
                <th>바나나</th>
                <th>망고</th>            
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><img src="img/apple.svg" width="100px" height="100px" alt="사과"></td>
                <td><img src="img/banana.svg" width="100px" height="100px" alt="바나나"></td>
                <td><img src="img/mango.svg" width="100px" height="100px"  alt="망고"></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th>페루</th>
                <th>필리핀</th>
                <th>호주</th>
            </tr>
        </tfoot>
    </table>
</body>
</html>
```

## VSCode 팁
### 다음줄 입력
- `ctrl` + `enter`
### shorcut 세팅하기
- 방법
    1. 메뉴 바에 File
    2. Preference
    3. Keyboard Shorcuts
- user keybindings 넣기
    - Keyboard Shortcuts 화면에서 우측상단 "Open Keyboard Shortcuts" 클릭
    - 다음과 같이 설정
- ```json
    // Place your key bindings in this file to override the defaultsauto[]
    [
        {
        "key": "ctrl+j",
        "command": "editor.action.joinLines"
        },
        {
        "key": "ctrl+r",
        "command": "editor.emmet.action.updateTag"
        },
        {
        "key": "ctrl+shift+r",
        "command": "editor.emmet.action.removeTag"
        },
        {
        "key": "ctrl+alt+r",
        "command": "editor.emmet.action.wrapWithAbbreviation"
        }
    ]
    ```
- user keybindings 확인하기
    - Keyboard Shortcuts 화면에서 우측상단 `...` 아이콘 클릭
    - Show User Keybindings
### 감싸는 태그 한번에 넣기
- 위 설정대로 했을 시 사용 가능
- 사용법
    1. 감쌀 요소들을 드래그 
    2. `ctrl`+`alt`+`r`을 누름
    3. 감쌀 태그 입력
- 그럼 한번에 넣을 수 있다!
### lorem 자동으로 문자열 채워넣기
- `lorem` 타이핑 후 `tab`키 누르면 일정한 길이의 문자가 생성됨
- 더 긴 문장이 필요할 경우
    - `lorem` 타이핑 후 `*`에스트릭스 담에 곱할 숫자
    - 예시) ` lorem * 3 ` 
### 선택자로 태그 생성하기
- 다음을 입력 후 `ctrl`+`space` 이후 `tab`키 누름
```html
    ur>li>a[href]*4
```
- 결과
    - ```html
        <ul>
            <li>
                <a href=""></a>
                <a href=""></a>
                <a href=""></a>
                <a href=""></a>
            </li>
        </ul>
        ```
## icon finder
- 무료 아이콘 
    - 유료도 있지만 무료도 있다.
- [링크](https://www.iconfinder.com/)

## 시맨틱 태그
- html 태그들에 역할 및 이름을 부여해서 웹 접근성을 지원해줌
- 화면낭독기가 읽고 해당 태그가 무엇을 나타내는 지 알기 쉬움
## Challenge 02 풀기
- [내 소스](../exmaples/html/book/ch02/Challenge02.html)
- [선생님 소스](../exmaples/html/book/ch02/Challenge02-teacher.html)
    - div태그로 역할별로 구역을 나눔
## ScreenHunter 6
- 화면 캡쳐 유틸
- `F6`키 눌러서 활성화

# Database
## 데이터베이스 구현
- 학습안내서 p17 참조
## 데이터베이스 관리
### 테이블스페이스
- 테이블스페이스(Tablespace) 
    - 오라클에서 데이터를 저장할 때 사용하는 논리적인 저장공간
#### TABLESPACE 생성
- 폴더를 먼저 생성해놓고 다음 명령어를 실행해야함
```SQL
-- 테이블스페이스 생성 명령
CREATE TABLESPACE md_tbs
  DATAFILE 'D:\JAVASTUDY\madang\oradata\md_tbs_data01.dbf'
  SIZE 10M;
CREATE TABLESPACE md_test
  DATAFILE 'D:\JAVASTUDY\madang\oradata\md_test_data01.dbf;'
  SIZE 10M;
```
#### TABLESPACE 삭제
```SQL
-- 테이블스페이스 삭제하기  
DROP TABLESPACE md_test
  INCLUDING CONTENTS AND DATAFILES;
```
### 사용자 계정
#### 사용자 계정 생성하기 
- 기본형태
    - ```sql
        CREATE USER [사용자이름]
            IDENTIFIED BY [비밀번호]
            DEFAULT TABLESPACE [테이블 스페이스];
        ```
- 테이블 스페이스를 지정하지 않으면 오라클에서 기본으로 users 테이블 스페이스를 할당함
```sql
-- 새로운 사용자 mdguest 생성
CREATE USER mdguest
  IDENTIFIED BY mdguest;
  
CREATE USER mdguest2
  IDENTIFIED BY mdguest2
  DEFAULT TABLESPACE md_tbs;

```
#### 접속 권한 주기
```sql
--접속 권한 주기
GRANT CONNECT TO mdguest;

-- RESOURCE 권한 주기
GRANT RESOURCE TO mdguest;
-- 한번에
GRANT CONNECT,RESOURCE TO mdguest2;
```
### ERROR 
#### RESOURCE 권한을 주고도 TABLE이 생성되지 않을 때
- 새로운 계정의 워크시트를 닫고 재 접속 해볼 것!

### 권한 관리
#### 갓 만들어진 mdguest의 빈약한 권한
- 막 생성 후 mdguest계정에겐 visibility도 없음
- 예시
    - ```sql
        select * from madang.book;
        ```
    - 결과
        ```        
        ORA-00942: table or view does not exist
        00000 -  "table or view does not exist"
        *Cause:    
        *Action:
        6행, 22열에서 오류 발생
        ```
#### mdguest계정에 Book테이블에 대한 select 권한 부여하기 
1. madang 계정으로 접속
2. 다음 명령어
    - ```sql
        GRANT SELECT ON Book TO mdguest;
        ```
#### mdguest계정에 customer테이블에 대한 select 및 update 권한 부여 및 WITH GRANT OPTION
- `WITH GRANT OPTION` 옵션을 주면 부여받은 권한을 다른 계정에게도 부여할 수 있음
    다단계같은거
    1. madang 계정으로 접속
    2. 다음 명령어
        - ```sql
            GRANT SELECT, UPDATE ON Customer TO mdguest WITH GRANT OPTION;
            ```
#### mdguest계정이 mdguest2계정에 권한 부여
- 아까 부여받은
- 방법
    1. mdguest 계정으로 접속
    2. 다음 명령어
        - ```sql
            GRANT SELECT ON madang.customer TO mdguest2;
            ```
#### 모든 계정에게 권한 부여
```sql
GRANT SELECT ON Orders TO PUBLIC;
```

    
[돌아가기](../README.md)  
[2019-11-29](whatIStudied_191129.md) 
