# What I studied today.
Date : 2020-02-05

# Spring
## SLF4J와 Logback을 이용한 로그 남기기
- JAVA진영 로깅 툴
	- commons-logging
	- log4j, log4j2
	- java util logging
- 이전에는 log4j와 commons-logging이 주로 사용됨
	- 스프링도 commons-logging 사용했었음
- 오픈소스 프로젝트를 여러가지를 사용하면 Logging툴이 혼재됨(충돌이 빈번히 일어남) 
	- 이럴경우 Logging 툴 통일 필요
- slf4j가 나온 이후 수많은 오픈소스가 채택 중	
- 가장 최근에 나온것이 slf4j(인터페이스), Logback(구현체)
	- 이것으로 통일함
## logback 설정하기
- [참고](https://taetaetae.github.io/2017/02/19/logback/)
# 발생 가능한 문제
## `@RequestBody`로 VO생성 시 VO의 속성 타입이 java.sql.Date type일 때 파싱후 쿼리가 제대로 동작하지 않는 현상
- 원인 spring에서 parsing을 제대로 못함
- [근거](https://stackoverflow.com/questions/25646564/unable-to-convert-string-to-date-by-requestbody-in-spring)
## EL표현식 사용시 대소문자가 섞인 property를 사용할 경우 property를 찾지못함
- 상황
    - cDate 라는 proeprty를 못읽어옴
- 원인
    - 모름
- 임시 조치
    - EL표현식에서 property 명을 `CDate`로 바꿔야 표현 됨
    - 다른 처방으로 해결된 [경우](https://reomoca.tistory.com/category/jstl)도 있음 
# 팀 프로젝트 발표 일정
|날짜|일정|발표자|
|---|---|---|
|02월 10일| 추진배경/목적/목표| 김현욱|
|02월 17일| 프로세스 설계<br>통합시나리오 초안|미정|
|02월 24일|팀 구성 및 개발일정<br>DB설계|미정|
|03월 02일|화면설계|미정|
|03월 09일|1차 중간점검<br>통합시나리오|미정|
|03월 16일|아키텍처 설계|미정|
## 프로세스 설계
- 기능분할도 (To-Be Process DCD)


<br><br><hr>

[돌아가기](../README.md)  
[2020-02-04](whatIStudied_200204.md)  
[2020-02-06](whatIStudied_200206.md)  














