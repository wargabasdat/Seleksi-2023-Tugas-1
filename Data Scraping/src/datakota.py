import requests
from bs4 import BeautifulSoup
import json

data_kota = {
    "kota_event": []
}

url = 'https://eventkampus.com/event/lokasi'
req = requests.get(url)
soup = BeautifulSoup(req.text, 'html.parser')
cities = soup.findAll('a', 'mdc-list-item justify-content-between col-12 col-sm-6 col-xl-4')

id_kota = 182000; #pembuatan ID unik untuk masing-masing kota

for city in cities:
    id_kota += 1
    kota = city.text
    span = city.find('span', 'badge badge-info').text

    # menghilangkan angka di akhir nama kota
    kota = kota.replace(' ' + str(span) + ' ', '')
    
    data_kota["kota_event"].append(
        {
            "id_kota" : id_kota,
            "kota": kota
        }
    )

folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'kota.json', 'w') as file:
    json.dump(data_kota, file)

