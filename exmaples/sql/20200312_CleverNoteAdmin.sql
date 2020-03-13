-- ��Ʈ ����� ������
SELECT 
    "comment".comment_num AS "commentNum",
    "comment".user_num AS "userNum",
    "comment".POST_NUM AS "postNum",
    "comment".CONTENT AS "content",
    "comment".CREATED_AT AS "createdAt",
    "comment".UPDATED_AT AS "updatedAt",
    "comment".USERNAME AS "username"    
--    (SELECT AS "countChildren"
FROM board_comment "comment"
WHERE "comment".post_num = 81 
AND "comment".parent_num IS NULL 
AND "comment".TARGET_NUM IS NULL;

-- �θ� ����� ������
SELECT 
    "comment".comment_num AS "commentNum",
    "comment".user_num AS "userNum",
    "comment".POST_NUM AS "postNum",
    "comment".CONTENT AS "content",
    "comment".CREATED_AT AS "createdAt",
    "comment".UPDATED_AT AS "updatedAt",
    "comment".USERNAME AS "username"
    ,nvl("child"."childrenCount",0) AS "childrenCount"        
FROM board_comment "comment",
        (SELECT parent_num, COUNT(comment_num) "childrenCount"
            FROM board_comment 
            WHERE  post_num = 81 
            AND parent_num IS NOT NULL 
            GROUP BY parent_num) "child"
WHERE "comment".post_num = 81 
AND "comment".comment_num = "child".parent_num(+)
AND "comment".parent_num IS NULL 
AND "comment".TARGET_NUM IS NULL;

-- �θ� ����� �Ϻθ� ��������
-- Ư����¥ ���ķ� ������ŭ ��������
select * FROM (
SELECT 
    row_number() over (order by created_at asc ) as  "row_num",
    "comment".comment_num AS "commentNum",
    "comment".user_num AS "userNum",
    "comment".POST_NUM AS "postNum",
    "comment".CONTENT AS "content",
    "comment".CREATED_AT AS "createdAt",
    "comment".UPDATED_AT AS "updatedAt",
    "comment".USERNAME AS "username",
    nvl("child"."childrenCount",0) AS "childrenCount",
    nvl("vote"."like",0) AS "like",
    nvl("vote"."dislike",0) AS "dislike"        
    -- ���ƿ� �Ⱦ�� ���� ������
FROM board_comment "comment",
    (SELECT parent_num, COUNT(comment_num) "childrenCount"
            FROM board_comment 
            WHERE  post_num = 81 
            AND parent_num IS NOT NULL 
            GROUP BY parent_num) "child",
    (SELECT board_comment.comment_num, COUNT(DECODE(type,'L',1)) "like", COUNT(DECODE(type,'D',1)) "dislike"
        FROM comment_vote, board_comment
        WHERE board_comment.comment_num = comment_vote.comment_num
        AND board_comment.parent_num IS NULL 
        AND board_comment.TARGET_NUM IS NULL
        AND board_comment.post_num = 81
        AND board_comment.CREATED_AT > '2020-03-12 02:45:53'
        GROUP BY board_comment.comment_num) "vote"                
WHERE "comment".comment_num = "child".parent_num(+)
AND "vote".comment_num(+) = "comment".comment_num    
AND "comment".parent_num IS NULL 
AND "comment".TARGET_NUM IS NULL
AND "comment".post_num = 81 
AND "comment".CREATED_AT > '2020-03-12 02:45:53'
)
WHERE "row_num" <= 3
ORDER BY "createdAt";

-- �ڽ� ��� �������� 
SELECT * FROM (
    SELECT  
        row_number() over (order by created_at asc ) as  "row_num",
        "comment".comment_num AS "commentNum",
        "comment".user_num AS "userNum",
        "comment".POST_NUM AS "postNum",
        "comment".CONTENT AS "content",
        "comment".CREATED_AT AS "createdAt",
        "comment".UPDATED_AT AS "updatedAt",
        "comment".USERNAME AS "username",
        "comment".PARENT_NUM AS "parentNum",
        "comment".TARGET_NUM AS "targetNum",
        nvl("vote"."like",0) AS "like",
        nvl("vote"."dislike",0) AS "dislike"
    FROM board_comment "comment",
        (SELECT board_comment.comment_num, COUNT(DECODE(type,'L',1)) "like", COUNT(DECODE(type,'D',1)) "dislike"
        FROM comment_vote, board_comment
        WHERE board_comment.comment_num = comment_vote.comment_num
        AND board_comment.parent_num = 45
        AND board_comment.CREATED_AT >  '2020-03-12 02:45:53'
        GROUP BY board_comment.comment_num) "vote"
    WHERE "vote".comment_num(+) = "comment".comment_num    
    AND "comment".parent_num IS NOT NULL 
    AND "comment".TARGET_NUM IS NOT NULL
    AND "comment".parent_num = 45 
    AND "comment".CREATED_AT >  '2020-03-12 02:45:53'
) WHERE "row_num" <= 10;

-- �Խñۿ� ������ ROOT ��� ���� 
SELECT COUNT(comment_num)
FROM board_comment
WHERE post_num = 81
AND created_at > '2020-03-12 08:45:53'
AND parent_num IS NULL 
AND target_num IS NULL;

-- �Խñ� �� ��۵��� �ڽ� �� ���
SELECT "child".parent_num, COUNT("child".comment_num) "childrenCount"
FROM board_comment "child"
WHERE  "child".post_num = 81
GROUP BY "child".parent_num ;

-- ��� �ϳ��� �ڽ� �� ���
SELECT "child".parent_num, COUNT("child".comment_num) "childrenCount"
FROM board_comment "child"
WHERE  "child".PARENT_NUM = 45
GROUP BY "child".parent_num ;


-- ��ǥ���� ���
SELECT comment_num, COUNT(DECODE(type,'L',1)) "like", COUNT(DECODE(type,'D',1)) "dislike"
FROM comment_vote
GROUP BY comment_num;

-- �� ��� ����� ������
SELECT 
    comment_num "commentNum",
    user_num "userNum",
    post_num "postNum",
    content,
    created_at "createdAt",
    updated_at "updatedAt",
    username username,
    nvl("child"."childrenCount",0) AS "childrenCount",
    nvl(parent_num,0) "parentNum",
    nvl(target_num,0) "targetNum"
FROM board_comment
WHERE post_num = 81
AND user_num = 397;
-- ���� �̷� ��������
SELECT 
    history_num "historyNum",
    post_num "postNum",
    comment_num "commentNum",
    created_at "createdAT",
    type "type"
FROM comment_change_history
WHERE post_num = 81
AND created_at > '2020-03-12 09:00:00';

-- ��� �ϳ� �������� 
SELECT
        "comment".comment_num AS "commentNum",
        "comment".user_num AS "userNum",
        "comment".POST_NUM AS "postNum",
        "comment".CONTENT AS "content",
        "comment".CREATED_AT AS "createdAt",
        "comment".UPDATED_AT AS "updatedAt",
        "comment".USERNAME AS "username",
        nvl("comment".PARENT_NUM,0) AS "parentNum",
        nvl("comment".TARGET_NUM,0) AS "targetNum",
        nvl("child"."childrenCount",0) AS "childrenCount",
        nvl("vote"."like",0) AS "like",
        nvl("vote"."dislike",0) AS "dislike"
FROM  board_comment "comment",       
    ( SELECT parent_num, COUNT(comment_num) "childrenCount"
            FROM board_comment 
            WHERE  post_num = 81 
            AND parent_num IS NOT NULL 
            GROUP BY parent_num) "child",
    (SELECT board_comment.comment_num, COUNT(DECODE(type,'L',1)) "like", COUNT(DECODE(type,'D',1)) "dislike"
        FROM comment_vote, board_comment
        WHERE board_comment.comment_num = comment_vote.comment_num                        
        GROUP BY board_comment.comment_num) "vote"                
WHERE "comment".comment_num = "child".parent_num(+)
AND "vote".comment_num(+) = "comment".comment_num    
AND "comment".comment_num = 45;

-- ��� �����ϱ�
UPDATE board_comment 
SET user_num = 397,
post_num = 81,
content = '�ٽ� �� ���',
updated_at = SYSTIMESTAMP,
username = 'userName',
parent_num = NULL,
target_num = NULL
WHERE comment_num = 45;

-- ��� �����ϱ� 
DELETE
FROM board_comment
WHERE comment_num = 85;

-- ��ǥ �߰�(�����ϸ� ���� ����)
MERGE INTO comment_vote
USING dual
ON (comment_vote.comment_num = 1 AND comment_vote.type = 'L' AND comment_vote.user_num = 397)
WHEN NOT MATCHED THEN 
    INSERT (
        vote_num,
        comment_num,
        type,
        created_at,
        updated_at,
        user_num
    )
    VALUES(
        1,
        2,
        'D',
        SYSTIMESTAMP,
        SYSTIMESTAMP,
        397
    );    

-- �� vote �� ����
 INSERT INTO comment_vote(
        vote_num,
        comment_num,
        type,
        created_at,
        updated_at,
        user_num
    )
    VALUES(
        VOTE_SEQUENCE.nextval,
        2,
        'L',
        SYSTIMESTAMP,
        SYSTIMESTAMP,
        397
    );  

-- ���ƿ� ǥ���� VO��ü
SELECT 
    "vote".vote_num "voteNum",
    "vote".comment_num "comment_num",
    "vote".type "type",
    "vote".created_at "createdAt",
    "vote".updated_at "updatedAt",
    "vote".user_num "userNum"
FROM comment_vote "vote", board_comment "comment"
WHERE "comment".comment_num = "vote".comment_num
AND "vote".user_num = 397
AND "comment".post_num = 81
