SELECT 			   
			    "comment".comment_num AS "commentNum",
			    "comment".user_num AS "userNum",
			    "comment".POST_NUM AS "postNum",
			    "comment".CONTENT AS "content",
			    "comment".CREATED_AT AS "createdAt",
			    "comment".UPDATED_AT AS "updatedAt",
			    "comment".USERNAME AS "username"
			    ,nvl("child"."childrenCount",0) AS "childrenCount" ,
		        nvl("vote"."like",0) AS "like",
		        nvl("vote"."dislike",0) AS "dislike"
			FROM board_comment "comment",
			        (SELECT parent_num, COUNT(comment_num) "childrenCount"
			            FROM board_comment 
			            WHERE parent_num = 43
			            AND parent_num IS NOT NULL 
			            GROUP BY parent_num) "child",
			        (SELECT board_comment.comment_num, COUNT(DECODE(type,'L',1,'l',1)) "like", COUNT(DECODE(type,'D',1,'d',1)) "dislike"
				        FROM comment_vote, board_comment
				        WHERE board_comment.comment_num = comment_vote.comment_num 
				        AND comment_vote.comment_num = 43                      
				        GROUP BY board_comment.comment_num) "vote"  
			WHERE "comment".comment_num =43
			AND "comment".comment_num = "child".parent_num(+)
			AND "vote".comment_num(+) = "comment".comment_num 
			AND "comment".parent_num IS NULL 
			AND "comment".TARGET_NUM IS NULL;		
            
            
SELECT board_comment.comment_num, COUNT(DECODE(type,'L',1,null)) "like", COUNT(DECODE(type,'D',1,null)) "dislike"
				        FROM comment_vote, board_comment
				        WHERE board_comment.comment_num = comment_vote.comment_num 
				        AND comment_vote.comment_num = 43                      
				        GROUP BY board_comment.comment_num;            
SELECT board_comment.comment_num, type, DECODE(type,'D  ',1,0)
				        FROM comment_vote, board_comment
				        WHERE board_comment.comment_num = comment_vote.comment_num 
				        AND comment_vote.comment_num = 43             ;
                        
select decode('L','L',1) from dual;                        



SELECT 
		    post_num "postNum",
		    comment_num "commentNum",
		    created_at "createdAt",
		    type "type"
		FROM comment_change_history
		WHERE post_num = 81
		AND created_at > '20/03/15 08:58:54.407000000'        
		ORDER BY created_at ASC;
        
-- 게시글 타입 추가
insert into board_type(name, type_num)
values ('잡담',BOARD_TYPE_SEQUENCE.nextval);

-- 게시글 타입
select type_num as "typeNum", name FROM board_type
commit;


-- 이력 
select * from comment_change_history order by created_at desc;