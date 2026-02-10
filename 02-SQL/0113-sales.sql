-- 0113-sales.sql
DROP TABLE sales;

CREATE TABLE sales (
    id             INTEGER PRIMARY KEY,
    order_date     DATE NOT NULL,
    customer_id    VARCHAR(10) NOT NULL,
    product_id     VARCHAR(10) NOT NULL,
    product_name   VARCHAR(50) NOT NULL,
    category       VARCHAR(20) NOT NULL,
    quantity       INTEGER NOT NULL,
    unit_price     INTEGER NOT NULL,
    total_amount   INTEGER NOT NULL,
    sales_rep      VARCHAR(30) NOT NULL,
    region         VARCHAR(20) NOT NULL
);

SELECT * FROM sales;

-- 기존 데이터에는 address가 없는데 NOT NULL 조건을 추가하니 에러 발생
-- -> NOT NULL 대신 '' 으로 처리하기(NULL과 ''는 다름)
ALTER TABLE members ADD COLUMN address VARCHAR(100) NOT NULL;

