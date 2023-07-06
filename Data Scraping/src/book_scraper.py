from bs4 import BeautifulSoup
from urllib.request import urlopen
import requests
import pandas as pd

author = []
isbn = []

def get_item(title) :
    url = "https://kecilkecilpunyakarya.com/product/" + title + "/"
    headers = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'}
    response = requests.get(url, headers = headers)
    print(f"{response} : Berhasil melakukan scrapping dari produk {title}")
    soup = BeautifulSoup(response.content, "html.parser")

    info = soup.find_all('p')
    # info = soup.find_all("div", "woocommerce-product-details__short-description")
    # print(info)

    contain_isbn = False
    contain_author = False

    for i in info :
        if ("ISBN: " in i.get_text()) :
            contain_isbn = True

        if ("Penulis: " in i.get_text()) :
            contain_author = True

    for i in info :
        # print(i.get_text())

        if (not contain_isbn and not contain_author) :
            author.append(None)
            isbn.append(None)
            break
        elif (not contain_isbn) :
            if ("Penulis: " in i.get_text()) :
                book_author = i.get_text().replace("Penulis: ", "")
                author.append(book_author)
                isbn.append(None)
                break
        elif (not contain_author) :
            if ("ISBN: " in i.get_text()) :
                book_isbn = i.get_text().replace("ISBN: ", "")
                isbn.append(book_isbn)
                author.append(None)
                break
        elif (contain_isbn and contain_author) :
            if ("Penulis: " in i.get_text()) :
                book_author = i.get_text().replace("Penulis: ", "")
                # print(book_author)
                author.append(book_author)
            elif ("ISBN: " in i.get_text()) :
                book_isbn = i.get_text().replace("ISBN: ", "")
                # print(book_isbn)
                isbn.append(book_isbn)

    # print(len(author))
    # print(len(isbn))
    # print(author, isbn)
