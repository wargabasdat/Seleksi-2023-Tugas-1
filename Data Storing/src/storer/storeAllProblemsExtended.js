const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function storeAllProblemsExtended(conn) {
  const problems = JSON.parse(
    FileSystem.readFileSync("../../Data Scraping/data/problems.json", "utf-8")
  );

  const problemExtendedMapped = problems
    .map(({ number, premiumStatus, title, acceptanceRate, difficulty }) => {
      if (premiumStatus) {
        return null;
      }
      const {
        numberOfLikes,
        numberOfDislikes,
        numberOfSubmission,
        numberOfDiscussion,
        numberOfSolutions,
        numberOfAcceptedSubmission,
      } = JSON.parse(
        FileSystem.readFileSync(
          `../../Data Scraping/data/problemsExtended/${number}.json`,
          "utf-8"
        )
      );
      return [
        number,
        numberOfLikes,
        title,
        difficulty,
        acceptanceRate,
        numberOfDislikes,
        numberOfAcceptedSubmission,
        numberOfSubmission,
        numberOfDiscussion,
        numberOfSolutions,
      ];
    })
    .filter((problemExtended) => problemExtended !== null);

  await conn.batch(
    "INSERT INTO `problem_extended` values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    problemExtendedMapped
  );
}

module.exports = storeAllProblemsExtended;
