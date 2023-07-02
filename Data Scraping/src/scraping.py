# Melakukan import library-library yang dibutuhkan
import requests
import json
import pandas
from bs4 import BeautifulSoup

# Url dari website yang ingin di-scraping
page = 0
url = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa{}-West_Sumatra_Sumatra.html'.format(page)

# Header sebagai identitas dalam melakukan scraping
header = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
}

# Melakukan request pada website yang akan di-scraping
req = requests.post(url, headers = header)
soup = BeautifulSoup(req.text, 'html.parser')

# Melakukan proses scraping data
daftarItem = soup.findAll('article', 'GTuVU XJlaI')
for item in daftarItem:
    nama = item.find('div', 'XfVdV o AIbhI').text.split('. ')[1]
    print(nama)