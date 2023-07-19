const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function sixteenthDiagram(conn) {
  const result = (
    await conn.query(
      `
	  
WITH 
simplified_problem AS (
	SELECT 
		number,
		premium_status
	FROM problem
),
tag_and_premium_status AS (
	SELECT * 
	FROM 
		simplified_problem JOIN tag_contain_problem 
			ON simplified_problem.number = tag_contain_problem.problem_number
),
tag_and_count AS(
SELECT 
	tag_name, 
	COUNT(
		CASE WHEN premium_status = TRUE 
			THEN 1 
			ELSE NULL END) 
		premium_count, 
	COUNT(
			CASE WHEN premium_status = FALSE
			THEN 1
			ELSE NULL END)
		free_count, 
	COUNT(*) total_count 
	FROM tag_and_premium_status 
	GROUP BY tag_name
)
SELECT 
	*,
	(premium_count / free_count) premium_free_ratio 
FROM tag_and_count
ORDER BY premium_free_ratio
LIMIT 10;
      `
    )
  ).map(
    ({
      tag_name,
      premium_count,
      free_count,
      total_count,
      premium_free_ratio,
    }) => {
      return {
        tag_name,
        premium_count: Number(premium_count),
        free_count: Number(free_count),
        total_count: Number(total_count),
        premium_free_ratio: Number(premium_free_ratio),
      };
    }
  );

  const result2 = (
    await conn.query(
      `
	  WITH 
simplified_problem AS (
	SELECT 
		number,
		premium_status
	FROM problem
),
tag_and_premium_status AS (
	SELECT * 
	FROM 
		simplified_problem JOIN tag_contain_problem 
			ON simplified_problem.number = tag_contain_problem.problem_number
),
tag_and_count AS(
SELECT 
	tag_name, 
	COUNT(
		CASE WHEN premium_status = TRUE 
			THEN 1 
			ELSE NULL END) 
		premium_count, 
	COUNT(
			CASE WHEN premium_status = FALSE
			THEN 1
			ELSE NULL END)
		free_count, 
	COUNT(*) total_count 
	FROM tag_and_premium_status 
	GROUP BY tag_name
)
SELECT 
	*,
	(premium_count / free_count) premium_free_ratio 
FROM tag_and_count
ORDER BY premium_free_ratio
DESC LIMIT 10;
      `
    )
  ).map(
    ({
      tag_name,
      premium_count,
      free_count,
      total_count,
      premium_free_ratio,
    }) => {
      return {
        tag_name,
        premium_count: Number(premium_count),
        free_count: Number(free_count),
        total_count: Number(total_count),
        premium_free_ratio: Number(premium_free_ratio),
      };
    }
  );

  FileSystem.writeFileSync(
    "../data/16.json",
    JSON.stringify({ premiumest: result2, freest: result })
  );
}

module.exports = sixteenthDiagram;
