SET SERVEROUTPUT ON
DECLARE
	TYPE  ename_table_type IS TABLE OF emp.ename%TYPE
		INDEX BY BINARY_INTEGER;
	TYPE  job_table_type IS TABLE OF emp.job%TYPE
		INDEX BY BINARY_INTEGER;
	ename_table	ename_table_type;
	job_table	job_table_type;
	i		BINARY_INTEGER := 0;
BEGIN
	FOR  k IN (SELECT ename,job FROM emp) LOOP
		i := i + 1;
		ename_table(i) := k.ename;
		job_table(i) := k.job;
	END LOOP;
	FOR j IN 1..i LOOP
		DBMS_OUTPUT.PUT_LINE(RPAD(ename_table(j),12) ||
			RPAD(job_table(j),9));
	END LOOP;

END;
/
SET SERVEROUTPUT OFF


select * from emp;



SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT  p_ename PROMPT '조회하고자 하는 사원의 이름을 입력하시오 : '
DECLARE
	TYPE emp_record_type IS RECORD(
		v_empno		emp.empno%TYPE,
		v_ename		emp.ename%TYPE,
		v_job		emp.job%TYPE,
		v_mgr		emp.mgr%TYPE,
		v_hiredate	emp.hiredate%TYPE,
		v_sal		emp.sal%TYPE,
		v_comm		emp.comm%TYPE,
		v_deptno	emp.deptno%TYPE);
	emp_record	emp_record_type;
	v_ename		emp.ename%TYPE := '&p_ename';
BEGIN
	SELECT *
		INTO emp_record
		FROM emp
		WHERE ename = UPPER(v_ename);
	DBMS_OUTPUT.PUT_LINE('사원번호 : ' || TO_CHAR(emp_record.v_empno));
	DBMS_OUTPUT.PUT_LINE('이    름 : ' || emp_record.v_ename);
	DBMS_OUTPUT.PUT_LINE('담당업무 : ' || emp_record.v_job);
	DBMS_OUTPUT.PUT_LINE('메 니 저 : ' || TO_CHAR(emp_record.v_mgr));
	DBMS_OUTPUT.PUT_LINE('입사일자 : ' || TO_CHAR(emp_record.v_hiredate));
	DBMS_OUTPUT.PUT_LINE('급    여 : ' ||
 		LTRIM(TO_CHAR(emp_record.v_sal,'$999,990.00')));
	DBMS_OUTPUT.PUT_LINE('보 너 스 : ' || 
 		LTRIM(TO_CHAR(NVL(emp_record.v_comm,0),'$999,990')));
	DBMS_OUTPUT.PUT_LINE('부서번호 : ' || TO_CHAR(emp_record.v_deptno));
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('&p_ename' || '의 자료는 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('&p_ename' || '자료가 2건 이상입니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러 입니다.');
END;
