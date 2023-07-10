const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fourthDiagram(conn) {
  const result = (
    await conn.query(
      "SELECT solution_type, MAX(number_of_submission) maximum, MIN(number_of_submission) minimum, AVG(number_of_submission) average FROM problem GROUP BY solution_type;"
    )
  ).map(({ solution_type, maximum, minimum, average }) => {
    return {
      solution_type,
      maximum: Number(maximum),
      minimum: Number(minimum),
      average: Number(average),
    };
  });

  FileSystem.writeFileSync("../data/4.json", JSON.stringify(result));
}

module.exports = fourthDiagram;
