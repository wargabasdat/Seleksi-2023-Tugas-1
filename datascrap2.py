import requests
from bs4 import BeautifulSoup
 
url = 'https://www.zalora.co.id/c/beauty/make-up/c-7968?page=2'
# headers = {
#     'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
# }
req = requests.get(url)
print(req)
# soup = BeautifulSoup(req.text, 'html.parser')
# items = soup.findAll('div', 'jsx-2856971448 product-item')
# for it in items:
#     name = it.find('h2', 'jsx-2059197805 product-card-catalog-title').text
#     print(name)