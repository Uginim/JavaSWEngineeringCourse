-- 도전과제 
-- 문제 별 통과한 사람 수
SELECT challenge.c_num, COUNT( DISTINCT (CASE WHEN challenge_result.status = 'S' THEN challenge_result.user_num ELSE NULL END)) "passer", COUNT(DISTINCT challenge_result.user_num ) "challenger"
FROM challenge LEFT OUTER JOIN challenge_result
ON challenge.c_num = challenge_result.c_num
GROUP BY challenge.c_num 
ORDER BY "challenger" desc, "passer" asc

;
-- 도전과제 
-- 핫한 문제 top 5
SELECT * FROM(
SELECT
"pass".* ,
ROW_NUMBER() OVER (ORDER BY "pass"."challenger" desc) "num"
FROM(
SELECT 
challenge.c_num AS "cNum", 
challenge.title AS "title",
COUNT( DISTINCT (CASE WHEN challenge_result.status = 'S' THEN challenge_result.user_num ELSE NULL END)) "passer", 
COUNT(DISTINCT challenge_result.user_num ) "challenger"
FROM challenge LEFT OUTER JOIN challenge_result
ON challenge.c_num = challenge_result.c_num
GROUP BY challenge.c_num, challenge.title
ORDER BY "challenger" desc, "passer" asc) "pass"
)
WHERE "num" <= 5

;

-- 랭킹
SELECT * 
FROM (
SELECT 
pass.*,
row_number() over(order by "passedNum" desc) AS "num"
FROM (
SELECT 
app_user.user_num AS "userNum", 
app_user.username AS "username",
COUNT(DISTINCT CASE WHEN challenge_result.status='S' then app_user.user_num ELSE null END) "passedNum"
FROM APP_USER, CHALLENGE_RESULT
WHERE APP_USER.user_num = challenge_result.user_num
GROUP BY app_user.username, app_user.user_num
ORDER BY "passedNum"
) pass 
)
WHERE "num" <= 5
;

-- 과목 진척도 조회
select	*
		FROM(
		select row_number() over(order by
		subject.subject_num desc) as
		num,
		subject.subject_num as "subjectNum",
		subject.title,
		subject.created_at  as "createdAt",
		subject.updated_at as "updatedAt",
		subject.user_num as "userNum",
        progress."progressRate",
		"tutor".username AS "username"
		FROM subject, app_user "tutor",
        (SELECT subject.subject_num, count(distinct unit.unit_num), count(distinct case when unit_completion.status='C' AND unit_completion.user_num = 3 then unit_completion.unit_num else null end),
count(distinct case when unit_completion.status='C' AND unit_completion.user_num = 1 then unit_completion.unit_num else null end)/ count(distinct unit.unit_num) *100 AS "progressRate"
FROM  subject, unit, unit_completion
WHERE subject.subject_num = unit.subject_num (+)
AND  unit.unit_num = unit_completion.unit_num(+)
GROUP BY subject.subject_num) progress
where subject.user_num = "tutor".user_num
AND subject.subject_num = progress.subject_num(+)
--and subject.subject_num = unit.subject_num (+)
--AND  unit.unit_num = unit_completion.unit_num(+)
--AND (unit_completion.user_num = 3 or unit_completion.user_num = null)
)

;


-- 단원 내 모든 문제 통과 여부(단원의 진행정도를 조회)
SELECT CASE WHEN "totalQuiz" = "passedQuiz" THEN 'T' ELSE 'F' END AS "passesUnit", "quizStatus".*
FROM (
SELECT unit.unit_num AS "unitNum", unit.title AS "title", count(distinct quiz.quiz_num) AS "totalQuiz",  
count(DISTINCT case when quiz_result.status='t' and quiz_result.user_num =3  then quiz.quiz_num else null end) AS "passedQuiz"
FROM UNIT, QUIZ, quiz_result
WHERE UNIT.unit_num = quiz.unit_num(+)
AND quiz.quiz_num = quiz_result.quiz_num (+)
AND unit.unit_num = 3
GROUP BY unit.unit_num , unit.title
) "quizStatus"

;
-- 단원 내 각 문제의 통과여부 조회
SELECT CASE WHEN "passedResult" > 0 THEN 'T' ELSE 'F' END AS "passesQuiz", "quizStatus".*
FROM (
SELECT distinct unit.unit_num AS "unitNum", quiz.quiz_num AS "quizNum", count( case when quiz_result.status='t' and quiz_result.user_num =3  then quiz.quiz_num else null end )AS "passedResult"
FROM UNIT, QUIZ, quiz_result
WHERE UNIT.unit_num = quiz.unit_num
AND quiz.quiz_num = quiz_result.quiz_num (+)
AND unit.unit_num = 3
GROUP BY unit.unit_num, quiz.quiz_num
order by quiz.quiz_num
)"quizStatus"


