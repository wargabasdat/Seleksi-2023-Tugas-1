import pandas as pd
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from datetime import datetime
import time

def to_isoformat(input):
    month_dict = {
        "Jan": "01",
        "Feb": "02",
        "Mar": "03",
        "Apr": "04",
        "Mei": "05",
        "Jun": "06",
        "Jul": "07",
        "Ags": "08",
        "Sep": "09",
        "Okt": "10",
        "Nov": "11",
        "Des": "12"
    }

    for key, value in month_dict.items():
        input = input.replace(key, value)
    
    datetime_object = datetime.strptime(input, "%d %m %Y, %H:%M WIB")

    date = datetime_object.date()
    time = datetime_object.time()

    return [date, time]

def to_email(name):
    name = name.lower().strip()
    email = name.replace(" ", "") + "@gmail.com"
    return email

# URL = "https://www.jamtangan.com/c/jam-tangan"
# URL = "https://www.jamtangan.com/p/avi8-hawker-hunter-av408001-duke-chronograph-men-black-dial-black-leather-strap-462741?list-referer-id=Jam%20Tangan%20Pria&list-referer-name=Jam%20Tangan%20Pria%20Brand%20Avi%208"

# URL = "https://www.jamtangan.com/p/casio-gshock-gclassic-ga1001a1dr-analogdigital-dial-resin-band-15821?list-referer-id=Jam%20Tangan&list-referer-name=Jam%20Tangan"

# URL = "https://www.jamtangan.com/p/cccp-kashalot-submarine-cp700401-automatic-rose-gold-dial-dark-brown-leather-strap-317341?list-referer-id=Jam%20Tangan&list-referer-name=Jam%20Tangan%20Movement%20Manual%20Winding"

URL = "https://www.jamtangan.com/p/casio-general-ltp1215a2adf-enticer-ladies-blue-dial-stainless-steel-band-122102?list-referer-id=Jam%20Tangan&list-referer-name=Jam%20Tangan%20Brand%20Casio"

time_start = time.time()

driver = webdriver.Chrome()
driver.get(URL)
driver.maximize_window()

customer_dict = {
    "Email" : "",
    "Name" : "",
    "Member Status" : ""
}
customer_header = customer_dict.keys()
customer_list = []

review_dict = {
    "ID Review" : "",
    "Product Name" : "",
    "Email" : "",
    "Date" : "",
    "Time" : "",
    "Rating" : "",
    "Delivery Review" : "",
    "Product Review" : ""
}
review_header = review_dict.keys()
review_list = []

MAX_REVIEW_PER_PRODUCT = 5
div_review_pagination = driver.find_element(By.CSS_SELECTOR, ".pb-14")
try:
    max_tab_per_product = int(div_review_pagination.find_elements(By.TAG_NAME, "li")[-2].text)
except:
    max_tab_per_product = 1

review_count = 0
tab_count = 0
while (review_count < MAX_REVIEW_PER_PRODUCT and tab_count < max_tab_per_product):
    time.sleep(1)
    div_review_pagination = driver.find_element(By.CSS_SELECTOR, ".pb-14")
    review_divs = div_review_pagination.find_elements(By.XPATH, "preceding-sibling::*[position() <= 3]")

    for review in review_divs:
        reviewer_name = review.find_element(By.CSS_SELECTOR, ".mb-1 .text-base").text
        if reviewer_name[1] == '*' and reviewer_name[-2] == '*': continue

        product_name = driver.find_element(By.CSS_SELECTOR, "h1").text

        rating = len(review.find_elements(By.CSS_SELECTOR, ".rating .ic-star-fill"))
        datetime_review = to_isoformat(review.find_element(By.CSS_SELECTOR, "span.block.text-xxs").text)
        date_review, time_review = datetime_review[0], datetime_review[1]
        
        paragraph_review = review.find_elements(By.CSS_SELECTOR, "p")
        delivery_review = ""
        product_review = ""
        for par in paragraph_review:
            title = par.find_element(By.CSS_SELECTOR, "span").text
            if title == "Pengiriman:": delivery_review = par.text.lstrip("Pengiriman: ")
            if title == "Produk:": product_review = par.text.lstrip("Produk: ")
            else: continue
        if delivery_review == "": delivery_review = "Tidak ada review"
        if product_review == "": product_review = "Tidak ada review"

        member_status = driver.find_element(By.CSS_SELECTOR, ".badge.text-xxs").text

        review_count += 1
        if review_count > MAX_REVIEW_PER_PRODUCT: break

        customer_result = [to_email(reviewer_name), reviewer_name, member_status]
        for key, value in zip(customer_header, customer_result):
            customer_dict[key] = value
        customer_list.append(customer_dict.copy())
    
        result_review = [review_count, product_name, to_email(reviewer_name), date_review, time_review, rating, delivery_review, product_review]
        for key, value in zip(review_header, result_review):
            review_dict[key] = value
        review_list.append(review_dict.copy())
    
    tab_count += 1
    div_review_pagination = driver.find_element(By.CSS_SELECTOR, ".pb-14")
    page_buttons = div_review_pagination.find_elements(By.TAG_NAME, "li")
    for page_button in page_buttons:
        if page_button.text == str(tab_count + 1): 
            page_button.click()
            break

# for review in review_list:
#     print("=================================================================")
#     print(f"ID Review: {review['ID Review']}")
#     print(f"Product Name: {review['Product Name']}")
#     print(f"Email: {review['Email']}")
#     print(f"Date Review: {review['Date']}")
#     print(f"Time Review: {review['Time']}")
#     print(f"Rating: {review['Rating']}")
#     print(f"Delivery Review: {review['Delivery Review']}")
#     print(f"Product Review: {review['Product Review']}")
#     print("=================================================================")

# print("=================================================================")
# for customer in customer_list:
#     print(f"Email: {customer['Email']}")
#     print(f"Name: {customer['Name']}")
#     print(f"Member Status: {customer['Member Status']}")
#     print("=================================================================")



# print(len(review_list))
# for review in review_list:
#     print(review.find_element(By.CSS_SELECTOR, ".mb-1 .text-base").text)


driver.quit()

# for key in review_dict.keys():
#     print(f"{key}: {review_dict[key]}")

time_end = time.time()

dt1 = datetime.fromtimestamp(time_start)
print('Datetime Start:', dt1)
dt2 = datetime.fromtimestamp(time_end)
print('Datetime End:', dt2)

delta = dt2 - dt1
print('Difference is:', delta)

