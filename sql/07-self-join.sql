-- 같은 테이블을 서로 다른 별칭으로 두 번 JOIN (자기 자신을 참조하는 계층구조 조회)
-- 출처: 프로그래머스 SQL 고득점 Kit
-- 실무 연결: 조직도(직원-상사), 카테고리 트리(상위/하위 분류) 같은 계층 데이터를 다룰 때
-- 거의 항상 이 패턴을 쓴다.

-- 업그레이드 된 아이템 구하기
-- ITEM_TREE는 ITEM_ID-PARENT_ITEM_ID 관계만 담고 있어 등급(RARITY) 정보가 없다.
-- 그래서 같은 ITEM_INFO를 "부모 확인용(P)"과 "자식 출력용(C)" 두 가지 역할로 각각 JOIN한다.
SELECT C.ITEM_ID, C.ITEM_NAME, C.RARITY
FROM ITEM_TREE T
JOIN ITEM_INFO P ON T.PARENT_ITEM_ID = P.ITEM_ID   -- 부모가 RARE인지 확인용
JOIN ITEM_INFO C ON T.ITEM_ID = C.ITEM_ID           -- 자식(결과로 낼) 정보 출력용
WHERE P.RARITY = 'RARE'
ORDER BY C.ITEM_ID DESC;

-- 참고: "부모 확인"만 필요하고 출력엔 안 쓴다면 JOIN 대신 서브쿼리/EXISTS로도 동일하게 가능
-- SELECT C.ITEM_ID, C.ITEM_NAME, C.RARITY
-- FROM ITEM_TREE T
-- JOIN ITEM_INFO C ON T.ITEM_ID = C.ITEM_ID
-- WHERE T.PARENT_ITEM_ID IN (SELECT ITEM_ID FROM ITEM_INFO WHERE RARITY = 'RARE')
-- ORDER BY C.ITEM_ID DESC;
