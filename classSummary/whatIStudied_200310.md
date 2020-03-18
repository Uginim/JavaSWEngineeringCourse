# What I studied today.
Date : 2020-03-10   


# Spring
## 게시판 만들기
### 댓글 선호도
#### 선호도 넣기
- vote테이블의 레코드는 존재하면 update 없으면 insert를 할 필요 있음
- `merge into` 사용
    ```xml
    <!-- vote 있으면 update 없으면 insert -->	
    <update id="mergeVote">
        merge into board_vote
        using dual
        on ( rnum=#{rnum} and bnum=#{bnum} and rid=#{rid} )
        when matched then
            update set vote=#{vote}
        when not matched then  
            insert (  rnum,   bnum,   rid,   vote ) 
            values (#{rnum},#{bnum},#{rid},#{vote})
    </update>	
    ```
#### 선호도 계산
- 투표 카운트
    ```sql
    -- 투표 카운트
    select rnum, vote, count(vote)
    from board_vote
    where rnum = 41;
    group by rnum, vote;
    ```
- 투표 선호 비선호 한 행에 카운트
    ```sql
    select rnum, count(decode(vote,1,1)) "선호", count(decode(vote,2,1)) "비선호"
    from board_vote
    group by rnum;
    ```
- 투표 기존 댓글 가져오기
    ```sql
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
    ```
- 한번에 투표수 계산하는 쿼리
    ```sql     
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
    ```

# 이웃클래스의 팀프로젝트 발표 참관
## 발표자 내용
1. 방방 곡곡 [시연영상](https://www.youtube.com/watch?v=8masbqwd0Zo)
2. 런치박스 [시연영상](https://www.youtube.com/watch?v=Hpq5TOxThsQ)
3. 데일리 하우스 [시연영상](https://www.youtube.com/watch?v=TnJDJtCr7Uk)
4. 허들링 [시연영상](https://youtu.be/nHitX3MzmZI)
## 선생님의 피드백
- 아키텍처 및 사용 엔진 설명
- 기승전결이 필요함
    - 목적과 목표를 얘기할 것
    - 그래서 어떻게 구현하였으며
    - 최종적으로 UI는 어떻게 되었다
- 후기 등의 내용도 공유하면 좋을 것



[돌아가기](../README.md)  
[2020-03-09](whatIStudied_200309.md)  
[2020-03-11](whatIStudied_200311.md)  














