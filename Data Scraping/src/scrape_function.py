import time
from bs4 import BeautifulSoup
import requests
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


def load_page_source(url):
    # Membuat objek options untuk mengatur header
    options = Options()
    options.add_argument("user-agent=Chrome/114.0.5735.199 (Windows NT 11.0; Win64; x64)")
    options.add_argument("From=Naura Valda P/18221173@std.stei.ac.id/basisdata@std.stei.itb.ac.id")

    # Membuat objek DesiredCapabilities untuk mengatur header lainnya
    capabilities = DesiredCapabilities.CHROME.copy()
    capabilities['acceptInsecureCerts'] = True

    # Menggabungkan options dan capabilities dalam objek ChromeOptions
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_experimental_option("w3c", False)
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")

    # Membuat driver dengan header yang telah dikonfigurasi
    driver = webdriver.Chrome(options=options)
    # Memuat halaman web
    driver.get(url)
    # Menunggu hingga semua elemen dimuat menggunakan Explicit Waits
    wait = WebDriverWait(driver, 100)
    wait.until(EC.presence_of_all_elements_located((By.CLASS_NAME, "Typography_body-md-bold__4bejd")))
    # Mendapatkan HTML dari halaman yang telah dimuat
    html = driver.page_source
    # Menutup WebDriver
    driver.quit()
    return html

def load_page_event(url):
    # Membuat objek options untuk mengatur header
    options = Options()
    options.add_argument("user-agent=Chrome/114.0.5735.199 (Windows NT 11.0; Win64; x64)")
    options.add_argument("From=Naura Valda P/18221173@std.stei.ac.id/basisdata@std.stei.itb.ac.id")

    # Membuat objek DesiredCapabilities untuk mengatur header lainnya
    capabilities = DesiredCapabilities.CHROME.copy()
    capabilities['acceptInsecureCerts'] = True

    # Menggabungkan options dan capabilities dalam objek ChromeOptions
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_experimental_option("w3c", False)
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")

    # Membuat driver dengan header yang telah dikonfigurasi
    driver = webdriver.Chrome(options=options)
    # Memuat halaman web
    driver.get(url)
    # Menunggu hingga semua elemen dimuat menggunakan Explicit Waits
    wait = WebDriverWait(driver, 20)
    wait.until(EC.presence_of_element_located((By.TAG_NAME, "time")))
    wait.until(EC.presence_of_all_elements_located((By.TAG_NAME, "meta")))
    wait.until(EC.presence_of_all_elements_located((By.TAG_NAME, "span"))) 
    # Mendapatkan HTML dari halaman yang telah dimuat
    html = driver.page_source
    # Menutup WebDriver
    driver.quit()
    return html

def create_soup(html):
    soup = BeautifulSoup(html, 'html.parser')
    return soup

def get_panel_event(soup,i):
    panel = soup.find_all('section', class_="event-card-details")
    return panel[i]

def get_name(soup,i):
    # fungsi find all untuk mencari element dengan tag h2 dan class yang sesuai
    try:
        name = soup.find_all('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--two Typography_align-match-parent__4bejd')[i]
        return name.text
    except:
        return None

# def get_time(soup,i):
#     elements = soup.find_all('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd eds-text-color--ui-800 Typography_align-match-parent__4bejd')[i].text
#     print(elements)
#     elTime = elements.split(' ')[2] + ' ' + elements.split(' ')[3]
#     print(elTime)
#     if elements.split(' ')[3] != "PM" or elements.split(' ')[3] != "AM":
#         elTime = elements.split(' ')[4] +' ' + elements.split(' ')[5]
#     if elTime[0]==' ':
#         elTime = elTime[1:]
#     print(elTime)
#     time = datetime.strptime(elTime, "%I:%M %p")
#     # Mengubah format waktu
#     formatted_time = time.strftime("%H:%M") 
#     return formatted_time

def get_event_url(soup,i):
    event_url = soup.find_all('a', class_='event-card-link')[i]
    return event_url['href']

def get_date(soup):
    date = soup.find('time').get('datetime')
    return date
def get_time(soup):
    element = soup.find('meta', attrs={'name': 'twitter:data2'})['value']
    elTime = element.split(' ')[5] + ' ' + element.split(' ')[6]
    time = datetime.strptime(elTime, "%I:%M %p")
    # Mengubah format waktu
    formatted_time = time.strftime("%H:%M")
    return formatted_time



# pake url event
def get_address(soup):
    meta_tag = soup.find('meta', attrs={'name': 'twitter:data1'})
    address = meta_tag['value']
    return address

def get_price(soup, i):
    section = soup.find_all('section', class_='event-card-details')[i*2+1]
    p_tag = section.find('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd Typography_align-match-parent__4bejd')
    text = p_tag.text
    if text == 'Free':
        price = 0
    else:
        print(text + "haha")
        idx = text.find('-')
        if idx==-1:
            i = text.find('$')
            price = float(text[i+1:].strip())
        # Menghapus karakter "$" dan spasi pada setiap nilai
        else:
            el = text.split('-')
            price = float(el[0].replace('$', '').strip())
    return price

# def get_price(soup):
#     tag = soup.find('span', class_='eds-text-bm eds-text-weight--heavy')
#     if tag == None:
#         print('p')
#         tag = soup.find('div', class_='conversion-bar__panel-info')
#         if tag == None:
#             tag = soup.find('div', class_='eds-text-bm eds-text-weight--heavy')
#     text = tag.text
#     if text == 'Free':
#         price=0
#     else:
#         print(text)
#         idx = text.find('$')
#         price = float(text[idx+1:])
#     return price
    

# pake url event
def get_duration(soup):
    # Menggunakan metode find() untuk mencari elemen <li> dengan class yang diberikan
    li_tag = soup.find('li', class_='eds-text-bm eds-text-weight--heavy css-1eys03p')
    # Mendapatkan teks dari elemen <li>
    duration = li_tag.text.strip()
    # Mendapatkan nilai jam dari string waktu
    days = int(duration.split(' ')[0])
    hours = 0
    if len(duration.split(' ')) == 3:
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
    return int(value)

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

def replace_hyphens_with_spaces(string):
    val = string.replace('--', ' ')
    val = val.replace('-', ' ')
    return val

# url = 'https://www.eventbrite.com/d/indonesia/business--events/?page=1/'
# # Membuat objek WebDriver
# driver = webdriver.Chrome()

# # Memuat halaman web
# driver.get(url)

# # Menunggu hingga semua elemen dimuat menggunakan Explicit Waits
# wait = WebDriverWait(driver, 100)
# # wait.until(EC.presence_of_element_located((By.CLASS_NAME, "Typography_root__4bejd")))
# # wait.until(EC.presence_of_element_located((By.CLASS_NAME, "#585163")))
# wait.until(EC.presence_of_all_elements_located((By.CLASS_NAME, "Typography_body-md-bold__4bejd")))
# # wait.until(EC.presence_of_element_located((By.CLASS_NAME, "Typography_align-match-parent__4bejd")))

# # Mendapatkan HTML dari halaman yang telah dimuat
# html = driver.page_source

# # Menutup WebDriver
# driver.quit()

# soup = BeautifulSoup(html, 'html.parser')
url = 'https://www.eventbrite.com/d/indonesia/business--events/?page=2'
html = load_page_source(url)
soup = create_soup(html)
print(get_name(soup,1))
# print(get_time(soup,0))
url1 = get_event_url(soup,1)
print(url1)
print(get_price(soup,1))
# url1 = 'https://www.eventbrite.com/e/jakarta-leadership-delegation-skills-for-busy-leaders-why-how-tickets-449153629597?aff=ebdssbdestsearch'
# soup1 = create_soup(load_page_event(url1))
# print(get_date(soup1))
# print(get_time(soup1))
# print(get_price(soup1))
# print(get_address(soup1))
# print(get_duration(soup1))
# print(get_organizer(soup1))
# print(get_totalfolowersorganizer(soup1))
# print(get_organizerpage(soup1))
# print(get_lattitude(soup1))
# print(get_longitude(soup1))
# print(url1)




