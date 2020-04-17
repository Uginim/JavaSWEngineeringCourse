-- 마무리문제결과 생성
INSERT INTO quiz_result(
RESULT_NUM, 
QUIZ_NUM, 
ANSWER, 
user_num,
STATUS
) values (
    RESULT_NUM_SEQ.nextval,
    21,
    '[1,5]',
    1,
    'f'    
);

commit;



-- 튜터신청서 총 개수
SELECT count(*) 
FROM tutor_application
;
SELECT *
FROM
(SELECT 
ROW_NUMBER() OVER(ORDER BY CREATED_AT DESC) AS "num",
UPDATED_AT AS "updatedAt", 
TITLE,  
CONTENT, 
USER_NUM AS "userNum", 
APPLICATION_NUM AS "applicationNum", 
CREATED_AT AS "createdAt",
APPROVAL
FROM tutor_application)
WHERE 
 "num" between 2 and 4
 
 
 ;