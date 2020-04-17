-- 도전과제 총 개수 ( 이름)
SELECT count(*)
FROM Challenge, App_User
WHERE challenge.user_num  = app_user.user_num
AND username like '%테스트%';



-- 도전과제 총개수 (과목)
SELECT count(*)
FROM Challenge, App_User
WHERE challenge.user_num  = app_user.user_num
AND title like '%더하%';


