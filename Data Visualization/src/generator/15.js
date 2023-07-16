const FileSystem = require("fs");
const mariaDB = require("mariadb");
/**
 *
 * @param {mariaDB.PoolConnection} conn
 */
async function fifteenthDiagram(conn) {
  const result = (
    await conn.query(
      `
      WITH problem_sol_sub_ratio AS (
        SELECT number, solution_type, number_of_solution, number_of_submission, number_of_solution / number_of_submission sol_sub_ratio FROM problem WHERE premium_status = FALSE AND NOT ISNULL(number_of_solution)
    )
    SELECT solution_type, AVG(sol_sub_ratio) average_ratio, MAX(sol_sub_ratio) max_ratio, MIN(sol_sub_ratio) min_ratio FROM problem_sol_sub_ratio GROUP BY solution_type;
    
    
    
    
      `
    )
  ).map(({ solution_type, average_ratio, max_ratio, min_ratio }) => {
    return {
      solution_type,
      average_ratio: Number(average_ratio),
      max_ratio: Number(max_ratio),
      min_ratio: Number(min_ratio),
    };
  });

  FileSystem.writeFileSync("../data/15.json", JSON.stringify(result));
}

module.exports = fifteenthDiagram;
