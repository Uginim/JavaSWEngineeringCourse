EXEC InsertBook(13,'스포츠과학', '마당과학서적', 25000);

/* 프로시저 InsertBook을 테스트하는 부분 */
--EXEC InsertBook(13,'스포츠과학', '마당과학서적', 25000);
SELECT * FROM Book;

EXEC BOOKINSERTORUPDATE(15, '스포츠 즐거움','마당과학서적',25000);

EXEC BOOKINSERTORUPDATE(15, '스포츠 즐거움','마당과학서적',20000);


--
SET SERVEROUTPUT ON;
DECLARE
  AverageVal NUMBER;
BEGIN
  AveragePrice(AverageVal);
  DBMS_OUTPUT.PUT_LINE('책값 평균: '||AverageVal);
END;

-- Interest 프로시저 실행 
SET SERVEROUTPUT ON;
EXEC Interest;