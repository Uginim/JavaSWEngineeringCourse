CREATE TABLE NewBook (
bookid            NUMBER,
bookname         VARCHAR2(20),
publisher          VARCHAR2(20),
price             NUMBER,
PRIMARY KEY (bookid)
);
CREATE TABLE NewCustomer (
  custid     NUMBER PRIMARY KEY,
  name     VARCHAR2(40),
  address   VARCHAR2(40),
  phone     VARCHAR2(30)
);
CREATE TABLE NewOrders (
  orderid     NUMBER,
  custid      NUMBER NOT NULL,
  bookid      NUMBER NOT NULL,
  saleprice    NUMBER,
  orderdate   DATE,
  PRIMARY KEY (orderid),
  FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);
DROP TABLE NewBook;
CREATE TABLE NewBook(
bookid       NUMBER,
bookname    VARCHAR2(20),
publisher     VARCHAR2(20),
price         NUMBER);

DESC NewBook; -- 테이블 구조 보기
SELECT * FROM user_constraints WHERE table_name = 'NEWCUSTOMER'; --데이터 사전(메타정보 관리

ALTER TABLE NewBook ADD isbn VARCHAR2(13);
ALTER TABLE NewBook MODIFY isbn NUMBER;
ALTER TABLE NewBook DROP COLUMN isbn;
ALTER TABLE NewBook MODIFY bookid NUMBER NOT NULL;
ALTER TABLE NewBook ADD PRIMARY KEY(bookid);