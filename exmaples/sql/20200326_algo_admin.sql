-- 도전과제 생성
INSERT INTO CHALLENGE
(C_NUM, CONTENT, TITLE, LIMIT_MEMORY, LIMIT_TIME, USER_NUM)
VALUES 
(CHALLENGE_NUM_SEQ.nextval, '문제', '제목', 2000, 2000, 1);

-- 도전과제 결과 생성
INSERT INTO challenge_result
(result_num, c_num , user_num, result_comment, status, code, used_memory, processing_time)
VALUES
(RESULT_NUM_SEQ.nextval,  1, 1, '아직', 'p', 'hello world', 10, 20 );

-- 도전과제 케이스 생성
INSERT INTO challenge_case
    (case_num, c_num, input, output, user_num)
VALUES
    (CASE_NUM_SEQ.nextval, 1, '1', '1', 1 );
    
    
-- 도전과제 조회
SELECT 
    c_num AS "cNum",
    content,
    title,
    limit_memory AS "limitMemory",
    limit_time AS "limitTime" ,
    user_num AS "userNum",
    pass_num AS "passNum",
    created_at AS "createdAt",
    updated_at AS "updatedAt"   
FROM challenge
WHERE c_num = 1;
    
-- 도전과제 목록 검색(제목 검색) 1)
SELECT *
FROM (SELECT 
    ROW_NUMBER() OVER (ORDER BY title asc) as "num" ,
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
WHERE challenge.user_num  = app_user.user_num 
    AND challenge.title like  '%제목%'
)
WHERE "num" >= 1 
    AND "num" <= 10;

-- 여기까지 문서 반영

-- 도전과제 결과 보기 
SELECT 
    result_num AS "resultNum",
    user_num AS "userNum" ,
    result_comment AS "resultComment",
    status ,
    created_at AS "createdAt",
    updated_at AS "updatedAt",
    code,
    c_num AS "cNum",
    used_memory AS "usedMemory",
    processing_time AS "processingTime"
FROM challenge_result
WHERE result_num = 2;

-- 전체 도전과제 결과 보기
SELECT *
FROM (SELECT 
        ROW_NUMBER() OVER(ORDER BY  created_at DESC) as num,
        result_num AS "resultNum",
        user_num AS "userNum" ,
        result_comment AS "resultComment",
        status ,
        created_at AS "createdAt",
        updated_at AS "updatedAt",
        code,
        c_num AS "cNum",
        used_memory AS "usedMemory",
        processing_time AS "processingTime"
    FROM challenge_result   
    )
WHERE num >= 1 
    AND num <= 10;

-- 문제 내 전체 도전과제 결과 보기
SELECT *
FROM (SELECT 
        ROW_NUMBER() OVER(ORDER BY  created_at DESC) as num,
        result_num AS "resultNum",
        user_num AS "userNum" ,
        result_comment AS "resultComment",
        status ,
        created_at AS "createdAt",
        updated_at AS "updatedAt",
        code,
        c_num AS "cNum",
        used_memory AS "usedMemory",
        processing_time AS "processingTime"
    FROM challenge_result
    WHERE challenge_result.c_num = 1 
    )
WHERE num >= 1 
    AND num <= 10;
    

-- 문제에서 내가 제출한 도전과제 결과 보기
SELECT *
FROM (SELECT 
        ROW_NUMBER() OVER(ORDER BY  created_at DESC) as num,
        result_num AS "resultNum",
        user_num AS "userNum" ,
        result_comment AS "resultComment",
        status ,
        created_at AS "createdAt",
        updated_at AS "updatedAt",
        code,
        c_num AS "cNum",
        used_memory AS "usedMemory",
        processing_time AS "processingTime"
    FROM challenge_result
    WHERE 
            challenge_result.c_num = 1 
        AND challenge_result.user_num = 1
    )
WHERE num >= 1 
    AND num <= 10;
-- 도전과제의 결과 중 가장 최근 과제 결과를 가져옴     
SELECT *
FROM (SELECT 
        ROW_NUMBER() OVER(ORDER BY  created_at DESC) as num,
        result_num AS "resultNum",
        user_num AS "userNum" ,
        result_comment AS "resultComment",
        status ,
        created_at AS "createdAt",
        updated_at AS "updatedAt",
        code,
        c_num AS "cNum",
        used_memory AS "usedMemory",
        processing_time AS "processingTime"
    FROM challenge_result   
    WHERE challenge_result.c_num = 1 
    AND challenge_result.user_num = 1
    )
WHERE num = 1 ;

    
-- 모든 도전과제의 모든 결과 개수를 가져옴    
SELECT COUNT(*)
FROM challenge_result;


-- 도전과제의 모든 결과 개수를 가져옴
SELECT COUNT(*)
FROM challenge_result    
WHERE c_num = 1;

-- 도전과제 내 모든 케이스를 가져옴
SELECT 
    case_num AS "caseNum",
    c_num AS "cNum",
    input,
    output,
    user_num AS "userNum",
    created_at AS "createdAt",
    updated_at AS "updatedAt"
FROM  challenge_case
WHERE c_num = 1;

-- 케이스 번호로 케이스 데이터 하나 열람 
SELECT 
    case_num AS "caseNum",
    c_num AS "cNum",
    input,
    output,
    user_num AS "userNum",
    created_at AS "createdAt",
    updated_at AS "updatedAt"
FROM  challenge_case
WHERE case_num = 1;

-- 도전과제 변경
UPDATE challenge
SET 
    content = 'hello world를 출력하라!',
    title = '출력하기1',
    limit_memory = 2000,
    limit_time = 1000,
    updated_at = SYSTIMESTAMP,
    user_num = 1
WHERE c_num = 1;

-- 도전과제 통과 수 증가
UPDATE challenge
SET pass_num = pass_num +1
WHERE c_num = 1;


-- 도전과제 통과 수 갱신
UPDATE challenge
SET pass_num = 20,
updated_at = SYSTIMESTAMP
WHERE c_num = 1;

-- 도전과제 결과 변경
UPDATE  challenge_result 
SET 
    user_num = 1,
    result_comment = '컴파일 에러',
    status = 'e',
    updated_at = SYSTIMESTAMP,
    c_num = 1,
    used_memory = 1024,
    processing_time = 1234
WHERE result_num = 3;

-- 도전과제 테스트케이스 변경
UPDATE challenge_case
SET 
c_num = 1,
input = '1 4',
output = '5',
user_num = 1,
updated_at = SYSTIMESTAMP
WHERE case_num = 1;

-- 도전과제 삭제
DELETE FROM challenge 
WHERE c_num = 4;

-- 도전과제 결과 삭제
DELETE FROM challenge_result
WHERE result_num = 6;

-- 도전과제 테스트케이스 삭제
DELETE FROM challenge_case
WHERE case_num = 3;

-- 도전과제에 포함된 모든 테스트케이스삭제
DELETE FROM challenge_case
WHERE c_num = 1