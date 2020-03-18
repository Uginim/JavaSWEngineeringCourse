# What I studied today.
Date : 2020-03-17

# UI 구현 : 게시판 발표
- 후기
    - 댓글 구현이 가장 힘들었다.
        - 특히 갱신하기
            - 댓글을 작성하면  그 사이에 또 누군가가 변화를 줄 수 있음				* 
                - 가능한 변화들
                    - 삭제
					- 전체 댓글 개수
					- 각 댓글의 답글 개수
					- 수정
                    - 댓글 내용 
				-해결책
                    - 전체갱신
						- 너무 무식해
					- 일부 갱신            
						- 화면상의 마지막 댓글(답글)을 기준으로 갱신함
						- 변화를 추적하여 하나씩 수정함(화면에 표현된것만 반영됨)
							- 삭제
							- 추가
								- 댓글
								- 답글
							- 수정
	- 선생님 리뷰
		1. UI 레이아웃
			- float
			- position
			- flex
			- gird
				- 아직 표준은 안됨(2020-3월)
		2. 웹표준
			- html
			- css
			- javascript-es6
		3. DB
			- SQL(튜닝)
			- 테이블설계(정규화)
		4. JAVA
			- 객체
			- 함수형(람다, 스트림)
			- 디자인패턴(GOF-24패턴)
			- AOP
		5. MVC 모델
			- 계층 
				- 구성
					1. Presentation Layer
					2. Business Layer
					3. Data Access Layer
				- 인접레이어와 인터페이스를 두고 통신 해야 함
    				- 어떤 계층에서 다른 계층의 기능을 사용하려면 인터페이스만 알면 됨
		6. 프레임워크
			- 목적 : 경제성
				- 반복 작업을 줄여줘서 빨리빨리 결과가 나옴
				- 예시
					- 붕어빵 틀 처럼 틀을 만들어 줌(결과물의 모양이 비슷)
			- spring
			- bootstrap
				- 미리 class에 css를 정의해놓고 가져다 쓰는 것
			- mybatis(JPA)
		7. 테스트
			- JUnit
			- Postman - front-end 쪽 테스트 툴
# 팀프로젝트 
## 다음주 발표 3월 23일
- 1차 중간점검통합시나리오

  통합시나리오 초안을 기본으로 

- 개인 포트폴리오 발표 준비
- 문서작업에 주력함
# Spring
## 댓글 구현
### 변경 내용 
1. rboard 테이블 컬럼 2개추가
2. rboardVO 필드 2개 추가
3. RboardController rnum 삭제
4. BaordSVCImpl reply() 수정
5. RboardDAO replyView 추가
6. RboardDAOImpl
    - updateStep()
    - replyView()
7. RboardDAO-mapper.xml
    - replyView 추가
    - list 수정
    - reply 수정
8. reply.jsp 수정


[돌아가기](../README.md)  
[2020-03-16](whatIStudied_200316.md)  
[2020-03-18](whatIStudied_200318.md)  














