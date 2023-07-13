/**
 * Main scrapping file
 * @author Ahmad Rizki - 18221071
 */

const moment = require('moment');
const retriever = require('./retriever');
const parser = require('./parser');
const fs = require("fs");


// this constant specifies how many date ranges to be retrieved from the website
const ITERATION = 100;

main();

/**
 * Main function
 * @returns {Promise<void>}
 */
async function main() {
  let date = moment().format('YYYY-MM-DD');
  let nested_data = [];

  for (let i = 0; i < ITERATION; i++) {
    let html = await retriever(date);
    let start_date = parser.extract_start_date(html);
    let end_date = parser.extract_end_date(html);
    let tables = parser.extract_tables(html);

    nested_data.push({
      start_date: start_date,
      end_date: end_date,
      data: tables
    });

    date = moment(start_date).subtract(1, 'days').format('YYYY-MM-DD');
  }

  write_to_json('../data/kurs_pajak.json', nested_data);
  write_normalized_to_json('../data/kurs_pajak_normalized.json', nested_data);
  console.log('[+] Done. Data written to JSON file!');
};

/**
 * write normalized data to JSON file
 * @param filename
 * @param data nested data
 */
function write_normalized_to_json(filename, data) {
  let normalized_data = normalize_to_rdb(data);
  write_to_json(filename, normalized_data);
};


/**
 * write data to JSON file
 * @param filename
 * @param data nested data
 */
function write_to_json(filename, data) {
  let str_write = JSON.stringify(data, null, 4);
  fs.writeFileSync(filename, str_write);
};


/**
 * normalize nested data to relational, normalized format
 * @param data nested data
 * @returns {currencies: [], records: []}
 */
function normalize_to_rdb(data) {
  let currency_map = {};
  let currency_records = [];
  let currency_names = [];

  // iterate through nested data
  data.forEach((row) => {
    let records = row.data;
    records.forEach((record) => {
      // check if currency code is already added
      if (!currency_map[record.currency_code]) {
        // add currency name
        currency_names.push({
          currency: record.currency,
          currency_code: record.currency_code
        });

        // add currency code to map
        currency_map[record.currency_code] = true;
      }

      // add currency record
      currency_records.push({
        currency_code: record.currency_code,
        value: record.value,
        change: record.change,
        start_date: row.start_date,
        end_date: row.end_date
      })
    });
  });

  return {
    currencies: currency_names,
    kurs_pajak: currency_records
  };
};