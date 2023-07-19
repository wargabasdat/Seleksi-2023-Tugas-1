const mariadb = require("mariadb");
const connWrapper = require("./utilities/connWrapper");

const pool = mariadb.createPool({
  host: "localhost",
  user: "root",
  password: "Bruh",
  connectionLimit: 1,
  database: "leetcode_insight",
});

(async () => {
  const conn = await pool.getConnection();
})().finally(() => {
  pool.end();
});
