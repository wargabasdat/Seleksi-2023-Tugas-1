const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function thirtheenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH high_acceptance_problem AS (SELECT * FROM problem WHERE acceptance_rate > 75)
      SELECT difficulty, COUNT(*) amount FROM high_acceptance_problem
      GROUP BY difficulty
      ORDER BY acceptance_rate DESC;
      `
    )
  ).map(({ difficulty, amount }) => {
    return {
      difficulty,
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/13.json", JSON.stringify(result));
}

module.exports = thirtheenthDiagram;
