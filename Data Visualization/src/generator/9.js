const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function ninthDiagram(conn) {
  const result = (
    await conn.query(
      `
      
SELECT IF(premium_status IS TRUE, 'premium_problem', 'free_problem') type, COUNT(*) amount FROM problem GROUP BY premium_status;

      `
    )
  ).map(({ type, amount }) => {
    return {
      type,
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/9.json", JSON.stringify(result));
}

module.exports = ninthDiagram;
