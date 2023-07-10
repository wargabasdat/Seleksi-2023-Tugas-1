const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function twelfthDiagram(conn) {
  const result = (
    await conn.query(
      `
      SELECT number, title, acceptance_rate, difficulty, number_of_submission FROM problem
      ORDER BY acceptance_rate DESC LIMIT 5;      `
    )
  ).map(
    ({ number, title, acceptance_rate, difficulty, number_of_submission }) => {
      return {
        number: Number(number),
        title,
        difficulty,
        acceptance_rate: Number(acceptance_rate),
        number_of_submission: number_of_submission
          ? Number(number_of_submission)
          : null,
      };
    }
  );

  FileSystem.writeFileSync("../data/12.json", JSON.stringify(result));
}

module.exports = twelfthDiagram;
