const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fifthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH simplified_problem AS (SELECT number, number_of_likes, number_of_dislikes FROM problem),
     tag_like_dislike AS (SELECT tag_name, SUM(number_of_likes) total_likes, SUM(number_of_dislikes) total_dislike FROM simplified_problem JOIN tag_contain_problem ON tag_contain_problem.problem_number = simplified_problem.number GROUP BY tag_name)
SELECT tag_name, total_likes, total_dislike, (total_likes / total_dislike) ratio FROM tag_like_dislike ORDER BY ratio DESC LIMIT 10;
      `
    )
  ).map(({ tag_name, total_likes, total_dislike, ratio }) => {
    return {
      tag_name,
      total_likes: Number(total_likes),
      total_dislike: Number(total_dislike),
      ratio: Number(ratio),
    };
  });

  const result2 = (
    await conn.query(
      `
      WITH simplified_problem AS (SELECT number, number_of_likes, number_of_dislikes FROM problem),
     tag_like_dislike AS (SELECT tag_name, SUM(number_of_likes) total_likes, SUM(number_of_dislikes) total_dislike FROM simplified_problem JOIN tag_contain_problem ON tag_contain_problem.problem_number = simplified_problem.number GROUP BY tag_name)
SELECT tag_name, total_likes, total_dislike, (total_likes / total_dislike) ratio FROM tag_like_dislike ORDER BY ratio ASC LIMIT 10;
      `
    )
  ).map(({ tag_name, total_likes, total_dislike, ratio }) => {
    return {
      tag_name,
      total_likes: Number(total_likes),
      total_dislike: Number(total_dislike),
      ratio: Number(ratio),
    };
  });

  FileSystem.writeFileSync(
    "../data/5.json",
    JSON.stringify({ dislikes: result2, likes: result })
  );
}

module.exports = fifthDiagram;
