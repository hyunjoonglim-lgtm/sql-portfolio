-- GROUP BY 여러 컬럼 + HAVING으로 중복/재구매 탐지
-- 출처: 프로그래머스 SQL 고득점 Kit
-- (회계 실무로 치면: 같은 거래처+같은 금액이 두 번 찍힌 중복결제를 찾는 것과 같은 패턴
--  GROUP BY 거래처, 금액 HAVING COUNT(*) > 1)

-- 재구매가 일어난 상품과 회원 리스트 구하기
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) > 1
ORDER BY USER_ID ASC, PRODUCT_ID DESC;
-- GROUP BY에 컬럼을 2개(USER_ID, PRODUCT_ID) 넣으면 "두 값의 조합"이 같은 행끼리 묶인다.
-- COUNT(*)는 "그 조합이 몇 번 등장했는지" -> 2번 이상이면 재구매로 판단.
