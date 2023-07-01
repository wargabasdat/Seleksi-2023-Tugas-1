require("events").EventEmitter.defaultMaxListeners = 15;
const axios = require("axios");
const cheerio = require("cheerio");
const { wrapper } = require("axios-cookiejar-support");
const { CookieJar } = require("tough-cookie");

const url = "https://leetcode.com/problemset/all/?page=1";

const jar = new CookieJar();
const client = wrapper(axios.create({ jar }));

client
  .get(url, { responseType: "text" })
  .then(function ({ data: html }) {
    const $ = cheerio.load(html);
    // const $title = $("div[role='cell'] span", html);
    // console.log($title.length);
  })
  .catch(function (error) {
    console.log(error);
  });

// rp(url)
//   .then(function (html) {
//     console.log("Bruh");
//     console.log(html);
//     // const $row = $("[role='row']", html);
//     // console.log($row.length);
//     // console.log($row);
//   })
//   .catch(function (err) {
//     console.log(err);
//   });
