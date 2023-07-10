const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fifthDiagram(conn) {
  const result = (
    await conn.query(
      "SELECT number, title, difficulty, number_of_likes, number_of_submission FROM problem ORDER BY (number_of_likes / number_of_submission) DESC LIMIT 10"
    )
  ).map(
    ({ number, title, difficulty, number_of_likes, number_of_submission }) => {
      return {
        number: Number(number),
        title,
        difficulty,
        number_of_likes: Number(number_of_likes),
        number_of_submission: Number(number_of_submission),
      };
    }
  );

  FileSystem.writeFileSync("../data/5.json", JSON.stringify(result));
}

module.exports = fifthDiagram;
