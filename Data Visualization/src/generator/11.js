const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function eleventDiagram(conn) {
  const result = (
    await conn.query(
      `
      SELECT COUNT(*) amount, IFNULL(category, 'uncategorized') 'category'
FROM problem GROUP BY category;
      `
    )
  ).map(({ category, amount }) => {
    return {
      category,
      amount: Number(amount),
    };
  });

  FileSystem.writeFileSync("../data/11.json", JSON.stringify(result));
}

module.exports = eleventDiagram;
