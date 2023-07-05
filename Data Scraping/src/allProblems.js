const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const FileSystem = require("fs");
const getHTML = require("./utilities/getHTML");
const writeToFile = require("./utilities/writeToFile");

const url = "https://leetcode.com/problemset";

/**
 * Parse the html of a problem page and process it into an array of problems with all of its attributes
 * @param {String} html html of a problem page
 * @returns problems found in the given html
 */
function processProblems(html) {
  // Load the html into cheerio
  const $ = cheerio.load(html);

  //   Find all of the cell in the problems table
  const $cells = $("div[role='cell']", html);

  //   Categorize the cells by the column of the problems table
  const $titleCells = $cells.filter((index) => {
    return (index + 1) % 6 === 2;
  });

  const $solutionCells = $cells.filter((index) => {
    return (index + 1) % 6 === 3;
  });

  const $acceptanceCells = $cells.filter((index) => {
    return (index + 1) % 6 === 4;
  });

  const $difficultyCells = $cells.filter((index) => {
    return (index + 1) % 6 === 5;
  });

  //   Initialize the problems in page array by filling it with the problems number and title
  const problemsInPage = $titleCells
    .find("a")
    .map((_, el) => {
      const titleRaw = el.children[0].data;
      const [number, title] = titleRaw.split(".");
      return {
        number: Number(number),
        title: title.substring(1),
      };
    })
    .toArray();

  // Get the link to each problems
  $titleCells
    .find("a")
    .map((_, el) => {
      return el.attribs["href"];
    })
    .toArray()
    // Add the link to each problems into the problems in page array
    .forEach((link, index) => {
      problemsInPage[index]["link"] = link;
    });

  // Get the acceptance rate of each problems
  $acceptanceCells
    .find("span")
    .map((_, el) => {
      const rawAcceptance = el.children[0].data;
      const acceptance = Number(
        rawAcceptance.substring(0, rawAcceptance.length - 1)
      );
      return acceptance;
    })
    .toArray()
    // Add the acceptance rate of each problems into the problems in page array
    .forEach((acceptanceRate, index) => {
      problemsInPage[index]["acceptanceRate"] = acceptanceRate;
    });

  // Get the solution type of each problems
  // Solution can be in the following state : not exist, in a readable article, or a video
  $solutionCells
    .map((_, el) => {
      // Empty cell means no solution
      if (el.children.length <= 0) {
        return "None";
      }

      //   Check whether there's an SVG with text-blue class and classify it accordingly
      $solutionLink = cheerio.load(el);
      $blueSVGIcon = $solutionLink("svg.text-blue", el);
      return $blueSVGIcon.length > 0 ? "ReadUp" : "Video";
    })
    .toArray()
    // Add the solution type of each problems into the problems in page array
    .forEach((solutionType, index) => {
      problemsInPage[index]["solutionType"] = solutionType;
    });

  // Get the difficulty level of each problems : Easy, Medium, or Hard
  $difficultyCells
    .find("span")
    .map((_, el) => {
      return el.children[0].data;
    })
    .toArray()
    // Add the difficulty level of each problems into the problems in page array
    .forEach((difficulty, index) => {
      problemsInPage[index]["difficulty"] = difficulty;
    });

  // Get the premium status of each problems (Boolean)
  $titleCells
    .find("div.truncate")
    .map((_, el) => {
      return el.parent.children.length === 2;
    })
    .toArray()
    // Add the premium status of each problems into the problems in page array
    .forEach((premiumStatus, index) => {
      problemsInPage[index]["premiumStatus"] = premiumStatus;
    });

  return problemsInPage;
}

/**
 * Categorize the problem in the problems array
 * @param {puppeteer.page} page
 * @param {array} problems
 */
async function categorizeProblems(page, problems) {
  //   The specialized category of the problems and how many pages they take up in the site
  const problemsCategory = [
    { name: "algorithms", pageCount: 50 },
    { name: "database", pageCount: 5 },
    { name: "javascript", pageCount: 2 },
    { name: "shell", pageCount: 1 },
    { name: "concurrency", pageCount: 1 },
  ];

  for (j = 0; j < problemsCategory.length; j++) {
    const { name, pageCount } = problemsCategory[j];
    for (i = 1; i <= pageCount; i++) {
      console.log(`Processing ${i}th page of ${name} category`);

      // Use dependency injection in the getHTML function
      const html = await getHTML(page, `${url}/${name}/?page=${i}`);

      processProblemsCategory(html, name, problems);
    }
  }
}

function processProblemsCategory(html, category, problems) {
  // Load the html into cheerio
  const $ = cheerio.load(html);

  //   Find all of the title cell in the problems table
  const $titleCells = $("div[role='cell']", html).filter((index) => {
    return (index + 1) % 6 === 2;
  });

  //   Find the index of all of the problems that are in the given category
  $titleCells
    .find("a")
    .map((_, el) => {
      const titleRaw = el.children[0].data;
      const index = Number(titleRaw.split(".")[0]);
      return index;
    })
    .toArray()
    // Add the category of each problem found to be in the given category into the problems array
    .forEach((index) => {
      // index - 1 because the problem in the problems array has number starts from one
      const targetedProblem = problems[index - 1];
      if (targetedProblem) {
        targetedProblem["category"] = category;
      }
    });
}

// Execute the fetching of all of the problems
(async () => {
  // Initiate the browser
  const browser = await puppeteer.launch();

  // Create a new page in headless chrome
  const page = await browser.newPage();

  //   The array for all of the problems in the site
  const problems = [];

  // Iterate over all of the problem pages
  for (i = 1; i <= 56; i++) {
    console.log(`Processing ${i}th page of all problems`);

    // Use dependency injection in the getHTML function
    const html = await getHTML(page, `${url}/all/?page=${i}`);

    // Add the problems in the page to the problems array
    problems.push(...processProblems(html));
  }
  // Remove the daily contest problem
  problems.shift();

  await categorizeProblems(page, problems);

  // Close the opened chromium browser
  await browser.close();

  writeToFile(problems, "problems");
})();
