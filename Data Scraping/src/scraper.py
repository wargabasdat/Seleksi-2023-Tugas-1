#Imports
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
import time
from selenium.webdriver.common.by import By
# importing pandas as pd
import pandas as pd
 
#Opening the Chrome tab
driver = webdriver.Chrome()
driver.maximize_window()

#URL template
URL = "https://www.tripadvisor.com/Hotels-g297704-"
URL2 = "-Bandung_West_Java_Java-Hotels.html"

#Initialize
driver.get((URL+URL2))
obj = BeautifulSoup(driver.page_source,'lxml')
hotel_name,reviews,address,prices = [],[],[],[]
location,cleanliness,service,value = [],[],[],[]
# Collecing the first 3 pages (90 top hotels in Bandung)
for i in range(3):
    
    # Current page creation
    curr_page = 'oa'+str(i*30)
    driver.get((URL+curr_page+URL2))
    obj = BeautifulSoup(driver.page_source,'lxml')

    # Appending to list
    for name in obj.find_all("div",{"class": ["listing_title","nBrpc"]}):
        if(name.text.strip() not in hotel_name and 'Sponsored' not in name.text.strip()):
            hotel_name.append(name.text.strip())
            if len(hotel_name) == i:
                hotel_name.append('None')
    print(hotel_name)


curr_page = ''
for i in range(90):
    print(i)
    while True:
        try:
            # Reload the page while hotel name is not found on page
            driver.get((URL+curr_page+URL2))
            try:
                # Click the see all button when necessary
                if(i % 30 >=9 and i > 30):
                    driver.find_element(By.PARTIAL_LINK_TEXT, 'See all')
            except:
                pass
            # Hotel redirect
            hotel_link = driver.find_element(By.PARTIAL_LINK_TEXT, hotel_name[i])
            
            driver.get(hotel_link.get_attribute('href'))
            #Hotel redirect success
            break
        except:
            pass

    
    obj = BeautifulSoup(driver.page_source,'lxml')

    # Review collection, 0.0 if empty
    for review in obj.find_all("span",class_ = "uwJeR"):
        reviews.append(review.text.strip())
        if len(reviews) == i:
            reviews.append('0.0')
    print(reviews)
    count = 0
    for review in obj.find_all("span",class_ = "CzVMJ"):
        if count == 0:
            location.append(review.text.strip())
        if count == 1:
            cleanliness.append(review.text.strip())
        if count == 2:
            service.append(review.text.strip())
        if value == 3:
            value.append(review.text.strip())
        count+=1
    if len(location) == i:
        location.append('0.0')
    if len(cleanliness) == i:
        cleanliness.append('0.0')
    if len(service) == i:
        service.append('0.0')
    if len(value) == i:
        value.append('0.0')



    # Address collection, None if empty
    for place in obj.find_all("span",class_ = "oAPmj"):
        if(place.text.strip() not in address):
            address.append(place.text.strip())
            if len(address) == i:
                address.append("None")
    print(address)

    # Price average from 3 sources on the hotel page collection, 0 if empty
    ave = 0
    for price in obj.find_all("div",class_ = "gbXAQ"):
        nums = price.text.strip().split(',')
        for j in range (len(nums)):
            if(j == 0):
                nums[j] = nums[j][4:]
            ave += int(nums[j])*(10**((len(nums)-j-1)*3))
    ave = int(ave/3)
    prices.append(ave)
    if len(prices) == i:
        prices.append(0)
    print(prices)

    # To the next page if necessary
    if((i+1)%30 == 0):
        curr_page = 'oa'+str((i+1))
        
# Keeping to csv
dict = {'hotel_name': hotel_name, 'review': reviews, 'address': address,'prices' : prices,'location':location,'cleanliness':cleanliness,'service':service,'value':value}
df = pd.DataFrame(dict)
df.to_csv('data.csv')
