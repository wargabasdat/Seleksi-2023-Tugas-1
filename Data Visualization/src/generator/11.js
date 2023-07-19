const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function eleventhDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH 
simplified_problem AS (
	SELECT 
		number, 
		difficulty 
	FROM problem
),
tag_and_problem AS (
	SELECT * 
	FROM tag_contain_problem JOIN 
		simplified_problem ON tag_contain_problem.problem_number = simplified_problem.number
),
tag_and_hard_problem AS (
	SELECT *
	FROM tag_and_problem
	WHERE difficulty = 'Hard'
),
tag_and_med_problem AS (
	SELECT *
	FROM tag_and_problem
	WHERE difficulty = 'Medium'
),
tag_and_easy_problem AS (
	SELECT * 
	FROM tag_and_problem 
	WHERE difficulty = 'Easy'
),
tag_and_count AS (
	SELECT tag_name, 
	COUNT(*) problem_count 
	FROM tag_and_problem 
	GROUP BY tag_name
),
tag_and_hard_count AS (
	SELECT 
		tag_name, 
		COUNT(*) hard_problem_count 
	FROM tag_and_hard_problem 
	GROUP BY tag_name
),
tag_and_medium_count AS (
	SELECT 
		tag_name, 
		COUNT(*) medium_problem_count 
	FROM tag_and_med_problem 
	GROUP BY tag_name
),
tag_and_easy_count AS (
	SELECT 
		tag_name, 
		COUNT(*) easy_problem_count 
	FROM tag_and_easy_problem  
	GROUP BY tag_name
),
hardest_ratio AS (
SELECT 
	tag_and_count.tag_name, 
	problem_count, 
	hard_problem_count, 
	IFNULL(hard_problem_count / problem_count, 0) 
	hard_ratio
	FROM 
		tag_and_hard_count RIGHT JOIN tag_and_count
			ON tag_and_hard_count.tag_name = tag_and_count.tag_name 
	ORDER BY hard_ratio 
	DESC
	LIMIT 10
)
SELECT 
	hardest_ratio.tag_name, 
	hard_ratio,  
	IFNULL(easy_problem_count, 0) easy_problem_count, 
	IFNULL(medium_problem_count, 0) medium_problem_count, 
	hard_problem_count, 
	problem_count 
FROM hardest_ratio LEFT JOIN tag_and_medium_count 
		ON hardest_ratio.tag_name = tag_and_medium_count.tag_name 
	LEFT JOIN tag_and_easy_count 
		ON hardest_ratio.tag_name = tag_and_easy_count.tag_name;
      `
    )
  ).map(
    ({
      tag_name,
      hard_ratio,
      easy_problem_count,
      medium_problem_count,
      hard_problem_count,
      problem_count,
    }) => {
      return {
        tag_name,
        hard_ratio: Number(hard_ratio),
        easy_problem_count: Number(easy_problem_count),
        medium_problem_count: Number(medium_problem_count),
        hard_problem_count: Number(hard_problem_count),
        problem_count: Number(problem_count),
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
		difficulty 
	FROM problem
),
tag_and_problem AS (
	SELECT * 
	FROM tag_contain_problem JOIN 
		simplified_problem ON tag_contain_problem.problem_number = simplified_problem.number
),
tag_and_hard_problem AS (
	SELECT *
	FROM tag_and_problem
	WHERE difficulty = 'Hard'
),
tag_and_med_problem AS (
	SELECT *
	FROM tag_and_problem
	WHERE difficulty = 'Medium'
),
tag_and_easy_problem AS (
	SELECT * 
	FROM tag_and_problem 
	WHERE difficulty = 'Easy'
),
tag_and_count AS (
	SELECT tag_name, 
	COUNT(*) problem_count 
	FROM tag_and_problem 
	GROUP BY tag_name
),
tag_and_hard_count AS (
	SELECT 
		tag_name, 
		COUNT(*) hard_problem_count 
	FROM tag_and_hard_problem 
	GROUP BY tag_name
),
tag_and_medium_count AS (
	SELECT 
		tag_name, 
		COUNT(*) medium_problem_count 
	FROM tag_and_med_problem 
	GROUP BY tag_name
),
tag_and_easy_count AS (
	SELECT 
		tag_name, 
		COUNT(*) easy_problem_count 
	FROM tag_and_easy_problem  
	GROUP BY tag_name
),
easiest_ratio AS (
	SELECT 
		tag_and_count.tag_name, 
		problem_count,
		easy_problem_count, 
		IFNULL(easy_problem_count / problem_count, 0)  easy_ratio 
	FROM tag_and_easy_count RIGHT JOIN tag_and_count 
			ON tag_and_easy_count.tag_name = tag_and_count.tag_name 
		ORDER BY easy_ratio 
		DESC
		LIMIT 10
)
SELECT 
	easiest_ratio.tag_name, 
	easy_ratio, 
	easy_problem_count, 
	IFNULL(medium_problem_count, 0) medium_problem_count, 
	IFNULL(hard_problem_count, 0) hard_problem_count, 
	problem_count 
FROM easiest_ratio LEFT JOIN tag_and_medium_count
			ON easiest_ratio.tag_name = tag_and_medium_count.tag_name 
		LEFT JOIN tag_and_hard_count 
			ON easiest_ratio.tag_name = tag_and_hard_count.tag_name;
      `
    )
  ).map(
    ({
      tag_name,
      easy_ratio,
      easy_problem_count,
      medium_problem_count,
      hard_problem_count,
      problem_count,
    }) => {
      return {
        tag_name,
        easy_ratio: Number(easy_ratio),
        easy_problem_count: Number(easy_problem_count),
        medium_problem_count: Number(medium_problem_count),
        hard_problem_count: Number(hard_problem_count),
        problem_count: Number(problem_count),
      };
    }
  );

  FileSystem.writeFileSync(
    "../data/11.json",
    JSON.stringify({ easiest: result2, hardest: result })
  );
}

module.exports = eleventhDiagram;
