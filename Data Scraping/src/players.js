// Load the environment variables from the .env file (if any).
require('dotenv').config();

// Import required libraries.
const axios = require("axios");
const fs = require("fs");

// Define an asynchronous function to get player data from a specific region.
// Parameters:
// - regionName: The name of the region to get players from.
// - isOnline (optional): A flag to indicate whether to fetch the data online or offline.
const getPlayers = async (regionName, isOnline = false) => {

    // Define a helper function to parse the raw HTML data and extract player information.
    const parse = (rawData) => {
        // Split the raw data to extract relevant player information.
        rawData = rawData.split(`<h2><span class="mw-headline"`)[1];
        rawData = rawData.split(`<div class="content-ad navigation-not-searchable">`)[0];
        rawData = rawData.split(`<h3>`);

        // Create an array to store the player data.
        let data = [];

        // Loop through each player entry and extract the necessary details.
        for (let i = 1; i < rawData.length; i++) {
            try {
                // Extract the country name for the current player.
                const countryName = rawData[i].split(`title=\"`)[1].split(`\">`)[0];

                // Split the raw data further to access player-specific details.
                rawData[i] = rawData[i].split(`<tbody>`);
                rawData[i][1] = rawData[i][1].split(`<div class=\"block-player\">`);

                // Loop through each player entry within the current country.
                for (let j = 1; j < rawData[i][1].length; j++) {
                    // Extract player details and create a player object.
                    const player = ({
                        id: rawData[i][1][j].split(`\">`)[3].split(`</a>`)[0], // Player ID
                        url: process.env.BASE_URL + rawData[i][1][j].split(`<a href=\"`)[1].split(`\"`)[0], // Player detail URL
                        fullName: rawData[i][1][j].split(`</td><td> `)[1], // Player full name
                        team: rawData[i][1][j].split(`title=\"`).length > 3 ? rawData[i][1][j].split(`\">`)[10].split(`</a>`)[0].replaceAll(`&#39;`, `'`) : "", // Player team (if available)
                        country: countryName, // Player country
                        region: regionName, // Player region
                    });

                    // Add the player object to the data array.
                    data.push(player);
                }
            } catch (e) {
                // If an error occurs during parsing, log it and continue to the next player.
                console.log(`Skipped data no. ${i + 1}.`);
                console.log(e);
            }
        }

        // Return the array containing player data.
        return data;
    };

    // If the isOnline flag is true, fetch player data from an online source (URL).
    if (isOnline) {
        const URL = process.env.BASE_URL + "/valorant/Portal%3APlayers/" + regionName.replaceAll(` `, `_`).replaceAll(`&`, `%26`);
        return await axios.get(URL, { headers: JSON.parse(process.env.HEADER) }).then((res) => {
            // Uncomment only if you want to save the pages offline.
            // fs.writeFileSync(`Data Scraping/data/html/players/${regionName}.html`, res.data);

            // Parse the retrieved HTML data and return a Promise with the player information.
            return new Promise((resolve, reject) => resolve(parse(res.data)));
        });
    } else {
        // If the isOnline flag is false, fetch player data from a locally stored HTML file.
        const rawData = fs.readFileSync(`Data Scraping/data/html/players/${regionName}.html`, { encoding: 'utf8', flag: 'r' });
        // Parse the local HTML data and return a Promise with the player information.
        return new Promise((resolve, reject) => resolve(parse(rawData)));
    }
};

// Export the getPlayers function to be used in other modules.
module.exports = getPlayers;
