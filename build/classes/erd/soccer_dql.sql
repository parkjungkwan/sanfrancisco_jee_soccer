-- SQL_TEST_001
-- 전체 축구팀 목록. 이름 오름차순
SELECT TEAM_NAME
FROM TEAM
ORDER BY TEAM_NAME
;

-- SQL_TEST_002
-- 포지션 종류(중복제거,없으면 빈공간)
SELECT DISTINCT POSITION
FROM PLAYER
;


-- SQL_TEST_003
-- 포지션 종류(중복제거,없으면 신입으로 기재)
-- nvl2()사용
SELECT DISTINCT NVL2(POSITION, POSITION, '신입')
FROM PLAYER;
;


-- SQL_TEST_004
-- 수원팀(ID: K02)골키퍼
SELECT *
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND POSITION LIKE 'GK'
;


-- SQL_TEST_005
-- 수원팀(ID: K02)키가 170 이상 선수
-- 이면서 성이 고씨인 선수
SELECT *
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND HEIGHT >= 170
    AND PLAYER_NAME LIKE '고%'
;


-- SQL_TEST_006
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- 키 내림차순
SELECT PLAYER_NAME 선수명, 
    NVL(HEIGHT,0) || 'CM' 키, 
    NVL(WEIGHT,0) || 'KG'몸무게
FROM PLAYER
ORDER BY HEIGHT DESC
;



-- SQL_TEST_007
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- BMI지수
-- 키 내림차순
SELECT PLAYER_NAME 선수명, 
    CONCAT(NVL2(HEIGHT,HEIGHT,0),'CM') 키, 
    CONCAT(NVL2(WEIGHT,WEIGHT,0),'KG') 몸무게,
    ROUND((WEIGHT/(HEIGHT/100*HEIGHT/100)),2)BMI지수
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC
;




--SQL_TEST_008
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중
-- 포지션이 GK 인 선수
-- 팀명, 사람명 오름차순
SELECT T.TEAM_NAME, P.PLAYER_NAME
FROM PLAYER P 
    JOIN (SELECT TEAM_ID, TEAM_NAME
          FROM TEAM
          WHERE TEAM_ID IN ('K02','K10'))T
    USING (TEAM_ID)
WHERE P.POSITION LIKE 'GK'
ORDER BY 1,2 DESC
;

-- SQL_TEST_009
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- 키가 180 이상 183 이하인 선수들
-- 키, 팀명, 사람명 오름차순

SELECT P.HEIGHT 키, T.TEAM_NAME 팀명, P.PLAYER_NAME 사람명
FROM PLAYER P
    JOIN TEAM T
        USING(TEAM_ID)
WHERE TEAM_ID IN ('K02','K10')
    AND HEIGHT BETWEEN 180 AND 183
ORDER BY 1,2,3
;



-- SOCCER_SQL_010
-- 모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순
SELECT T.TEAM_NAME 팀명, P.PLAYER_NAME 사람명
FROM PLAYER P
    JOIN TEAM T
        USING(TEAM_ID)
WHERE POSITION IS NULL
ORDER BY 1,2
;

-- SOCCER_SQL_011
-- 팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력

SELECT 
    T.TEAM_NAME 팀명, 
    S.STADIUM_NAME 스타디움
FROM TEAM T
    JOIN STADIUM S
        USING(STADIUM_ID)
;


-- SOCCER_SQL_012
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오.

SELECT 
    T.TEAM_NAME 팀이름, 
    S.STADIUM_NAME 스타디움, 
   (SELECT TEAM_NAME 
    FROM TEAM
    WHERE TEAM_ID LIKE C.AWAYTEAM_ID) 어웨이팀, 
    C.SCHE_DATE 경기일자
FROM TEAM T
        JOIN STADIUM S
            USING(STADIUM_ID)
        JOIN SCHEDULE C
            USING(STADIUM_ID)
WHERE C.SCHE_DATE LIKE '20120317'
ORDER BY 1            
;


-- SOCCER_SQL_013
-- 2012년 3월 17일 경기에
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함),
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오
SELECT 
    P.PLAYER_NAME 선수, 
    P.POSITION 포지션,
    CONCAT(CONCAT(T.REGION_NAME,' ') ,T.TEAM_NAME) 팀명,
    S.STADIUM_NAME 스타디움, 
    K.SCHE_DATE 경기날짜
FROM PLAYER P 
    JOIN TEAM T
        USING(TEAM_ID)
    JOIN STADIUM S 
        USING(STADIUM_ID)
    JOIN SCHEDULE K 
        USING(STADIUM_ID)
WHERE P.POSITION LIKE 'GK'
    AND K.SCHE_DATE LIKE '20120317';
    



-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오

SELECT
    ST.STADIUM_NAME 경기장, 
    SC.SCHE_DATE 경기일정,
    CONCAT(CONCAT(HT.REGION_NAME,' '), HT.TEAM_NAME) 홈팀,
    CONCAT(CONCAT(AT.REGION_NAME,' '), AT.TEAM_NAME) 원정팀
FROM (SELECT STADIUM_ID,
             SCHE_DATE,
             HOMETEAM_ID,
             AWAYTEAM_ID
      FROM SCHEDULE
      WHERE (HOME_SCORE - AWAY_SCORE) >= 3) SC
    JOIN STADIUM ST
        USING (STADIUM_ID)
    JOIN TEAM HT
        ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
    JOIN TEAM AT
        ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
;
        

-- SOCCER_SQL_015
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20
SELECT S.*, T.E_TEAM_NAME
FROM STADIUM S 
    LEFT JOIN TEAM T
        ON S.STADIUM_ID LIKE T.STADIUM_ID
;


-- SOCCER_SQL_016
-- 평균키가 인천 유나이티스팀의 평균키 보다 작은 팀의
-- 팀ID, 팀명, 평균키 추출

SELECT
    TEAM_ID 팀ID,
    T.TEAM_NAME 팀명,
    ROUND(AVG(P.HEIGHT),2) 평균키
FROM PLAYER P
    JOIN TEAM T
        USING (TEAM_ID)
GROUP BY TEAM_ID, 
         T.TEAM_NAME
HAVING AVG(P.HEIGHT) < (SELECT AVG(P2.HEIGHT)
                        FROM PLAYER P2
                        WHERE TEAM_ID LIKE 
                            (SELECT T2.TEAM_ID 
                            FROM TEAM T2
                            WHERE T2.TEAM_NAME LIKE '유나이티드') )
;



-- SOCCER_SQL_017
-- 포지션이 MF 인 선수들의 소속팀명 및 선수명, 백넘버 출력
SELECT 
    TEAM_NAME 팀명, 
    PLAYER_NAME 선수명, 
    BACK_NO 백넘버
FROM (SELECT PLAYER_NAME ,BACK_NO ,TEAM_ID
      FROM PLAYER
      WHERE POSITION LIKE 'MF') P
    JOIN TEAM T
        USING(TEAM_ID)

;


-- SOCCER_SQL_018
-- 가장 키큰 선수 5 추출, 오라클, 단 키 값이 없으면 제외

SELECT 
    PLAYER_NAME 선수명, 
    BACK_NO 백넘버, 
    HEIGHT 키
FROM (SELECT 
            PLAYER_NAME,
            BACK_NO, 
            HEIGHT
      FROM PLAYER
      WHERE HEIGHT IS NOT NULL
      ORDER BY HEIGHT DESC)
WHERE ROWNUM<=5
;


-- SOCCER_SQL_019
-- 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력
SELECT 
    TEAM_NAME, 
    PLAYER_NAME, 
    HEIGHT,
    BACK_NO
FROM TEAM T
    JOIN PLAYER P
        ON T.TEAM_ID LIKE P.TEAM_ID
WHERE HEIGHT < (SELECT AVG(HEIGHT)
                FROM PLAYER P2
                WHERE P2.TEAM_ID LIKE P.TEAM_ID
                AND P2.HEIGHT IS NOT NULL
                GROUP BY P2.TEAM_ID)     
;


-- SOCCER_SQL_020
-- 2012년 5월 한달간 경기가 있는 경기장 조회
-- EXISTS 쿼리는 항상 연관쿼리로 상요한다.
-- 또한 아무리 조건을 만족하는 건이 여러 건이라도
-- 조건을 만족하는 1건만 찾으면 추가적인 검색을 진행하지 않는다.

SELECT 
    SCHE_DATE 날짜 ,
    STADIUM_NAME 경기장
FROM STADIUM  
    JOIN SCHEDULE 
        USING(STADIUM_ID)
WHERE EXISTS (SELECT 1 
              FROM SCHEDULE
              WHERE SCHE_DATE 
                BETWEEN '20120501' AND '20120531')
                
-- SOCCER_SQL_021
-- 이현 선수 소속팀의 선수명단 출력
--X.PLAYER_NAME 선수명
--    ,X.POSITION 포지션
--    ,X.BACK_NO 백넘버
SELECT X.PLAYER_NAME 선수명
    ,X.POSITION 포지션
    ,X.BACK_NO 백넘버
FROM PLAYER X
WHERE X.TEAM_ID LIKE (
        SELECT P.TEAM_ID
        FROM PLAYER P
        WHERE P.PLAYER_NAME LIKE '이현'
)
;
SELECT X.PLAYER_NAME 선수명
    ,X.POSITION 포지션
    ,X.BACK_NO 백넘버
FROM PLAYER X JOIN (
        SELECT P.TEAM_ID
        FROM PLAYER P
        WHERE P.PLAYER_NAME LIKE '이현') D
    ON X.TEAM_ID = D.TEAM_ID
;


-- SOCCER_SQL_022
-- NULL 처리에 있어
-- SUM(NVL(SAL,0)) 로 하지말고
-- NVL(SUM(SAL),0) 으로 해야 자원낭비가 줄어든다

-- 팀별 포지션별 인원수와 팀별 전체 인원수 출력

-- Oracle, Simple Case Expr

SELECT
    TEAM_ID,
    NVL(SUM(CASE POSITION WHEN 'FW' THEN 1 ELSE 0 END),0) FW,
    NVL(SUM(CASE POSITION WHEN 'MF' THEN 1 ELSE 0 END),0) MF,
    NVL(SUM(CASE POSITION WHEN 'DF' THEN 1 ELSE 0 END),0) DF,
    NVL(SUM(CASE POSITION WHEN 'GK' THEN 1 ELSE 0 END),0) GK,
    COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID
;



-- SOCCER_SQL_023
-- GROUP BY 절 없이 전체 선수들의 포지션별 평균 키 및 전체 평균 키 출력S
SELECT
    ROUND(AVG(CASE WHEN POSITION LIKE 'MF' THEN HEIGHT END),2) 미드필더,
    ROUND(AVG(CASE WHEN POSITION LIKE 'FW' THEN HEIGHT END),2) 공격수,
    ROUND(AVG(CASE WHEN POSITION LIKE 'DF' THEN HEIGHT END),2) 수비수,
    ROUND(AVG(CASE WHEN POSITION LIKE 'GK' THEN HEIGHT END),2) 골키퍼,
    ROUND(AVG(HEIGHT),2) "전체 평균키"
FROM PLAYER
;




-- SOCCER_SQL_024
-- 소속팀별 키가 가장 작은 사람들의 정보

SELECT*
FROM PLAYER
WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT)
                            FROM PLAYER
                            GROUP BY TEAM_ID)
;

SELECT TEAM_ID, MIN(HEIGHT)
FROM PLAYER
GROUP BY TEAM_ID
;


-- SOCCER_SQL_025
-- K-리그 2012년 8월 경기결과와 두 팀간의 점수차를 ABS 함수를 사용하여
-- 절대값으로 출력하기

SELECT SCHE_DATE 날짜,
    CONCAT(CONCAT(T.TEAM_NAME,' - '),T2.TEAM_NAME)팀들,
    CONCAT(CONCAT(HOME_SCORE, ' - '),AWAY_SCORE) 점수,
    ABS(HOME_SCORE-AWAY_SCORE)
    
FROM (SELECT SCHE_DATE, 
             HOME_SCORE, 
             AWAY_SCORE, 
             HOMETEAM_ID, 
             AWAYTEAM_ID
       FROM SCHEDULE
       WHERE SCHE_DATE BETWEEN 20120801 AND 20120831
       ) S 
    JOIN (SELECT TEAM_ID, TEAM_NAME
           FROM TEAM) T
        ON S.HOMETEAM_ID LIKE T.TEAM_ID
    JOIN (SELECT TEAM_ID, TEAM_NAME
           FROM TEAM) T2
        ON S.AWAYTEAM_ID LIKE T2.TEAM_ID
;
        




-- SOCCER_SQL_026
-- 20120501 부터 20120602 사이에 경기가 있는 경기장 조회
SELECT 
    DISTINCT 
    STADIUM_ID 스타디움코드, 
    STADIUM_NAME 경기장명
FROM (SELECT 
            STADIUM_ID, 
            STADIUM_NAME
      FROM STADIUM)
      JOIN (SELECT SCHE_DATE, STADIUM_ID
            FROM SCHEDULE
            WHERE SCHE_DATE 
                BETWEEN TO_DATE('20120501') AND TO_DATE('20120602'))
        USING(STADIUM_ID)
;

-- SOCCER_SQL_027
-- 선수정보와 해당 선수가 속한 팀의 평균키 조회
-- 단, 정렬시 평균키 내림차순
SELECT A.*,
       ROUND((SELECT AVG(X.HEIGHT)
              FROM PLAYER X
              WHERE X.TEAM_ID LIKE A.TID),2) 평균키
FROM (SELECT 
        T.TEAM_ID TID,
        T.TEAM_NAME 팀명,
        P.PLAYER_NAME 선수명,
        P.HEIGHT 키 
      FROM PLAYER P 
        JOIN TEAM T
           ON P.TEAM_ID LIKE T.TEAM_ID) A
ORDER BY 4 DESC
;


-- SOCCER_SQL_028
-- 평균키가 삼성 블루윙즈 팀이 평균키보다 작은 팀의
-- 이름과 해당 팀의 평균키
SELECT 
    T.TEAM_NAME 팀이름,
    ROUND(AVG(P.HEIGHT),2) 평균키
FROM (SELECT TEAM_ID, HEIGHT
      FROM PLAYER) P
      JOIN (SELECT TEAM_ID, TEAM_NAME
      FROM TEAM) T
    ON P.TEAM_ID LIKE T.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING AVG(P.HEIGHT) <
        (SELECT AVG(HEIGHT)
        FROM (SELECT TEAM_ID, HEIGHT
             FROM PLAYER)
        JOIN (SELECT TEAM_ID, TEAM_NAME
             FROM TEAM
             WHERE TEAM_NAME LIKE '삼성블루윙즈')
        USING(TEAM_ID))
;

-- SOCCER_SQL_029
-- 드래곤즈 K07,FC서울 K09,일화천마 K08 각각의 팀 소속의 GK, MF 선수 정보
SELECT *
FROM (SELECT TEAM_ID ,TEAM_NAME
      FROM TEAM
      WHERE TEAM_ID IN('K07','K09','K08')) T 
      JOIN(SELECT *
           FROM PLAYER
           WHERE POSITION IN('GK','MF')) P
        ON T.TEAM_ID LIKE P.TEAM_ID
; -- COUNT 67

SELECT P.*, (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE P.TEAM_ID )
FROM (SELECT *
           FROM PLAYER
           WHERE POSITION IN('GK','MF')
            AND TEAM_ID IN('K07','K09','K08')) P
; -- COUNT 67

-- SOCCER_SQL_030
-- 29번에서 제시한 팀과 포지션이 아닌 선수들의 수

SELECT COUNT(*) 선수들의수
FROM PLAYER P 
    JOIN TEAM T
    USING(TEAM_ID)
WHERE TEAM_NAME NOT IN('드래곤즈','FC서울','일화천마')
            AND POSITION NOT IN('GK','MF')
;
