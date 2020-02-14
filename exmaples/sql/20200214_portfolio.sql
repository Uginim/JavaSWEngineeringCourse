-- 기존테이블 삭제
drop table board_upload_file;
drop table board_vote;
drop table rboard;
drop table board;
drop table board_category;
drop table member;

-- 시퀀스 삭제
drop sequence board_bnum_seq;
drop sequence rboard_rnum_seq;  
drop sequence board_upload_file_fid_seq;   
drop sequence board_category_cid_seq;     
  
-- 테이블 생성
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE"BOARD" 
   (	"BNUM" NUMBER(10,0), 
	"BCATEGORY" NUMBER(3,0), 
	"BTITLE" VARCHAR2(150 BYTE), 
	"BID" VARCHAR2(40 BYTE), 
	"BNICKNAME" VARCHAR2(30 BYTE), 
	"BCDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"BUDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"BHIT" NUMBER(5,0) DEFAULT 0, 
	"BCONTENT" CLOB, 
	"BGROUP" NUMBER(5,0) DEFAULT 0, 
	"BSTEP" NUMBER(5,0), 
	"BINDENT" NUMBER(5,0), 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"COL3" VARCHAR2(30 BYTE)
   ) ;
 

   COMMENT ON COLUMN"BOARD"."BNUM" IS '게시글번호';
 
   COMMENT ON COLUMN"BOARD"."BCATEGORY" IS '분류카테고리';
 
   COMMENT ON COLUMN"BOARD"."BTITLE" IS '제목';
 
   COMMENT ON COLUMN"BOARD"."BID" IS '작성자ID(이메일)';
 
   COMMENT ON COLUMN"BOARD"."BNICKNAME" IS '별칭';
 
   COMMENT ON COLUMN"BOARD"."BCDATE" IS '작성일';
 
   COMMENT ON COLUMN"BOARD"."BUDATE" IS '수정일';
 
   COMMENT ON COLUMN"BOARD"."BHIT" IS '조회수';
 
   COMMENT ON COLUMN"BOARD"."BCONTENT" IS '본문내용';
 
   COMMENT ON COLUMN"BOARD"."BGROUP" IS '답글그룹';
 
   COMMENT ON COLUMN"BOARD"."BSTEP" IS '답변글의 단계';
 
   COMMENT ON COLUMN"BOARD"."BINDENT" IS '답변글의 들여쓰기';
 
   COMMENT ON COLUMN"BOARD"."COL1" IS '임시1';
 
   COMMENT ON COLUMN"BOARD"."COL2" IS '임시2';
 
   COMMENT ON COLUMN"BOARD"."COL3" IS '임시3';
--------------------------------------------------------
--  DDL for Table BOARD_CATEGORY
--------------------------------------------------------

  CREATE TABLE"BOARD_CATEGORY" 
   (	"CID" NUMBER(10,0), 
	"CNAME" VARCHAR2(60 BYTE)
   ) ;
 

   COMMENT ON COLUMN"BOARD_CATEGORY"."CID" IS '분류코드';
 
   COMMENT ON COLUMN"BOARD_CATEGORY"."CNAME" IS '분류명';
--------------------------------------------------------
--  DDL for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  CREATE TABLE"BOARD_UPLOAD_FILE" 
   (	"FID" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"FNAME" VARCHAR2(150 BYTE), 
	"FSIZE" VARCHAR2(45 BYTE), 
	"FTYPE" VARCHAR2(50 BYTE), 
	"FDATA" BLOB, 
	"CDATA" TIMESTAMP (6) DEFAULT systimestamp, 
	"UDATA" TIMESTAMP (6) DEFAULT systimestamp, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE)
   );
 

   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."FID" IS '파일아이디';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."BNUM" IS '게시글번호';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."FNAME" IS '파일명';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."FSIZE" IS '파일사이즈';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."FTYPE" IS '파일유형';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."FDATA" IS '첨부파일';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."CDATA" IS '생성일';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."UDATA" IS '수정일';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."COL1" IS '임시1';
 
   COMMENT ON COLUMN"BOARD_UPLOAD_FILE"."COL2" IS '임시2';
--------------------------------------------------------
--  DDL for Table BOARD_VOTE
--------------------------------------------------------

  CREATE TABLE"BOARD_VOTE" 
   (	"RNUM" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"RID" VARCHAR2(40 BYTE), 
	"VOTE" CHAR(1 BYTE), 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE)
   ) ;
 

   COMMENT ON COLUMN"BOARD_VOTE"."RNUM" IS '댓글번호';
 
   COMMENT ON COLUMN"BOARD_VOTE"."BNUM" IS '게시글번호';
 
   COMMENT ON COLUMN"BOARD_VOTE"."RID" IS '투표자(회원ID)';
 
   COMMENT ON COLUMN"BOARD_VOTE"."VOTE" IS '1:호감, 2:비호감';
 
   COMMENT ON COLUMN"BOARD_VOTE"."COL1" IS '임시1';
 
   COMMENT ON COLUMN"BOARD_VOTE"."COL2" IS '임시2';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE"MEMBER" 
   (	"ID" VARCHAR2(40 BYTE), 
	"PW" VARCHAR2(10 BYTE), 
	"TEL" VARCHAR2(13 BYTE), 
	"NICKNAME" VARCHAR2(30 BYTE), 
	"GENDER" CHAR(3 BYTE), 
	"REGION" VARCHAR2(30 BYTE), 
	"BIRTH" DATE, 
	"CDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"UDATE" TIMESTAMP (6), 
	"PIC" BLOB, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"COL3" VARCHAR2(30 BYTE)
   );
 

   COMMENT ON COLUMN"MEMBER"."ID" IS '아이디(메일)';
 
   COMMENT ON COLUMN"MEMBER"."PW" IS '비밀번호';
 
   COMMENT ON COLUMN"MEMBER"."TEL" IS '전화번호';
 
   COMMENT ON COLUMN"MEMBER"."NICKNAME" IS '별칭';
 
   COMMENT ON COLUMN"MEMBER"."GENDER" IS '성별(''남'',''여'')';
 
   COMMENT ON COLUMN"MEMBER"."REGION" IS '지역';
 
   COMMENT ON COLUMN"MEMBER"."BIRTH" IS '생년월일(''yyyymmdd'')';
 
   COMMENT ON COLUMN"MEMBER"."CDATE" IS '생성일';
 
   COMMENT ON COLUMN"MEMBER"."UDATE" IS '변경일';
 
   COMMENT ON COLUMN"MEMBER"."PIC" IS '사진(확장자 jpg,gif,png)';
 
   COMMENT ON COLUMN"MEMBER"."COL1" IS '임시1';
 
   COMMENT ON COLUMN"MEMBER"."COL2" IS '임시2';
 
   COMMENT ON COLUMN"MEMBER"."COL3" IS '임시3';
--------------------------------------------------------
--  DDL for Table RBOARD
--------------------------------------------------------

  CREATE TABLE"RBOARD" 
   (	"RNUM" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"RID" VARCHAR2(40 BYTE), 
	"RNICKANME" VARCHAR2(30 BYTE), 
	"RCDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"RUDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"RCONTENT" CLOB, 
	"RGROUP" NUMBER(5,0) DEFAULT 0, 
	"RSTEP" NUMBER(5,0) DEFAULT 0, 
	"RINDENT" NUMBER(5,0) DEFAULT 0, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"COL3" VARCHAR2(30 BYTE)
   );
 

   COMMENT ON COLUMN"RBOARD"."RNUM" IS '댓글번호';
 
   COMMENT ON COLUMN"RBOARD"."BNUM" IS '게시글번호';
 
   COMMENT ON COLUMN"RBOARD"."RID" IS '작성자ID';
 
   COMMENT ON COLUMN"RBOARD"."RNICKANME" IS '작성자이름(별칭)';
 
   COMMENT ON COLUMN"RBOARD"."RCDATE" IS '작성일';
 
   COMMENT ON COLUMN"RBOARD"."RUDATE" IS '수정일';
 
   COMMENT ON COLUMN"RBOARD"."RCONTENT" IS '본문내용';
 
   COMMENT ON COLUMN"RBOARD"."RGROUP" IS '답글그룹';
 
   COMMENT ON COLUMN"RBOARD"."RSTEP" IS '답변글의 단계';
 
   COMMENT ON COLUMN"RBOARD"."RINDENT" IS '답변글의 들여쓰기';
 
   COMMENT ON COLUMN"RBOARD"."COL1" IS '임시1';
 
   COMMENT ON COLUMN"RBOARD"."COL2" IS '임시2';
 
   COMMENT ON COLUMN"RBOARD"."COL3" IS '임시3';
--------------------------------------------------------
--  DDL for Index BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX"BOARD_PK" ON"BOARD" ("BNUM") ;
--------------------------------------------------------
--  DDL for Index BOARD_CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX"BOARD_CATEGORY_PK" ON"BOARD_CATEGORY" ("CID") ;
--------------------------------------------------------
--  DDL for Index BOARD_CATEGORY_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX"BOARD_CATEGORY_UK1" ON"BOARD_CATEGORY" ("CNAME");
--------------------------------------------------------
--  DDL for Index BOARD_UPLOAD_FILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX"BOARD_UPLOAD_FILE_PK" ON"BOARD_UPLOAD_FILE" ("FID");
--------------------------------------------------------
--  DDL for Index BOARD_VOTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX"BOARD_VOTE_PK" ON"BOARD_VOTE" ("RNUM", "BNUM", "RID") ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX"MEMBER_PK" ON"MEMBER" ("ID") ;
--------------------------------------------------------
--  DDL for Index RBOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX"RBOARD_PK" ON"RBOARD" ("RNUM") ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE"BOARD" ADD CONSTRAINT "BOARD_PK" PRIMARY KEY ("BNUM");
 
  ALTER TABLE"BOARD" MODIFY ("BNUM" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BCATEGORY" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BTITLE" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BID" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BNICKNAME" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BCDATE" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BHIT" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BCONTENT" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BGROUP" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BSTEP" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD" MODIFY ("BINDENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_CATEGORY
--------------------------------------------------------

  ALTER TABLE"BOARD_CATEGORY" ADD CONSTRAINT "BOARD_CATEGORY_PK" PRIMARY KEY ("CID");
 
  ALTER TABLE"BOARD_CATEGORY" ADD CONSTRAINT "BOARD_CATEGORY_UK1" UNIQUE ("CNAME");
 
  ALTER TABLE"BOARD_CATEGORY" MODIFY ("CID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE"BOARD_UPLOAD_FILE" ADD CONSTRAINT "BOARD_UPLOAD_FILE_PK" PRIMARY KEY ("FID");
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("BNUM" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("FNAME" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("FSIZE" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("FTYPE" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("FDATA" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("CDATA" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_UPLOAD_FILE" MODIFY ("FID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_VOTE
--------------------------------------------------------

  ALTER TABLE"BOARD_VOTE" ADD CONSTRAINT "BOARD_VOTE_PK" PRIMARY KEY ("RNUM", "BNUM", "RID");
 
  ALTER TABLE"BOARD_VOTE" MODIFY ("RNUM" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_VOTE" MODIFY ("BNUM" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_VOTE" MODIFY ("RID" NOT NULL ENABLE);
 
  ALTER TABLE"BOARD_VOTE" MODIFY ("VOTE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE"MEMBER" ADD CONSTRAINT "MEMBER_CHK1" CHECK (gender in ('남','여')) ENABLE;
 
  ALTER TABLE"MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID");
 
  ALTER TABLE"MEMBER" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("PW" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("TEL" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("NICKNAME" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("GENDER" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("REGION" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("BIRTH" NOT NULL ENABLE);
 
  ALTER TABLE"MEMBER" MODIFY ("CDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBOARD
--------------------------------------------------------

  ALTER TABLE"RBOARD" ADD CONSTRAINT "RBOARD_PK" PRIMARY KEY ("RNUM");
 
  ALTER TABLE"RBOARD" MODIFY ("RNUM" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("BNUM" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RID" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RNICKANME" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RCDATE" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RCONTENT" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RGROUP" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RSTEP" NOT NULL ENABLE);
 
  ALTER TABLE"RBOARD" MODIFY ("RINDENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE"BOARD" ADD CONSTRAINT "BOARD_FK1" FOREIGN KEY ("BNUM")
	  REFERENCES"BOARD_CATEGORY" ("CID") ENABLE;
 
  ALTER TABLE"BOARD" ADD CONSTRAINT "BOARD_FK2" FOREIGN KEY ("BID")
	  REFERENCES"MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE"BOARD_UPLOAD_FILE" ADD CONSTRAINT "BOARD_UPLOAD_FILE_FK1" FOREIGN KEY ("BNUM")
	  REFERENCES"BOARD" ("BNUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_VOTE
--------------------------------------------------------

  ALTER TABLE"BOARD_VOTE" ADD CONSTRAINT "BOARD_VOTE_FK1" FOREIGN KEY ("RNUM")
	  REFERENCES"RBOARD" ("RNUM") ENABLE;
 
  ALTER TABLE"BOARD_VOTE" ADD CONSTRAINT "BOARD_VOTE_FK2" FOREIGN KEY ("BNUM")
	  REFERENCES"BOARD" ("BNUM") ENABLE;
 
  ALTER TABLE"BOARD_VOTE" ADD CONSTRAINT "BOARD_VOTE_FK3" FOREIGN KEY ("RID")
	  REFERENCES"MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RBOARD
--------------------------------------------------------

  ALTER TABLE"RBOARD" ADD CONSTRAINT "RBOARD_FK1" FOREIGN KEY ("BNUM")
	  REFERENCES"BOARD" ("BNUM") ENABLE;
 
  ALTER TABLE"RBOARD" ADD CONSTRAINT "RBOARD_FK2" FOREIGN KEY ("RID")
	  REFERENCES"MEMBER" ("ID") ENABLE;


--시퀀스 생성
create sequence board_bnum_seq
  start with 1
  increment by 1
  nocycle;

create sequence rboard_rnum_seq
  start with 1
  increment by 1
  nocycle;  
  
create sequence board_upload_file_fid_seq
  start with 1
  increment by 1
  nocycle;   
  
create sequence board_category_cid_seq
  start with 1001
  increment by 1
  MAXVALUE 1999
  nocycle;     