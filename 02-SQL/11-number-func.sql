-- 11-number-func.sql
SELECT * FROM dt_demo;

-- 실수 관련 함수
SELECT 
	name,
	score AS 원점수,
	ROUND(score) AS 반올림,	-- 함수 사용 시 가상 컬럼
	CEIL(score) AS 올림,
	FLOOR(score) AS 내림
FROM dt_demo;

-- 사칙연산
SELECT
	10 + 5 AS plus,
	10 - 5 AS minus,
	10 * 5 AS multiply,
	10 / 5 AS divide,
	10 / 3 AS 몫,
	10 % 3 AS 나머지,
	POWER(10, 3) AS 거듭제곱,
	SQRT(16) AS 루트,
	ABS(-5) AS 절댓값;

-- CASE
SELECT
	name,
	score,
	-- IF(score >= 80, '우수', '보통')	-- 일반적인 DB에선 사용됨(80이상 이면 우수, 아니면 보통)
	CASE
		WHEN score >= 90 THEN 'A'
		WHEN score >= 80 THEN 'B'
		WHEN score >= 70 THEN 'C'
		ELSE 'D'
	END	AS 학점
FROM dt_demo;
	
--  dt_demo 에서 id가 홀/짝을 판별하는 컬럼을 추가하여 확인
--  id, name, 홀짝
SELECT 
	id, 
	name AS 이름,
	CASE
		WHEN id % 2 = 1 THEN '홀'
		ELSE '짝'
	END AS 홀짝
FROM dt_demo;

SELECT * FROM dt_demo;