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

for t in tags:
    tag = t.text
    span = t.find('span', 'badge').text

    # menghilangkan angka di akhir nama tag
    tag = tag.replace(span, '')
    tag = tag.replace(' ', '')

    link = 'https://eventkampus.com/event/tags/' + tag

    # mencari banyak halaman untuk tag tersebut
    req2 = requests.get(link)
    soup2 = BeautifulSoup(req2.text, 'html.parser')
    pages = (soup2.find('div','card card-eka-blue mb-2').text)
    pages = int(pages[-5:-1].replace(' ',''))
    
    for page in range (1,pages+1):
        link = 'https://eventkampus.com/event/tags/' + tag + '?page=' + str(page)
        
        # membuka link untuk mendapatkan id event
        req3 = requests.get(link)
        soup3 = BeautifulSoup(req3.text, 'html.parser')
        events = soup3.findAll('div','col-12 col-md-6 col-xl-4')

        for e in events:
            link_id = e.find('a', {'class':'stretched-link'})['href']

            # mendapatkan ID unik tiket berdasarkan link pada web
            get_id = link_id.replace('https://eventkampus.com/event/detail/','')
            id_event = get_id[0:4]
            if '/' in id_event:
                id_event = id_event[0:3]
            if '/' in id_event:
                id_event = id_event[0:2]
            if '/' in id_event:
                id_event = id_event[0:1]
            
            data_tag["tag_event"].append(
                {
                    "id_event" : id_event,
                    "tag": tag
                }
            )


folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'tag.json', 'w') as file:
    json.dump(data_tag, file)

