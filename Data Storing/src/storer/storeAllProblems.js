const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function storeAllProblems(conn) {
  const problems = JSON.parse(
    FileSystem.readFileSync("../../Data Scraping/data/problems.json", "utf-8")
  );

  const problemMapped = problems.map(
    ({
      number,
      title,
      acceptanceRate,
      solutionType,
      premiumStatus,
      difficulty,
      category,
    }) => [
      number,
      title,
      solutionType,
      difficulty,
      premiumStatus,
      category ?? null,
      acceptanceRate,
    ]
  );

  await conn.batch(
    "INSERT INTO `problem` values (?, ?, ?, ?, ?, ?, ?)",
    problemMapped
  );
}

module.exports = storeAllProblems;
