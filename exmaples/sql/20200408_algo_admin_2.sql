-- 과목 수정
UPDATE subject
SET
    TITLE = '알고리즘', 
    USER_NUM = 1, 
    UPDATED_AT = SYSTIMESTAMP,
    IMAGE_DATA = NULL, 
    IMAGE_SIZE = NULL, 
    IMAGE_TYPE = NULL, 
    IMAGE_NAME = NULL
WHERE SUBJECT_NUM = 3;

--내용을 제외한 unit의 데이터들의 리스트를 가져옴
	SELECT
		unit_num as "unitNum",
		subject_num as "subjectNum",
		title,
		chapter_depth as "chapterDepth",
		created_at as "createdAt",
		updated_at as "updatedAt"
		FROM unit 
		WHERE subject_num = 1
      ;  
        
-- 이론학습 단원 삽입
INSERT INTO Unit (
    UNIT_NUM, 
    SUBJECT_NUM, 
    CONTENT, 
    TITLE, 
    CHAPTER_DEPTH
    )
VALUES (
    UNIT_NUM_SEQ.nextval,
    1,
    '냉무',
    '제목',
    '1.1.'
)
;

-- 단원 삭제
DELETE FROM unit 
	WHERE unit_num = 1
;
-- 단원 내용 수정
UPDATE Unit
SET      
    SUBJECT_NUM = 1, 
    CONTENT = '내애용', 
    TITLE = '제에목', 
    CHAPTER_DEPTH = '1.',
    UPDATED_AT = SYSTIMESTAMP
WHERE UNIT_NUM = 5
;

-- 마무리 문제 1개 열람
SELECT 
    QUIZ_NUM AS "quizNum", 
    UNIT_NUM AS "unitNum", 
    TITLE AS "title", 
    CONTENT AS "content", 
    CORRECT_ANSWER AS "correctAnswer", 
    SOLUTION AS "solution", 
    CREATED_AT AS "createdAt", 
    UPDATED_AT AS "updatedAt",
    USER_NUM AS "userNum"
FROM Quiz
WHERE quiz_num = 1

;
-- 마무리 문제 생성
INSERT INTO Quiz (
    QUIZ_NUM, 
    UNIT_NUM, 
    TITLE, 
    CONTENT, 
    CORRECT_ANSWER, 
    SOLUTION, 
    USER_NUM
    )
VALUES (
    QUIZ_NUM_SEQ.nextval,
    5,
    '제목',
    '내용',
    '정답',
    '해설',
    1
)

;
-- 마무리문제 현재 시퀀스
SELECT QUIZ_NUM_SEQ.currval FROM Dual
;
-- 과목 삭제
DELETE FROM Subject
WHERE subject_num = 2

;
-- 마무리 문제 삭제
DELETE FROM Quiz
WHERE quiz_num = 1

;

commit;







