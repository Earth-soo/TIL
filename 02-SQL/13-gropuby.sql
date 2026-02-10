-- 13-groupby.sql
SELECT 
	region,
	category,
	COUNT(*) AS 매출건수,
	ROUND(AVG(total_amount), 2) AS 평균매출
FROM sales
GROUP BY region, category
ORDER BY  평균매출 DESC	-- AS를 통해 컬럼명을 지정했으면 다른데에서 사용할 수 있음
LIMIT 3;

-- 카테고리별 매출
-- 카테고리, 주문건수, 총매출, 평균 매출 -> 총 매출 내림차순
SELECT 
	category AS 카테고리,
	COUNT(*) AS 주문건수,	-- 어떤 열을 세도 주문건수는 동일함
	SUM(total_amount) AS 총매출,
	ROUND(AVG(total_amount), 2) AS 평균매출	
FROM sales
GROUP BY category
ORDER BY 총매출 DESC;

-- 지역별 매출 분석
-- 지역, 주문건수, 총매출, 고객수, 고객당주문수, 고객당평균매출
SELECT
	region AS 지역,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 총매출,
	COUNT(DISTINCT customer_id) AS 고객수,
	-- (정수 / 정수) -> 정수 BUT (실수 / 정수) -> 실수, 둘 중 하나만 실수로 바꿔주면 됨
	ROUND(
		COUNT(*)::DECIMAL / COUNT(DISTINCT customer_id), 2
		) AS 고객당주문수,	-- 별칭은 SELECT문이 종료되어야 사용 가능(주문건수/고객수 -> X)
	ROUND(SUM(total_amount)::DECIMAL / COUNT(DISTINCT customer_id), 2) AS 고객당평균매출
FROM sales
GROUP BY region
ORDER BY 고객당평균매출 DESC;

-- 영업사원별-지역별 성과
-- 영업사원, 지역, 주문건수, 총매출액
SELECT 
	sales_rep AS 영업사원,
	region AS 지역,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 총매출액
FROM sales
GROUP BY sales_rep, region
ORDER BY 총매출액 DESC;

-- 영업사원별-월별 매출 분석
-- 월, 사원, 주문건수, 월매출액, 평균매출액
-- 월, 월매출액 순으로 정렬
SELECT
	TO_CHAR(order_date, 'YYYY-MM') AS 월,
	sales_rep AS 사원,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 월매출액,
	AVG(total_amount) AS 평균매출액
FROM sales
GROUP BY
	sales_rep,
	TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 월, 월매출액 DESC;

-- MAU(Monthly Active User) -> 월간 활성 고객
-- 월, 주문건수, 월매출액, MAU
SELECT 
	TO_CHAR(order_date, 'YYYY-MM') AS 월,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 월매출액,
	COUNT(DISTINCT customer_id) AS MAU
FROM sales
-- WHERE order_date BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 월;


-- 요일별 매출 패턴 (날짜->요일 함수?)
-- 요일, 주문건수, 총매출, 평균매출
SELECT
	TO_CHAR(order_date, 'Day') AS 요일,
	EXTRACT(DOW FROM order_date) AS "요일(숫자)",	-- 일(0) ~ 토(6)
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 총매출,
	ROUND(AVG(total_amount), 2) AS 평균매출
FROM sales
GROUP BY TO_CHAR(order_date, 'Day'), EXTRACT(DOW FROM order_date);


select * from sales;