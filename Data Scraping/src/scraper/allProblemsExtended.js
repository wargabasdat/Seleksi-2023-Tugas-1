const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const FileSystem = require("fs");
const getHTML = require("../utilities/getHTML");
const formattedStringToNumber = require("../utilities/formattedStringToNumber");
const writeToFile = require("../utilities/writeToFile");

async function fetchAndSaveProblem(page, problemLink, problemNumber) {
  const html = await getHTML(page, `https://leetcode.com${problemLink}`);

  const $ = cheerio.load(html);

  const [numberOfLikes, numberOfDislikes] =
    //   Target the element
    $(
      "path[d='M7.04 9.11l3.297-7.419a1 1 0 01.914-.594 3.67 3.67 0 013.67 3.671V7.33h4.028a2.78 2.78 0 012.78 3.2l-1.228 8.01a2.778 2.778 0 01-2.769 2.363H5.019a2.78 2.78 0 01-2.78-2.78V11.89a2.78 2.78 0 012.78-2.78H7.04zm-2.02 2a.78.78 0 00-.781.78v6.232c0 .431.35.78.78.78H6.69V11.11H5.02zm12.723 7.793a.781.781 0 00.781-.666l1.228-8.01a.78.78 0 00-.791-.898h-5.04a1 1 0 01-1-1V4.77c0-.712-.444-1.32-1.07-1.56L8.69 10.322v8.58h9.053z']",
      html
    )
      .parent()
      .parent()
      .parent()
      .parent()
      .children()
      // Map the children of the container for likes and dislikes to get the actual like dislike value
      .map((_, el) => {
        return el.children[1].children[0].data;
      })
      // Convert to array
      .toArray()
      // Convert to number
      .map(formattedStringToNumber);

  // Get the problem's content
  const content = $("._1l1MA").html();

  //   The 2 variable below are just intermediate element used to target the actual text box submission stats
  const $dividerLines = $("hr.border-divider-3.mx-5", html);

  const $submissionStatBox = $dividerLines.get(0).prev.children[0];

  const numberOfAcceptedSubmission = formattedStringToNumber(
    // Get the number of submission text itself
    $submissionStatBox.children[0].children[1].children[0].data
  );

  const numberOfSubmission = formattedStringToNumber(
    // Get the number of submission text itself
    $submissionStatBox.children[2].children[1].children[0].data
  );

  //   Get the number of discusision
  const discussionText = String(
    // Diving deep to get the actual discussion text
    $dividerLines.get(0).next.children[0].children[0].children[0].children[0]
      .data
    //   Getting the number of discussion itself
  ).split(" ")[1];

  const numberOfDiscussion = formattedStringToNumber(
    // Getting rid of parentheses
    discussionText.substring(1, discussionText.length - 1)
  );

  //   Get the number of submitted solution
  const $solutionContainer = $(`a[href='${problemLink}solutions'] span`, html);

  //
  const rawSolutionText = String(
    // Get the number of solution text itself
    $solutionContainer.get(0).children[0].data
  ).split(" ")[1];

  const numberOfSolutions = Number(
    formattedStringToNumber(
      // Getting rid of parentheses
      rawSolutionText.substring(1, rawSolutionText.length - 1)
    )
  );

  const result = {
    numberOfLikes,
    numberOfDislikes,
    content,
    numberOfAcceptedSubmission,
    numberOfSubmission,
    numberOfDiscussion,
    numberOfSolutions,
  };

  writeToFile(result, `problemsExtended/${problemNumber}`);
}

const scraperProblemsExtended = async () => {
  // Initiate the browser
  const browser = await puppeteer.launch({
    headless: false,
    args: ["--start-maximized"],
    defaultViewport: null,
  });

  // Create a new page in headless chrome
  const page = await browser.newPage();

  //   Set no timeout for the page. Required because loading up the individual problem page takes quite long
  page.setDefaultNavigationTimeout(0);

  //   Initialize the list of problems that haven't been fetched
  let unfetchedProblems = [];
  try {
    const result = FileSystem.readFileSync(
      "../data/problemsToFetch.json",
      "utf-8"
    );
    unfetchedProblems = JSON.parse(result);
  } catch {
    console.log(
      "Problems to fetch file not found. We'll assume this is the first time you fetch the problems."
    );
  }

  //   Get the list of problems
  const problems = JSON.parse(
    FileSystem.readFileSync("../data/problems.json", "utf-8")
  );

  //   If unfetchedProblems in empty, fetch all existing problems
  if (unfetchedProblems.length === 0) {
    unfetchedProblems = problems
      .filter(({ premiumStatus }) => !premiumStatus)
      .map(({ number }) => number);
  }

  let failureCount = 0;

  const failureThreshold = 20;

  // Unfetched problem works like a queue in the loop below

  while (unfetchedProblems.length > 0 && failureCount <= failureThreshold) {
    let failed = false;

    // Get the number of problem to fetch
    const problemNumber = unfetchedProblems[0];

    console.log(`Fetching problem ${problemNumber}`);

    try {
      await fetchAndSaveProblem(
        page,
        problems[problemNumber - 1]["link"],
        problemNumber,
        unfetchedProblems
      );
      console.log(`Fetching problem ${problemNumber} success!`);
    } catch (e) {
      console.log(`Failed fetching problem ${problemNumber}`);
      console.log(e);

      //   Insert the problem number back to the end to be tried again later
      unfetchedProblems.push(problemNumber);
      failed = true;
    }

    console.log("");
    // Remove the first element as that have been tried
    unfetchedProblems.shift();

    // Write the unfetchedProblems to json to ensure failure and success are immediately written down
    writeToFile(unfetchedProblems, "problemsToFetch");

    if (failed) {
      failureCount++;
    }
  }

  if (failureCount > failureThreshold) {
    console.log("Too much failures. Stopping the program. Please try again.");
  }

  writeToFile(unfetchedProblems, "problemsToFetch");

  browser.close();
};

module.exports = scraperProblemsExtended;
