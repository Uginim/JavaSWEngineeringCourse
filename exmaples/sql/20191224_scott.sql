SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT  p_name   PROMPT  ' ��    ��: '
DECLARE
	v_empno	emp.empno%TYPE;
	v_name	emp.ename%TYPE := UPPER('&p_name');
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
		DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||'���� ���� ���ŵǾ����ϴ�.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('���ŵ� �ڷᰡ �����ϴ�.');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '�� �ڷᰡ �����ϴ�.');		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '�� ���� �����Դϴ�.');		
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('��Ÿ ������ �߻� �߽��ϴ�.');		
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF