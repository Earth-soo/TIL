-- 18-join-group.sql
-- VIP 고객(C)들의 구매 내역 (S) 조회 (*)
SELECT *
FROM customer c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP';

-- 각 등급별 구매액 평균
SELECT 
	c.customer_type AS 등급,
	COUNT(*) AS 고객수,
	ROUND(AVG(s.total_amount), 2) AS 구매액평균
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- [모든 고객]의 구매 현황 분석
-- 고객 이름, 고객 등급, 주문 횟수, 총구매액, 평균주문액, 최근주문일
SELECT 
	c.customer_id AS 고객아이디,
	c.customer_name AS 고객이름,
	c.customer_type AS 고객등급,
	COUNT(s.id) AS 주문횟수,	-- *를 사용하게 되면 주문 내역이 없어도 값이 나옴(JOIN 되어서, 주문 내역이 없어도 다른 컬럼들은 값이 있어서)
	COALESCE(SUM(s.total_amount), 0) AS 총구매액,
	ROUND(COALESCE(AVG(s.total_amount), 0)) AS 평균주문액,
	COALESCE(
		TO_CHAR(MAX(s.order_date), 'YYYY-MM-DD'), '주문없음'
	) AS 최근주문일,
	CASE
		WHEN COUNT(s.id) = 0 THEN '잠재고객'
		WHEN COUNT(s.id) >= 5 THEN '충성고객'
		WHEN COUNT(s.id) >= 2 THEN '일반고객'
		ELSE '신규고객'
	END AS 고객분류
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.customer_type;	-- 일반 컬럼은 GROUP BY에 넣기


select * from sales;
select * from customers;


