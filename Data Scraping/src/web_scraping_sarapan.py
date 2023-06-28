from bs4 import BeautifulSoup
import requests
import json

url = "https://www.klikindomaret.com/category/sarapan"
result = requests.get(url)
doc = BeautifulSoup(result.text, "html.parser")

content_container = doc.find("div", "product-collection")
item = content_container.find_all("div", "item")
json_array = []
for g in item:

    product_url = "https://www.klikindomaret.com" + g.find("a", href=True)['href']
    product_details = requests.get(product_url)
    product_doc = BeautifulSoup(product_details.text, "html.parser")

    item_dict = {}

    plu = product_doc.find("span", {"id": "spec_id_PLU"})
    item_dict["PLU"] = int(plu.text)

    item_name = g.find("div", "title")
    item_dict["Item name"] = item_name.text.replace("\n", "")

    final_price = g.find("span", "price-value")
    item_dict["Final price (Rp)"] = int((final_price.text.replace("Rp ", "")).replace(".", ""))

    discount_percentage = g.find("span", "discount")
    if discount_percentage == None:
        item_dict["Discount (%)"] = 0
    else:
        item_dict["Discount (%)"] = int(discount_percentage.text.replace("%", ""))

    product_image = g.find("img")["data-src"]
    if product_image == None:
        item_dict["Image (URL)"] = "N/A"
    else:
        item_dict["Image (URL)"] = product_image
    
    product_description = product_doc.find("span", {"id": "desc-product"})
    if product_description == None:
        item_dict["Description"] = "N/A"
    else:
        item_dict["Description"] = product_description.text.replace("\n", "")

    product_composition = product_doc.find("span", "spec_id_KOMPOSISI")
    if product_composition == None:
        item_dict["Composition"] = "N/A"
    else:
        item_dict["Composition"] = product_composition.text.replace("\n", "")

    json_array.append(item_dict)

with open("../data/data_sarapan.json", "w") as outfile:
    json.dump(json_array, outfile, indent=4)

print("Json file is successfully created!")
