-- 2주차: 집계함수 / GROUP BY
-- 출처: 프로그래머스 SQL 고득점 Kit

-- 고양이와 개는 몇 마리 있을까: 종류별로 묶어서 개수 세기
SELECT ANIMAL_TYPE, COUNT(*) AS 개체수
FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE;

-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기: LIKE + OR 를 GROUP BY 전 필터로 사용
SELECT CAR_TYPE, COUNT(*) AS 차량수
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;

-- 성분으로 구분한 아이스크림 총 주문량: JOIN + GROUP BY + SUM
-- (JOIN은 3주차 내용이지만, 두 테이블을 합쳐야 풀리는 문제라 미리 사용)
SELECT I.INGREDIENT_TYPE, SUM(F.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF F
JOIN ICECREAM_INFO I ON F.FLAVOR = I.FLAVOR
GROUP BY I.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;
-- 주의: ORDER BY에 GROUP BY 이전의 원본 컬럼(F.TOTAL_ORDER)을 쓰면
-- 어느 행의 값이 나올지 보장되지 않는다. 집계함수의 별명(TOTAL_ORDER)을 써야 안전하다.
