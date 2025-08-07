INSERT INTO reports (person_id, content) VALUES (1, 'abcd');
INSERT INTO reports (person_id, content) VALUES (1, 'efgh');
INSERT INTO reports (person_id, content) VALUES (2, 'ijkl');
INSERT INTO reports (person_id, content) VALUES (2, 'mnop');
INSERT INTO reports (person_id, content) VALUES (3, 'qrst');
INSERT INTO reports (person_id, content) VALUES (3, 'uvwx');
INSERT INTO reports (person_id, content) VALUES (3, 'yzab');
INSERT INTO reports (person_id, content) VALUES (4, 'cdef');
INSERT INTO reports (person_id, content) VALUES (4, 'ghij');
INSERT INTO reports (person_id, content) VALUES (4, 'klmn');
INSERT INTO reports (person_id, content) VALUES (999, 'zzzz');
q1
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
q2
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED NULL AFTER email;
q3
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');
INSERT INTO people (name, email, department_id, age, gender) VALUES
('山田太郎', 'yamada@example.com', 1, 30, 1),
('佐藤花子', 'sato@example.com', 1, 28, 2),
('鈴木一郎', 'suzuki@example.com', 1, 35, 1),
('高橋健', 'takahashi@example.com', 2, 26, 1),
('田中美咲', 'tanaka@example.com', 2, 29, 2),
('伊藤翔', 'ito@example.com', 2, 33, 1),
('渡辺裕子', 'watanabe@example.com', 2, 31, 2),
('小林誠', 'kobayashi@example.com', 3, 40, 1),
('中村さおり', 'nakamura@example.com', 4, 27, 2),
('木村亮', 'kimura@example.com', 5, 34, 1);
INSERT INTO reports (person_id, content) VALUES
(1, '今日は営業先で新規顧客と商談ができました。'),
(2, '顧客からの問い合わせ対応を行いました。'),
(3, '売上データの分析を進めています。'),
(4, '新機能の設計をチームで話し合いました。'),
(5, 'バグ修正とコードレビューを実施。'),
(6, 'APIのドキュメントを更新しました。'),
(7, 'テストケースの作成が完了しました。'),
(8, '月次決算の準備を行いました。'),
(9, '採用面接を1件実施しました。'),
(10,'ネットワーク障害の対応を行いました。');
q4
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;
q5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;
q6
このSQLは、peopleテーブルから部署IDが1の人の名前、メール、年齢
を出して、登録された順に並べて表示するSQL文です。
q7
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
OR (gender = 1 AND age BETWEEN 40 AND 49);
q8
SELECT * FROM departments WHERE name = '営業';
SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;
q9
SELECT * FROM departments WHERE name = '開発';
SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2 AND gender = 2;
q10
SELECT
  (SELECT name FROM people WHERE people.person_id = reports.person_id) AS name,
  (SELECT name FROM departments 
   WHERE departments.department_id = (
     SELECT department_id FROM people WHERE people.person_id = reports.person_id
   )) AS department_name,
  reports.content
FROM reports;
q11
SELECT name
FROM people
WHERE person_id NOT IN (
  SELECT person_id FROM reports
);
