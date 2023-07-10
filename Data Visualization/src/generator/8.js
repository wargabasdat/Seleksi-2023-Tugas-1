const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function eightDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH free_problem AS (SELECT * FROM problem WHERE premium_status IS FALSE),
premium_problem AS (SELECT * FROM problem WHERE premium_status IS TRUE),
number_of_free_problem AS (SELECT COUNT(*) number_of_free_problem FROM free_problem),
number_of_premium_problem AS (SELECT COUNT(*) number_of_premium_problem FROM premium_problem)
SELECT concat(solution_type, '_free') solution_type_and_status, (COUNT(*)/ number_of_free_problem) 'normalized_amount' FROM free_problem, number_of_free_problem GROUP BY solution_type
UNION
SELECT concat(solution_type, '_premium') solution_type_and_status, (COUNT(*)/ number_of_premium_problem) FROM premium_problem, number_of_premium_problem  GROUP BY solution_type;
      `
    )
  ).map(({ solution_type_and_status, normalized_amount }) => {
    return {
      solution_type_and_status,
      normalized_amount: Number(normalized_amount),
    };
  });

  FileSystem.writeFileSync("../data/8.json", JSON.stringify(result));
}

module.exports = eightDiagram;
