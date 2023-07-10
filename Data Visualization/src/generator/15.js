const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fifteenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      SELECT difficulty,solution_type , COUNT(*) amount, AVG(acceptance_rate) average_acceptance  FROM problem GROUP BY solution_type, difficulty ORDER BY difficulty, solution_type;
      `
    )
  ).map(({ solution_type, difficulty, amount, average_acceptance }) => {
    return {
      solution_type,
      difficulty,
      average_acceptance: Number(average_acceptance),
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/15.json", JSON.stringify(result));
}

module.exports = fifteenthDiagram;
