-- 투표 카운트
select rnum, vote, count(vote)
from board_vote
where rnum = 41;
group by rnum, vote;

-- 투표 선호 비선호 한 행에 카운트
select rnum, count(decode(vote,1,1)) "선호", count(decode(vote,2,1)) "비선호"
from board_vote
group by rnum;

-- 투표 기존 댓글 가져오기
select   rnum,         bnum,
	         rid,          rnickname,
	         rcdate,
	         rcontent,
	         rgroup,       rstep,        rindent,
	         prnum
	from(
	  select row_number() over (order by rgroup desc, rstep asc) as  num, 
	         t1.rnum,      t1.bnum,
	         t1.rid,       t1.rnickname,
	         t1.rcdate,
	         t1.rcontent,
	         t1.rgroup,    t1.rstep,     t1.rindent,
	         t1.prnum
	    from rboard t1
	   where bnum = 1124);
     
-- 한번에 투표수 계산하는 쿼리
select comments.*, nvl(votecount."good",0) as good, nvl(votecount."bad",0) as bad
from 
(select   rnum,         bnum,
	         rid,          rnickname,
	         rcdate,
	         rcontent,
	         rgroup,       rstep,        rindent,
	         prnum
	from(
	  select row_number() over (order by rgroup desc, rstep asc) as  num, 
	         t1.rnum,      t1.bnum,
	         t1.rid,       t1.rnickname,
	         t1.rcdate,
	         t1.rcontent,
	         t1.rgroup,    t1.rstep,     t1.rindent,
	         t1.prnum
	    from rboard t1
	   where bnum = 1124
	   )
--	where num between #{startRec} and #{endRec} 
  
  ) comments,
--(select rnum, nvl(count(decode(vote,1,1)),0) "good", nvl(count(decode(vote,2,1)),0) "bad"
(select rnum, count(decode(vote,1,1)) as "good", count(decode(vote,2,1)) "bad"
from board_vote
group by rnum) votecount
where votecount.rnum(+) = comments.rnum -- left outer join을 해야함
-- decode가 머지?  
-- nvl
