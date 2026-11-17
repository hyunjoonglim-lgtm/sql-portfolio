# SQL Portfolio

회계·재무 실무 경험을 바탕으로 SQL을 독학하며 쌓아가는 연습 기록입니다. 프로그래머스 SQL 고득점 Kit 문제를 풀면서 배운 개념을 정리하고, 실제 회계 업무(매입-세금계산서 대사 등)와 어떻게 연결되는지 함께 기록합니다.

## 왜 이걸 만들었나

경리·회계 실무(매입/매출 대사, 세금계산서 검증 등)를 하면서 데이터를 손으로 맞춰보던 작업들이, 사실 SQL의 JOIN·GROUP BY·HAVING으로 표현되는 작업이라는 걸 공부하며 알게 됐습니다. 회계 도메인 지식 + SQL을 함께 가진 사람이 되기 위한 학습 기록입니다.

## 학습 로드맵

1주 SELECT/WHERE/ORDER BY → 2주 GROUP BY/집계함수 → 3주 JOIN → 4주 포트폴리오 정리(현재 위치)를 한 사이클로 반복하며 문제 수를 늘려가고 있습니다.

## 폴더 구성

| 파일 | 내용 |
| --- | --- |
| [`sql/01-select-where-orderby.sql`](sql/01-select-where-orderby.sql) | SELECT, WHERE, ORDER BY 기초 |
| [`sql/02-groupby-aggregate.sql`](sql/02-groupby-aggregate.sql) | COUNT/SUM/MAX/MIN/AVG, GROUP BY |
| [`sql/03-conditions.sql`](sql/03-conditions.sql) | LIKE, OR, BETWEEN |
| [`sql/04-join.sql`](sql/04-join.sql) | INNER JOIN, LEFT JOIN, 테이블 간 열 비교 |
| [`sql/05-having-subquery.sql`](sql/05-having-subquery.sql) | HAVING, 서브쿼리 |
| [`sql/06-group-by-having-duplicates.sql`](sql/06-group-by-having-duplicates.sql) | GROUP BY 여러 컬럼 + HAVING으로 중복/재구매 탐지 |
| [`sql/07-self-join.sql`](sql/07-self-join.sql) | 같은 테이블을 두 번 JOIN하는 계층구조(자기참조) 조회 |
| [`notes/concepts.md`](notes/concepts.md) | 개념 정리 노트 (헷갈렸던 부분·실수 기록 포함) |

## 회계 실무와의 연결

- **JOIN** — 매입장(위하고)과 세금계산서(이카운트) 데이터를 거래처명·날짜·금액 같은 공통 키로 맞춰보던 매입대사 작업과 같은 원리입니다.
- **LEFT JOIN + IS NULL** — "세금계산서는 있는데 매입장엔 없는 거래"처럼, 한쪽에만 있고 다른 쪽엔 없는 데이터를 찾아내는 데 씁니다.
- **외래키** — 매입장의 거래처코드가 거래처 마스터의 거래처코드를 가리키는 것과 같은 구조입니다.

모든 예시 데이터는 프로그래머스 문제에서 제공한 공개 샘플 데이터이며, 실제 회사 데이터는 포함되어 있지 않습니다.
