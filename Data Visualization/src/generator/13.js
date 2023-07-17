const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function thirteenthDiagram(conn) {
  const result = (
    await conn.query(
      `
	  WITH
	  acceptance_rate_categorization AS (
		  SELECT
			  *,
			  IF(acceptance_rate < 75,
			  IF(acceptance_rate < 50,
			  IF(acceptance_rate < 25,
			  'Very Low',
			  'Low'),
			  'High'),
			  'Very High') acceptance_rate_category
			  FROM problem
	  ),
	  simplified_problem AS (
		  SELECT
			  number,
			  acceptance_rate_category
		  FROM acceptance_rate_categorization
	  ),
	  tag_and_problem AS (
		  SELECT *
		  FROM tag_contain_problem JOIN
			  simplified_problem ON tag_contain_problem.problem_number = simplified_problem.number
	  ),
	  vhigh_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'Very High'
	  ),
	  high_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'High'
	  ),
	  low_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'Low'
	  ),
	  
	  vlow_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'Very Low'
	  ),
	  tag_and_count AS (
		  SELECT tag_name,
		  COUNT(*) problem_count
		  FROM tag_and_problem
		  GROUP BY tag_name
	  ),
	  tag_and_vl_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) vlow_acceptance_problem_count
		  FROM vlow_problem
		  GROUP BY tag_name
	  ),
	  tag_and_l_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) low_acceptance_problem_count
		  FROM low_problem
		  GROUP BY tag_name
	  ),
	  
	  tag_and_h_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) high_acceptance_problem_count
		  FROM high_problem
		  GROUP BY tag_name
	  ),
	  tag_and_vh_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) vhigh_acceptance_problem_count
		  FROM vhigh_problem
		  GROUP BY tag_name
	  ),
	  easiest_ratio AS (
	  SELECT
		  tag_and_count.tag_name,
		  vhigh_acceptance_problem_count,
		  problem_count,
		  IFNULL(vhigh_acceptance_problem_count / problem_count, 0)
		  easy_ratio
		  FROM
			  tag_and_vh_a_count RIGHT JOIN tag_and_count
				  ON tag_and_vh_a_count.tag_name = tag_and_count.tag_name
		  ORDER BY easy_ratio
		  DESC
		  LIMIT 10
	  )
	  SELECT
		  easiest_ratio.tag_name,
		  easy_ratio,
		  vhigh_acceptance_problem_count very_high_acceptance_problem_count,
		  IFNULL(high_acceptance_problem_count, 0) high_acceptance_problem_count,
		  IFNULL(low_acceptance_problem_count, 0) low_acceptance_problem_count,
		  IFNULL(vlow_acceptance_problem_count, 0) very_low_acceptance_problem_count,
		  problem_count
	  FROM easiest_ratio LEFT JOIN tag_and_h_a_count
			  ON easiest_ratio.tag_name = tag_and_h_a_count.tag_name
		  LEFT JOIN tag_and_l_a_count
			  ON easiest_ratio.tag_name = tag_and_l_a_count.tag_name
		  LEFT JOIN tag_and_vl_a_count
			  ON easiest_ratio.tag_name = tag_and_vl_a_count.tag_name;
      `
    )
  ).map(
    ({
      tag_name,
      easy_ratio,
      very_high_acceptance_problem_count,
      high_acceptance_problem_count,
      low_acceptance_problem_count,
      very_low_acceptance_problem_count,
      problem_count,
    }) => {
      return {
        tag_name,
        easy_ratio: Number(easy_ratio),
        very_high_acceptance_problem_count: Number(
          very_high_acceptance_problem_count
        ),
        high_acceptance_problem_count: Number(high_acceptance_problem_count),
        low_acceptance_problem_count: Number(low_acceptance_problem_count),
        very_low_acceptance_problem_count: Number(
          very_low_acceptance_problem_count
        ),
        problem_count: Number(problem_count),
      };
    }
  );

  const result2 = (
    await conn.query(
      `
	  WITH
	  acceptance_rate_categorization AS (
		  SELECT
			  *,
			  IF(acceptance_rate < 75,
			  IF(acceptance_rate < 50,
			  IF(acceptance_rate < 25,
			  'Very Low',
			  'Low'),
			  'High'),
			  'Very High') acceptance_rate_category
			  FROM problem
	  ),
	  simplified_problem AS (
		  SELECT
			  number,
			  acceptance_rate_category
		  FROM acceptance_rate_categorization
	  ),
	  tag_and_problem AS (
		  SELECT *
		  FROM tag_contain_problem JOIN
			  simplified_problem ON tag_contain_problem.problem_number = simplified_problem.number
	  ),
	  vhigh_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'Very High'
	  ),
	  high_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'High'
	  ),
	  low_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'Low'
	  ),
	  
	  vlow_problem AS (
		  SELECT *
		  FROM tag_and_problem
		  WHERE acceptance_rate_category = 'Very Low'
	  ),
	  tag_and_count AS (
		  SELECT tag_name,
		  COUNT(*) problem_count
		  FROM tag_and_problem
		  GROUP BY tag_name
	  ),
	  tag_and_vl_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) vlow_acceptance_problem_count
		  FROM vlow_problem
		  GROUP BY tag_name
	  ),
	  tag_and_l_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) low_acceptance_problem_count
		  FROM low_problem
		  GROUP BY tag_name
	  ),
	  
	  tag_and_h_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) high_acceptance_problem_count
		  FROM high_problem
		  GROUP BY tag_name
	  ),
	  tag_and_vh_a_count AS (
		  SELECT
			  tag_name,
			  COUNT(*) vhigh_acceptance_problem_count
		  FROM vhigh_problem
		  GROUP BY tag_name
	  ),
	  hardest_ratio AS (
	  SELECT
		  tag_and_count.tag_name,
		  vlow_acceptance_problem_count,
		  problem_count,
		  IFNULL(vlow_acceptance_problem_count / problem_count, 0)
		  hard_ratio
		  FROM
			  tag_and_vl_a_count RIGHT JOIN tag_and_count
				  ON tag_and_vl_a_count.tag_name = tag_and_count.tag_name
		  ORDER BY hard_ratio
		  DESC
		  LIMIT 10
	  )
	  SELECT
		  hardest_ratio.tag_name,
		  hard_ratio,
		  vlow_acceptance_problem_count very_low_acceptance_problem_count,
		  IFNULL(high_acceptance_problem_count, 0) high_acceptance_problem_count,
		  IFNULL(low_acceptance_problem_count, 0) low_acceptance_problem_count,
		  IFNULL(vhigh_acceptance_problem_count, 0) very_high_acceptance_problem_count,
		  problem_count
	  FROM hardest_ratio LEFT JOIN tag_and_h_a_count
			  ON hardest_ratio.tag_name = tag_and_h_a_count.tag_name
		  LEFT JOIN tag_and_l_a_count
			  ON hardest_ratio.tag_name = tag_and_l_a_count.tag_name
		  LEFT JOIN tag_and_vh_a_count
			  ON hardest_ratio.tag_name = tag_and_vh_a_count.tag_name;
      `
    )
  ).map(
    ({
      tag_name,
      hard_ratio,
      very_high_acceptance_problem_count,
      high_acceptance_problem_count,
      low_acceptance_problem_count,
      very_low_acceptance_problem_count,
      problem_count,
    }) => {
      return {
        tag_name,
        hard_ratio: Number(hard_ratio),
        very_high_acceptance_problem_count: Number(
          very_high_acceptance_problem_count
        ),
        high_acceptance_problem_count: Number(high_acceptance_problem_count),
        low_acceptance_problem_count: Number(low_acceptance_problem_count),
        very_low_acceptance_problem_count: Number(
          very_low_acceptance_problem_count
        ),
        problem_count: Number(problem_count),
      };
    }
  );

  FileSystem.writeFileSync(
    "../data/13.json",
    JSON.stringify({ easiest: result, hardest: result2 })
  );
}

module.exports = thirteenthDiagram;
