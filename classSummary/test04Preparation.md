# 데이터 베이스 구현
## 기출 문제
### 1. 오라클 접속 정보 설정 파일중 listener.ora, tnsnames.ora 의 용도를 각각 작성하시오.

### 2. 오라클 데이터베이스 주요 파일 3가지를 나열하시오. 

### 3. 데이터베이스 블록사이즈는 데이터 I/O의 기본단위이다. <br> 블록 사이즈를 크게 했을때와 작게 했을때의 시스템 성능에 미치는 장단점 1가지씩을 각각 작성하시오.  
### 4. ‘10M’ 용량의 테이블스페이스 ‘MD_TBS’를 'D:\madang\oradata' 폴더에 생성하시오. 이때 데이터 파일 이름은 md_tbs_data.dbf, 블록사이즈는 4kbyte인 SQL문을 작성하시오. 또한 데이터파일의 이용현황을 조회하는 SQL문을 작성하시오. 

### 5. 아래 내용을 참고하여 계정생성 및 권한을 부여하는 명령문을 각각 작성하시오. 
|속성|값|
|---|---|
|사용자계정 | USER1 |
|비밀번호 | 1234 |
|테이블스페이스 | MD_TBS |
|권한 | 접속(CONNECT) , 테이블생성(RESOURCE) |
  
### 6. 아래 절차에 따라 역할 생성 및 권한을 부여하는 SQL문을 작성하시오.
>   ① ‘programmer’라는 역할 생성  
>   ② ‘programmer 역할에 CREATE ANY TABLE과 CREATE ANY VIEW 권한을 부여  
>   ③ user1에 programmer 역할의 권한을 부여  


### 7. 인덱스 유효성 여부를 검사를 위한 절차를 3단계로 분류하여 간단히 설명하고 각 단계별 SQL문 예를 들어 작성하시오.(단, 인덱스명: bookid_pk) 

### 8. SEQUENCE의 특징과 용도를 1가지씩 작성하시오. 

### 9. SYNONYM의 사용목적 2가지만 작성하시오. 

### 10. 데이터 개체 무결성, 참조 무결성, 도메인 무결성에 대해 제약 대상과 각각의 의미를 작성하시오.  
<br><br><br><br><hr><br><br>
# 답지

## 1. 오라클 접속 정보 설정 파일중 listener.ora, tnsnames.ora 의 용도를 각각 작성하시오.
- tnsnames.ora :
    - 클라이언트에서 오라클 서버로 접속할때 필요한 프로토콜, 포트번호, 서버주소, 인스턴스 등을 설정해주는 파일로 클라이언트에 존재함
- listener.ora :
    - 오라클 클라이언트에서 서버로 접속할때 필요한 프로토콜, 포트번호등을 설정하는 파일로 서버에 존재함.

## 2. 오라클 데이터베이스 주요 파일 3가지를 나열하시오. 
1. 데이터파일(Data File)
2. 리두로그(Redo Log)
3. 컨트롤 파일(Control File)
## 3. 데이터베이스 블록사이즈는 데이터 I/O의 기본단위이다. <br> 블록 사이즈를 크게 했을때와 작게 했을때의 시스템 성능에 미치는 장단점 1가지씩을 각각 작성하시오.  
- 블록사이즈가 클 때
    - 장점 : 
        - 한번에 저장할 데이터량이 많아서 I/O 트래픽 감소
    - 단점 : 
        - 데이터가 적을경우 공간낭비 발생
    - 활용 :
        - 세선이 적고 대량의 데이터접근(ex DW, DataWarehouse)
- 블록사이즈가 작을 때
    - 장점 :
        - 데이터가 적을경우 공간 효율이 좋음
    - 단점 : 
        - 한번에 저장할 데이터량이 적어서 I/O 트래픽 증가
    - 활용 : 
        - 빈번한 세션단위의 소량 데이터 접근 (ex OLTP, Online Transaction Processing)
## 4. ‘10M’ 용량의 테이블스페이스 ‘MD_TBS’를 'D:\madang\oradata' 폴더에 생성하시오. 이때 데이터 파일 이름은 md_tbs_data.dbf, 블록사이즈는 4kbyte인 SQL문을 작성하시오. 또한 데이터파일의 이용현황을 조회하는 SQL문을 작성하시오. 
- 테이블스페이스 생성
```sql
CREATE TABLESPACE MD_TBS DATAFILE 'D:\madang\oradata\md_tbs_data.dbf' size 10m BLOCKSIZE 4k;
```
- 데이터파일의 이용현황 조회
```sql
SELECT * FROM user_tablespaces;
```
## 5. 아래 내용을 참고하여 계정생성 및 권한을 부여하는 명령문을 각각 작성하시오. 

|속성|값|
|---|---|
|사용자계정 | USER1 |
|비밀번호 | 1234 |
|테이블스페이스 | MD_TBS |
|권한 | 접속(CONNECT) , 테이블생성(RESOURCE) |
- 계정 생성 
```SQL
CREATE USER user1 IDENTIFIED BY 1234 DEFAULT TABLESPACE md_tbs;
```
- 권한부여
```SQL
GRANT CONNECT, RESOURCE TO user1;
```
  
## 6. 아래 절차에 따라 역할 생성 및 권한을 부여하는 SQL문을 작성하시오.
>   ① ‘programmer’라는 역할 생성  
>   ② ‘programmer 역할에 CREATE ANY TABLE과 CREATE ANY VIEW 권한을 부여  
>   ③ user1에 programmer 역할의 권한을 부여  

1. 'programmer'라는 역할 생성
    - ```sql
        CREATE ROLE programmer;
        ```
2. 'programmer' 역할에 CREATE ANY TABLE과 CREATE ANY VIEW 권한을 부여
    - ```SQL
        GRANT CREATE ANY TABLE, CREATE ANY VIEW TO programmer;
        ```
3. user1에 programmer 역할의 권한을 부여
    - ```SQL
        GRANT programmer TO user1;
        ```         
## 7. 인덱스 유효성 여부를 검사를 위한 절차를 3단계로 분류하여 간단히 설명하고 각 단계별 SQL문 예를 들어 작성하시오.(단, 인덱스명: bookid_pk) 
1. 인덱스 분석자료 수짐
    - ```sql
        analyze index bookid_pk validate structure;
        ```
2. 인덱스 분석된 통계자료조회
    - ```sql
        select * from index_stats;
        ```
3. 인덱스 삭제비율(del_lf_rows / lf_rows)이 높으면 Rebuild
    - `lf_rows`
        - 인덱스 생성 시 만들어진 레코드 수
    - `del_lf_rows`
        - 인덱스 생성 후 삭제된 레코드 수
    - ```sql
        alter index bookid_pk rebuild;
        ```
## 8. SEQUENCE의 특징과 용도를 1가지씩 작성하시오. 
- 용도: 
    - 순차적으로 중복되지 않는 번호를 자동으로  
        발생시킬 필요가 있는 컬럼에 사용한다(기본키, 대리키 등)
- 특징: 
    - 테이블과 별도의 공간에 저장  
     DML이 롤백되어도 이미 생성된 시퀀스 번호는 롤백되지 않다.
## 9. SYNONYM의 사용목적 2가지만 작성하시오. 
- 목적
    - 편의성
        - 간단한 별칭사용
        - 사용자 계정 없이도 접근가능  
            (public synonym: admin만 생성가능)
    - 보안성
        - 원객체를 숨길 수 있어 보안에 유리, 특히 public은 소유자도 숨김
## 10. 데이터 개체 무결성, 참조 무결성, 도메인 무결성에 대해 제약 대상과 각각의 의미를 작성하시오.  
- 개체무결성 
    - 대상은 투플
    - 릴레이션 내에 기본키(null값 없음, 중복없음)를 가져야 함
- 참조무결성
    - 대상은 속성과 투플
    - 왜래키는 부모 릴레이션의 기본키를 참조하고 도메인이 동일해야함
- 도메인무결성
    - 대상은 속성
    - 릴레이션 내의 튜플들이 각 속성의 도메인에 지정된 값만을 가져야 함