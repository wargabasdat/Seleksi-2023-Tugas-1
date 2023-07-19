import json
import psycopg2

path = 'Seleksi-2023-Tugas-1/Data Scraping/data/data.json'
with open(path) as json_file:
    data = json.load(json_file)
    
connection = psycopg2.connect(host="localhost", database="database", user="user", password="password")
cursor = connection.cursor()

def is_player_exists(name):
    cursor.execute("SELECT 1 FROM player WHERE name = %s", (name,))
    return cursor.fetchone() is not None

cursor.execute("CREATE TABLE school (name VARCHAR(50) NOT NULL PRIMARY KEY, address_street VARCHAR(70) NOT NULL, address_subdistrict VARCHAR(20), address_city VARCHAR(20) NOT NULL)")
cursor.execute("CREATE TABLE player (name VARCHAR(50) NOT NULL PRIMARY KEY, school VARCHAR(50) NOT NULL, gender VARCHAR(6), age VARCHAR(2), FOREIGN KEY (school) REFERENCES school(name))")
cursor.execute("CREATE TABLE official (name VARCHAR(50) NOT NULL PRIMARY KEY, school VARCHAR(50) NOT NULL, gender VARCHAR(6), age VARCHAR(2), FOREIGN KEY (school) REFERENCES school(name))")
cursor.execute("CREATE TABLE official_role (name VARCHAR(50) NOT NULL, job_type VARCHAR(5) NOT NULL, job_role VARCHAR(15) NOT NULL, PRIMARY KEY(name, job_type, job_role), FOREIGN KEY (name) REFERENCES official(name))")
cursor.execute("CREATE TABLE match_info (date_time VARCHAR(30) NOT NULL PRIMARY KEY, type VARCHAR(5) NOT NULL, venue VARCHAR(20) NOT NULL, winner VARCHAR(50) NOT NULL, FOREIGN KEY (winner) REFERENCES school(name))")
cursor.execute("CREATE TABLE player_stats (date_time VARCHAR(30) NOT NULL, name VARCHAR(50) NOT NULL, position VARCHAR(7), minute VARCHAR(5), points VARCHAR(2), assists VARCHAR(2), rebound VARCHAR(2), PRIMARY KEY (date_time, name), FOREIGN KEY (date_time) REFERENCES match_info(date_time), FOREIGN KEY (name) REFERENCES player(name))")
cursor.execute("CREATE TABLE team_stats (date_time VARCHAR(30) NOT NULL, name VARCHAR(50) NOT NULL, score INT, field_goal VARCHAR(5), field_goal_pct VARCHAR(5), two_pts VARCHAR(5), two_pts_pct VARCHAR(5), three_pts VARCHAR(5), three_pts_pct VARCHAR(5), free_throw VARCHAR(5), free_throw_pct VARCHAR(5), rebound_od VARCHAR(5), assist INT, steal INT, block INT, turnover INT, foul INT, pts_off_turnover INT, PRIMARY KEY (date_time, name), FOREIGN KEY (date_time) REFERENCES match_info(date_time), FOREIGN KEY (name) REFERENCES school(name))")

for team in data['school']:
    cursor.execute("INSERT INTO school (name, address_street, address_subdistrict, address_city) VALUES (%s, %s, %s, %s)", (team['name'], team['street'], team['subdistrict'], team['city']))

for match in data['match_info']:
    cursor.execute("INSERT INTO match_info (date_time, type, venue, winner) VALUES (%s, %s, %s, %s)", (match['date_time'], match['type'], match['venue'], match['winner']))
    cursor.execute("INSERT INTO team_stats (date_time, name, score, field_goal, field_goal_pct, two_pts, two_pts_pct, three_pts, three_pts_pct, free_throw, free_throw_pct, rebound_od, assist, steal, block, turnover, foul, pts_off_turnover) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (match['date_time'], match['team_A'], match['score_A'], match['field_goal_A'], match['field_goal_pct_A'], match['2pts_A'], match['2pts_pct_A'], match['3pts_A'], match['3pts_pct_A'], match['free_throw_A'], match['free_throw_pct_A'], match['rebound(O/D)_A'], match['assist_A'], match['steal_A'], match['block_A'], match['turnover_A'], match['foul_A'], match['pts_off_turnover_A']))
    cursor.execute("INSERT INTO team_stats (date_time, name, score, field_goal, field_goal_pct, two_pts, two_pts_pct, three_pts, three_pts_pct, free_throw, free_throw_pct, rebound_od, assist, steal, block, turnover, foul, pts_off_turnover) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (match['date_time'], match['team_B'], match['score_B'], match['field_goal_B'], match['field_goal_pct_B'], match['2pts_B'], match['2pts_pct_B'], match['3pts_B'], match['3pts_pct_B'], match['free_throw_B'], match['free_throw_pct_B'], match['rebound(O/D)_B'], match['assist_B'], match['steal_B'], match['block_B'], match['turnover_B'], match['foul_B'], match['pts_off_turnover_B']))

for stats in data['player_stats']:
    if not is_player_exists(stats['name']):
        cursor.execute("INSERT INTO player(name, school) VALUES (%s, %s)", (stats['name'], stats['school']))
    cursor.execute("INSERT INTO player_stats (date_time, name, position, minute, points, assists, rebound) VALUES (%s, %s, %s, %s, %s, %s, %s)", (stats['date_time'], stats['name'], stats['position'], stats['minute'], stats['points'], stats['assists'], stats['rebound']))

for person in data['official']:
    cursor.execute("INSERT INTO official (name, school) VALUES (%s, %s)", (person['name'], person['school']))
    cursor.execute("INSERT INTO official_role (name, job_type, Job_role) VALUES (%s, %s, %s)", (person['name'], person['type'], person['role']))
    if len(person) > 4:
        cursor.execute("INSERT INTO official_role (name, job_type, job_role) VALUES (%s, %s, %s)", (person['name'], person['type2'], person['role2']))

connection.commit()
cursor.close()
connection.close()