
-- NFL Roster
-- create role nfl_user login superuser password 'nfl_user';

-- Create source tables

DROP TABLE IF EXISTS nfl.player;
DROP TABLE IF EXISTS nfl.position;
DROP TABLE IF EXISTS nfl.team;

CREATE TABLE nfl.team(
	team_id smallint NOT NULL PRIMARY KEY,
	team_name text NOT NULL,
	team_state char(2) NOT NULL
);

CREATE TABLE nfl.position(
	position_id smallint NOT NULL PRIMARY KEY,
	position_code varchar(3) NOT NULL,
	position_name varchar(30) NOT NULL
);

CREATE TABLE nfl.player(
	player_id int NOT NULL,
	first_name varchar(20) NOT NULL PRIMARY KEY,
	last_name varchar(20) NOT NULL,
	team_id smallint NOT NULL REFERENCES nfl.team(team_id),
	position_id smallint NOT NULL REFERENCES nfl.position(position_id)
);

-- Data

INSERT INTO nfl.team(team_id, team_name, team_state) VALUES
	(1, 'Atlanta Falcons', 'GA'),
	(2, 'Carolina Panthers', 'NC'),
	(3, 'New Orleans Saints', 'LA'),
	(4, 'Tampa Bay Buccaneers', 'FL');
	
INSERT INTO nfl.position(position_id, position_code, position_name) VALUES
	(1, 'QB', 'Quarterback'),
	(2, 'RB', 'Running Back'),
	(3, 'DL', 'Defensive Line');
	
INSERT INTO nfl.player(player_id, first_name, last_name, team_id, position_id) VALUES
	(1, 'Grady', 'Jarrett', 1, 3),
	(2, 'Christian', 'McCaffrey', 2, 2),
	(3, 'Alvin', 'Kamara', 3, 2),
	(4, 'Tom', 'Brady', 4, 1);

-- Combine

SELECT p.player_id, p.first_name, p.last_name, t.team_id, t.team_name, t.team_state, 
	pn.position_id, pn.position_code, pn.position_name
FROM nfl.player as p
JOIN nfl.team as t ON t.team_id = p.team_id
JOIN nfl.position as pn ON pn.position_id = p.position_id;
