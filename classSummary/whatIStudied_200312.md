# What I studied today.
Date : 2020-03-12


# Spring
## 게시판 만들기
### 댓글 구현
#### VO에 Timestamp 프로퍼티가 있을 때 date 양식을 지정하고 싶다면
- 프로퍼티에 `@JsonFormat(pattern="yyyy-mm-dd h:mm a", timezone = "Asia/Seoul")`를 붙인다.
#### ORACLE의 DECODE 함수
-  `DECODE(컬럼, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3..........)` 이런 식으로 사용
    -  [출처 - \[Oracle\] 오라클 DECODE 함수 사용방법 (if else, 디코드)](https://gent.tistory.com/227)
    -  [참고 - \[SQL\]조건문 - DECODE, CASE~WHEN-THEN ](https://data-make.tistory.com/20)
- 'CASE'와 `DECODE` 중 무엇을 써야하나?
- 정리
    - CASE는 STATEMENT, DECODE는 함수
    - 단순 쿼리에서는 성능 차이 없음
    - NULL과 비교 시 
        - DECODE는 참
        - CASE는 거짓
            - 주의 해야함
    - DECODE는 등가연산만 가능하지만 CASE는 다양한 연산 가능
    - [출처 - DECODE와 CASE:과연 그놈이 그놈일까](https://dorongdogfoot.tistory.com/79)
#### 화면에서 게시판의 제목 길이가 길 때
다음 css를 적용한다
```css
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
```
#### ORACLE Merge INTO
- 넣을 당시 레코드가 존재하면 동작을 정할 수 있다.

# UI구현 (능력단위평가)
## 제출 해야할 것
- 문서
	1. 화면설계서
	2. 아키텍처기술서
	3. 테이블명세서
	4. 테스트명세서
- 소스코드
- 동영상

[돌아가기](../README.md)  
[2020-03-11](whatIStudied_200311.md)  
[2020-03-13](whatIStudied_200313.md)  














