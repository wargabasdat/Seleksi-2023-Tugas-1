import requests
from bs4 import BeautifulSoup
import json

data_tiket = {
    "tiket_event": []
}

url = 'https://eventkampus.com/tiket?page='

ctr = 0
for page in range(1,5):
    print()
    print("page =", page)
    req = requests.get(url+str(page))
    soup = BeautifulSoup(req.text, 'html.parser')
    tikets = soup.findAll('div', 'col-12 col-sm-6 col-md-4 col-lg-3 mb-3')

    for t in tikets:
        ctr += 1
        link = t.find('a', {'class':'stretched-link'})['href']
        
        # mendapatkan ID unik tiket berdasarkan link pada web
        get_id = link.replace('https://eventkampus.com/tiket/detail/','')
        id_tiket = get_id[0:4]
        if '/' in id_tiket:
            id_tiket = id_tiket[0:3]
        if '/' in id_tiket:
            id_tiket = id_tiket[0:2]
        if '/' in id_tiket:
            id_tiket = id_tiket[0:1]

        # mendapatkan nama tiket
        tiket = t.find('h5', {'class':'card-title'}).text

        # mendapatkan data lengkap terkait tiket
        tiket_data = t.findAll('div', 'mb-1')

        # data terkait tiket
        kategori = tiket_data[0].text.replace(' ','')
        kategori = kategori[2:-2]
        tanggal = tiket_data[1].text.replace(' ','')
        tempat = tiket_data[2].text.replace('place ','')

        # membuka link untuk mendapatkan harga tiket
        req2 = requests.get(link)
        soup2 = BeautifulSoup(req2.text, 'html.parser')
        tiket_data = soup2.findAll()

        data_tiket["tiket_event"].append(
            {
                "id_tiket" : id_tiket,
                "tiket" : tiket,
                "kategori" : kategori,
                "tanggal" : tanggal,
                "tempat" : tempat
            }
        )

        print(tempat)

'''
folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'tiket.json', 'w') as file:
    json.dump(data_tiket, file)'''
