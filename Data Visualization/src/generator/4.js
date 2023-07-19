const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fourthDiagram(conn) {
  const result = (
    await conn.query(
      `
      SELECT number, LOG(10, number_of_submission) log_number_of_submission FROM problem WHERE premium_status = false ORDER BY number ASC ;
      `
    )
  ).map(({ number, log_number_of_submission }) => {
    return {
      number: Number(number),
      log_number_of_submission: Number(log_number_of_submission),
    };
  });

  FileSystem.writeFileSync("../data/4.json", JSON.stringify(result));
}

module.exports = fourthDiagram;
