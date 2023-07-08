const scraperProbems = require("./scraper/allProblems");
const scraperProblemsExtended = require("./scraper/allProblemsExtended");
const scraperTags = require("./scraper/allTags");

(async () => {
  // Scrape all of the problems
  await scraperProbems();

  // Scrape individual page of all the problems
  await scraperProblemsExtended();

  // Scrape the tags and the problem in each of them
  await scraperTags();
})();
