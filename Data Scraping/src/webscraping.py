# Aditya Inas Hamidah (18221172)
# Tugas 1

# import library
import requests
import json
from bs4 import BeautifulSoup
 

# Masukkan url yang akan discrap
url = 'https://go.drugbank.com/drugs?approved=1&c=name&d=up&page='

# membuat list kosong untuk menyimpan data
data = []
count_page = 0     # menghitung halaman yang akan discrap
for page in range(1, 111):
    count_page+=1
    print('scraping page :',count_page)
    req = requests.get(url+str(page))   # menambahkan page ke url sebelumnya
    soup = BeautifulSoup(req.text, 'html.parser')
    items = soup.findAll('tr')
    for it in items:
        name = it.find('a').text
        weight_element = it.find('td', class_='weight-value')
        weight = None
        if weight_element and weight_element.text != 'Not Available':
            try:
                weight = float(weight_element.text.split()[0])
            except ValueError:
                pass    # Apabila nilai weight Not Available maka akan discrap sebagai Null
        try : description = it.find('td', class_='description-value').text
        except : description = ''
        try : categories = it.find('td', class_='categories-value').find('a').text
        except : categories = ''

        # Create a dictionary for each item
        if name != 'Name':   # mengecualikan header tabel
            item_data = {
                'name': name,
                'weight': weight,
                'description': description,
                'categories': categories
            }

            # menggabungkan item-item tersebut ke dalam list
            data.append(item_data)

# menyimpan data sebagai json
with open('drug.json', 'w') as file:
    json.dump(data, file, indent=4)
