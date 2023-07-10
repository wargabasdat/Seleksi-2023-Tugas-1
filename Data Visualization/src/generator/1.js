const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function firstDiagram(conn) {
  const result = (
    await conn.query(
      "SELECT difficulty, COUNT(*) amount FROM problem GROUP BY difficulty"
    )
  ).map(({ difficulty, amount }) => {
    return { difficulty, amount: Number(amount) };
  });

  FileSystem.writeFileSync("../data/1.json", JSON.stringify(result));
}

module.exports = firstDiagram;
