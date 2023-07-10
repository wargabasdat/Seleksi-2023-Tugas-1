from bs4 import BeautifulSoup
import requests
import json
import pandas as pd

# Request the main site
url = "https://www.klikindomaret.com/category/sarapan"
result = requests.get(url)
doc = BeautifulSoup(result.text, "html.parser")

# Grab the array of items found in the url
content_container = doc.find("div", "product-collection")
item = content_container.find_all("div", "item")
json_array = []
json_dict = {}
for g in item:

    # Request url of each item to get more data from the g item
    product_url = "https://www.klikindomaret.com" + g.find("a", href=True)['href']
    product_details = requests.get(product_url)
    product_doc = BeautifulSoup(product_details.text, "html.parser")

    # Initialize an empty dictionary
    item_dict = {}

    # Find the PLU of each item
    plu = product_doc.find("span", {"id": "spec_id_PLU"})
    # Add PLU as the value of "PLU" to item_dict
    item_dict["PLU"] = int(plu.text)

    # Find the name of each item
    item_name = g.find("div", "title")
    # Add item name as the value of "Item name" to item_dict
    item_dict["Item name"] = item_name.text.replace("\n", "") # Replace newline with blank

    # Find the name of warehouse
    warehouse_indomaret = g.find("span", "send-store-blue")
    warehouse_jakarta = g.find("span", "send-warehouse")
    if warehouse_indomaret != None: # If product comes from toko indomaret
        item_dict["Warehouse Name"] = warehouse_indomaret.text
    if warehouse_jakarta != None: # If product comes from warehouse jakarta
        item_dict["Warehouse Name"] = warehouse_jakarta.text

    # Find final price of each item
    final_price = g.find("span", "price-value")
    # Add final price as the value of "Final price (Rp)" to item_dict
    item_dict["Final price (Rp)"] = int((final_price.text.replace("Rp ", "")).replace(".", "")) # Replace Rp and . with blank

    # Find discount percentage of each item
    discount_percentage = g.find("span", "discount")
    # Add product discount as the value of "Discount (%)" to item_dict
    if discount_percentage == None: # Product discount is not found
        item_dict["Discount (%)"] = 0
    else:
        item_dict["Discount (%)"] = int(discount_percentage.text.replace("%", "")) # Replace % with blank

    # Find product image
    product_image = g.find("img")["data-src"]
    # Add product image as the value of "Image (URL)" to item_dict
    if product_image == None: # Product image is not found
        item_dict["Image (URL)"] = "N/A"
    else:
        item_dict["Image (URL)"] = product_image
    
    # Find product description
    product_description = product_doc.find("span", {"id": "desc-product"})
    # Add product description as the value of "Description" to item_dict
    if product_description == None: # Product description is not found
        item_dict["Description"] = "N/A"
    else:
        item_dict["Description"] = product_description.text.replace("\n", "") # Replace newline with blank

    # Find product composition
    product_composition = product_doc.find("span", "spec_id_KOMPOSISI")
    # Add product composition as the value of "Composition" to item_dict
    if product_composition == None: # Product composition is not found
        item_dict["Composition"] = "N/A"
    else:
        item_dict["Composition"] = product_composition.text.replace("\n", "") # Replace newline with blank

    # Add the data from item_dict to the json_array
    json_array.append(item_dict)

# Add json_array as the value of "products" to json_dict
json_dict["products"] = json_array

# Write json file from json_dict that contains the product data in the data folder
with open("../data/data_sarapan.json", "w") as outfile:
    json.dump(json_dict, outfile, indent=4)

print("Json file is successfully created!")

# Turn json into string
string_json = json.dumps(json_dict)

# Use pandas to read json string
df = pd.read_json(string_json)

# Turn json string into csv
df.to_csv('../data/data_sarapan.csv')
print("CSV file is successfully created!")
