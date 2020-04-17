
-- 마무리 문제 수정
UPDATE Quiz 
SET
    UNIT_NUM = 5, 
    TITLE = '새 제목', 
    CONTENT ='나는 내용을 바꿀거야', 
    CORRECT_ANSWER ='답', 
    SOLUTION ='해설',
    UPDATED_AT = SYSTIMESTAMP
WHERE QUIZ_NUM = 5

;

-- 퀴즈(마무리문제) 답안
SELECT 
    ANSWER_NUM AS "answerNum", 
    QUIZ_NUM AS "quizNum", 
    CONTENT AS "content", 
    IS_CORRECT AS "isCorrect", 
    CREATED_AT AS "createdAt", 
    UPDATED_AT AS "updatedAt"
FROM Quiz_answer
WHERE quiz_num = 4

;

-- 새 마무리문제 답안 생성
INSERT INTO Quiz_answer (
    ANSWER_NUM, 
    QUIZ_NUM, 
    CONTENT, 
    IS_CORRECT
) VALUES (
    ANSWER_NUM_SEQ.nextval,
    5,
    '답',
    't'
)


;

SELECT ANSWER_NUM_SEQ.currval FROM dual

;

-- 답안 한개 조회
SELECT 
    ANSWER_NUM AS "answerNum", 
    QUIZ_NUM AS "quizNum", 
    CONTENT AS "content", 
    IS_CORRECT AS "isCorrect", 
    CREATED_AT AS "createdAt", 
    UPDATED_AT AS "updatedAt"
FROM Quiz_answer
WHERE ANSWER_NUM = 2

;

--마무리문제 답안 삭제	
DELETE FROM QUIZ_ANSWER
WHERE answer_num = 5

;

--마무리문제 답안 수정 
UPDATE Quiz_answer
SET   
    QUIZ_NUM = 21, 
    CONTENT = '답을 정말 바꿀거야', 
    IS_CORRECT = 'f', 
    UPDATED_AT = SYSTIMESTAMP
WHERE ANSWER_NUM = 4

;
