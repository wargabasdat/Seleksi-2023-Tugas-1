const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function secondDiagram(conn) {
  const result = (
    await conn.query(
      "SELECT solution_type, COUNT(*) amount FROM problem GROUP BY solution_type;"
    )
  ).map(({ solution_type, amount }) => {
    return { solution_type, amount: Number(amount) };
  });

  FileSystem.writeFileSync("../data/2.json", JSON.stringify(result));
}

module.exports = secondDiagram;
