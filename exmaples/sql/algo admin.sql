

-- 단원 완료 생성 
INSERT INTO unit_completion( 
COM_NUM, 
USER_NUM, 
UNIT_NUM, 
STATUS
)
VALUES (
    COM_NUM_SEQ.nextval,
    1,
    5,
    'C'
)

;

-- 다음 unit번호 가져오기

SELECT  case when count(unit_num) >0 then min(unit_num) else 0 end as "unitNum"
FROM unit
WHERE unit_num > 6
AND subject_num = 1
GROUP BY subject_num 

;

SELECT  nvl(min(unit_num),0 )as "unitNum" 
FROM unit 
WHERE unit_num > 5
and subject_num = (SELECT subject_num 
FROM unit WHERE unit_num = 5)


;

SELECT  nvl(min(unit_num),0) as "unitNum" 
FROM unit
WHERE unit_num > 6
AND subject_num = (SELECT subject_num 
FROM unit WHERE unit_num = 6)
GROUP BY subject_num 
;

commit;