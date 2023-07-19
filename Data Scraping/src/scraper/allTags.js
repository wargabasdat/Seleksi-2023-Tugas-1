const cheerio = require("cheerio");
const puppeteer = require("puppeteer");
const getHTML = require("../utilities/getHTML");
const writeToFile = require("../utilities/writeToFile");

const url = "https://leetcode.com/problemset";

const scraperTags = async () => {
  // Initiate the browser
  const browser = await puppeteer.launch();

  // Create a new page in headless chrome
  const page = await browser.newPage();

  console.log("Fetching all of the tags");

  //   Get and load html
  const html = await getHTML(page, `${url}/all/`);

  const $ = cheerio.load(html);

  //   Get the tags container
  const $tagsContainer = $("hr.my-8.border-divider-border-2", html)[0].next
    .children[0];

  // Get the tag content elements
  const $tags = cheerio.load($tagsContainer)("span", $tagsContainer);

  //   Get the tag name
  const tags = $tags
    // Get every other span
    .filter((index) => index % 2 === 0)
    // Get its content and put it in an object
    .map((_, el) => {
      return { name: el.children[0].data };
    })
    // Convert to array
    .toArray();

  // Get the tag link elements
  const $tagLink = cheerio.load($tagsContainer)("a", $tagsContainer);

  //   Add the tags array with the link of each tag
  $tagLink
    // Get the href in each of the a element
    .map((_, el) => el.attribs["href"])
    // Convert to array
    .toArray()
    // Add it to the tags array
    .forEach((link, index) => (tags[index]["link"] = link));

  // Generator of the exact url to the tag
  const tagUrlGenerator = (tagLink) => `https://leetcode.com${tagLink}/`;

  // Get the problems that are in each of the tags
  for (i = 0; i < tags.length; i++) {
    console.log(`Processing ${i + 1}th tag (${tags[i].name}) of all tags`);

    // Get the HTML of the page
    const html = await getHTML(page, tagUrlGenerator(tags[i]["link"]));

    // Get the problems number that are in the tag
    const problems = cheerio
      // Load the html and find all of the element containing the problem's number
      .load(html)("td[label='#']", html)
      // Get the number value inside the element
      .map((_, el) => Number(el.children[0].data))
      //   Convert to array
      .toArray();

    // Insert the information to the tag in the tags array
    tags[i]["problems"] = problems;
    tags[i]["numberOfProblems"] = problems.length;
  }

  writeToFile(tags, "tags");

  browser.close();
};

module.exports = scraperTags;
