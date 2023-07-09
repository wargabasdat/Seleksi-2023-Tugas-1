const scraperProbems = require("./scraper/allProblems");
const scraperProblemsExtended = require("./scraper/allProblemsExtended");
const scraperTags = require("./scraper/allTags");
const msToTime = require("./utilities/msToTime");

(async () => {
  const start = Date.now();
  console.log("Starting web scraping");
  // Scrape all of the problems
  await scraperProbems();

  // Scrape individual page of all the problems
  await scraperProblemsExtended();

  // Scrape the tags and the problem in each of them
  await scraperTags();

  const end = Date.now();
  const duration = end - start;
  console.log(`Finished scraping in ${msToTime(duration)}.`);
})();
