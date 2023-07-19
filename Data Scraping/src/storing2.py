import json
import psycopg2

with open("C:/Users/ASUS/Documents/0. kuliah/aslab/basdat/s1/Seleksi-2023-Tugas-1/Data Scraping/data/scraping_webometrics.json", "r") as jsonWeb:
    data_web = jsonWeb.read()

data = json.loads(data_web)

conn = psycopg2.connect(host="localhost", port=5432, dbname="webometrics", user="postgres", password="Inipostgrerr")

cur = conn.cursor()

for ob in data:
    university_name = ob['University']
    uni_profile = ob['Uni Profile']
    country_name = ob['Country']

    cur.execute(f"SELECT country_id FROM Country WHERE country_name = %s", (country_name,))
    country_id = cur.fetchone()
    
    if country_id is None:
        # Jika belum ada, operasi INSERT pada tabel "Country" dan ambil "country_id" yang baru dibuat
        cur.execute(f"INSERT INTO Country (country_name) VALUES (%s) RETURNING country_id", (country_name,))
        country_id = cur.fetchone()[0]
    else:
        # ambil "country_id" yang sesuai
        country_id = country_id[0]

    # operasi INSERT pada tabel "University" dengan nilai "country_id" sebagai foreign key
    cur.execute(f"INSERT INTO University (university_name, country_id, uni_profile) VALUES (%s, %s, %s)", (university_name, country_id, uni_profile))


conn.commit()
cur.close()
conn.close()