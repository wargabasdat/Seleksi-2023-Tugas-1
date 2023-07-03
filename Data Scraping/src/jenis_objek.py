import requests
import json
from bs4 import BeautifulSoup

# Url dari website yang ingin di-scraping
url = 'https://www.tripadvisor.co.id/Attractions-g2301784-Activities-oa0-West_Sumatra_Sumatra.html'

# Header sebagai identitas dalam melakukan scraping
header = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)'
}

# Melakukan request pada website yang akan diekstrak
req = requests.post(url, headers = header)
soup = BeautifulSoup(req.text, "html.parser")

# Melakukan ekstrak data
items = soup.findAll('a', 'KoOWI')
number = 0
for it in items:
    # Cleaning data dilakukan karena item yang ingin diekstrak dari web memiliki class yang sama dengan beberapa item yang tidak diinginkan
    number += 1
    if (number <= 5) :
        continue

    # Lanjut proses ekstrak data
    try :
        jenis_objek = it.find('div', 'biGQs _P pZUbB KxBGd').text
    except :
        jenis_objek = ''
    print(jenis_objek)