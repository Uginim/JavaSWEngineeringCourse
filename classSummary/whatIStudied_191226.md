# What I studied today.
Date : 2019-12-26
# JSP
- 새 책 수령
- 주요 Chapter
    - 1장
    - 2장
    - 3장
    - 4장
    - 5장
    - 8장
    - 14장 JSTL(JSP Standard Tag Library)과 EL(Expression Language)
## 숙제
- 1,2,3,4 Chapter읽어오기
# Database
## PL/SQL
- Procedural Language/SQL
- 프로그래밍 언어의 특성을 수용한 SQL의 확장
- SQL을 가지고 절차적 프로그래밍을 가능하게함

### PL/SQL 예시
```sql
SET VERIFY OFF  -- 환경변수 설정
SET SERVEROUTPUT ON  -- serveroutput을 on이라고 해야함
ACCEPT  p_name   PROMPT  ' 이    름: '
DECLARE
	v_empno	emp.empno%TYPE;
	v_name	emp.ename%TYPE := UPPER('&p_name'); -- &는 치환변수
	v_sal	emp.sal%TYPE;
	v_job	emp.job%TYPE;	
BEGIN
	SELECT empno,job
		INTO v_empno,v_job
		FROM emp
		WHERE ename = v_name;
	IF v_job IN ('MANAGER','ANALYST') THEN
		v_sal := v_sal * 1.5;
	ELSE
		v_sal := v_sal * 1.2;
	END IF;
	UPDATE emp
		SET sal = v_sal
		WHERE empno = v_empno;
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||'개의 행이 갱신되었습니다.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('갱신된 자료가 없습니다.');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '는 자료가 없습니다.');		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '는 동명 이인입니다.');		
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러가 발생 했습니다.');		
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
```
- 치환변수
    - '`&`'가 붙음
## Search for Error Messages - Oracle
- [링크](https://docs.oracle.com/pls/db92/db92.error_search?remark=homepage&prefill=ORA-)

### 장점
1. 프로그램 개발의 모듈화
2. 식별자 선언
3. 절차적 언어 구조로 된 프로그램 작성
4. ERROR처리
5. 성능 향상


# Git/github
- github 페이지 만들기
    - 블로그를 만들 수 있음
    - https://pages.github.com/
- github 도움말
    - http://help.github.com/
    - [마크다운 문법보기](https://help.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax)
- VSCODE와 연동
    - [참조](https://www.lesstif.com/pages/viewpage.action?pageId=17105558)
<br><br><hr>

[돌아가기](../README.md)  
[2019-12-24](whatIStudied_191224.md)  
[2019-12-27](whatIStudied_191227.md) 


