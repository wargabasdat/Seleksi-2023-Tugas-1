const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const FileSystem = require("fs");
const getHTML = require("./utilities/getHTML");
const formattedStringToNumber = require("./utilities/formattedStringToNumber");

(async () => {
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

  const [likes, dislike] = $(
    "path[d='M7.04 9.11l3.297-7.419a1 1 0 01.914-.594 3.67 3.67 0 013.67 3.671V7.33h4.028a2.78 2.78 0 012.78 3.2l-1.228 8.01a2.778 2.778 0 01-2.769 2.363H5.019a2.78 2.78 0 01-2.78-2.78V11.89a2.78 2.78 0 012.78-2.78H7.04zm-2.02 2a.78.78 0 00-.781.78v6.232c0 .431.35.78.78.78H6.69V11.11H5.02zm12.723 7.793a.781.781 0 00.781-.666l1.228-8.01a.78.78 0 00-.791-.898h-5.04a1 1 0 01-1-1V4.77c0-.712-.444-1.32-1.07-1.56L8.69 10.322v8.58h9.053z']",
    html
  )
    .parent()
    .parent()
    .parent()
    .parent()
    .children()
    .map((_, el) => {
      return el.children[1].children[0].data;
    })
    .toArray()
    .map(formattedStringToNumber);

  const rawContent = $("._1l1MA").html();

  const $dividerLines = $("hr.border-divider-3.mx-5", html);

  const $submissionStatBox = $dividerLines.get(0).prev.children[0];

  const acceptedSubmission = formattedStringToNumber(
    // Get the number of submission text itself
    $submissionStatBox.children[0].children[1].children[0].data
  );

  const submission = formattedStringToNumber(
    // Get the number of submission text itself
    $submissionStatBox.children[2].children[1].children[0].data
  );

  const discussionText = String(
    $dividerLines.get(1).prev.children[0].children[0].children[0].children[0]
      .data
  ).split(" ")[1];

  const discussionNumber = formattedStringToNumber(
    // Get the number of discussion text itself
    discussionText.substring(1, discussionText.length - 1)
  );

  console.log(acceptedSubmission, submission, discussionNumber);

  const $solutionContainer = $(
    `a[href='/problems/two-sum/solutions'] span`,
    html
  );

  const rawSolutionText = String(
    $solutionContainer.get(0).children[0].data
  ).split(" ")[1];
  const solutionsNumber = Number(
    formattedStringToNumber(
      rawSolutionText.substring(1, rawSolutionText.length - 1)
    )
  );

  console.log(solutionsNumber);

  browser.close();
})();
