const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function tenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH tag_and_count AS (SELECT tag_name, COUNT(*) problem_count FROM tag_contain_problem GROUP BY tag_name),
tag_and_disliked_problem_count AS (SELECT tag_name, COUNT(*) disliked_problem_count FROM (SELECT * FROM tag_contain_problem JOIN problem p on tag_contain_problem.problem_number = p.number WHERE p.number_of_likes < p.number_of_dislikes) as filtered_tag_problem GROUP BY tag_name),
calculated_table AS (SELECT tag_and_disliked_problem_count.tag_name, problem_count, disliked_problem_count, disliked_problem_count / problem_count ratio FROM tag_and_disliked_problem_count LEFT JOIN tag_and_count ON tag_and_count.tag_name = tag_and_disliked_problem_count.tag_name)
SELECT * FROM calculated_table WHERE disliked_problem_count > 10 ORDER BY ratio DESC LIMIT 10;
      `
    )
  ).map(({ tag_name, problem_count, disliked_problem_count, ratio }) => {
    return {
      tag_name,
      problem_count: Number(problem_count),
      disliked_problem_count: Number(disliked_problem_count),
      ratio: Number(ratio),
    };
  });

  const result2 = (
    await conn.query(
      `
      WITH tag_and_count AS (SELECT tag_name, COUNT(*) problem_count FROM tag_contain_problem GROUP BY tag_name),
tag_and_liked_problem_count AS (SELECT tag_name, COUNT(*) liked_problem_count FROM (SELECT * FROM tag_contain_problem JOIN problem p on tag_contain_problem.problem_number = p.number WHERE p.number_of_likes >= p.number_of_dislikes) as filtered_tag_problem GROUP BY tag_name),
calculated_table AS (SELECT tag_and_liked_problem_count.tag_name, problem_count, liked_problem_count, liked_problem_count / problem_count ratio FROM tag_and_liked_problem_count LEFT JOIN tag_and_count ON tag_and_count.tag_name = tag_and_liked_problem_count.tag_name)
SELECT * FROM calculated_table WHERE liked_problem_count > 10 ORDER BY ratio DESC LIMIT 10;
      `
    )
  ).map(({ tag_name, problem_count, liked_problem_count, ratio }) => {
    return {
      tag_name,
      problem_count: Number(problem_count),
      liked_problem_count: Number(liked_problem_count),
      ratio: Number(ratio),
    };
  });

  FileSystem.writeFileSync(
    "../data/10.json",
    JSON.stringify({ likes: result2, dislikes: result })
  );
}

module.exports = tenthDiagram;
