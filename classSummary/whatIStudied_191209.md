# What I studied today.
Date : 2019-12-09

# 웹표준
## Javascript
- 웹 범용언어
- 넷스케이프(Netscape Communications Corporation) 사에서 개발
- 웹 프로그래밍의 개념을 창시한 언어
### 웹페이지에서 자바스크립트 역할
- 사용자의 입력 및 계산
- 웹페이지 내용 및 모양의 동적 제어
- 브라우저 제어
- 웹 서버와의 통신
- 웹 애플리케이션 작성
### 자바스크립트 코드의 위치
1. HTML 태그의 이벤트 리스너 속성에 작성
2. `<script></script>` 태그에 작성
3. 자바스크립트 파일에 작성
4. URL 부분에 작성
### 용법 예시
```javascript
// write 예시
document.write("<h3>Welcome!</h3>");

// prompt예시
var ret = prompt("이름을 입력하세요","기본값");
if(ret == null){
    // 취소 버튼이나 다이얼로그를 닫은 경우
}
else if(ret == "") {
    // 문자열 입력 없이 확인 버튼 누른 경우
}
else {
    // ret에는 사용자가 입력한 문자열
}

// confirm() 예시
var ret = confirm("완료할까요?");
if (ret == true) {
    // 사용자가 확인 누름
}
else {
    // 취소 버튼이나 다이얼로그 닫음
}

// alert()
alert("메시지");
```
### DOM
### undefined 
- 선언은 되었지만 "값이 할당"("초기화")되지 않은 상태
### `typeof` 연산자
- 해당 변수의 타입을 알 수 있다.
- ```javascript
    var a = 10;
    console.log(typeof a );
    ```
### `console.log()` 
- 중간 중간 결과를 알고 싶을 때 사용
- 개발자 도구 console 탭에서 확인
### 자바스크립트의 객체
- 객체
    - 프로퍼티
        - 객체의 고유한 속성
    - 메소드
        - 객체가 가지는 함수들
### 자바스크립트 객체 유형
1. 코어 객체
    - 자바 스크립트 언어가 실행되는 환경 어디서나 사용가능한 기본 객체
    - 표준 객체
    - Array, Data, String, Math 등    - 
2. HTML DOM 객체
    - HTML 문서에 작성된 각 HTML 태그들을 객체화 한 것
    - 내용과 모양을 제어
    - W3C의 표준 객체
3. 브라우저 객체     
    - BOM(Browser Object Model)이라고도 함
    - 브라우저 종류
    - 스크린의 크기
#### 코어 객체
- 종류
    1. Array
    2. Date
    3. String
    4. Math
- new 키워드로 코어 객체 생성
    - ```javascript 
        var today = new Date();
        var msg = new String("Hello");
        ```
## VS Code tip
- Togle tab key moves focus
    - `ctrl` + `m`
        - 이거하면 tab키 안먹음 당황하지 말 것
## 연습문제
### 이론문제
#### 2번
- 답 : 3
#### 4번
- 답 : 3
#### 6번
- 답 : 4
#### 8번
- (1) 
    - s 
        - "3hello3"
    - t
        - "1hello23"
- (2)
    - s
        - false
    - t
        - false
#### 10번
- (1) : "합 = 0"이라고 출력됨
- 소스코드상의 전역변수 sum은 window 객체의 멤버로 들어간다.
- (2) : "합 = 45"이라고 출력됨
#### 12번
#### 14번
- (1) 
    - a="12345"
    - b="45"
- (2)
    - a=168
    - b="45"
- (3)
    - a="1012345"
    - b="45"
- (4)
    - a="123"
    - b="133ab"

# Database
## 용어정리 2
- sequence 시퀀스
    - 용도: 순차적으로 중복되지 않는 번호를 자동으로  
            발생시킬 필요가 있는 컬럼에 사용한다(기본키, 대리키 등)
    - 특징 : 테이블과 별도의 공간에 저장  
            DML이 롤백되어도 이미 생성된 시퀀스 번호는 롤백되지 않다.
- synonym 시노님(동의어)
    - 목적
        - 편의성
            - 간단한 별칭사용
            - 사용자 계정 없이도 접근가능  
                (public synonym: admin만 생성가능)
        - 보안성
            - 원객체를 숨길 수 있어 보안에 유리, 특히 public은 소유자도 숨김
- 무결성 p(88~89)
    - 개체무결성 
        - 릴레이션 내에 기본키(null값 없음, 중복없음)를 가져야 함
    - 참조무결성
        - 왜래키는 부모 릴레이션의 기본키를 참조하고 도메인이 동일해야함
    - 도메인무결성
        - 릴레이션 내의 튜플들이 각속석의 도메인에 지정된 값만을 가져야 함
- 인덱스 유효성 여부 검사
    1. 인덱스 분석자료 수짐
        - ```sql
            analyze index 인덱스이름 validate structure;
            ```
    2. 인덱스 분석된 통계자료조회
        - ```sql
            select * from index_stats;
            ```
    3. 인덱스 삭제비율(del_if_rows / if_rows)이 높으면 Rebuild
        - `lf_rows`
            - 인덱스 생성 시 만들어진 레코드 수
        - `del_lf_rows`
            - 인덱스 생성 후 삭제된 레코드 수
        - ```sql
            alter index bookid_pk rebuild;
            ```
## 대리키를 쓰는 순간
- 마땅한 기본키가 없을 때
- 보안상 키로 사용하는 값을 노출시키고 싶지 않을 때
## Sequence
### Sequence 생성
```sql
create sequence custid_seq
  start with 1        --시작값
  increment by 1     --증가값
  minvalue 1         --최소값
  maxvalue 10000000 --최대값
  nocycle;            --1회만 순환
  
```
## Synonym 
### synonym 생성
```sql
-- synonim 생성  
create synonym ord for orders;  
select * from ord;
```
#### synonym 사용하기 
```sql
-- mdguest 계정
-- synonym 사용
select * from madang.ord;

```
#### public synonym생성(공용 동의어)
- 사용자 계정을 적지 않고 접근
```sql
-- system 계정
-- public synonym(공용 동의어) 생성
create public synonym ord for madang.orders;
```
## Index
- primary key를 생성하면 자동으로 index만들어짐
# 궁금한 점.



[돌아가기](../README.md)  
[2019-12-06](whatIStudied_191206.md)  
[2019-12-10](whatIStudied_191210.md) 

