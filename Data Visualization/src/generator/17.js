const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function seventeenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH 
simplified_problem AS (
	SELECT 
		number,
		difficulty,
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
		CASE WHEN difficulty = 'Easy'
			THEN 1 
			ELSE null 
		END) easy_count,
	COUNT(
		CASE WHEN difficulty = 'Medium'
			THEN 1
			ELSE null
			END)  medium_count,
	COUNT(
		CASE WHEN difficulty = 'Hard'
			THEN 1 
			ELSE null 
			END) hard_count 
	FROM simplified_problem 
	GROUP BY sector_number
)
SELECT 
	*,
	easy_count / total_count easy_ratio,
	medium_count / total_count medium_ratio,
	hard_count / total_count hard_ratio 
FROM sector_count;
      `
    )
  ).map(
    ({
      sector_number,
      lower_limit,
      upper_limit,
      total_count,
      easy_count,
      medium_count,
      hard_count,
      easy_ratio,
      medium_ratio,
      hard_ratio,
    }) => {
      return {
        sector_number: Number(sector_number),
        lower_limit: Number(lower_limit),
        upper_limit: Number(upper_limit),
        total_count: Number(total_count),
        easy_count: Number(easy_count),
        medium_count: Number(medium_count),
        hard_count: Number(hard_count),
        easy_ratio: Number(easy_ratio),
        medium_ratio: Number(medium_ratio),
        hard_ratio: Number(hard_ratio),
      };
    }
  );

  FileSystem.writeFileSync("../data/17.json", JSON.stringify(result));
}

module.exports = seventeenthDiagram;
