DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE user(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL, 
  password TEXT NOT NULL,
  preferred_region_id INT REFERENCES region
);

CREATE TABLE post(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL, 
  info TEXT NOT NULL,
  location_from TEXT NOT NULL,
  user_id INT REFERENCES user,
  region_id INT REFERENCES region,
  category_id INT REFERENCES category
);
