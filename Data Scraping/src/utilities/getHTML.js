/**
 * Get the HTML from the page of the given url using puppeteer.
 * Puppeteer is needed because the website uses a framework (isn't static).
 * @param {puppeteer.page} browserPage
 * @param {string} url
 * @returns html of the page
 */
async function getHTML(browserPage, url) {
  // Go to target website with the given page number
  // Have it set to wait until the content has fully loaded (no more network activities)
  await browserPage.goto(url, {
    waitUntil: "networkidle0",
  });

  // Get full page html
  const html = await browserPage.content();

  return html;
}

module.exports = getHTML;
