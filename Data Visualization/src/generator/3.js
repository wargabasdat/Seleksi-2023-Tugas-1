const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function thirdDiagram(conn) {
  const result = (
    await conn.query(
      "SELECT difficulty, solution_type, COUNT(*) amount FROM problem GROUP BY difficulty, solution_type;"
    )
  ).map(({ difficulty, solution_type, amount }) => {
    return { difficulty, solution_type, amount: Number(amount) };
  });

  FileSystem.writeFileSync("../data/3.json", JSON.stringify(result));
}

module.exports = thirdDiagram;
