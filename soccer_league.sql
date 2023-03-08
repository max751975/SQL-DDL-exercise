DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT,
  city TEXT
);
CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER
);
CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE, 
  team_id INTEGER NOT NULL REFERENCES teams,
  field_role TEXT 
);
CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
  );
CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  date DATE,
  season_id INTEGER REFERENCES seasons,
  location TEXT,
  home_team_id INTEGER REFERENCES teams,
  guest_team_id INTEGER REFERENCES teams,
  start_time TIME,
  duration INTEGER,
  head_referee_id INTEGER REFERENCES referees,
  line_referee_1_id INTEGER REFERENCES referees,
  line_referee_2_id INTEGER REFERENCES referees
  );
CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players,
  match_id INTEGER REFERENCES matches,
  goal_time TIME
  );

CREATE TABLE rankings
(
  id SERIAL PRIMARY KEY,
  points INTEGER,
  team_id INTEGER REFERENCES teams
  );
CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  match_id INTEGER REFERENCES matches,
  team_id INTEGER REFERENCES teams,
  result TEXT
  );


INSERT INTO teams
  (name, country, city)
VALUES 
('Dinamo', 'Ukraine', 'Kiev'),
('Dinamo', 'USA', 'Houston'),
('Spartak', 'Uzbekistan', 'Tashkent'),
('Nistru', 'Moldova', 'Chisinau');

INSERT INTO players
  (name, birthday, team_id, field_role)
VALUES 
('Shevchenko', '1-1-1971', 1, 'forward'),
('Savchenko', '8-5-1975', 1, 'midfielder'),
('Shamsuddinov', '3-10-1985', 3, 'forward'),
('Popesku', '12-3-1990', 4, 'center back'),
('Johnson', '1-1-1991', 2, 'defender');

INSERT INTO referees
  (name, age)
VALUES 
('Ivanovich', 45),
('Pavlikova', 35),
('Zverev', 49),
('Steinman', 56),
('Davidzon', 41);

INSERT INTO seasons
  (start_date, end_date)
VALUES 
('4-1-2017', '11-20-2017'),
('4-1-2018', '11-20-2018'),
('4-1-2019', '11-20-2019'),
('4-1-2020', '11-20-2020'),
('4-1-2021', '11-20-2021'),
('4-1-2022', '11-20-2022');

INSERT INTO matches
  (date, season_id, location, home_team_id, guest_team_id, start_time, duration, head_referee_id, line_referee_1_id, line_referee_2_id)
VALUES 
('4-10-2017', 1, 'Kiev', 1, 3, '15:30', 96, 1, 2, 3),
('5-10-2017', 1, 'Tashkent', 3, 1, '15:30', 94, 2, 4, 1),
('4-15-2017', 1, 'Houston', 2, 4, '16:30', 98, 4, 3, 2),
('6-20-2017', 1, 'Chisinau', 4, 2, '17:30', 96, 4, 2, 3);

INSERT INTO goals
  (player_id, match_id, goal_time)
VALUES 
(1,1,'15:40'),
(1,1,'15:45'),
(3,1,'15:51'),
(1,3,'16:59'),
(4,3,'17:10'),
(4,4,'18:49');

INSERT INTO results
  (match_id, team_id, result)
VALUES 
(1,1,'W'),
(1,3,'L'),
(2,1,'W'),
(2,3,'L'),
(3,4,'W'),
(3,2,'L'),
(4,4,'W'),
(4,2,'L');

INSERT INTO rankings
  (points, team_id)
VALUES 
(6, 1),
(6, 4),
(0, 2),
(0, 3);

