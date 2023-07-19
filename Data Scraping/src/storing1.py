import json
import psycopg2

with open("C:/Users/ASUS/Documents/0. kuliah/aslab/basdat/s1/Seleksi-2023-Tugas-1/Data Scraping/data/scraping_webometrics.json", "r") as jsonWeb:
    data_web = jsonWeb.read()

data = json.loads(data_web)

conn = psycopg2.connect(host="localhost", port=5432, dbname="webometrics", user="postgres", password="Inipostgrerr")

cur = conn.cursor()

for ob in data:
    country_name = ob['Country']

    cur.execute(f"SELECT 1 FROM Country WHERE country_name = %s", (country_name,))

    if(cur.fetchone() is None):
        # Jika belum ada, operasi INSERT pada tabel "Country"
        cur.execute(f"INSERT INTO Country (country_name) VALUES (%s)", (country_name,))
    else:
        # jika sudah ada, maka tidak akan dilakukan proses insert karena akan menyebabkan data redundan
        pass

conn.commit()
cur.close()
conn.close()