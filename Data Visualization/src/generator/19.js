const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function nineteenthDiagram(conn) {
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
),
sector_ratio AS ( 
	SELECT
				*,
				easy_count / total_count easy_ratio,
				medium_count / total_count medium_ratio,
				hard_count / total_count hard_ratio
	FROM sector_count
)
SELECT 
	STD(easy_ratio) easy_ratio_std_dev,
	STD(medium_ratio) medium_ratio_std_dev,
	STD(hard_ratio) hard_ratio_std_dev,
	AVG(easy_ratio) easy_ratio_average,
	AVG(medium_ratio) medium_ratio_average,
	AVG(hard_ratio) hard_ratio_average
FROM sector_ratio;
      `
    )
  ).map(
    ({
      easy_ratio_std_dev,
      medium_ratio_std_dev,
      hard_ratio_std_dev,
      easy_ratio_average,
      medium_ratio_average,
      hard_ratio_average,
    }) => {
      return {
        easy_ratio_std_dev: Number(easy_ratio_std_dev),
        medium_ratio_std_dev: Number(medium_ratio_std_dev),
        hard_ratio_std_dev: Number(hard_ratio_std_dev),
        easy_ratio_average: Number(easy_ratio_average),
        medium_ratio_average: Number(medium_ratio_average),
        hard_ratio_average: Number(hard_ratio_average),
      };
    }
  );

  FileSystem.writeFileSync("../data/19.json", JSON.stringify(result));
}

module.exports = nineteenthDiagram;
