const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fourteenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH hard_problem AS (SELECT * FROM problem WHERE difficulty = 'Hard')
      SELECT solution_type, COUNT(*) amount, AVG(acceptance_rate) average_acceptance, MAX(acceptance_rate) max_acceptance, MIN(acceptance_rate) min_acceptance  FROM hard_problem GROUP BY solution_type;
      `
    )
  ).map(
    ({
      solution_type,
      amount,
      average_acceptance,
      max_acceptance,
      min_acceptance,
    }) => {
      return {
        solution_type,
        average_acceptance: Number(average_acceptance),
        max_acceptance: Number(max_acceptance),
        min_acceptance: Number(min_acceptance),
        amount: Number(amount),
      };
    }
  );

  FileSystem.writeFileSync("../data/14.json", JSON.stringify(result));
}

module.exports = fourteenthDiagram;
