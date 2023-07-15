import requests
from bs4 import BeautifulSoup
import json

data_kategori = {
    "kategori_event": []
}

url = 'https://eventkampus.com/event'
req = requests.get(url)
soup = BeautifulSoup(req.text, 'html.parser')
categories = soup.findAll('a', 'button-kategori')

id_kategori = 252000; #pembuatan ID unik untuk masing-masing kategori

for category in categories:
    id_kategori += 1
    kategori = category.find('div', 'button-kategori__text').text
    data_kategori["kategori_event"].append(
        {
            "id_kategori" : id_kategori,
            "kategori": kategori
        }
    )

folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'kategori.json', 'w') as file:
    json.dump(data_kategori, file)

