from bs4 import BeautifulSoup
from urllib.request import urlopen
import requests
import pandas as pd

title = []
genre = []
price = []

for i in range (11) :
    if i == 0 :
        url = "https://kecilkecilpunyakarya.com/shop/"
    else :
        url = "https://kecilkecilpunyakarya.com/shop/page/" + str(i+1) + "/"
    response = requests.get(url)
    print(response, ": Berhasil melakukan scrapping dari halaman ke", i + 1)
    soup = BeautifulSoup(response.content, "html.parser")

    produk = soup.find_all("div", "woocommerce-product-inner")
    # print(produk)

    for p in produk :
        # print(p)
        book_title = p.find('h3', 'woocommerce-product-title').get_text().replace("\n", "")
        book_genres = p.find('div', 'woocommerce-product-category').get_text().replace("\n", "")
        book_price = p.find('span', 'price').get_text().replace("Rp", "").replace(".", "")
        title.append(book_title)
        genre.append(book_genres)
        price.append(book_price)
        # print(book_title, book_genres, book_price)

product_dict = {
    "Product Name" : title,
    "Genre" : genre,
    "Price" : price
}

df = pd.DataFrame(product_dict, columns = ["Product Name", "Genre", "Price"])
df.sort_values("Product Name", ascending = True)
print(df)