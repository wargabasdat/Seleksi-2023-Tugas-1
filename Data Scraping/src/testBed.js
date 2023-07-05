const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const FileSystem = require("fs");
const getHTML = require("./utilities/getHTML");

(async () => {
  // Initiate the browser
  const browser = await puppeteer.launch();

  // Create a new page in headless chrome
  const page = await browser.newPage();

  const url = "https://leetcode.com/tag/array/";
  const html = await getHTML(page, url);

  const $ = cheerio.load(html);

  const $tableCell = $("td[label='#']", html);

  console.log($tableCell);
  console.log($tableCell.length);

  browser.close();
})();
