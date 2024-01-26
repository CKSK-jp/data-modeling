DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  current_team_id INT REFERENCES team,
  goals INT DEFAULT 0
);

CREATE TABLE referee (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE match(
  id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES team, 
  away_team_id INT REFERENCES team, 
  location TEXT NOT NULL,
  date TIMESTAMP NOT NULL,
  referees_id INT[] REFERENCES referee
  home_score INT DEFAULT 0,
  away_score INT DEFAULT 0
);

CREATE TABLE league(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE league_stats(
  PRIMARY KEY (league_id, team_id)
  league_id INT REFERENCES league(id),
  team_id INT REFERENCES team(id),
  ranking INT NOT NULL,
  total_goals INT NOT NULL DEFAULT 0,
);
