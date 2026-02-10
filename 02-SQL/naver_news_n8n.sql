-- naver_news_n8n.sql
CREATE TABLE naver_news (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(300) NOT NULL DEFAULT '',
	content TEXT NOT NULL DEFAULT '',
	section VARCHAR(10) NOT NULL DEFAULT ''
);

INSERT INTO naver_news (title, content, section)
VALUES ('테스트기사', '테스트 테스트', '테스트');

ALTER TABLE naver_news
ADD COLUMN date DATE DEFAULT CURRENT_DATE;

SELECT * FROM naver_news;