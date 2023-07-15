import requests
from bs4 import BeautifulSoup
import json

data_tag = {
    "tag_event": []
}

url = 'https://eventkampus.com/event/tags'
req = requests.get(url)
soup = BeautifulSoup(req.text, 'html.parser')
tags = soup.findAll('a', 'tags-item')

id_tag = 165000; #pembuatan ID unik untuk masing-masing tag

for t in tags:
    id_tag += 1
    tag = t.text
    span = t.find('span', 'badge').text

    # menghilangkan angka di akhir nama tag
    tag = tag.replace(span, '')
    tag = tag.replace(' ', '')
    
    data_tag["tag_event"].append(
        {
            "id_tag" : id_tag,
            "tag": tag
        }
    )

folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'tag.json', 'w') as file:
    json.dump(data_tag, file)

