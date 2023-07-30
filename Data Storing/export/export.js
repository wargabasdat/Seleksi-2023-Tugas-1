const { Client } = require('pg');
const fs = require('fs');

// Baca data dari file JSON
const rawData = fs.readFileSync('D:\\Coding\\git-repo\\github\\Tugas1_Seleksi_Basdat\\Seleksi-2023-Tugas-1\\Data Scraping\\data\\kurs_pajak_normalized.json');
const data = JSON.parse(rawData);

// Konfigurasi koneksi ke database PostgreSQL
const dbConfig = {
  user: 'postgres',
  host: 'localhost',
  database: 'kurs_pajak_indonesia',
  password: '11062003',
  port: 5432, // Port default PostgreSQL
};

// Fungsi untuk menghapus semua data dari tabel "nilai_kurs"
async function deleteNilaiKursData(client) {
  try {
    await client.query('DELETE FROM nilai_kurs');
    console.log('Data has been deleted from the nilai_kurs table.');
  } catch (err) {
    console.error('Error while deleting nilai_kurs data:', err);
    throw err;
  }
}

// Fungsi untuk menghapus semua data dari tabel "kurs_pajak_document"
async function deleteKursPajakDocumentData(client) {
  try {
    await client.query('DELETE FROM kurs_pajak_document');
    console.log('Data has been deleted from the kurs_pajak_document table.');
  } catch (err) {
    console.error('Error while deleting kurs_pajak_document data:', err);
    throw err;
  }
}

// Fungsi untuk menghapus semua data dari tabel "currency"
async function deleteCurrencyData(client) {
  try {
    await client.query('DELETE FROM currency');
    console.log('Data has been deleted from the currency table.');
  } catch (err) {
    console.error('Error while deleting currency data:', err);
    throw err;
  }
}

// Fungsi untuk menyimpan data ke dalam tabel currency
async function insertCurrency(client, currency) {
  const { currency_code, currency_name } = currency;
  const query = 'INSERT INTO currency (currency_code, currency_name) VALUES ($1, $2)';
  const values = [currency_code, currency_name];
  await client.query(query, values);
}

// Fungsi untuk menyimpan data ke dalam tabel kurs_pajak_document
async function insertKursPajakDocument(client, kursPajakDocument) {
  const { doc_id, start_date, end_date } = kursPajakDocument;
  const query = 'INSERT INTO kurs_pajak_document (doc_id, start_date, end_date) VALUES ($1, $2, $3)';
  const values = [doc_id, start_date, end_date];
  await client.query(query, values);
}

// Fungsi untuk menyimpan data ke dalam tabel nilai_kurs
async function insertNilaiKurs(client, nilaiKurs) {
  const { doc_id, no_urut, currency_code, value_in_rupiah } = nilaiKurs;
  const query = 'INSERT INTO nilai_kurs (doc_id, no_urut, currency_code, value_in_rupiah) VALUES ($1, $2, $3, $4)';
  const values = [doc_id, no_urut, currency_code, value_in_rupiah];
  await client.query(query, values);
}

// Fungsi utama untuk menyimpan data ke dalam database (termasuk menghapus data lama)
async function saveDataToDatabase() {
  const client = new Client(dbConfig);

  try {
    await client.connect();

    // Mulai transaksi
    await client.query('BEGIN');

    // Hapus data lama dari tabel-tabel
    await deleteNilaiKursData(client);
    await deleteKursPajakDocumentData(client);
    await deleteCurrencyData(client);

    // Iterasi dan simpan data currency
    for (const currency of data.currency) {
      await insertCurrency(client, currency);
    }

    // Iterasi dan simpan data kurs_pajak_document
    for (const kursPajakDocument of data.kurs_pajak_document) {
      await insertKursPajakDocument(client, kursPajakDocument);
    }

    // Iterasi dan simpan data nilai_kurs
    for (const nilaiKurs of data.nilai_kurs) {
      await insertNilaiKurs(client, nilaiKurs);
    }

    // Commit transaksi jika semua data berhasil disimpan
    await client.query('COMMIT');
    console.log('Data has been successfully inserted/updated into PostgreSQL.');
  } catch (err) {
    // Rollback transaksi jika terjadi kesalahan
    await client.query('ROLLBACK');
    console.error('Error while inserting data into PostgreSQL:', err);
  } finally {
    // Tutup koneksi dengan database
    client.end();
  }
}

// Panggil fungsi utama untuk menyimpan data ke dalam database
saveDataToDatabase();