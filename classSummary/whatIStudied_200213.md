# What I studied today.
Date : 2020-02-10

# Spring
# 능력단위평가
## 테스트 진행
1. 워크스페이스 만들기
2. 인코딩 utf-8 설정
3. 프로젝트 임포트
4. 톰캣서버 추가
5. db계정 생성
    - 계정 정보는 프로젝트내 sql폴더에 있음
6. t1 => db연결 테스트 junit
7. t2 => 회원관리 dao테스트 junit
8. 이후 t3~t7 진행 
9.  결함수정된 프로젝트 익스포트
    파일명: springtest_홍길동.zip
    결함원인, 결함제거방법, 오류위치(파일명)
### Test2 풀이
1. db접속이 안됨 
    - database.properties의 계정정보가 다름
    - 
2. MemberDAO의 selectAllMember 메소드가 실행안됨
    - 회원탈퇴 query에 pw도 확인하는 조건이 빠짐
3. spring form 태그에서 password로 binding 못함

##
<br><br><hr>

[돌아가기](../README.md)  
[2020-02-07](whatIStudied_200207.md)  
[2020-02-11](whatIStudied_200211.md)  














