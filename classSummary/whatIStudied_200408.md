# What I studied today.
Date : 2020-04-08

# 팀프로젝트 진행
# 능력단위 평가
## 배포
### 2번 실습 
deploy 연결 계정 설정하기  
- 톰캣 서버 내
    - tomcat-users.xml
        - 원래있던 정의는 주석처리함
        - role 정의
        - user 정의
    - deploy위치는 tomcat에 webapp에 생성됨
- sts에서 설정
    - pom.xml
        - build태그 내 plugin 태그에 메이븐을 위한 톰켓서버 배포를 설정함
- Maven Run Configuration
    - Goals 
        - tomcat7:deploy
- webapps에 manager가 없으면 배포안됨...
- 최종적으로 ROOT.war가 생기면 끝


- 운영서버와 테스트서버
    - 운영서버
        - 릴리즈버전이 사용 됨
        - 실제 생성되는 데이터들이 누적됨
    - pom.xml
        - properties에 env태그로 개발모드 릴리즈모드를 변환함
    


[돌아가기](../README.md)  

[2020-03-25](whatIStudied_200325.md)  
[2020-03-27](whatIStudied_200327.md)  














