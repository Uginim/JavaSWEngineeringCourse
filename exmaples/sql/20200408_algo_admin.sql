-- 사용자가 작성한 모든과목들가져오기 
select	*
FROM(
    select row_number() over(order by subject_num desc) as	num,
    subject_num as "subjectNum",
    title,
    created_at as "createdAt",
    updated_at as "updatedAt",
    user_num as "userNum"
    from subject
    where user_num =1
    )
    
    WHERE num between 1 and 10;
    
    
-- 사용자가 작성한 모든과목들 중 검색해서 가져오기 
select	*
FROM(
    select row_number() over(order by subject_num desc) as	num,
    subject_num as "subjectNum",
    title,
    created_at as "createdAt",
    updated_at as "updatedAt",
    user_num as "userNum"
    from subject
    where user_num =1
    AND title LIKE '%'||'J'||'%'
    )
    
    WHERE num between 1 and 10;
-- 과목생성하기    
INSERT INTO Subject (
    subject_num, 
    title, 
    user_num, 
    image_data, 
    image_size, 
    image_type, 
    image_name)
VALUES
    (SUBJECT_NUM_SEQ.nextval,
    'title',
    1,
    NULL,
    NULL,
    NULL,
    NULL);
    
-- 과목 하나 불러오기
SELECT 
    subject_num AS "subjectNum",
    title AS "title",
    user_num AS "userNum",
    created_at AS "createdAt",
    updated_at AS "updatedAt",
    image_data AS "imageData",
    image_size AS "imageSize",
    image_type AS "imageType",
    image_name AS "imageName"
FROM Subject
WHERE subject_num = 3
    
    