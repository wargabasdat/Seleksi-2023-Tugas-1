// Import required libraries.
const axios = require("axios");
const fs = require("fs");

// Function to get detailed information about a specific tournament.
// Parameters:
// - URL: The URL of the tournament page.
// - fileName: The name of the file where the tournament's HTML data is stored (used in offline mode).
// - isOnline (optional): A flag to indicate whether to fetch the data online or offline.
const getTournamentDetail = async (URL, fileName, isOnline = false) => {

    // Function to parse the raw HTML data and extract tournament details.
    const parse = (rawData) => {
        // Extract the tournament tier from the raw data.
        let tournamentTier = rawData.split(`Liquipedia Tier:`)[1].split(`-Tier`)[0].split(`/`);
        tournamentTier = tournamentTier[tournamentTier.length - 1];

        // Initialize variables to store tournament start and end dates.
        let tournamentStartDate, tournamentEndDate;

        try {
            // Try to extract start and end dates from the raw data (if available).
            tournamentStartDate = rawData.split(`Start Date:`)[1].split(`\">`)[1].split(`</div>`)[0];
            tournamentEndDate = rawData.split(`End Date:`)[1].split(`\">`)[1].split(`</div>`)[0];
        } catch (err) {
            // If start and end dates are not available, fallback to a single date for the tournament.
            tournamentStartDate = rawData.split(`Date:`)[1].split(`\">`)[1].split(`</div>`)[0];
            tournamentEndDate = tournamentStartDate;
        }

        // Return an object containing tournament tier, start date, and end date.
        return {
            tier: tournamentTier,
            startDate: tournamentStartDate,
            endDate: tournamentEndDate,
        };
    };

    // Fetch tournament detail data from an online source or a locally stored file based on the isOnline flag.
    if (isOnline) {
        return await axios.get(URL, { headers: JSON.parse(process.env.HEADER) }).then((res) => {
            // Uncomment only if you want to save the pages offline.
            // fs.writeFileSync(`Data Scraping/data/html/tournaments/${fileName}.html`, res.data);

            // Parse the retrieved HTML data and return a Promise with the tournament details.
            return new Promise((resolve, reject) => resolve(parse(res.data)));
        });
    } else {
        const rawData = fs.readFileSync(`Data Scraping/data/html/tournaments/${fileName}.html`, { encoding: 'utf8', flag: 'r' });
        // Parse the local HTML data and return a Promise with the tournament details.
        return new Promise((resolve, reject) => resolve(parse(rawData)));
    }
};

// Export the getTournamentDetail function to be used in other modules.
module.exports = getTournamentDetail;
