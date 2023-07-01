const cheerio = require("cheerio");
const puppeteer = require("puppeteer");

const url = "https://leetcode.com/problemset/all/?page=1";

// Get the HTML from the page by using puppeteer
// The reason puppeteer is needed is because the website uses a framework and isn't static
async function getHTML() {
  // Initiate the browser
  const browser = await puppeteer.launch();

  // Create a new page in headless chrome
  const page = await browser.newPage();

  // Go to target website
  // Have it set to wait until the content has fully loaded (no more network activities)
  await page.goto(url, {
    waitUntil: "networkidle0",
  });

  // Get full page html
  const html = await page.content();

  // Close headless chrome
  await browser.close();

  return html;
}

// Execute the fetching of all of the problems
(async () => {
  const html = await getHTML();

  const $ = cheerio.load(html);
  const $title = $("div[role='cell'] span", html);
  console.log($title.length);
})();
