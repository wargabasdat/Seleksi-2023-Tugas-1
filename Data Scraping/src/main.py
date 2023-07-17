# Import libraries
from bs4 import BeautifulSoup
import requests
import time
import json
from tqdm import tqdm

# Set up url and headers
url = "https://guide.michelin.com/en/restaurants"
headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67"}

# Awards category to scrap
awards = {
    "1-star-michelin": "1 Star", 
    "2-stars-michelin": "2 Stars", 
    "3-stars-michelin": "3 Stars",
    }

def get_last_page(award):
    """Get last page from each awards category"""

    page_url = "{url}/{award}".format(url=url,award=award)
    html_page = requests.get(page_url, headers=headers).text
    soup = BeautifulSoup(html_page,'lxml')
    last_page = int(soup.find('ul', class_ = "pagination").find_all('a')[-2].text)
    return last_page

def convert_price_category(price):
    """Convert price category to readable format"""
    
    if price == 1:
        return "On a budget"
    elif price == 2:
        return "A moderate spend"
    elif price == 3:
        return "Special occasion"
    elif price == 4:
        return "Spare no expense"
    else:
        return "-"

def get_restaurant_data(link, award):
    """Get data from each restaurant"""

    restaurant_page = requests.get("https://guide.michelin.com"+link, headers=headers).text
    restaurant_soup = BeautifulSoup(restaurant_page,'lxml')

    # restaurant name
    restaurant_name = restaurant_soup.find("h1",class_="restaurant-details__heading--title").text

    # restaurant address
    restaurant_address = restaurant_soup.find("li",class_="restaurant-details__heading--address").text
    
    # restaurant country
    restaurant_country = restaurant_address.split(',')[-1].strip()

    # formatted restaurant price and cuisine type
    try:
        restaurant_price, restaurant_cuisine = [detail.strip() for detail in restaurant_soup.find("li", class_="restaurant-details__heading-price").find("span").text.replace('\n','').split('·')]
        restaurant_cuisine = [cuisine.strip() for cuisine in restaurant_cuisine.split(',')]
        restaurant_price = convert_price_category(len(restaurant_price))
    except:
        restaurant_price = "-"
        restaurant_cuisine =  [cuisine.strip() for cuisine in restaurant_soup.find("li", class_="restaurant-details__heading-price").find("span").text.split(',')]

    # restaurant description
    restaurant_description = restaurant_soup.find("div",class_="restaurant-details__description--text").text.strip().replace('\n',' ')

    # booking availability
    try:
        if restaurant_soup.find('a', attrs = {"data-event":"partner_book"}).text.strip() == "Book":
            restaurant_available = True
        else:
            restaurant_available = False
    except:
        restaurant_available = False

    # restaurant phone number
    try:
        restaurant_phone_number = restaurant_soup.find('a',attrs = {"data-event":"CTA_tel"})['href'][4:].replace(' ','')
    except:
        restaurant_phone_number = '-'

    # restaurant url
    try:
        restaurant_url = restaurant_soup.find('a',attrs={"data-event":"CTA_website"})["href"]
    except:
        restaurant_url = '-'

    # create json structure 
    new_restaurant = {
        "name": restaurant_name,
        "country": restaurant_country,
        "address": restaurant_address,
        "award": award,
        "description": restaurant_description,
        "price_type": restaurant_price,
        "cuisine_type": restaurant_cuisine,
        "reservation_availability": restaurant_available,
        "phone_number": restaurant_phone_number,
        "restaurant_url": restaurant_url
    }

    return new_restaurant

def write_json(restaurant):
    """Write data to json file"""

    with open("../data/MichelinAwardRestaurants.json", "w+", encoding="utf-8") as file:
        dump = json.dumps(restaurant, ensure_ascii=False, indent=4)
        file.write(dump)
        file.close()

def get_page_html(page, award):
    """Get html page from each awards category"""

    page_url = "{url}/{award}/page/{page}".format(url=url, award=award, page=page)
    restaurants_page = requests.get(page_url, headers=headers).text
    page_soup = BeautifulSoup(restaurants_page,'lxml')
    return page_soup

def get_page_links(page_soup):
    """Get all individual restaurant url"""

    restaurants = page_soup.find_all(class_="col-md-6 col-lg-4 col-xl-3")
    links = [link["href"] for restaurant in restaurants for link in restaurant.find_all('a', class_="link with-love")]
    return links

def scraper():
    """Main function to scrap data"""

    restaurant = []
    count = 0

    # Scrap base on Michelin Awards
    for key, value in awards.items():
        last_page = get_last_page(key)

        # Scrap for each award
        print(f"Start Scraping {value} MICHELIN Restaurants")
        for page in tqdm(range(1, last_page + 1)):
            page_soup = get_page_html(page, key)

            # Get all individual restaurant url and location
            links = get_page_links(page_soup)

            # Get data from each restaurant
            for link in links:
                try:
                    new_restaurant = get_restaurant_data(link, value)

                    # add new object to list
                    restaurant.append(new_restaurant)
                    count+=1
                except Exception as error:
                    print(link)
                    print(error)
                    pass
            time.sleep(2)
        print(f"Done scraping {count} restaurant data")
        
    return restaurant

if __name__ == "__main__":
    restaurant = scraper()
    write_json(restaurant)