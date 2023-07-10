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
      SELECT solution_type, IF(premium_status, 'Premium', 'Free') is_premium, COUNT(*) amount FROM problem GROUP BY solution_type, premium_status;
      `
    )
  ).map(({ solution_type, is_premium, amount }) => {
    return {
      solution_type,
      is_premium,
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/7.json", JSON.stringify(result));
}

module.exports = seventhDiagram;
