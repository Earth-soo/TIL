-- 02-create-table.sql
CREATE TABLE sample (
	name varchar(30),
	age INT
);

-- 테이블 삭제
DROP TABLE sample;

-- members 테이블 생성
CREATE TABLE members (
	-- 자동으로 1씩 올라가게, PK
	id 			INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	-- 비어있지 않게 (NULL X)
	name 		VARCHAR(30) NOT NULL,
	-- 중복 허용 X
	email 		VARCHAR(100) UNIQUE,
	-- 기본값 20
	age 		INT DEFAULT 20,
	-- 자동으로 오늘 날짜
	join_date 	DATE DEFAULT CURRENT_DATE
);

DROP TABLE members;