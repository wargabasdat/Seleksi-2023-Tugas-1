import time
from bs4 import BeautifulSoup
# import requests
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

# load page source menggunakan selenium
def load_page_source(url):
    max_retries = 6
    retries = 0
    # Membuat objek options untuk mengatur header
    options = Options()
    options.add_argument("user-agent=Chrome/114.0.5735.199 (Windows NT 11.0; Win64; x64)")
    options.add_argument("From=Naura Valda P/18221173@std.stei.ac.id/basisdata@std.stei.itb.ac.id")
    capabilities = DesiredCapabilities.CHROME.copy()
    capabilities['acceptInsecureCerts'] = True
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_experimental_option("w3c", False)
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")

    while retries < max_retries:
        try:
            # Membuat driver dengan header yang telah dikonfigurasi
            driver = webdriver.Chrome(options=options)
            # Memuat halaman web
            driver.get(url)
            # Menunggu hingga semua elemen dimuat menggunakan Explicit Waits
            wait = WebDriverWait(driver, 20)
            wait.until(EC.presence_of_all_elements_located((By.CLASS_NAME, "Typography_body-md-bold__4bejd")))
            wait.until(EC.presence_of_all_elements_located((By.CLASS_NAME, "Typography_root__4bejd")))
            # Mendapatkan HTML dari halaman yang telah dimuat
            html = driver.page_source
            # Menutup WebDriver
            driver.quit()
            return html
        except Exception as e:
            print(e)
            retries += 1
            time.sleep(5)
            print("Retrying...")

# load page event menggunakan selenium
def load_page_event(url):
    max_retries = 3
    retries = 0
    # Membuat objek options untuk mengatur header
    options = Options()
    options.add_argument("user-agent=Chrome/114.0.5735.199 (Windows NT 11.0; Win64; x64)")
    options.add_argument("From=Naura Valda P/18221173@std.stei.ac.id/basisdata@std.stei.itb.ac.id")
    capabilities = DesiredCapabilities.CHROME.copy()
    capabilities['acceptInsecureCerts'] = True
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_experimental_option("w3c", False)
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")

    while retries<max_retries:
        try:
            driver = webdriver.Chrome(options=options)
            driver.get(url)
            wait = WebDriverWait(driver, 20)
            wait.until(EC.presence_of_element_located((By.TAG_NAME, "time")))
            wait.until(EC.presence_of_all_elements_located((By.TAG_NAME, "meta")))
            wait.until(EC.presence_of_all_elements_located((By.TAG_NAME, "span"))) 
            html = driver.page_source
            driver.quit()
            return html
        except Exception as e:
            print(e)
            retries += 1
            time.sleep(5)
            print("Retrying...")
    driver.quit()
    return None

# membuat objek soup
def create_soup(html):
    soup = BeautifulSoup(html, 'html.parser')
    return soup

# scrape jumlah page per category
def get_max_page(soup):
    li_tag = soup.find('li', class_='eds-pagination__navigation-minimal eds-l-mar-hor-3')
    if li_tag == None:
        return None
    max_page = int(li_tag.text.replace('1 of ', ''))
    return max_page

# scrape nama event
def get_name(soup,i):
    try:
        name = soup.find_all('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--two Typography_align-match-parent__4bejd')[i]
        return name.text
    except:
        return None

# scrape link event
def get_event_url(soup,i):
    section = soup.find_all('section', class_='event-card-details')[i*2]
    event_url = section.find('a', class_='event-card-link')
    return event_url['href']

# scrape tanggal event
def get_date(soup):
    date = soup.find('time').get('datetime')
    return date

# scrape waktu mulai event
def get_time(soup):
    element = soup.find('meta', attrs={'property': 'event:start_time'})['content']
    elTime = element.split('T')[1]
    time = elTime.split('+')[0]
    return time

# scrape alamat lokasi event
def get_address(soup):
    meta_tag = soup.find('meta', attrs={'name': 'twitter:data1'})
    if (meta_tag == None):
        return None
    address = meta_tag['value']
    return address

def get_elm_page(soup, i):
    section = soup.find_all('section', class_='event-card-details')[i*2+1]
    p_tag = section.find('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd Typography_align-match-parent__4bejd')
    if p_tag == None:              
        p_tag = section.find('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd eds-text-color--ui-800 Typography_align-match-parent__4bejd')
    text = p_tag.text
    if text == 'Free':
        elm = 0
    else:
            idx = text.find('-')
            if idx==-1:
                i = text.find('$')
                elm = float(text[i+1:].strip())
            # Menghapus karakter "$" dan spasi pada setiap nilai
            else:
                el = text.split('-')
                elm = float(el[0].replace('$', '').strip())
    return elm

# scrape event price
def get_price(soup, i):
    section = soup.find_all('section', class_='event-card-details')[i*2+1]
    p_tag = section.find('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd Typography_align-match-parent__4bejd')
    if p_tag == None:              
        p_tag = section.find('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd eds-text-color--ui-800 Typography_align-match-parent__4bejd')
        if p_tag == None:
            price = 0
    else:
        text = p_tag.text
        if text == 'Free':
            price = 0
        else:
            idx = text.find('-')
            if idx==-1:
                i = text.find('$')
                text = text.split('.')[0].replace(',','')
                price = float(text[i+1:].strip())
            else:
                el = text.split('-')
                el[0] = el[0].replace(',','')
                price = float(el[0].replace('$', '').strip())
    return float(price)

# scrape durasi event
def get_duration(soup):
    li_tag = soup.find('li', class_='eds-text-bm eds-text-weight--heavy css-1eys03p')
    if li_tag == None:
        return None
    else:
        duration = li_tag.text.strip()
        days = int(duration.split(' ')[0])
        hours = 0
        if len(duration.split(' ')) == 3:
            hours = int(duration.split(' ')[2])
        total_hours = days * 24 + hours
        return total_hours

# scrape nama organizer event
def get_organizer(soup):
    a_tag = soup.find('a', class_='descriptive-organizer-info__name-link')
    if a_tag == None:
        return "unknown"
    organizer = a_tag.text
    return organizer

# scrape total followers organizer event
def get_totalfollowersorganizer(soup):
    text = soup.find('span', class_='organizer-stats__highlight')
    if text == None:
        return 0
    else:
        text = text.text
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
        
# scrape event organizer page
def get_organizerpage(soup):
    a_tag = soup.find('a', class_='descriptive-organizer-info__name-link')
    if a_tag == None:
        return "unknown-page"
    organizerpage = a_tag['href']
    return organizerpage

# scrape latitude lokasi event
def get_lattitude(soup):
    meta_tag = soup.find('meta', attrs={'property': 'event:location:latitude'})
    if meta_tag == None:
        return None
    latitude = meta_tag['content']
    return latitude

# scrape longitude lokasi event
def get_longitude(soup):
    meta_tag = soup.find('meta', attrs={'property': 'event:location:longitude'})
    if meta_tag == None:
        return None
    longitude = meta_tag['content']
    return longitude

# mengubah format string
def replace_hyphens_with_spaces(string):
    val = string.replace('--', ' ')
    val = val.replace('-', ' ')
    return val




