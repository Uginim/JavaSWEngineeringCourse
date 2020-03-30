-- �������� ����
INSERT INTO CHALLENGE
(C_NUM, CONTENT, TITLE, LIMIT_MEMORY, LIMIT_TIME, USER_NUM)
VALUES 
(CHALLENGE_NUM_SEQ.nextval, '����', '����', 2000, 2000, 1);

-- �������� ��� ����
INSERT INTO challenge_result
(result_num, c_num , user_num, result_comment, status, code, used_memory, processing_time)
VALUES
(RESULT_NUM_SEQ.nextval,  1, 1, '����', 'p', 'hello world', 10, 20 );

-- �������� ���̽� ����
INSERT INTO challenge_case
    (case_num, c_num, input, output, user_num)
VALUES
    (CASE_NUM_SEQ.nextval, 1, '1', '1', 1 );
    
    
-- �������� ��ȸ
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
    
-- �������� ��� �˻�(���� �˻�) 1)
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
    AND challenge.title like  '%����%'
)
WHERE "num" >= 1 
    AND "num" <= 10;

-- ������� ���� �ݿ�

-- �������� ��� ���� 
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

-- ��ü �������� ��� ����
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

-- ���� �� ��ü �������� ��� ����
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
    

-- �������� ���� ������ �������� ��� ����
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
-- ���������� ��� �� ���� �ֱ� ���� ����� ������     
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

    
-- ��� ���������� ��� ��� ������ ������    
SELECT COUNT(*)
FROM challenge_result;


-- ���������� ��� ��� ������ ������
SELECT COUNT(*)
FROM challenge_result    
WHERE c_num = 1;

-- �������� �� ��� ���̽��� ������
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

-- ���̽� ��ȣ�� ���̽� ������ �ϳ� ���� 
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

-- �������� ����
UPDATE challenge
SET 
    content = 'hello world�� ����϶�!',
    title = '����ϱ�1',
    limit_memory = 2000,
    limit_time = 1000,
    updated_at = SYSTIMESTAMP,
    user_num = 1
WHERE c_num = 1;

-- �������� ��� �� ����
UPDATE challenge
SET pass_num = pass_num +1
WHERE c_num = 1;


-- �������� ��� �� ����
UPDATE challenge
SET pass_num = 20,
updated_at = SYSTIMESTAMP
WHERE c_num = 1;

-- �������� ��� ����
UPDATE  challenge_result 
SET 
    user_num = 1,
    result_comment = '������ ����',
    status = 'e',
    updated_at = SYSTIMESTAMP,
    c_num = 1,
    used_memory = 1024,
    processing_time = 1234
WHERE result_num = 3;

-- �������� �׽�Ʈ���̽� ����
UPDATE challenge_case
SET 
c_num = 1,
input = '1 4',
output = '5',
user_num = 1,
updated_at = SYSTIMESTAMP
WHERE case_num = 1;

-- �������� ����
DELETE FROM challenge 
WHERE c_num = 4;

-- �������� ��� ����
DELETE FROM challenge_result
WHERE result_num = 6;

-- �������� �׽�Ʈ���̽� ����
DELETE FROM challenge_case
WHERE case_num = 3;

-- ���������� ���Ե� ��� �׽�Ʈ���̽�����
DELETE FROM challenge_case
WHERE c_num = 1