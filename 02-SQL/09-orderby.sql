-- 09-orderby.sql
-- 특정 컬럼을 기준으로 정렬(ASC| DESC)

SELECT * FROM students;

-- 이름 ㄱㄴㄷ 순 정렬
SELECT * FROM students ORDER BY name;
SELECT * FROM students ORDER BY name ASC;  -- 기본값
SELECT * FROM students ORDER BY name DESC; -- 내림차순

-- 테이블 컬럼 추가 및 데이터 수정
SELECT * FROM students ORDER BY id DESC;
ALTER TABLE students ADD COLUMN grade VARCHAR(1) DEFAULT 'B';
UPDATE students SET grade = 'A' WHERE id BETWEEN 1 AND 7;
UPDATE students SET grade = 'C' WHERE id BETWEEN 15 AND 23;

-- 다중 컬럼 정렬 -> 앞에 오는 컬럼이 먼저 정렬 기준
SELECT * FROM students ORDER BY
grade DESC, age ASC;	-- 같은 성적끼리 나이 줄 세우기기 
-- age ASC, grade DESC	-- 같은 나이끼리 성적 줄 세우기

SELECT * FROM students ORDER BY id LIMIT 5;		-- 5개의 결과만 출력

-- 나이가 40 미만인 학생들 중에서 학점순->나이 많은 순으로 상위 5명 뽑기
SELECT * 
FROM students
WHERE age < 40	-- grade를 조건으로 넣게 되면('A') 학점이 고정되기 때문에 'A'값이 5명보다 적으면 그만큼만 나옴
ORDER BY grade ASC, age DESC
LIMIT 5;