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
    let id = parser.extract_id(html);
    let start_date = parser.extract_start_date(html);
    let end_date = parser.extract_end_date(html);
    let tables = parser.extract_tables(html);

    nested_data.push({
      doc_id : id,
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
  let documment_map = {};
  let currency_records = [];
  let currency_names = [];
  let documents = [];


  // iterate through nested data
  data.forEach((row) => {
    let records = row.data;
    records.forEach((record) => {
      // check if currency code is already added
      if (!currency_map[record.currency_code]) {
        // add currency name
        currency_names.push({
          currency_code: record.currency_code,
          currency_name: record.currency
        });

        // add currency code to map
        currency_map[record.currency_code] = true;
      }

      // check if document is already added
      if (!documment_map[row.doc_id]) {
        // add document
        documents.push({
          doc_id: row.doc_id,
          start_date: row.start_date,
          end_date: row.end_date,
        });

        // add document to map
        documment_map[row.doc_id] = true;
      }

      // add currency record
      currency_records.push({
        doc_id: row.doc_id,
        no_urut: record.row_id,
        currency_code: record.currency_code,
        value_in_rupiah: record.value,
      })
    });
  });

  return {
    currency: currency_names,
    kurs_pajak_document: documents,
    nilai_kurs: currency_records
  };
};