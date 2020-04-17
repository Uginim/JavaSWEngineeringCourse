-- 랭킹 총 개수 
SELECT COUNT(*)
FROM Challenge_result
WHERE c_num = 21
AND status = 'S'
ORDER BY processing_time;

--랭킹에 따른 도전과제 (시간) 
SELECT * 
FROM (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY processing_time asc) as "rankNum",
        result_num as "resultNum",
        result_comment as "resultComment",
        cr.user_num as "userNum",
        au.username as "username",
        cr.used_memory as  "usedMemory",
        cr.processing_time as "processingTime",
        cr.c_num as "cNum",
        cr.status as "status"
    FROM Challenge_result cr, App_user au
    WHERE cr.user_num = au.user_num
    AND status= 'S'
    AND cr.c_num = 21
    ORDER BY "rankNum"
)
WHERE  "rankNum" >= 1
AND  "rankNum" <= 10



--랭킹에 따른 도전과제 (메모리) 
SELECT * 
FROM (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY used_memory asc) as "rankNum",
        result_num as "resultNum",
        result_comment as "resultComment",
        cr.user_num as "userNum",
        au.username as "username",
        cr.used_memory as  "usedMemory",
        cr.processing_time as "processingTime",
        cr.c_num as "cNum",
        cr.status as "status"
    FROM Challenge_result cr, App_user au
    WHERE cr.user_num = au.user_num
    AND status= 'S'
    AND cr.c_num = 21
    ORDER BY "rankNum"
)
WHERE  "rankNum" >= 1
AND  "rankNum" <= 10;



-- 자신의 가장 잘한 결과를 가져온다. 
SELECT *
FROM 
(SELECT 
    ROW_NUMBER() OVER (ORDER BY "usedMemory" asc) as "num",
    "rankNum",
    "resultNum",
     "resultComment",
    "userNum", 
    "username",
    "usedMemory",
    "processingTime",
    "cNum",
     "status"
FROM (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY used_memory asc) as "rankNum",        
        result_num as "resultNum",
        result_comment as "resultComment",
        cr.user_num as "userNum",
        au.username as "username",
        cr.used_memory as  "usedMemory",
        cr.processing_time as "processingTime",
        cr.c_num as "cNum",
        cr.status as "status"
    FROM Challenge_result cr, App_user au
    WHERE cr.user_num = au.user_num    
    AND status= 'S'
    AND cr.c_num = 21
    ORDER BY "rankNum"
)
WHERE  "userNum" = 1
)
WHERE "num" = 1;



SELECT
		post_num as "postNum",
		t2.category_num as
		"boardCategoryVO.categoryNum",
		t2.name as
		"boardCategoryVO.name",
		title,
		username as "userName",
		created_at as
		"createdAt",
		updated_at as
		"updatedAt",
		hit,
		content,
		post_group as
		"postGroup",
		post_step as
		"postStep",
		indent
		FROM
		board_post t1,
		board_category t2
		where
		t1.category_num = t2.category_num
		order by
		t1.post_group desc,
		t1.post_step asc;
        
        

  SELECT * FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY title asc) as "num" , 
    c_num as "cNum" , 
    content as "content", 
    title as "title", 
    limit_memory as "limitMemory", 
    limit_time as "limitTime", 
    challenge.user_num as "userNum", 
    app_user.username as "username", 
    pass_num as "passNum", 
    challenge.created_at as "createdAt", 
    challenge.updated_at as "updatedAt" 
    FROM challenge, app_user 
    WHERE challenge.user_num = app_user.user_num 
    AND ( challenge.title like '%' || 'gg' || '%' or 
    challenge.content like '%' || 'gg' || '%' ) ) 
    WHERE "num" >= 1 AND "num" <= 10; 
    
SELECT ROW_NUMBER() OVER (ORDER BY title asc) as "num" , 
    c_num as "cNum" , 
    content as "content", 
    title as "title", 
    limit_memory as "limitMemory", 
    limit_time as "limitTime", 
    challenge.user_num as "userNum", 
    app_user.username as "username", 
    pass_num as "passNum", 
    challenge.created_at as "createdAt", 
    challenge.updated_at as "updatedAt" 
    FROM challenge, app_user 
    WHERE challenge.user_num = app_user.user_num 
    AND challenge.title like '%' || 'gq' || '%';
    
select * from challenge where title like '%gq%'
        
        
        
        
SELECT 
        challenge.c_num AS "cNum",
        challenge.content,
        challenge.title,
        challenge.limit_memory AS "limitMemory",
        challenge.limit_time AS "limitTime" ,
        challenge.user_num AS "userNum",
        app_user.username as "username",
        challenge.pass_num AS "passNum",
        challenge.created_at AS "createdAt",
        challenge.updated_at AS "updatedAt"   
    FROM challenge, app_user
    WHERE challenge.user_num  = app_user.user_num
    AND c_num = 21
    