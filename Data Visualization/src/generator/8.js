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
      WITH amount_of_premium AS (SELECT IF(premium_status, 'Premium', 'Free') is_premium, COUNT(*) amount FROM problem GROUP BY premium_status),
unnormalized_data AS (SELECT solution_type, IF(premium_status, 'Premium', 'Free') is_premium, COUNT(*) amount FROM problem GROUP BY solution_type, premium_status)
SELECT is_premium, solution_type, (amount / (SELECT amount FROM amount_of_premium WHERE amount_of_premium.is_premium = unnormalized_data.is_premium LIMIT  1)) normalized_amount FROM unnormalized_data;

      `
    )
  ).map(({ solution_type, is_premium, normalized_amount }) => {
    return {
      solution_type,
      is_premium,
      normalized_amount: Number(normalized_amount),
    };
  });

  FileSystem.writeFileSync("../data/8.json", JSON.stringify(result));
}

module.exports = eightDiagram;
