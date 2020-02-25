-- 검색어 없는 경우
select * from (select row_number() over(order by bgroup desc, bstep asc) as num, board.* from board)
where num between 21 and 30;

select bnum, bcategory, btitle, bid, bnickname, bcdate, budate, bhit, bindent
from (select row_number() over(order by bgroup desc, bstep asc) as num, board.* from board)
where num between 21 and 30;


-- 검색어 있는 경우
select * from (
  select row_number() over(order by bgroup desc, bstep asc) as num, board.* 
  from board
  where btitle like '%제목%'
  );
  
select * from (
  select row_number() over(order by bgroup desc, bstep asc) as num, board.* 
  from board
  where btitle like '%제목%'
  )
where num between 21 and 30;

select bnum, bcategory, btitle, bid, bnickname, bcdate, budate, bhit, bindent
from (
    select row_number() over(order by bgroup desc, bstep asc) as num, -- 행번호
    board.bnum, 
    board.bcategory,
    board.bcdate,
    board.bgroup,
    board.bhit,
    board.bid,
    board.bindent,
    board.bnickname,
    board.bstep,
    board.btitle,
    board.budate    
    from board
    where btitle like '%제목%'
    )
where num between 21 and 30;