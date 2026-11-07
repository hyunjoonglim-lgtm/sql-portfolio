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
