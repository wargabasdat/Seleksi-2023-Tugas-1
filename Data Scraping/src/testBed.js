const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const FileSystem = require("fs");
const getHTML = require("./utilities/getHTML");
const formattedStringToNumber = require("./utilities/formattedStringToNumber");
const writeToFile = require("./utilities/writeToFile");

(async () => {
  const problems = JSON.parse(
    FileSystem.readFileSync("./result/problems.json", "utf-8")
  );

  const result = FileSystem.readFileSync(
    "./result/problemsToFetch.json",
    "utf-8"
  );
  const unfetchedProblems = JSON.parse(result);

  const problemsToFetch = problems
    .filter(({ premiumStatus, number }) => !premiumStatus)
    .map(({ number }) => number);

  const fetchedProblems = (
    await FileSystem.readdirSync("./result/problemsExtended/")
  )
    .filter((string) => string.endsWith(".json"))
    .map((string) => string.substring(0, string.length - 6));

  console.log(unfetchedProblems.length);
  console.log(fetchedProblems.length);
  console.log(problemsToFetch.length);

  // writeToFile(unfetchedProblems, "problemsToFetch");

  return;
  // Initiate the browser
  const browser = await puppeteer.launch({
    headless: false,
    args: ["--start-maximized"],
    defaultViewport: null,
  });

  // Create a new page in headless chrome
  const page = await browser.newPage();

  await page.setDefaultNavigationTimeout(0);

  const url = "https://leetcode.com/problems/two-sum/";

  const html = await getHTML(page, url);

  const $ = cheerio.load(html);

  browser.close();
})();
