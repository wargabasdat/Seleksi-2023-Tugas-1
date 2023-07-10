const mariadb = require("mariadb");
const connWrapper = require("./utilities/connWrapper");
const firstDiagram = require("./generator/1");
const secondDiagram = require("./generator/2");
const thirdDiagram = require("./generator/3");
const fourthDiagram = require("./generator/4");
const fifthDiagram = require("./generator/5");
const sixthDiagram = require("./generator/6");
const seventhDiagram = require("./generator/7");
const eightDiagram = require("./generator/8");
const ninthDiagram = require("./generator/9");
const tenthDiagram = require("./generator/10");
const eleventDiagram = require("./generator/11");
const twelfthDiagram = require("./generator/12");
const thirtheenthDiagram = require("./generator/13");
const fourteenthDiagram = require("./generator/14");
const fifteenthDiagram = require("./generator/15");

const pool = mariadb.createPool({
  host: "localhost",
  user: "root",
  password: "Bruh",
  connectionLimit: 1,
  database: "leetcode_insight",
});

(async () => {
  const conn = await pool.getConnection();

  await connWrapper(conn, fifteenthDiagram);
})().finally(() => {
  pool.end();
});
