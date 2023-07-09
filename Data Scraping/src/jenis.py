import requests
import json
import csv
from bs4 import BeautifulSoup

# PERSIAPAN
# Url yang ingin di-scraping
url_utama = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa0-West_Sumatra_Sumatra.html'

# Header sebagai identitas dalam melakukan scraping
header = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
}

# EKSEKUSI
# Melakukan request pada url yang akan di-scraping
req = requests.post(url_utama, headers = header)
soup = BeautifulSoup(req.text, 'html.parser')

# Melakukan ekstraksi data
n = 0  # Ini nanti di-loop untuk ngambil data khusus label aja, soalnya ada elemen lain selain label yang punya tag sama
objek = soup.findAll('div', 'XDHza y f u G')
for obj in objek :
    n += 1
    if (1 <= n <= 6) :
        continue
    try :
        url_per_label = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-c{}-West_Sumatra_Sumatra.html'.format(obj.find('a', 'KoOWI')['href'].split('=')[1])
    except :
        url_per_label = ''

    # Masuk ke halaman label untuk mencari jenis objek di tiap labelnya
    header_label = {
        'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
    }
    req_per_label = requests.post(url_per_label, headers = header_label)
    soup_per_label = BeautifulSoup(req_per_label.text, 'html.parser')

    # Cari jenis-jenis objek di tiap label
    items = soup_per_label.findAll('div', {'id' : 'type_filter_contents'})
    jenis_per_label = []
    for cek_jenis in items :
        nama_jenis = cek_jenis.findAll('div', 'biGQs _P pZUbB KxBGd')
        for cek in nama_jenis :
            nama = cek.text
            print(nama)
    items = soup_per_label.find('span', 'biGQs _P KxBGd')
    print(items)

# PENYIMPANAN