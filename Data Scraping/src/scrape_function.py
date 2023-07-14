import time
from bs4 import BeautifulSoup
import requests
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def load_page_source(url):
    # Membuat objek WebDriver
    driver = webdriver.Chrome()
    # Memuat halaman web
    driver.get(url)
    # Menunggu hingga semua elemen dimuat menggunakan Explicit Waits
    wait = WebDriverWait(driver, 100)
    wait.until(EC.presence_of_element_located((By.CLASS_NAME, "Typography_root__4bejd")))
    # Mendapatkan HTML dari halaman yang telah dimuat
    html = driver.page_source
    # Menutup WebDriver
    driver.quit()
    return html

def create_soup(html):
    soup = BeautifulSoup(html, 'html.parser')
    return soup

def get_name(soup,i):
    # fungsi find all untuk mencari element dengan tag h2 dan class yang sesuai
    name = soup.find_all('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--three Typography_align-match-parent__4bejd')[i]
    return name.text

def get_datetime(soup,i):
    elements = soup.find_all('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd eds-text-color--primary-brand Typography_align-match-parent__4bejd')[i].text
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

# pake url event
def get_address(soup):
    meta_tag = soup.find('meta', attrs={'name': 'twitter:data1'})
    address = meta_tag['value']
    return address

def get_price(soup, i):
    time.sleep(5)
    p_tag = soup.find('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd Typography_align-match-parent__4bejd')
    # Mendapatkan teks dari elemen <div>
    text = p_tag.text
    if text == 'Free':
        lowest_price = 0
        highest_price = 0
    else:
        prices = text.split('–')
        # Menghapus karakter "$" dan spasi pada setiap nilai
        lowest_price = int(prices[0].replace('$', '').strip())
        highest_price = int(prices[1].replace('$', '').strip())
    return lowest_price, highest_price

# pake url event
def get_duration(soup):
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

def get_organizer(soup):
    # Menggunakan metode find() untuk mencari elemen <a>
    a_tag = soup.find('a', class_='descriptive-organizer-info__name-link')
    # Mendapatkan teks dari elemen <a>
    organizer = a_tag.text
    return organizer

def get_totalfolowersorganizer(soup):
    # Mendapatkan teks dari elemen span
    text = soup.find('span', class_='organizer-stats__highlight').text
    # Mengonversi teks menjadi angka
    if text.endswith('k'):
        value = float(text[:-1]) * 1000
    elif text.endswith('m'):
        value = float(text[:-1]) * 1000000
    elif text.endswith('b'):
        value = float(text[:-1]) * 1000000000
    elif text.endswith('t'):
        value = float(text[:-1]) * 1000000000000
    else:
        value = int(text)
    return value

def get_organizerpage(soup):
    # Menggunakan metode find() untuk mencari elemen <a>
    a_tag = soup.find('a', class_='descriptive-organizer-info__name-link')
    # Mendapatkan teks dari elemen <a>
    organizerpage = a_tag['href']
    return organizerpage


def get_lattitude(soup):
    # Menggunakan metode find() untuk mencari elemen <meta> dengan atribut property
    meta_tag = soup.find('meta', attrs={'property': 'event:location:latitude'})
    # Mendapatkan nilai content dari atribut elemen <meta>
    latitude = meta_tag['content']
    return latitude

def get_longitude(soup):
    # Menggunakan metode find() untuk mencari elemen <meta> dengan atribut property
    meta_tag = soup.find('meta', attrs={'property': 'event:location:longitude'})
    # Mendapatkan nilai content dari atribut elemen <meta>
    longitude = meta_tag['content']
    return longitude

url = 'https://www.eventbrite.com/d/indonesia/business--events/?page=1/'
# Membuat objek WebDriver
driver = webdriver.Chrome()

# Memuat halaman web
driver.get(url)

# Menunggu hingga semua elemen dimuat menggunakan Explicit Waits
wait = WebDriverWait(driver, 100)
wait.until(EC.presence_of_element_located((By.CLASS_NAME, "Typography_root__4bejd")))
# wait.until(EC.presence_of_element_located((By.CLASS_NAME, "#585163")))
# wait.until(EC.presence_of_element_located((By.CLASS_NAME, "Typography_body-md-bold__4bejd")))
# wait.until(EC.presence_of_element_located((By.CLASS_NAME, "Typography_align-match-parent__4bejd")))

# Mendapatkan HTML dari halaman yang telah dimuat
html = driver.page_source

# Menutup WebDriver
driver.quit()

soup = BeautifulSoup(html, 'html.parser')

url1 = get_event_url(soup,0)
print(url1)
print(get_price(soup,0))
# print(get_price('https://www.eventbrite.com/e/the-weight-loss-key-you-havent-heard-yet-limiting-beliefs-beauty-sleep-tickets-656780527237?aff=ebdssbdestsearch'))



