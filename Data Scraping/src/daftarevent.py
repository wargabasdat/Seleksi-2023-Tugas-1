import requests
from bs4 import BeautifulSoup
import json

data_event = {
    "event_event": []
}

url = 'https://eventkampus.com/event?page='

for page in range(1,152):
    print("page =", page)
    req = requests.get(url+str(page))
    soup = BeautifulSoup(req.text, 'html.parser')
    events = soup.findAll('div', 'col-12 col-md-6 col-xl-4')

    for e in events:
        link = e.find('a', {'class':'stretched-link'})['href']
        
        # mendapatkan ID unik event berdasarkan link pada web
        get_id = link.replace('https://eventkampus.com/event/detail/','')
        id_event = get_id[0:4]
        if '/' in id_event:
            id_event = id_event[0:3]
        if '/' in id_event:
            id_event = id_event[0:2]
        if '/' in id_event:
            id_event = id_event[0:1]

        # mendapatkan nama event
        event = e.find('h5', {'class':'card-title'}).text

        # mendapatkan data lengkap terkait event
        event_data = e.findAll('div', 'mb-1')

        # data terkait event
        kategori = event_data[0].text.replace(' ','')
        kategori = kategori[1:-1]
        tanggal = event_data[1].text.replace('date_range ','')
        jam = event_data[2].text.replace('access_time ','')
        tempat = event_data[3].text.replace('place ','')
        data_event["event_event"].append(
            {
                "id_event" : id_event,
                "event" : event,
                "kategori" : kategori,
                "tanggal" : tanggal,
                "jam" : jam,
                "tempat" : tempat
            }
        )


folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'event.json', 'w') as file:
    json.dump(data_event, file)

