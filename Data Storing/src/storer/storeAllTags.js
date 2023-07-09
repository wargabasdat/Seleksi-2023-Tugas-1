const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function storeAllTags(conn) {
  const tagsAndProblem = JSON.parse(
    FileSystem.readFileSync("../../Data Scraping/data/tags.json", "utf-8")
  );

  const tags = tagsAndProblem.map(({ name }) => [name]);

  await conn.batch("INSERT INTO `tag` values (?)", tags);

  const tagsContainProblem = [];

  tagsAndProblem.forEach(({ name, problems }) => {
    problems.forEach((number) => {
      tagsContainProblem.push([name, number]);
    });
  });

  await conn.batch(
    "INSERT INTO `tag_contain_problem` values (?, ?)",
    tagsContainProblem
  );
}

module.exports = storeAllTags;
