const fs = require("fs");

// Read data from JSON files and parse it into JavaScript objects.
const players = JSON.parse(fs.readFileSync("Data Scraping/data/json/players.json", { encoding: 'utf8' }));
const teams = JSON.parse(fs.readFileSync("Data Scraping/data/json/teams.json", { encoding: 'utf8' }));
const tournaments = JSON.parse(fs.readFileSync("Data Scraping/data/json/tournaments.json", { encoding: 'utf8' }));

// Initialize objects to store data temporarily.
let countries_regions = {};
let players_teams = {};
let buffer_players_teams = "";

// Initialize an array to store team names.
let teamNames = [];

// Initialize the buffer with initial SQL statements.
let buffer = "\
CREATE TABLE IF NOT EXISTS teams (\n\
    name   VARCHAR(30) NOT NULL PRIMARY KEY,\n\
    status VARCHAR(9),\n\
    region VARCHAR(20)\n\
);\n\
\n\
CREATE TABLE IF NOT EXISTS countries_regions (\n\
    country VARCHAR(20) NOT NULL PRIMARY KEY,\n\
    region  VARCHAR(20) NOT NULL\n\
);\n\
\n\
CREATE TABLE IF NOT EXISTS players (\n\
    id        VARCHAR(20) NOT NULL PRIMARY KEY,\n\
    full_name VARCHAR(40),\n\
    country   VARCHAR(20) NOT NULL,\n\
    FOREIGN KEY (country) REFERENCES countries_regions (country)\n\
);\n\
\n\
CREATE TABLE IF NOT EXISTS players_teams (\n\
    player_id VARCHAR(20) NOT NULL,\n\
    team_name VARCHAR(30) NOT NULL,\n\
    PRIMARY KEY (player_id, team_name),\n\
    FOREIGN KEY (player_id) REFERENCES players (id),\n\
    FOREIGN KEY (team_name) REFERENCES teams (name)\n\
);\n\
\n\
CREATE TABLE IF NOT EXISTS tournaments (\n\
    name           VARCHAR(60) NOT NULL PRIMARY KEY,\n\
    prize          NUMERIC(9,2),\n\
    location       VARCHAR(30) NOT NULL,\n\
    participants   INTEGER NOT NULL,\n\
    winner_team0   VARCHAR(30),\n\
    runner_up_team VARCHAR(30),\n\
    winner_team1   VARCHAR(30),\n\
    tier           VARCHAR(1) NOT NULL,\n\
    start_date     DATE NOT NULL,\n\
    end_date       DATE NOT NULL,\n\
    FOREIGN KEY (winner_team0) REFERENCES teams (name),\n\
    FOREIGN KEY (runner_up_team) REFERENCES teams (name),\n\
    FOREIGN KEY (winner_team1) REFERENCES teams (name)\n\
);\n\
\n\
\n";

// Teams
// Iterate through teams data and generate SQL insert statements for teams and players_teams.
for (let i = 0; i < teams.length; i++) {
    let { name, players, status, region } = teams[i];
    name = name.replaceAll(`'`, `''`);
    buffer += `INSERT INTO teams(name,status,region) VALUES ('${name}','${status}','${region}');\n`;
    teamNames.push(name);

    for (let j = 0; j < players.length; j++) {
        if (players_teams[players[j]] == undefined) {
            players_teams[players[j]] = name;
            buffer_players_teams += `INSERT INTO players_teams(player_id,team_name) VALUES ('${players[j]}','${name}');\n`;
        }
    }
}

// Countries_Regions
// Iterate through players data and generate SQL insert statements for countries_regions.
for (let i = 0; i < players.length; i++) {
    const { country, region } = players[i];

    if (countries_regions[country] == undefined) {
        buffer += `INSERT INTO countries_regions(country,region) VALUES ('${country}','${region}');\n`;
        countries_regions[country] = region;
    }
}

// Players
// Iterate through players data and generate SQL insert statements for players and players_teams.
for (let i = 0; i < players.length; i++) {
    let { id, fullName, team, country } = players[i];
    fullName = fullName.replaceAll(`'`, `''`);
    team = team.replaceAll(`'`, `''`);
    buffer += `INSERT INTO players(id,full_name,country) VALUES ('${id}','${fullName}','${country}');\n`;

    if (players_teams[id] == undefined && team !== "") {
        players_teams[id] = team;
        buffer_players_teams += `INSERT INTO players_teams(player_id,team_name) VALUES ('${id}','${team}');\n`;
        if (teamNames.indexOf(team) === -1) {
            buffer += `INSERT INTO teams(name,status,region) VALUES ('${team}',NULL,NULL);\n`;
            teamNames.push(team);
        }
    }
}

// Players_Teams
// Add the generated players_teams SQL insert statements to the buffer.
buffer += buffer_players_teams;

// Tournaments
// Iterate through tournaments data and generate SQL insert statements for tournaments.
for (let i = 0; i < tournaments.length; i++) {
    let { name, prize, location, participants, winner, runnerUp, tier, startDate, endDate } = tournaments[i];
    prize = prize !== "" ? parseFloat(prize).toFixed(2) : "NULL";
    const winner_team0 = winner.length > 0 ? `'${winner[0]}'` : "NULL";
    const runner_up_team = runnerUp.length > 0 ? `'${runnerUp[0]}'` : "NULL";
    const winner_team1 = winner.length > 1 ? `'${winner[1]}'` : "NULL";

    if (winner_team0 !== "NULL" && teamNames.indexOf(winner_team0.substring(1, winner_team0.length - 1)) === -1) {
        buffer += `INSERT INTO teams(name,status,region) VALUES (${winner_team0},NULL,NULL);\n`;
        teamNames.push(winner_team0.substring(1, winner_team0.length - 1));
    }
    if (runner_up_team !== "NULL" && teamNames.indexOf(runner_up_team.substring(1, runner_up_team.length - 1)) === -1) {
        buffer += `INSERT INTO teams(name,status,region) VALUES (${runner_up_team},NULL,NULL);\n`;
        teamNames.push(runner_up_team.substring(1, runner_up_team.length - 1));
    }
    if (winner_team1 !== "NULL" && teamNames.indexOf(winner_team1.substring(1, winner_team1.length - 1)) === -1) {
        buffer += `INSERT INTO teams(name,status,region) VALUES (${winner_team1},NULL,NULL);\n`;
        teamNames.push(winner_team1.substring(1, winner_team1.length - 1));
    }

    buffer += `INSERT INTO tournaments(name,prize,location,participants,winner_team0,runner_up_team,winner_team1,tier,start_date,end_date) VALUES ('${name}',${prize},'${location}','${participants}',${winner_team0},${runner_up_team},${winner_team1},'${tier}','${startDate}','${endDate}');\n`;
}

// Write the generated SQL queries to a file named "liquipedia.sql".
fs.writeFileSync("Data Storing/export/liquipedia.sql", buffer);