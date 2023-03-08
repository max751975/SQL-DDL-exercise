DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  preffered_region_id INTEGER 
);
CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT,
  user_id INT NOT NULL REFERENCES users,
  category_id INTEGER NOT NULL REFERENCES categories,
  region_id INTEGER NOT NULL REFERENCES regions,
  location TEXT,
  date DATE NOT NULL
);


INSERT INTO regions
  (name)
VALUES 
('California'),
('Texas'),
('New York');

INSERT INTO categories
  (name)
VALUES 
('Activities'),
('For sale'),
('Relocations');

INSERT INTO users
  (username, password, preffered_region_id)
VALUES 
('vasya2000', '12345', 1),
('pascal', 'abcde', 2),
('maxx123', '321', 3);

INSERT INTO posts
 (title, text, user_id, category_id, region_id, location, date)
VALUES 
('Fun in NYC', 'looking for friends to have some fun', 1, 1, 3, 'Brooklyn','1-1-2023'),
('Moving help', 'need 2 people to help with truck loading', 2, 3, 1, 'Sacramento','1-15-2023'),
('Toyota', '2018 Toyota for sale', 3, 3, 2, 'Houston','2-20-2023');

-- SELECT username, posts.title, posts.text AS post, regions.name AS region, location FROM posts
-- JOIN regions ON posts.region_id = regions.id
-- JOIN users ON user_id = users.id WHERE user_id = 3;