const cheerio = require("cheerio");
const puppeteer = require("puppeteer");

const url = "https://leetcode.com/problemset/all";

/**
 * Get the HTML from the page by using puppeteer
 * The reason puppeteer is needed is because the website uses a framework and isn't static
 * Fetch the page with the given page number
 * @param {puppeteer.page} browserPage
 * @param {Number} pageNumber
 * @returns
 */
async function getHTML(browserPage, pageNumber) {
  // Go to target website with the given page number
  // Have it set to wait until the content has fully loaded (no more network activities)
  await browserPage.goto(`${url}/?page=${pageNumber}`, {
    waitUntil: "networkidle0",
  });

  // Get full page html
  const html = await browserPage.content();

  return html;
}

// Execute the fetching of all of the problems
(async () => {
  // Initiate the browser
  const browser = await puppeteer.launch();

  // Create a new page in headless chrome
  const page = await browser.newPage();

  //   The array for the problems
  const problems = [];

  // Iterate over all of the problem pages
  for (i = 1; i <= 1; i++) {
    // Use dependency injection to get the HTML content
    const html = await getHTML(page, i);
    console.log(`Processing ${i}th page`);

    const $ = cheerio.load(html);
    const $cells = $("div[role='cell']", html);

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

    const premiumStatuses = $titleCells
      .find("div.truncate")
      .map((_, el) => {
        return el.parent.children.length === 2;
      })
      .toArray();

    const links = $titleCells
      .find("a")
      .map((_, el) => {
        return el.attribs["href"];
      })
      .toArray();

    const acceptanceRates = $acceptanceCells
      .find("span")
      .map((_, el) => {
        const rawAcceptance = el.children[0].data;
        const acceptance = Number(
          rawAcceptance.substring(0, rawAcceptance.length - 1)
        );
        return acceptance;
      })
      .toArray();

    const solutionType = $solutionCells
      .map((_, el) => {
        if (el.children.length <= 0) {
          return "None";
        }

        $solutionLink = cheerio.load(el);
        $blueSVGIcon = $solutionLink("svg.text-blue", el);
        return $blueSVGIcon.length > 0 ? "ReadUp" : "Video";
      })
      .toArray();

    // console.log(solutionType);

    const difficulties = $difficultyCells
      .find("span")
      .map((_, el) => {
        return el.children[0].data;
      })
      .toArray();

    links.forEach((link, index) => {
      problemsInPage[index]["link"] = link;
    });

    acceptanceRates.forEach((acceptanceRate, index) => {
      problemsInPage[index]["acceptanceRate"] = acceptanceRate;
    });

    difficulties.forEach((difficulty, index) => {
      problemsInPage[index]["difficulty"] = difficulty;
    });

    premiumStatuses.forEach((premiumStatus, index) => {
      problemsInPage[index]["premiumStatus"] = premiumStatus;
    });

    solutionType.forEach((solutionType, index) => {
      problemsInPage[index]["solutionType"] = solutionType;
    });

    problems.push(...problemsInPage);
  }

  await browser.close();

  console.log(problems);
})();
