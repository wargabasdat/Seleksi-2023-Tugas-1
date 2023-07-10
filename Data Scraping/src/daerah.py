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
# inisialisasi tempat penyimpanan hasil ekstraksi data untuk dijadikan JSON
list_daerah_objek = []

# Inisialisasi tempat penyimpanan sementara hasil ekstraksi data agar tidak ada duplikat data
dict_daerah_objek = dict()
page = 0
while (page <= 180) :
    # Melakukan request pada setiap halaman yang akan diekstrak
    url_per_halaman = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa{}-West_Sumatra_Sumatra.html'.format(page)
    req = requests.post(url_per_halaman, headers = header)
    soup = BeautifulSoup(req.text, 'html.parser')

    # Melakukan request pada setiap halaman baru per objek wisata
    objek_wisata = soup.findAll('article', 'GTuVU XJlaI')
    for objek in objek_wisata:
        nama_objek = objek.find('div', 'XfVdV o AIbhI').text.split('. ')[1]
        try :
            nama_jenis = objek.find('div', 'biGQs _P pZUbB hmDzD').text
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

        # Masuk ke halaman setiap objek untuk melihat daerah objek wisata
        url_per_objek_wisata = 'https://www.tripadvisor.co.id/' + objek.find('div', 'alPVI eNNhq PgLKC tnGGX').find('a')['href']
        header_per_objek_wisata = {
            'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
        }
        req_objek_wisata = requests.get(url_per_objek_wisata, headers = header_per_objek_wisata)
        soup_objek_wisata = BeautifulSoup(req_objek_wisata.text, 'html.parser')

        # Cari nama daerah
        items = soup_objek_wisata.findAll('div', 'IuzAT e')
        for cek_daerah in items :
            nama_daerah = cek_daerah.find('div', 'biGQs _P pZUbB KxBGd').text.split('di ')[1]
            if (nama_objek != '' and nama_daerah != '' and nama_jenis != '' and rata_rata_rating != '' and jumlah_ulasan != '') :
                if (nama_daerah in dict_daerah_objek) :
                    dict_daerah_objek[nama_daerah] = dict_daerah_objek[nama_daerah] + 1
                else :
                    dict_daerah_objek[nama_daerah] = 1
            else :
                if (nama_daerah not in dict_daerah_objek) :
                    dict_daerah_objek[nama_daerah] = 0
    page += 30

# PENYIMPANAN (PILIH SALAH SATU BENTUK JSON ATAU CSV)
# AKAN DISIMPAN DALAM BENTUK JSON
# Simpan data ke dictionary agar bisa dijadiin JSON
for x in dict_daerah_objek :
    hasil_daerah = {
        "nama_daerah" : x,
        "jumlah_objek_sedaerah" : dict_daerah_objek[x]
    }
    list_daerah_objek.append(hasil_daerah)

# Simpan dan format data ke dalam bentuk JSON
with open('Data Scraping/data/daerah.json', 'w') as file:
    json.dump(list_daerah_objek, file, indent = 4)

# # AKAN DISIMPAN DALAM BENTUK CSV
# for x in dict_daerah_objek :
#     list_daerah_objek.append([x, dict_daerah_objek[x]])
# kepala = ['nama_daerah', 'jumlah_objek_sedaerah']
# writer = csv.writer(open('Data Scraping/data/daerah.csv', 'w', newline = ''))
# writer.writerow(kepala)
# for data in list_daerah_objek :
#     writer.writerow(data)