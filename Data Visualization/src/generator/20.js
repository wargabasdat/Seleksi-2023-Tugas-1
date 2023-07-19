const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function twentiethDiagram(conn) {
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
	  ),
	  sector_ratio AS (
	  SELECT
		  *,
		  premium_count / total_count premium_ratio,
		  free_count / total_count free_ratio
	  FROM sector_count
	  )
	  SELECT STD(premium_ratio) premium_ratio_std_dev, STD(free_ratio) free_ratio_std_dev, AVG(premium_ratio) premium_ratio_average, AVG(free_ratio) free_ratio_average
	  FROM sector_ratio;
      `
    )
  ).map(
    ({
      premium_ratio_std_dev,
      free_ratio_std_dev,
      premium_ratio_average,
      free_ratio_average,
    }) => {
      return {
        premium_ratio_std_dev: Number(premium_ratio_std_dev),
        free_ratio_std_dev: Number(free_ratio_std_dev),
        premium_ratio_average: Number(premium_ratio_average),
        free_ratio_average: Number(free_ratio_average),
      };
    }
  );

  FileSystem.writeFileSync("../data/20.json", JSON.stringify(result));
}

module.exports = twentiethDiagram;
