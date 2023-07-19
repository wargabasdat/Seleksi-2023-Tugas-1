const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const FileSystem = require("fs");
const getHTML = require("./utilities/getHTML");
const formattedStringToNumber = require("./utilities/formattedStringToNumber");
const writeToFile = require("./utilities/writeToFile");
const scraperProbems = require("./scraper/allProblems");
const scraperProblemsExtended = require("./scraper/allProblemsExtended");
const scraperTags = require("./scraper/allTags");

(async () => {
  const bruh = { bruh: "" };

  writeToFile(bruh, "bruh");
})();
