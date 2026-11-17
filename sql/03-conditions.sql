-- LIKE / OR / BETWEEN
-- 출처: 프로그래머스 SQL 고득점 Kit

-- 노선별 평균 역 사이 거리 조회하기: ROUND + CONCAT
-- ROUND는 소수점 뒤 불필요한 0을 버리고, FORMAT은 항상 자릿수를 채운다.
-- 문제의 기대 출력에 말미 0이 없다면 ROUND를, 있다면 FORMAT을 써야 한다.
-- (실제로 ROUND -> FORMAT으로 잘못 바꿨다가 "코드 실행"으로 기대값과 직접 비교해 원인을 찾은 경험이 있다.)
SELECT ROUTE,
       CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS DISTANCE
FROM SUBWAY
GROUP BY ROUTE
ORDER BY DISTANCE DESC;

-- 강원도에 위치한 생산공장 목록 출력하기: LIKE로 "~로 시작하는" 패턴 찾기
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS LIKE '강원도%'
ORDER BY FACTORY_ID ASC;

-- 조건에 맞는 회원수 구하기: BETWEEN으로 범위 조건 간결하게 쓰기
SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE YEAR(JOINED) = 2021
  AND AGE BETWEEN 20 AND 29;

-- Python 개발자 찾기: 같은 값이 여러 컬럼 중 어디든 있으면 찾기 -> OR로 컬럼별 비교
-- (IN은 "한 컬럼이 여러 값 중 하나"를 찾을 때, OR는 "한 값이 여러 컬럼 중 하나"를 찾을 때)
SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPER_INFOS
WHERE SKILL_1 = 'Python' OR SKILL_2 = 'Python' OR SKILL_3 = 'Python'
ORDER BY ID ASC;
