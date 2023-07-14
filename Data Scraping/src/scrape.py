from bs4 import BeautifulSoup
import requests
import json
from datetime import datetime, timedelta

def get_name(soup,i):
    # fungsi find all untuk mencari element dengan tag h2 dan class yang sesuai
    name = soup.find_all('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--three Typography_align-match-parent__4bejd')[i]
    return name.text

def get_date(soup,i):
    elements = soup.find_all('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd eds-text-color--primary-brand Typography_align-match-parent__4bejd')[i].text
    print(elements)
    if len(elements) > 20:
        elements = elements[0:21]
    if elements[0:8]=='Tomorrow':
        date = (datetime.today() + timedelta(days=1))
        time = datetime.strptime(elements[12:], "%I:%M %p")
    elif elements[0:5]=='Today':
        date = datetime.today()
        time = datetime.strptime(elements[9:], "%I:%M %p")
    else:
        elDate = elements[0:11]
        elTime = elements[13:]
        date = datetime.strptime(elDate, "%a, %b %d")
        time = datetime.strptime(elTime, "%I:%M %p")
        date = date.replace(year=datetime.today().year)
    # Mengubah format tanggal
    formatted_date = date.strftime("%d-%m-%Y")    
    # Mengubah format waktu
    formatted_time = time.strftime("%H:%M")
    
    return formatted_date, formatted_time

def get_event_url(soup,i):
    event_url = soup.find_all('a', class_='event-card-link')[i]
    return event_url['href']

def get_address(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    meta_tag = soup.find('meta', attrs={'name': 'twitter:data1'})
    address = meta_tag['value']
    return address

def get_price(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    div_tag = soup.find('div', class_='conversion-bar__panel-info')
    # Mendapatkan teks dari elemen <div>
    text = div_tag.text
    if text == 'Free':
        lowest_price = 0
        highest_price = 0
    else:
        prices = text.split('–')
        # Menghapus karakter "$" dan spasi pada setiap nilai
        lowest_price = int(prices[0].replace('$', '').strip())
        highest_price = int(prices[1].replace('$', '').strip())
    return lowest_price, highest_price


def get_duration(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # Menggunakan metode find() untuk mencari elemen <li> dengan class yang diberikan
    li_tag = soup.find('li', class_='eds-text-bm eds-text-weight--heavy css-1eys03p')
    # Mendapatkan teks dari elemen <li>
    duration = li_tag.text.strip()
    # Mendapatkan nilai jam dari string waktu
    days = int(duration.split(' ')[0])
    hours = int(duration.split(' ')[2])
    # Menghitung total jam
    total_hours = days * 24 + hours
    return total_hours

def get_organizer(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # Menggunakan metode find() untuk mencari elemen <a>
    a_tag = soup.find('a', class_='descriptive-organizer-info__name-link')
    # Mendapatkan teks dari elemen <a>
    organizer = a_tag.text
    return organizer

def get_lattitude(url):
    # Membuat objek BeautifulSoup
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # Menggunakan metode find() untuk mencari elemen <meta> dengan atribut property
    meta_tag = soup.find('meta', attrs={'property': 'event:location:latitude'})
    # Mendapatkan nilai content dari atribut elemen <meta>
    latitude = meta_tag['content']
    return latitude

def get_longitude(url):
    # Membuat objek BeautifulSoup
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # Menggunakan metode find() untuk mencari elemen <meta> dengan atribut property
    meta_tag = soup.find('meta', attrs={'property': 'event:location:longitude'})
    # Mendapatkan nilai content dari atribut elemen <meta>
    longitude = meta_tag['content']
    return longitude






url = 'https://www.eventbrite.com/d/indonesia/business--events/?page=1/'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')
url1 = get_event_url(soup,0)
print(get_organizer(url1))


