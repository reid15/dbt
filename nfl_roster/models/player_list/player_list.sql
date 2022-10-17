
WITH player_list as (
	SELECT p.player_id, p.first_name, p.last_name, t.team_id, t.team_name, t.team_state, 
		pn.position_id, pn.position_code, pn.position_name
	FROM nfl.player as p
	JOIN nfl.team as t ON t.team_id = p.team_id
	JOIN nfl.position as pn ON pn.position_id = p.position_id
)
SELECT * FROM player_list