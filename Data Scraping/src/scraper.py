from book_scraper import *

title = []
genre = []
price = []

def adjustment(title) :
    title = title.lower()
    title = title.replace(" ", "-").replace("’", "").replace("!", "").replace(",", "")
    
    if (title == "fairyland-adventure") :
        title = "fairlyland-adventure"
    
    return title

for i in range (11) :
    if i == 0 :
        url = "https://kecilkecilpunyakarya.com/shop/"
    else :
        url = "https://kecilkecilpunyakarya.com/shop/page/" + str(i+1) + "/"

    headers = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'}
    response = requests.get(url, headers = headers)
    print(f"{response} : Berhasil melakukan scrapping dari halaman ke-{i + 1}")
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

        book_title = adjustment(book_title)
        get_item(book_title)
        # print(book_title, book_genres, book_price)

# print(len(title))
# print(len(genre))
# print(len(price))
# print(len(author))
# print(len(isbn))

product_dict = {
    "Book Title" : title,
    "Genre" : genre,
    "Price" : price,
    "Author" : author,
    "ISBN" : isbn
}

df = pd.DataFrame(product_dict, columns = ["Book Title", "Genre", "Price", "Author", "ISBN"])
df.sort_values("Book Title", ascending = True)
print(df)