/**
 * Webpage Retriever
 * @author Ahmad Rizki - 18221071
 */

const axios = require('axios');
const moment = require('moment');

const URL = "https://fiskal.kemenkeu.go.id/informasi-publik/kurs-pajak";

module.exports = async (date) => {
  return date ? await retrieve_date(date) : await retrieve_no_date();
};


/**
 * retriever with date parameter
 * @param date (YYYY-MM-DD)
 * @returns {Promise<*>}
 */
async function retrieve_date(date) {
  console.log(`[*] Retrieving raw HTML from ${URL} for ${date}...`);

  let tanggal = moment(date).format('YYYY-MM-DD');

  let response = await axios.get(URL + "?date=" + tanggal, null, {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79'
    }
  });
  
  console.log(`[+] Data retrieved successfully!`);

  return response.data;
};

/**
 * retriever without date parameter
 * @returns {Promise<*>}
 */
async function retrieve_no_date(params) {
  console.log(`[*] Retrieving raw HTML from ${URL}...`);

  let response = await axios.get(URL, null, {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79'
    }
  });

  console.log(`[+] Data retrieved successfully!`);

  return response.data;
};