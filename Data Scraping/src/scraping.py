import requests
import json
import pandas
import csv
from bs4 import BeautifulSoup

# Url dari website yang ingin di-scraping
url = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa{}-West_Sumatra_Sumatra.html'.format(0)

# Header sebagai identitas dalam melakukan scraping
header = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
}

# Proses ekstrak data
# Inisialisasi tempat penyimpanan untuk menyimpan hasil ekstrak data
list_objek_wisata = []
page = 0
while (page <= 180):
    # Melakukan request pada website yang akan diekstrak
    url = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa{}-West_Sumatra_Sumatra.html'.format(page)
    req = requests.post(url, headers = header)
    soup = BeautifulSoup(req.text, 'html.parser')

    # Melakukan ekstrak data
    objek_wisata = soup.findAll('article', 'GTuVU XJlaI')
    for objek in objek_wisata:
        peringkat = objek.find('div', 'XfVdV o AIbhI').text.split('. ')[0]
        nama_objek = objek.find('div', 'XfVdV o AIbhI').text.split('. ')[1]
        jenis_objek = objek.find('div', 'biGQs _P pZUbB hmDzD').text.replace(' • ', ', ')
        try :
            rating = objek.find('svg', 'UctUV d H0 hzzSG')['aria-label'].split(' ')[0].replace(',', '.')
        except :
            rating = ''
        try :
            jumlah_ulasan = objek.find('span', 'biGQs _P pZUbB osNWb').text
        except :
            jumlah_ulasan = ''

        # Melakukan penyimpanan hasil ekstrak data ke tempat penyimpanan yang telah diinisialisasi sebelumnya
        hasil_objek_wisata = {
            'Peringkat' : peringkat,
            'Nama_Objek' : nama_objek,
            'Jenis_Objek' : jenis_objek,
            'Rating' : rating,
            'Jumlah_Ulasan' : jumlah_ulasan
        }
        list_objek_wisata.append(hasil_objek_wisata)
    page += 30

# Proses formatting hasil ekstrak data ke bentuk json
with open('Data Scraping/data/hasil.json', 'w') as file:
    json.dump(list_objek_wisata, file, indent = 5)