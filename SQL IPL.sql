CREATE TABLE ipl2024 (
    id TEXT,
    date TEXT,
    team1 TEXT,
    team2 TEXT,
    toss_winner TEXT,
    decision TEXT,
    first_score TEXT,
    first_wkts TEXT,
    second_score TEXT,
    second_wkts TEXT,
    winner TEXT,
    player_of_the_match TEXT,
    most_runs TEXT,
    most_wkts TEXT
);
SELECT COUNT(*) FROM ipl2024;

SELECT * FROM ipl2024 LIMIT 5;

ALTER TABLE ipl2024
ALTER COLUMN id TYPE INTEGER USING id::INTEGER;

ALTER TABLE ipl2024
ALTER COLUMN first_score TYPE INTEGER USING first_score::INTEGER;

ALTER TABLE ipl2024
ALTER COLUMN first_wkts TYPE INTEGER USING first_wkts::INTEGER;

ALTER TABLE ipl2024
ALTER COLUMN second_score TYPE INTEGER USING second_score::INTEGER;

ALTER TABLE ipl2024
ALTER COLUMN second_wkts TYPE INTEGER USING second_wkts::INTEGER;

ALTER TABLE ipl2024
ALTER COLUMN date TYPE DATE
USING TO_DATE(date, 'Month DD,YYYY');

SELECT winner, COUNT(*) AS total_wins
FROM ipl2024
GROUP BY winner
ORDER BY total_wins DESC;

SELECT
COUNT(*) FILTER (WHERE toss_winner = winner) AS toss_and_match_win,
COUNT(*) AS total_matches
FROM ipl2024;

SELECT MAX(first_score) FROM ipl2024;

SELECT AVG(first_score) FROM ipl2024;

SELECT 
ROUND(
(COUNT(*) FILTER (WHERE toss_winner = winner) * 100.0) 
/ COUNT(*), 2
) AS toss_win_percentage
FROM ipl2024;


SELECT team1, team2, first_score, second_score
FROM ipl2024
ORDER BY GREATEST(first_score, second_score) DESC
LIMIT 1;

SELECT 
ROUND(
    SUM(
        CASE 
            WHEN toss_winner = winner THEN 1 
            ELSE 0 
        END
    ) * 100.0 / COUNT(*),
2
) AS toss_win_percentage
FROM ipl2024;


