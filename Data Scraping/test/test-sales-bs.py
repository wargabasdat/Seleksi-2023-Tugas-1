import pandas as pd
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from datetime import datetime
import time


# URL = "https://www.jamtangan.com/c/jam-tangan"
# URL = "https://www.jamtangan.com/p/avi8-hawker-hunter-av408001-duke-chronograph-men-black-dial-black-leather-strap-462741?list-referer-id=Jam%20Tangan%20Pria&list-referer-name=Jam%20Tangan%20Pria%20Brand%20Avi%208"

URL = "https://www.jamtangan.com/p/casio-gshock-gclassic-ga1001a1dr-analogdigital-dial-resin-band-15821?list-referer-id=Jam%20Tangan&list-referer-name=Jam%20Tangan"

time_start = time.time()

driver = webdriver.Chrome()
driver.get(URL)

result = []
content = driver.page_source
soup = BeautifulSoup(content, "html.parser")
# print(soup.prettify())

sales_dict = {
    "Product Name" : "",
    "Brand" : "",
    "Model No" : "",
    "Normal Price" : "",
    "Discounted Price" : "",
    "Discount Percentage" : "",
    "Number of Seen" : "",
    "Number of Sold" : "",
    "Online Stock Status" : "",
    "Offline Stock Status" : ""
}

# time.sleep(0.5)
spec_grid = soup.find("div", {"class": "tab-content"})
# time.sleep(0.5)
spec_grid = spec_grid.find("div", {"class": "grid"})
# spec_grid = soup.find("div", {"class": "tab-content"})
# spec_grid = soup.select_one("div.tab-content")
# print(spec_grid)
# time.sleep(0.5)
spec_list_raw = spec_grid.find_all("div", {"class": "spec-item"})

for spec in spec_list_raw:
    # time.sleep(0.5)
    if spec.find("div", {"class": "font-black"}).text in ["Brand", "Model No"]:
        # time.sleep(0.5)
        data = spec.findAll("div", {"class": "leading-6"})
        key = data[0].text.strip()
        value = data[1].text.strip()
        sales_dict[key] = value

# spec_list = [spec for spec in spec_list_raw if spec.find("div", {"class": "font-black"}).text in ["Brand", "Model No"]]

# for spec in spec_list:
#     data = spec.findAll("div", {"class": "leading-6"})
#     key = data[0].text.strip()
#     value = data[1].text.strip()
#     sales_dict[key] = value

# time.sleep(0.5)
sales_dict["Product Name"] = soup.find("h1").text.strip()

try:
    # time.sleep(0.5)
    normal_price = soup.find("div", {"data-testid": "test-product-info"}).find("div", {"class": "line-through"}).text.strip()
except:
    # time.sleep(0.5)
    normal_price = soup.find("div", {"data-testid": "test-product-info"}).find("div", {"class": "text-xl"}).text.strip()
# time.sleep(0.5)
discounted_price = soup.find("div", {"data-testid": "test-product-info"}).find("div", {"class": "text-xl"}).text.strip()
sales_dict["Normal Price"] = int(normal_price.replace("Rp", "").replace(".", "").strip())
sales_dict["Discounted Price"] = int(discounted_price.replace("Rp", "").replace(".", "").strip())

discount_percentage = (sales_dict["Normal Price"] - sales_dict["Discounted Price"]) / sales_dict["Normal Price"]
sales_dict["Discount Percentage"] = round(discount_percentage * 100, 2)

# time.sleep(0.5)
num_seen = soup.find("span", {"class": "ic-eye"}).find_next_sibling("div").contents[1].text.strip()
if (num_seen.__contains__("Rb")):
    num_seen = float(num_seen.replace(" Rb", "").strip()) * 1000
sales_dict["Number of Seen"] = int(num_seen)

# time.sleep(0.5)
num_sold = soup.select_one(".ic-cart.mr-1").find_next_sibling("div").contents[1].text.strip()
if (num_sold.__contains__("Rb")):
    num_sold = float(num_sold.replace(" Rb", "").strip()) * 1000
sales_dict["Number of Sold"] = int(num_sold)

# time.sleep(0.5)
try:
    empty_badge = soup.select(".badge.bg-accent-red")
    if (empty_badge != None and empty_badge.text.strip().__contains__("habis")):
        sales_dict["Online Stock Status"] = "Empty"
    else:
        raise Exception("The badge is not empty badge")
except:
    # time.sleep(0.5)
    online_stock_status = soup.find("div", {"class": "stepper-wrapper"}).find_next_sibling("div").text.strip()
    if (online_stock_status == "STOK ONLINE < 5 PCS"): sales_dict["Online Stock Status"] = "Low (< 5 PCS)"
    elif (online_stock_status == "STOK ONLINE > 5 PCS"): sales_dict["Online Stock Status"] = "High (>= 5 PCS)"
    else: sales_dict["Online Stock Status"] = "Unknown"

print(f"Online Stock Status real: {online_stock_status}")

driver.quit()

for key in sales_dict.keys():
    print(f"{key}: {sales_dict[key]}")

time_end = time.time()

dt1 = datetime.fromtimestamp(time_start)
print('Datetime Start:', dt1)
dt2 = datetime.fromtimestamp(time_end)
print('Datetime End:', dt2)

delta = dt2 - dt1
print('Difference is:', delta)


# # print(specs_grid.prettify())
# # print(specs_grid.prettify())

# # print("\n\n========================================================\n\n")

# specs_grid = soup.find("div", {"class": "tab-content"}).find("div", {"class": "grid"})
# specs_list = specs_grid.find_all("div", {"class": "spec-item"})
# sprecs_dict = {}

# for spec in specs_list:
#     # print(spec.prettify())
#     data = spec.findAll("div", {"class": "leading-6"})
#     key = data[0].text.strip()
#     value = data[1].text.strip()
#     print(f"({key}, {value}")
#     result.append([key, value])

# driver.quit()
