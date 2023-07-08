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
# Ini apabila butuh data bentuk JSON
list_ulasan_teratas = [] 

# Ini apabila butuh data bentuk CSV
list_ulasan_teratas_csv = []
# kepala = ['peringkat', 'nama_objek', 'nama_akun_pengunjung', 'asal_pengunjung', 'rating_pengunjung', 'waktu_berkunjung', 'tipe_kunjungan', 'sorotan_pengunjung']
# writer = csv.writer(open('Data Scraping/data/ulasan_teratas.csv', 'w', newline = ''))
# writer.writerow(kepala)

# Inisialisasi tempat penyimpanan untuk menyimpan ulasan semua objek
list_nama_akun_pengunjung_semua_objek = []
list_asal_pengunjung_semua_objek = []
list_rating_pengunjung_semua_objek = []
list_waktu_berkunjung_semua_objek = []
list_tipe_kunjungan_semua_objek = []

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

        # Melakukan cleaning data agar tak ada row yang isinya bolong-bolong
        if (nama_objek != '' and nama_jenis != '' and rata_rata_rating != '' and jumlah_ulasan != '') :
            # Peringkat disesuaikan karena terjadinya cleaning data di atas
            peringkat += 1
        else :
            continue
            
        # Cari informasi penyampai ulasan
        items = soup_objek.findAll('div', {'data-automation' : 'reviewCard'})
        list_nama_akun_pengunjung_per_objek = []
        list_asal_pengunjung_per_objek = []
        list_rating_pengunjung_per_objek = []
        list_waktu_berkunjung_per_objek = []
        list_tipe_kunjungan_per_objek = []
        for cek in items :
            nama_akun_pengunjung = cek.find('a', 'BMQDV _F Gv wSSLS SwZTJ FGwzt ukgoS').text
            if (not nama_akun_pengunjung.isascii()) :
                continue
            asal_pengunjung = cek.find('div', 'biGQs _P pZUbB osNWb').text.split(', ')[0]

            # Lakukan cleaning data agar akun yang tidak mencantumkan daerah asal tidak masuk
            if ((asal_pengunjung).__contains__('kontribusi')) :
                asal_pengunjung = ''
            rating_pengunjung = cek.find('svg', 'UctUV d H0')['aria-label'].split(' ')[0].replace(',', '.')
            try :
                waktu_berkunjung = cek.find('div', 'RpeCd').text.split(' • ')[0]
            except :
                waktu_berkunjung = ''
            try :
                tipe_kunjungan = cek.find('div', 'RpeCd').text.split(' • ')[1]
            except :
                tipe_kunjungan = ''

            # Masukkan setiap informasi ulasan pengunjung ke array per objek
            list_nama_akun_pengunjung_per_objek.append(nama_akun_pengunjung)
            list_asal_pengunjung_per_objek.append(asal_pengunjung)
            list_rating_pengunjung_per_objek.append(rating_pengunjung)
            list_waktu_berkunjung_per_objek.append(waktu_berkunjung)
            list_tipe_kunjungan_per_objek.append(tipe_kunjungan)

            # Append ke tempat penyimpanan yang udah diinisialisasi di awal CSV
            # list_ulasan_teratas_csv.append([peringkat, nama_objek, nama_akun_pengunjung, asal_pengunjung, rating_pengunjung, waktu_berkunjung, tipe_kunjungan])

        # Masukkan setiap array informasi ulasan pengunjung per objek ke array semua objek
        list_nama_akun_pengunjung_semua_objek.append(list_nama_akun_pengunjung_per_objek)
        list_asal_pengunjung_semua_objek.append(list_asal_pengunjung_per_objek)
        list_rating_pengunjung_semua_objek.append(list_rating_pengunjung_per_objek)
        list_waktu_berkunjung_semua_objek.append(list_waktu_berkunjung_per_objek)
        list_tipe_kunjungan_semua_objek.append(list_tipe_kunjungan_per_objek)

        # Melakukan penyimpanan hasil ekstrak data ke tempat penyimpanan yang telah diinisialisasi sebelumnya
        # Memasukkan variabel ke dalam bentuk dictionary
        hasil_ulasan_teratas = {
            'peringkat' : peringkat,
            'nama_objek' : nama_objek,
            'nama_akun_pengunjung' : list_nama_akun_pengunjung_per_objek,
            'asal_pengunjung' : list_asal_pengunjung_per_objek,
            'rating_pengunjung' : list_rating_pengunjung_per_objek,
            'waktu_berkunjung' : list_waktu_berkunjung_per_objek,
            'tipe_kunjungan' : list_tipe_kunjungan_per_objek
        }
        # Append ke tempat penyimpanan yang udah diinisialisasi di awal JSON
        list_ulasan_teratas.append(hasil_ulasan_teratas)
        
        # Test scraping JSON (jadikan komentar apabila tidak digunakan)
        # for i in hasil_ulasan_teratas :
        #     print(i, ' : ', hasil_ulasan_teratas[i])
        # print('\n')
    page += 30

# PENYIMPANAN (PILIH SALAH SATU)
# Proses penyimpanan dan formatting hasil ekstrak data ke bentuk JSON
with open('Data Scraping/data/ulasan_teratas.json', 'w') as file:
    json.dump(list_ulasan_teratas, file, indent = 5)

# Proses penyimpanan dan formatting hasil ekstrak data ke bentuk CSV
# for data in list_ulasan_teratas_csv :
#     writer.writerow(data)