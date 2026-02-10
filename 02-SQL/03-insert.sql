-- 03-insert.sql
INSERT INTO members (name, email, age)
VALUES ('홍지수', 'my@mail.com', 30);

SELECT * FROM members;

INSERT INTO members (name, email)
VALUES 
('유부장', 'yu@mail.com'),
('박차장', 'park@mail.com'),
('정과장', 'jung@mail.com')
;

INSERT INTO members (name)
VALUES (3, '박차장'), (4, '정과장');