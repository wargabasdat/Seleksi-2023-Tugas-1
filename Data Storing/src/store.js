const mariadb = require("mariadb");
const storeAllProblems = require("./storer/storeAllProblems");
const connWrapper = require("./utilities/connWrapper");
const storeAllTags = require("./storer/storeAllTags");
const storeAllProblemsExtended = require("./storer/storeAllProblemsExtended");
const pool = mariadb.createPool({
  host: "localhost",
  user: "root",
  password: "Bruh",
  connectionLimit: 1,
  database: "leetcode_insight",
});

(async () => {
  const conn = await pool.getConnection();

  await connWrapper(conn, storeAllProblems);
  await connWrapper(conn, storeAllTags);
  await connWrapper(conn, storeAllProblemsExtended);
})().finally(() => {
  pool.end();
});
