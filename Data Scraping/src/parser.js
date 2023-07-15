/**
 * Page Parser
 * @author Ahmad Rizki - 18221071
 */

const cheerio = require('cheerio');

const bulan = {
  'Januari': 1,
  'Februari': 2,
  'Maret': 3,
  'April': 4,
  'Mei': 5,
  'Juni': 6,
  'Juli': 7,
  'Agustus': 8,
  'September': 9,
  'Oktober': 10,
  'November': 11,
  'Desember': 12
};



/**
 * extract tables from raw HTML
 * @param html (raw HTML string)
 * @returns Array array of tables
 */
module.exports.extract_tables = (html) => {
  const $ = cheerio.load(html);
    let table = $('table');
    let rows = extract_rows($, table);

    // exclude row 0, which is the header
    delete rows[0];

    let data = [];

    rows.forEach((row) => {
        let cells = extract_cells($, row);
        let parsed_row = parse_row(cells);

        data.push(parsed_row);
    });

    return data;
};


/**
 * 
 * @param html (raw HTML string)
 * @returns str (id of the records)
 */
module.exports.extract_id = (html) => {
  const $ = cheerio.load(html);

  let strong_block = $('strong');
  let id = strong_block.text().trim().replace("KMK Nomor ", '');

  return id;
}


/**
 * extract start_date of the records
 * @param html (raw HTML string)
 * @returns date (YYYY-MM-DD)
 */
module.exports.extract_start_date = (html) => {
  const $ = cheerio.load(html);

  let i_block = $('.text-muted > i');
  let date_range = i_block.text().trim().replace("Tanggal Berlaku: ", '');
  let dates = date_range.split(" - ");
  let start_date = dates[0];

  return format_date(start_date);
};

/**
 * extract end_date of the records
 * @param html (raw HTML string)
 * @returns date (YYYY-MM-DD)
 */

module.exports.extract_end_date = (html) => {
  const $ = cheerio.load(html);

  let i_block = $('.text-muted > i');
  let date_range = i_block.text().trim().replace("Tanggal Berlaku: ", '');
  let dates = date_range.split(" - ");
  let start_date = dates[1];

  return format_date(start_date);
};


/**
 * format date
 * @param str (date string)
 * @returns date (YYYY-MM-DD)
 */
function format_date(date_str) {
  let date_components = date_str.split(" ");

  if (!bulan[date_components[1]]) throw new Error("Invalid date format!");

  let month_int = bulan[date_components[1]];
  let format_date_str = `${date_components[2]}-${pad(month_int, 2)}-${date_components[0]}`;

  return format_date_str;
};

/**
 * extract rows from the table
 * @param cheerio (cheerio object)
 * @param table_selector (cherrio table DOM)
 * @returns array of cheerio <tr> DOMs
 */
function extract_rows(cheerio, table) {
  let rows = [];

  table.find('tr').each((i, row) => rows.push(cheerio(row)));

  return rows;
};

/**
 * extract cells from the row
 * @param cheerio (cheerio object)
 * @param row (cheerio <tr> DOM)
 * @returns array of cheerio <td> DOMs
 */
function extract_cells(cheerio, row) {
  let cells = [];
    row.find('td').each(function() {
        cells.push(cheerio(this).text());
    });

    return cells;
}

/**
 * parse row into object
 * @param row (cheerio <tr> DOM)
 * @returns {currency: *, currency_code: *, value, change}
 */
function parse_row(row) {
  return {
    row_id: parseInt(row[0]),
    currency: get_currency_name(row[1]),
    currency_code: get_currency_code(row[1]),
    value: format_float(row[2]),
    change: format_float(row[3])
  };
};


/**
 * format unformatted string into float
 * @param str (unformatted float string)
 * @returns float (formatted float)
 */
function format_float(value_str) {
  let formatted_str = value_str.replace(/\./g, '').replace(/,/g, '.');

  return parseFloat(formatted_str);
};


/**
 * extract currency name from combined currrncy name and code
 * @param str (combined currency name and code)
 * @returns string (currency name)
 */
function get_currency_name(combined_str) {
  return combined_str.replace(` (${get_currency_code(combined_str)})`, '').replace(`${get_currency_code(combined_str)}`, '').trim();
};


/**
 * extract currency code from combined currrncy name and code
 * @param str (combined currency name and code)
 * @returns string (currency code)
 */
function get_currency_code(combined_str) {
  return combined_str.match(/\((.*?)\)/)[1];
};


/**
 * pad number with leading zeros
 * @param num (number)
 * @param size (number of digits)
 * @param char (leading character)
 * @returns string (padded number)
 */
function pad(num, size, char = '0') {
  let s = num + "";

  while (s.length < size) s = char + s;

  return s;
};