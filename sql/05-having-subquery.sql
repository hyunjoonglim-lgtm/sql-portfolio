-- HAVING / 서브쿼리
-- 출처: 프로그래머스 SQL 고득점 Kit

-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
-- WHERE: 집계 전 개별 행 필터 / HAVING: GROUP BY 이후 집계 결과 필터
SELECT CAR_ID, MONTH(START_DATE) AS MONTH, COUNT(*) AS RECORDS
FROM CAR_RENTAL
WHERE CAR_ID IN (
    SELECT CAR_ID FROM CAR_RENTAL
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
)
AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY CAR_ID, MONTH(START_DATE)
ORDER BY CAR_ID, MONTH;
-- 주의: 서브쿼리 안의 WHERE는 서브쿼리 자체에만 적용된다.
-- 바깥 쿼리에서도 같은 기간 제한이 필요하면 바깥 WHERE에도 똑같이 반복해서 써야 한다.
