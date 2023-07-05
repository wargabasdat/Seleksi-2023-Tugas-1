import requests
import json
from bs4 import BeautifulSoup
 
url = 'https://go.drugbank.com/drugs?approved=1&c=name&d=up&page='
data = []
count_page = 0
for page in range(1, 3):
    count_page+=1
    print('scraping page :',count_page)
    req = requests.get(url+str(page))
    soup = BeautifulSoup(req.text, 'html.parser')
    items = soup.findAll('tr')
    for it in items:
        name = it.find('a').text
        try : weight = it.find('td', class_='weight-value').text.split()[0]
        except : weight = ''
        try : description = it.find('td', class_='description-value').text
        except : description = ''
        try : categories = it.find('td', class_='categories-value').find('a').text
        except : categories = ''

        # Create a dictionary for each item
        if name != 'Name':
            item_data = {
                'name': name,
                'weight': weight,
                'description': description,
                'categories': categories
            }

            # Append the item dictionary to the data list
            data.append(item_data)

# Save the data as JSON
with open('result.json', 'w') as file:
    json.dump(data, file, indent=4)
