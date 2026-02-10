-- 로또 정보 텡
CREATE TABLE lotto_draws (
    draw_round INT PRIMARY KEY,        -- 회차
    win_num_1 INT NOT NULL,
    win_num_2 INT NOT NULL,
    win_num_3 INT NOT NULL,
    win_num_4 INT NOT NULL,
    win_num_5 INT NOT NULL,
    win_num_6 INT NOT NULL,
    bonus_num INT NOT NULL,
    draw_date DATE NOT NULL,            -- 추첨일자 (YYYY-MM-DD)
    first_prize_winners INT NOT NULL,
    first_prize_amount BIGINT NOT NULL,
    second_prize_winners INT NOT NULL,
    second_prize_amount BIGINT NOT NULL
);

SELECT * FROM lotto_draws;
CREATE TABLE lotto_draws (
    draw_round INT PRIMARY KEY,        -- 회차
    win_num_1 INT NOT NULL,
    win_num_2 INT NOT NULL,
    win_num_3 INT NOT NULL,
    win_num_4 INT NOT NULL,
    win_num_5 INT NOT NULL,
    win_num_6 INT NOT NULL,
    bonus_num INT NOT NULL,
    draw_date DATE NOT NULL,            -- 추첨일자 (YYYY-MM-DD)
    first_prize_winners INT NOT NULL,
    first_prize_amount BIGINT NOT NULL,
    second_prize_winners INT NOT NULL,
    second_prize_amount BIGINT NOT NULL
);

SELECT * FROM lotto_draws;