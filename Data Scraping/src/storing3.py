import json
import psycopg2

with open("C:/Users/ASUS/Documents/0. kuliah/aslab/basdat/s1/Seleksi-2023-Tugas-1/Data Scraping/data/scraping_webometrics.json", "r") as jsonWeb:
    data_web = jsonWeb.read()

data = json.loads(data_web)

conn = psycopg2.connect(host="localhost", port=5432, dbname="webometrics", user="postgres", password="Inipostgrerr")

cur = conn.cursor()

for ob in data:
    world_rank = ob['World Ranking']
    asean_rank = ob['Ranking']
    impact_rank = ob['Impact Rank']
    openness_rank = ob['Openness Rank']
    excellence_rank = ob['Excellence Rank']
    university_name = ob['University']
    uni_profile = ob['Uni Profile']

    cur.execute(f"SELECT university_id FROM University WHERE university_name = %s", (university_name,))
    university_id = cur.fetchone()
    
    if university_id is None:
        # Jika belum ada, operasi INSERT pada tabel "University" dan ambil "university_id" yang baru dibuat
        cur.execute(f"INSERT INTO University (university_name, uni_profile) VALUES (%s, %s) RETURNING university_id", (university_name, uni_profile))
        university_id = cur.fetchone()[0]
    else:
        # ambil "university_id" yang sesuai
        university_id = university_id[0]

    # operasi INSERT pada tabel "Rank" dengan nilai "university_id" sebagai foreign key
    cur.execute(f"INSERT INTO rank (university_id, world_rank, asean_rank, impact_rank, openness_rank, excellence_rank) VALUES (%s, %s, %s, %s, %s, %s)", (university_id, world_rank, asean_rank, impact_rank, openness_rank, excellence_rank))


conn.commit()
cur.close()
conn.close()