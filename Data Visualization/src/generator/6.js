const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function sixthDiagram(conn) {
  const result = (
    await conn.query(
      "SELECT number, title, difficulty, number_of_likes, number_of_submission FROM problem WHERE number_of_submission > 50000 ORDER BY (number_of_likes / number_of_submission)DESC LIMIT 10;"
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

  FileSystem.writeFileSync("../data/6.json", JSON.stringify(result));
}

module.exports = sixthDiagram;
