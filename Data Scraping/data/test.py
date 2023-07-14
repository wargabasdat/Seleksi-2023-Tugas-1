from bs4 import BeautifulSoup
import requests
from datetime import datetime, timedelta

url = 'https://www.eventbrite.com/d/indonesia/events/'
url2 = 'https://www.eventbrite.com/d/indonesia/all-events/'

def scrape_name_from_main_page(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # name = soup.find('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--two eds-text-color--ui-800 Typography_align-match-parent__4bejd')
    elements = soup.find_all('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--two eds-text-color--ui-800 Typography_align-match-parent__4bejd')
    events = [element.text for element in elements]
    return events

#berhasil

# fungsi scrape nama dari satu page
def scrape_name(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # fungsi find all untuk mencari element dengan tag h2 dan class yang sesuai
    elements = soup.find_all('h2', class_='Typography_root__4bejd #585163 Typography_body-lg__4bejd event-card__clamp-line--three Typography_align-match-parent__4bejd')
    name_events = [element.text for element in elements]
    return name_events

def scrape_date(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # fungsi find all untuk mencari element dengan tag h2 dan class yang sesuai
    elements = soup.find_all('p', class_='Typography_root__4bejd #585163 Typography_body-md-bold__4bejd eds-text-color--primary-brand Typography_align-match-parent__4bejd')[0].text
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
    # return date_events
    # # loop untuk mengganti url page
    # for i in range (1,15):
    #     url_specific_page = url + '?page=' + str(i)

# print(scrape_date(url2))

# formatted_date, formatted_time = scrape_date(url2)
# print("Date:", formatted_date)
# print("Time:", formatted_time)

def scrape_price(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # fungsi find all untuk mencari element dengan tag h2 dan class yang sesuai
    elements = soup.find_all('p', class_='Typography_root__4bejd #585163 Typography_body-md__4bejd event-card__clamp-line--one eds-text-color--ui-600 Typography_align-match-parent__14bejd')
    price_events = [element.text for element in elements]
    return price_events

print(scrape_price(url2))