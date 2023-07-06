import requests
import json
import csv
from bs4 import BeautifulSoup

# PERSIAPAN
# Url dari website yang ingin di-scraping
url = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa{}-West_Sumatra_Sumatra.html'.format(0)

# Header sebagai identitas dalam melakukan scraping
header = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
}

# EKSEKUSI
# Inisialisasi tempat penyimpanan untuk menyimpan hasil ekstrak data
list_objek_wisata = [] # Ini apabila butuh data bentuk JSON
list_objek_wisata_csv = [] # Ini apabila butuh data bentuk CSV
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
        
        # Masuk ke halaman objek untuk mendapatkan informasi daerah tempat objek wisata berada
        link_objek = 'https://www.tripadvisor.co.id/' + objek.find('div', 'alPVI eNNhq PgLKC tnGGX').find('a')['href']
        headers_objek = {
            'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
        }
        req_objek = requests.get(link_objek, headers = headers_objek)
        soup_objek = BeautifulSoup(req_objek.text, 'html.parser')

        # Cari nama daerah
        items = soup_objek.findAll('div', 'IuzAT e')
        for cek_daerah in items :
            nama_daerah = cek_daerah.find('div', 'biGQs _P pZUbB KxBGd').text.split('di ')[1]

        # Cari rating per bintang
        item_rating = soup_objek.findAll('div', 'outsq')
        jumlah_rating_5 = 0
        jumlah_rating_4 = 0
        jumlah_rating_3 = 0
        jumlah_rating_2 = 0
        jumlah_rating_1 = 0
        n = 1
        for item in item_rating :
            if (n == 1) :
                jumlah_rating_5 = item.find('div', 'biGQs _P pZUbB osNWb').text
            elif (n == 2) :
                jumlah_rating_4 = item.find('div', 'biGQs _P pZUbB osNWb').text
            elif (n == 3) :
                jumlah_rating_3 = item.find('div', 'biGQs _P pZUbB osNWb').text
            elif (n == 4) :
                jumlah_rating_2 = item.find('div', 'biGQs _P pZUbB osNWb').text
            elif (n == 5) :
                jumlah_rating_1 = item.find('div', 'biGQs _P pZUbB osNWb').text
            n += 1

        # Melakukan penyimpanan hasil ekstrak data ke tempat penyimpanan yang telah diinisialisasi sebelumnya
        # Penyimpanan dilakukan dengan didahului dengan cleaning data dari data kosong
        if (nama_objek != '' and nama_daerah != '' and nama_jenis != '' and rata_rata_rating != '' and jumlah_ulasan != '') :
            # Peringkat disesuaikan karena terjadinya cleaning data di atas
            peringkat += 1
            # Memasukkan variabel ke dalam bentuk dictionary
            hasil_objek_wisata = {
                'peringkat' : peringkat,
                'nama_objek' : nama_objek,
                'nama_daerah' : nama_daerah,
                'rata_rata_rating' : rata_rata_rating,
                'jumlah_rating_5' : jumlah_rating_5,
                'jumlah_rating_4' : jumlah_rating_4,
                'jumlah_rating_3' : jumlah_rating_3,
                'jumlah_rating_2' : jumlah_rating_2,
                'jumlah_rating_1' : jumlah_rating_1,
                'jumlah_ulasan' : jumlah_ulasan
            }
            # Append ke tempat penyimpanan yang udah diinisialisasi di awal (pilih antara JSON atau CSV)
            list_objek_wisata.append(hasil_objek_wisata)
            # list_objek_wisata_csv.append([peringkat, nama_objek, nama_daerah, rata_rata_rating, jumlah_rating_5, jumlah_rating_4, jumlah_rating_3, jumlah_rating_2, jumlah_rating_1, jumlah_ulasan])
            
            # Test scraping (jadikan komentar apabila tidak digunakan)
            # for i in hasil_objek_wisata :
            #     print(i, ' : ', hasil_objek_wisata[i])
            # print('\n')
    page += 30

# PENYIMPANAN
# Proses penyimpanan dan formatting hasil ekstrak data ke bentuk JSON
with open('Data Scraping/data/objek_wisata.json', 'w') as file:
    json.dump(list_objek_wisata, file, indent = 10)

# Proses penyimpanan dan formatting hasil ekstrak data ke bentuk CSV
# kepala = ['peringkat', 'nama_objek', 'nama_daerah', 'rata_rata_rating', 'jumlah_rating_5', 'jumlah_rating_4', 'jumlah_rating_3', 'jumlah_rating_2', 'jumlah_rating_1', 'jumlah_ulasan']
# writer = csv.writer(open('Data Scraping/data/objek_wisata.csv', 'w', newline = ''))
# writer.writerow(kepala)
# for data in list_objek_wisata_csv :
#     writer.writerow(data)