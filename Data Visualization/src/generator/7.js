const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function seventhDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH free_problem AS (SELECT * FROM problem WHERE premium_status IS FALSE),
premium_problem AS (SELECT * FROM problem WHERE premium_status IS TRUE)
SELECT concat(solution_type, '_premium') solution_type_and_status, COUNT(*) amount FROM premium_problem GROUP BY solution_type
UNION
SELECT concat(solution_type, '_free') solution_type_and_status, COUNT(*) amount FROM free_problem GROUP BY solution_type;
      `
    )
  ).map(({ solution_type_and_status, amount }) => {
    return {
      solution_type_and_status,
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/7.json", JSON.stringify(result));
}

module.exports = seventhDiagram;
