-- 08-where.sql
CREATE TABLE students (
	id 		INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name 	VARCHAR(10),
	age 	int
)

INSERT INTO students (name, age) VALUES
('박 수민', 40);
('박 혁거세', 20);
('정 민수', 50),
('서 지훈', 30),
('윤 하늘', 20),
('최 도윤', 25),
('강 수빈', 33),
('문 태오', 18),
('백 현우', 45),
('한 유진', 10),
('임 주원', 88),
('송 민재', 67);

SELECT * FROM students;

-- 특정 컬럼과
SELECT * FROM students WHERE name = '송 민재';			-- 같음
SELECT * FROM students WHERE id != 1;					-- 다름
SELECT * FROM students WHERE age >= 20;					-- 이상
SELECT * FROM students WHERE age > 20;					-- 초과
SELECT * FROM students WHERE age BETWEEN 20 AND 40;		-- 범위(이상-이하)
SELECT * FROM students WHERE id = 1 OR id = 3 OR id = 5 -- 다중 선택(여러 컬럼도 가능) 
SELECT * FROM students WHERE WHERE id IN (1, 3, 5);		-- 다중 선택(한 컬럼만)

-- 문자열 패턴 찾기(% : 있을 수도 없을 수도, _ : 개수만큼 있음)
SELECT * FROM students WHERE name LIKE '최%';	-- 최씨 찾기
SELECT * FROM students WHERE name LIKE '%민%';	-- 성, 이름 중에 민이 들어간 사람
SELECT * FROM students WHERE name LIKE '%훈';	-- 훈으로 끝나는 사람
SELECT * FROM students WHERE name LIKE '박 __';	-- 박씨중에 이름이 두글자인 사람(글자수 고정)