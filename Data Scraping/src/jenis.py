import requests
import json
import csv
from bs4 import BeautifulSoup

# PERSIAPAN
# Header sebagai identitas dalam melakukan scraping
header = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
}

# EKSEKUSI
# Inisialisasi tempat penyimpanan untuk menyimpan hasil ekstrak data
list_jenis_objek = []
page = 0
peringkat = 0
while (page <= 180) :
    # Melakukan request pada website yang akan diekstrak
    url = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa{}-West_Sumatra_Sumatra.html'.format(page)
    req = requests.post(url, headers = header)
    soup = BeautifulSoup(req.text, 'html.parser')

    # Melakukan ekstrak data
    objek_wisata = soup.findAll('article', 'GTuVU XJlaI')
    for objek in objek_wisata:
        nama_objek = objek.find('div', 'XfVdV o AIbhI').text.split('. ')[1]
        try :
            nama_jenis = objek.find('div', 'biGQs _P pZUbB hmDzD').text.replace(' • ', ',').split(',')
        except :
            nama_jenis = ''
        try :
            rata_rata_rating = objek.find('svg', 'UctUV d H0 hzzSG')['aria-label'].split(' ')[0].replace(',', '.')
        except :
            rata_rata_rating = ''
        try :
            jumlah_ulasan = objek.find('span', 'biGQs _P pZUbB osNWb').text
        except :
            jumlah_ulasan = ''

        # Melakukan penyimpanan hasil ekstrak data ke tempat penyimpanan yang telah diinisialisasi sebelumnya
        # Penyimpanan dilakukan dengan didahului dengan cleaning data dari data kosong
        if (nama_objek != '' and nama_jenis != '' and rata_rata_rating != '' and jumlah_ulasan != '') :
            # Peringkat disesuaikan karena terjadinya cleaning data di atas
            peringkat += 1
            # Memasukkan variabel ke dalam bentuk dictionary
            hasil_jenis_objek = {
                'peringkat' : peringkat,
                'nama_jenis' : nama_jenis
            }

            # Append ke tempat penyimpanan yang telah diinisialisasi sebelumnya (pilih antara JSON atau CSV)
            list_jenis_objek.append(hasil_jenis_objek) # Ini kalau JSON
            # for i in nama_jenis : # Ini kalau CSV
            #     list_jenis_objek.append([peringkat, i])

            # Test scraping (jadikan komentar apabila tidak digunakan)
            for i in hasil_jenis_objek :
                print(i, ' : ', hasil_jenis_objek[i])
            print('\n')
    page += 30

# PENYIMPANAN (PILIH ANTARA JSON ATAU CSV)
# Proses penyimpanan dan formatting hasil ekstrak data ke bentuk JSON
with open('Data Scraping/data/jenis.json', 'w') as file:
    json.dump(list_jenis_objek, file, indent = 4)

# Proses penyimpanan dan formatting hasil ekstrak data ke bentuk CSV
# kepala = ['peringkat', 'nama_jenis']
# writer = csv.writer(open('Data Scraping/data/jenis.csv', 'w', newline = ''))
# writer.writerow(kepala)
# for data in list_jenis_objek :
#     writer.writerow(data)