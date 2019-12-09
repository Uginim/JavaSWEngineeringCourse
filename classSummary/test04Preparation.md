# 데이터 베이스 구현

## 오라클 접속 정보 설정 파일중 listener.ora, tnsnames.ora 의 용도를 각각 작성하시오.
  

## 오라클 데이터베이스 주요 파일 3가지를 나열하시오. 

## 데이터베이스 블록사이즈는 데이터 I/O의 기본단위이다. <br> 블록 사이즈를 크게 했을때와 작게 했을때의 시스템 성능에 미치는 장단점 1가지씩을 각각 작성하시오.  

## ‘10M’ 용량의 테이블스페이스 ‘MD_TBS’를 'D:\madang\oradata' 폴더에 생성하시오. 이때 데이터 파일 이름은 md_tbs_data.dbf, 블록사이즈는 4kbyte인 SQL문을 작성하시오. 또한 데이터파일의 이용현황을 조회하는 SQL문을 작성하시오. 

## 아래 내용을 참고하여 계정생성 및 권한을 부여하는 명령문을 각각 작성하시오. 

|속성|값|
|---|---|
|사용자계정 | USER1 |
|비밀번호 | 1234 |
|테이블스페이스 | MD_TBS |
|권한 | 접속(CONNECT) , 테이블생성(RESOURCE) |

  
## 아래 절차에 따라 역할 생성 및 권한을 부여하는 SQL문을 작성하시오.
   ① ‘programmer’라는 역할 생성
   ② ‘programmer 역할에 CREATE ANY TABLE과 CREATE ANY VIEW 권한을 부여
   ③ user1에 programmer 역할의 권한을 부여
         
## 인덱스 유효성 여부를 검사를 위한 절차를 3단계로 분류하여 간단히 설명하고 각 단계별 SQL문 예를 들어 작성하시오.(단, 인덱스명: bookid_pk) 

## SEQUENCE의 특징과 용도를 1가지씩 작성하시오. 

## SYNONYM의 사용목적 2가지만 작성하시오. 

## 데이터 개체 무결성, 참조 무결성, 도메인 무결성에 대해 제약 대상과 각각의 의미를 작성하시오.  