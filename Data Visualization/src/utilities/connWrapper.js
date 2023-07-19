const mariadb = require("mariadb");

/**
 * Callback that receive a db connection
 *
 * @callback connReceivingCallback
 * @param {mariadb.PoolConnection} conn - DB connection
 * @returns {Promise<void>}
 */

/**
 *
 * @param {mariadb.PoolConnection} conn
 * @param {connReceivingCallback} functionToRun
 */
async function connWrapper(conn, functionToRun) {
  await functionToRun(conn);
  await conn.end();
}

module.exports = connWrapper;
