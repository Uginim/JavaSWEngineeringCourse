-- �������� �� ���� ( �̸�)
SELECT count(*)
FROM Challenge, App_User
WHERE challenge.user_num  = app_user.user_num
AND username like '%�׽�Ʈ%';



-- �������� �Ѱ��� (����)
SELECT count(*)
FROM Challenge, App_User
WHERE challenge.user_num  = app_user.user_num
AND title like '%����%';


