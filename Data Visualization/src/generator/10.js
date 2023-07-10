const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function tenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      
      SELECT difficulty, IF(premium_status IS TRUE, 'premium_problem', 'free_problem') is_premium, COUNT(*) amount FROM problem GROUP BY difficulty, premium_status;
      `
    )
  ).map(({ difficulty, solution_type, amount }) => {
    return {
      difficulty,
      solution_type,
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/10.json", JSON.stringify(result));
}

module.exports = tenthDiagram;
