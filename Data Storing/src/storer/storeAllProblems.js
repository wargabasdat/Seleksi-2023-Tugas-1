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

  const problemExtendedMapped = problems.map(
    ({
      number,
      premiumStatus,
      title,
      acceptanceRate,
      difficulty,
      solutionType,
      category,
    }) => {
      if (premiumStatus) {
        return [
          number,
          title,
          solutionType,
          difficulty,
          premiumStatus,
          category,
          acceptanceRate,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        ];
      }
      const {
        content,
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
        title,
        solutionType,
        difficulty,
        premiumStatus,
        category,
        acceptanceRate,
        content,
        numberOfLikes,
        numberOfDislikes,
        numberOfAcceptedSubmission,
        numberOfSubmission,
        numberOfDiscussion,
        numberOfSolutions,
      ];
    }
  );

  await conn.batch(
    "INSERT INTO `problem` values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)",
    problemExtendedMapped
  );

  // await conn.query("DELETE FROM `problem` WHERE TRUE");
}

module.exports = storeAllProblems;
