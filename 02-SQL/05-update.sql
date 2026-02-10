-- 05-update.sql

-- 데이터 추가 (name='익명')
INSERT INTO members (name) VALUES ('익명');

-- 데이터 업데이트
UPDATE members
SET name = '홍길동'
WHERE name = '익명';

-- 마지막 사람의 email(hong@mail.com과 나이(25) 수정)
UPDATE members 
SET email = 'hong@mail.com', age = 25
WHERE id = 5;

-- 나이가 20인 사람들 모두 나이를 21로 수정
UPDATE members
SET age = 21
WHERE age = 20;

SELECT * FROM members;
