// Import required libraries.
const axios = require("axios");
const fs = require("fs");

// Function to get information about Valorant tournaments.
// Parameters:
// - isOnline (optional): A flag to indicate whether to fetch the data online or offline.
const getTournaments = async (isOnline = false) => {

    // Function to parse the raw HTML data and extract tournament information.
    const parse = (rawData) => {
        // Split the raw data to extract relevant tournament information for the year 2023.
        rawData = rawData.split(`<h3><span class="mw-headline" id="2023">2023</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/valorant/index.php?title=VALORANT_Champions_Tour&amp;action=edit&amp;section=5" title="Edit section: 2023">edit</a><span class="mw-editsection-bracket">]</span></span></h3>`)[1];
        rawData = rawData.split(`<h2><span class="mw-headline" id="Selected_Statistics">Selected Statistics</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/valorant/index.php?title=VALORANT_Champions_Tour&amp;action=edit&amp;section=8" title="Edit section: Selected Statistics">edit</a><span class="mw-editsection-bracket">]</span></span></h2>`)[0];
        rawData = rawData.split(`<div class="divRow tournament-card-premier tournament-card-premier">`);

        let data = [];
        for (let i = 1; i < rawData.length; i++) {
            try {
                // Extract relevant details for each tournament.
                rawData[i] = rawData[i].split(`</a></span>&#160;<b>`)[1];
                rawData[i] = rawData[i].split(`</div></div>`)[0];

                // Determine if there is a single winner or multiple winners for the tournament.
                const titleCount = rawData[i].split(`First Place`)[1].split(`Second Place`)[0].split(`title=`).length;
                const isAnyWinner = titleCount > 4;
                const isDoubleWinner = titleCount > 7;

                // Create a tournament object with its name, URL, prize, location, participants, and winner/runner-up details.
                let tournament = ({
                    name: rawData[i].split(`\">`)[1].split(`</a>`)[0].replaceAll(`&amp;`, `&`),
                    url: process.env.BASE_URL + rawData[i].split(`<a href=\"`)[1].split(`\"`)[0],
                    prize: rawData[i].split(`<div class=\"divCell EventDetails-Right-45 Header-Premier\">`)[1].split(`</div>`)[0].replace(`&#160;`, ``).replace(`$`, ``).replaceAll(`,`, ``),
                    location: rawData[i].split(`</a></span>&#160;</span>`)[1].split(`</span></div>`)[0].replace(`<span class=\"MobileOnly\">`, ``).replace(`&#160;`, ` `),
                    participants: parseInt(rawData[i].split(`<div class=\"divCell EventDetails-Right-40 Header-Premier\"><span>`)[1].split(`</span>`)[0]),
                    winner: [],
                    runnerUp: [],
                });

                // Add winner and runner-up information if available.
                if (isAnyWinner) {
                    tournament.winner.push(rawData[i].split(`title=\"`)[4].split(`\">`)[0]);
                    if (isDoubleWinner) {
                        tournament.winner.push(rawData[i].split(`title=\"`)[8].split(`\">`)[0]);
                    } else {
                        tournament.runnerUp.push(rawData[i].split(`title=\"`)[8].split(`\">`)[0]);
                    }
                }

                data.push(tournament);
            } catch (e) {
                console.log(`Skipped data no. ${i + 1}.`);
                console.log(e);
            }
        }

        return data;
    };

    // Fetch tournament data from an online source or a locally stored file based on the isOnline flag.
    if (isOnline) {
        const URL = process.env.BASE_URL + "/valorant/VALORANT_Champions_Tour";
        return await axios.get(URL, { headers: JSON.parse(process.env.HEADER) }).then((res) => {
            // Uncomment only if you want to save the pages offline.
            // fs.writeFileSync("Data Scraping/data/html/tournaments.html", res.data);

            // Parse the retrieved HTML data and return a Promise with the tournament information.
            return new Promise((resolve, reject) => resolve(parse(res.data)));
        });
    } else {
        const rawData = fs.readFileSync("Data Scraping/data/html/tournaments.html", { encoding: 'utf8' });
        // Parse the local HTML data and return a Promise with the tournament information.
        return new Promise((resolve, reject) => resolve(parse(rawData)));
    }
};

// Export the getTournaments function to be used in other modules.
module.exports = getTournaments;