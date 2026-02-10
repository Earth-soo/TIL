-- 15-subquery.sql
-- subquery : 쿼리 안의 쿼리

-- 평균 주문 금액 구하기 -> 그 값보다 더 높은 금액을 주문한 판매 데이터(*)
SELECT AVG(total_amount) FROM sales;
SELECT * FROM sales WHERE total_amount >= 500000;

-- 특정 값을 매번 계산해서 조건으로 사용(스칼라)
SELECT * FROM sales
WHERE total_amount >= (SELECT AVG(total_amount) FROM sales);

-- 특정 판매데이터에 평균금액과의 차이를 함께 보고싶다면?
SELECT
    product_name AS 이름,
    total_amount AS 판매액,
    total_amount - (SELECT AVG(total_amount) FROM sales) AS 평균차이
FROM sales
WHERE total_amount >= (SELECT AVG(total_amount) FROM sales); 

-- sales에서 가장 비싼 total_amount를 가진 데이터(조건 서브쿼리)
SELECT * FROM sales ORDER BY total_amount DESC LIMIT 1;
SELECT * FROM sales WHERE total_amount=(SELECT MAX(total_amount) FROM sales);	-- 상관 서브쿼리 : 밖의 쿼리와 연결되어 있음
	
-- [주문 금액 평균]과 실제 주문액수의 차이가 가장 적은 5개
SELECT
    id,
    order_date,
    total_amount,
    ABS((SELECT AVG(total_amount) FROM sales) - total_amount) AS 평균차이
FROM sales
ORDER BY 평균차이
LIMIT 5;