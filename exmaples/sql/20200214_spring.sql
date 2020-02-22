desc board;

INSERT INTO board ( 
bnum,
bcategory,
btitle,
bid,
bnickname,
bcontent,
bgroup
)
values(
BOARD_BNUM_SEQ.nextval,
1001, 
'제목',
'test@naver.com',
'별칭',
'내용',
board_bnum_seq.currval
);


insert into board_category values(board_category_cid_seq.nextval, 'SPRING');
insert into board_category values(board_category_cid_seq.nextval, 'DATABASE');
insert into board_category values(board_category_cid_seq.nextval, 'JAVA');

commit;