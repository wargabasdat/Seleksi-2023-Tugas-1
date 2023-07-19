import requests
from bs4 import BeautifulSoup
import json

data_hargatiket = {
    "hargatiket_event": []
}

url = 'https://eventkampus.com/tiket?page='


for page in range(1,5):
    print()
    print("page =", page)
    req = requests.get(url+str(page))
    soup = BeautifulSoup(req.text, 'html.parser')
    tickets = soup.findAll('div', 'col-12 col-sm-6 col-md-4 col-lg-3 mb-3')

    for t in tickets:
        link = t.find('a', {'class':'stretched-link'})['href']
        
        # mendapatkan ID unik tiket berdasarkan link pada web
        get_id = link.replace('https://eventkampus.com/tiket/detail/','')
        id_event = get_id[0:4]
        if '/' in id_event:
            id_event = id_event[0:3]
        if '/' in id_event:
            id_event = id_event[0:2]
        if '/' in id_event:
            id_event = id_event[0:1]

        # membuka link untuk mendapatkan harga tiket
        req2 = requests.get(link)
        soup2 = BeautifulSoup(req2.text, 'html.parser')
        hargatiket_data = soup2.findAll('div','row mb-4 py-2')

        ctr = 0
        for ht in hargatiket_data:
            ctr += 1
            id_tiket = id_event + '0' + str(ctr)
            jenis_tiket = ht.find('div', 'col-sm-5').text
            # mengambil data harga tiket dan mengubah formatnya menjadi integer
            harga_tiket = ht.find('div', 'col-sm-4').text
            harga_tiket = harga_tiket.replace('Rp ','')
            harga_tiket = harga_tiket.replace('.','')
            harga_tiket = int(harga_tiket)
            # memasukkan ke dictionary
            data_hargatiket["hargatiket_event"].append(
                {
                    "id_event" : id_event,
                    "id_tiket" : id_tiket,
                    "jenis_tiket" : jenis_tiket,
                    "harga_tiket" : harga_tiket
                }
            )

        
# masukkan data tiket dengan update file tiket.json
folderPath = '/Users/marchelinefannihp/Documents/GitHub/Seleksi-2023-Tugas-1/Data Scraping/data/'
with open(folderPath + 'tiket.json', 'w') as file:
    json.dump(data_hargatiket, file)

