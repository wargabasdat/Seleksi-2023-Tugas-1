/*
    July, 2023.

    The program is designed by Syafiq Ziyadul Arifin (18221048@std.stei.itb.ac.id) to scrape data
    from Liquipedia's websites, specifically targeting Valorant tournaments, teams, and players. It
    follows the rules and guidelines outlined in Liquipedia's "robots.txt" file
    (https://liquipedia.net/robots.txt) for automated access. This ensures that the program
    operates within the permitted boundaries set by Liquipedia, avoiding any disruptive or
    unauthorized scraping activities.

    To further respect Liquipedia's traffic and prevent overwhelming their servers, the program
    incorporates a deliberate delay of 2 seconds between each request. This delay helps to lighten
    the load on Liquipedia's infrastructure and ensures a more balanced and considerate approach
    to data retrieval.

    Additionally, the program takes into consideration the approved sitemaps listed in the
    "sitemap-valorant-1.xml" file (https://liquipedia.net/sitemap-valorant-1.xml), which provides a
    structured overview of the authorized content sources. By adhering to these sitemaps and
    incorporating a delay, the program demonstrates its commitment to responsible data extraction,
    promoting a fair and sustainable use of Liquipedia's resources.
*/

// Import required libraries and custom modules for data retrieval.
const fs = require("fs"); // Node.js filesystem module for reading and writing files.
const getTournaments = require("./tournaments.js");
const getTournamentDetail = require("./tournamentDetail.js");
const getTeams = require("./teams.js");
const getPlayers = require("./players.js");

// Define the delay (in milliseconds) between each request to Liquipedia.
const delayMilliseconds = 2 * 1000;

// Set the isOnline flag to control online or offline data retrieval.
const isOnline = false; // If set to true, the program will take at least 406 seconds (6.76 minutes).

// Define the player regions for which data will be retrieved.
const playerRegions = [
    "Europe",
    "CIS",
    "Americas",
    "Oceania",
    "Asia",
    "Africa & Middle East",
];

// Function to pause execution for a given number of milliseconds.
const sleepMilliseconds = async (milliseconds) => {
    console.log(`\nSleeping for ${milliseconds / 1000} seconds.`);
    let timeStart = new Date().getTime();
    let timeNow = timeStart;
    while (timeNow - timeStart < milliseconds) {
        timeNow = new Date().getTime();
    }
    console.log("Continuing...\n");
};

// Main function to parse and retrieve data from Liquipedia.
const parse = async () => {
    console.log("Starting...");

    // Retrieve and write Teams data to JSON file.
    const teams = await getTeams(isOnline);
    fs.writeFileSync("Data Scraping/data/json/teams.json", JSON.stringify(teams));
    console.log(`Wrote ${teams.length} teams data.`);
    if (isOnline) sleepMilliseconds(delayMilliseconds);

    // Retrieve and write Tournaments data to JSON file.
    let tournaments = await getTournaments(isOnline);
    if (isOnline) sleepMilliseconds(delayMilliseconds);
    for (let i = 0; i < tournaments.length; i++) {
        const fileName = tournaments[i].name.replaceAll(`/`, ``);
        try {
            const tournamentDetail = await getTournamentDetail(tournaments[i].url, fileName, isOnline);
            tournaments[i] = { ...tournaments[i], ...tournamentDetail };
        } catch (err) {
            console.log(`Skipped ${key}.`);
        }
        if (isOnline) sleepMilliseconds(delayMilliseconds);
    }
    fs.writeFileSync("Data Scraping/data/json/tournaments.json", JSON.stringify(tournaments));
    console.log(`Wrote ${tournaments.length} tournaments data.`);

    // Retrieve and write Players data to JSON files per region.
    let players = [];
    for (let i = 0; i < playerRegions.length; i++) {
        const playersPerRegion = await getPlayers(playerRegions[i]);
        players = players.concat(playersPerRegion);
        fs.writeFileSync(`Data Scraping/data/json/players/${playerRegions[i].replaceAll(` `, ``).toLowerCase()}.json`, JSON.stringify(playersPerRegion));
        console.log(`Wrote ${playersPerRegion.length} ${playerRegions[i]} players data.`);
        if (isOnline) sleepMilliseconds(delayMilliseconds);
    }
    fs.writeFileSync("Data Scraping/data/json/players.json", JSON.stringify(players));
    console.log(`Merged ${players.length} players from ${playerRegions.length} regions data.`);

    console.log("Done!");
}

// Call the parse function to start data retrieval.
parse();