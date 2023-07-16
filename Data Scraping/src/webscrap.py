# Webscrap Program untuk mendapatkan data Top 500 lagu dari Rolling Stones
# Nama: Jason Rivalino
# NIM: 13521008

from bs4 import BeautifulSoup as bs
from requests import get
import json

url = 'https://stuarte.co/2021/2021-full-list-rolling-stones-top-500-songs-of-all-time-updated/'
response = get(url)

soup = bs(response.content, "lxml")

title = soup.find_all('td', class_= None)
print(len(title))

data_song = []
for index in range(0, len(title),4):
    data = [title[index].text.strip(), 
            title[index+1].text.strip(),
            title[index+2].text.strip(),
            title[index+3].text.strip()]
    data_song.append(data)

for data in data_song:
    print(data)

# Save data to a JSON file
filename = '500_song_data.json'
with open(filename, 'w') as file:
    json.dump(data_song, file)

print("Data saved to", filename)