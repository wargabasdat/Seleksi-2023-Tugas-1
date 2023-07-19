const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function eightteenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH 
simplified_problem AS (
	SELECT 
		number,
		premium_status,
		CEIL(number / 10) sector_number
	FROM problem 
	ORDER BY number
),
sector_count AS (
SELECT
	sector_number,
	MIN(number) lower_limit,
	MAX(number) upper_limit,
	COUNT(*) total_count,
	COUNT(
		CASE WHEN premium_status = TRUE
			THEN 1
			ELSE null
		END) premium_count,
		COUNT(
			CASE WHEN premium_status = FALSE
				THEN 1
				ELSE null
		END) free_count 
	FROM simplified_problem 
	GROUP BY sector_number
)
SELECT 
	*,
	premium_count / total_count premium_ratio, 
	free_count / total_count free_ratio
FROM sector_count;
      `
    )
  ).map(
    ({
      sector_number,
      lower_limit,
      upper_limit,
      total_count,
      free_count,
      premium_count,
      premium_ratio,
      free_ratio,
    }) => {
      return {
        sector_number: Number(sector_number),
        lower_limit: Number(lower_limit),
        upper_limit: Number(upper_limit),
        total_count: Number(total_count),
        free_count: Number(free_count),
        premium_count: Number(premium_count),
        premium_ratio: Number(premium_ratio),
        free_ratio: Number(free_ratio),
      };
    }
  );

  FileSystem.writeFileSync("../data/18.json", JSON.stringify(result));
}

module.exports = eightteenthDiagram;
