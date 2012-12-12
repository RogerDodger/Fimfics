------
-- Schema for Fimfics.pm's database
-- Author: Cameron Thornton <cthor@cpan.org>
------

PRAGMA foreign_keys = ON;

CREATE TABLE users (
	id   INTEGER PRIMARY KEY
);

CREATE TABLE storys (
	id   INTEGER PRIMARY KEY
);

CREATE TABLE favs (
	user_id  INTEGER REFERENCES users(id) ON DELETE CASCADE,
	story_id INTEGER REFERENCES storys(id) ON DELETE CASCADE,
	created  TIMESTAMP,
	PRIMARY KEY(user_id, story_id)
);

CREATE TABLE story_sims (
	story1_id  INTEGER REFERENCES storys(id) ON DELETE CASCADE,
	story2_id  INTEGER REFERENCES storys(id) ON DELETE CASCADE,
	similarity REAL,
	PRIMARY KEY(story1_id, story2_id)
);

CREATE TABLE user_sims (
	user1_id   INTEGER REFERENCES users(id) ON DELETE CASCADE,
	user2_id   INTEGER REFERENCES users(id) ON DELETE CASCADE,
	similarity REAL,
	PRIMARY KEY(user1_id, user2_id)
);