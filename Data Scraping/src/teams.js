// Import required libraries.
const axios = require("axios");
const fs = require("fs");

// Function to retrieve teams data.
// Parameters:
// - isOnline (optional): A flag to indicate whether to fetch the data online or offline.
const getTeams = async (isOnline = false) => {

    // Function to parse the raw HTML data and extract teams information.
    const parse = (rawData) => {
        // Split the raw data to extract relevant team information.
        rawData = rawData.split(`</div></div></div></div></div>`)[1];

        let data = [];

        // Extract active teams data.
        let rawActiveData = rawData.split(`<span class="mw-headline" id="Notable_Disbanded_Teams">`)[0];
        rawActiveData = rawActiveData.split(`<span class="mw-headline"`);

        for (let i = 2; i < rawActiveData.length; i++) {
            // Extract the region name for the current team.
            const region = rawActiveData[i].split("\">")[1].split(`</span>`)[0].replaceAll(`&amp;`, `&`);

            rawActiveData[i] = rawActiveData[i].split(`<span data-highlightingclass=\"`);
            for (let j = 1; j < rawActiveData[i].length; j++) {
                // Create a team object with its name, players, status, and region.
                let team = {
                    name: rawActiveData[i][j].split(`title=\"`)[1].split(`\">`)[0].replaceAll(`&#39;`, `'`),
                    players: [],
                    status: "active",
                    region: region,
                };
                
                // Extract player IDs for the current team.
                rawActiveData[i][j] = rawActiveData[i][j].split(`<span class=\"flag\">`);
                for (let k = 1; k < rawActiveData[i][j].length; k++) {
                    const id = rawActiveData[i][j][k].split(`">`)[3].split(`</a>`)[0];

                    // Add the player ID to the team's players array.
                    team["players"].push(id);
                }
                
                // Add the team object to the data array.
                data.push(team);
            }
        }

        // Extract disbanded teams data.
        let rawDisbandedData = rawData.split(`<span class="mw-headline" id="Notable_Disbanded_Teams">`)[1];
        rawDisbandedData = rawDisbandedData.split(`<div class="content-ad navigation-not-searchable">`)[0];
        rawDisbandedData = rawDisbandedData.split(`<span class="mw-headline"`);

        for (let i = 1; i < rawDisbandedData.length; i++) {
            // Extract the region name for the current team.
            const region = rawDisbandedData[i].split(`">`)[1].split(`</span>`)[0].replaceAll(`&amp;`, `&`);

            rawDisbandedData[i] = rawDisbandedData[i].split(`<span data-highlightingclass=\"`);
            for (let j = 1; j < rawDisbandedData[i].length; j++) {
                // Create a team object with its name, players, status, and region.
                let team = {
                    name: rawDisbandedData[i][j].split(`title=\"`)[3].split(`\">`)[0].replaceAll(`&#39;`, `'`),
                    players: [],
                    status: "disbanded",
                    region: region,
                };

                // Add the team object to the data array.
                data.push(team);
            }
        }

        return data;
    };

    // Fetch teams data from an online source or a locally stored file based on the isOnline flag.
    if (isOnline) {
        const URL = process.env.BASE_URL + "/valorant/Portal%3ATeams";
        return await axios.get(URL, { headers: JSON.parse(process.env.HEADER) }).then((res) => {
            // Uncomment only if you want to save the pages offline.
            // fs.writeFileSync("Data Scraping/data/html/teams.html", res.data);

            // Parse the retrieved HTML data and return a Promise with the teams information.
            return new Promise((resolve, reject) => resolve(parse(res.data)));
        });
    } else {
        const rawData = fs.readFileSync("Data Scraping/data/html/teams.html", { encoding: 'utf8', flag: 'r' });
        // Parse the local HTML data and return a Promise with the teams information.
        return new Promise((resolve, reject) => resolve(parse(rawData)));
    }
};

// Export the getTeams function to be used in other modules.
module.exports = getTeams;
