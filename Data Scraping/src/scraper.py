from bs4 import BeautifulSoup
import requests
import pandas as pd
import os

id = []
title = []
price = []
isbn = []

headers = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'}

genre_df = pd.DataFrame(columns = ["Book ID", "Genre"])
author_df = pd.DataFrame(columns = ["Book ID", "Author"])

# Function to adjust the book title to match the product page url
def adjustment(title) :
    title = title.lower()
    title = title.replace(" ", "-").replace("’", "").replace("!", "").replace(",", "")
    
    # Adjustment for one product that has typo in the product page url
    if (title == "fairyland-adventure") :
        title = "fairlyland-adventure"
    
    return title

# Function to get the author and isbn of the book from the product page
def get_item(title, book_id) :
    url = "https://kecilkecilpunyakarya.com/product/" + title + "/"
    response = requests.get(url, headers = headers)
    soup = BeautifulSoup(response.content, "html.parser")

    # Each information is stored in a p tag
    info = soup.find_all('p')

    # Check if the product page contain isbn and author information
    contain_isbn = False
    contain_author = False

    for i in info :
        if ("ISBN: " in i.get_text()) :
            contain_isbn = True

        if ("Penulis: " in i.get_text()) :
            contain_author = True

    # Get the author and isbn information
    # Some product has one or more authors
    # But each product has only one isbn if it's already been published
    authors = []
    for i in info :
        if (not contain_isbn and not contain_author) :
            isbn.append(None)
            break
        elif (not contain_isbn) :
            if ("Penulis: " in i.get_text()) :
                book_author = i.get_text().replace("Penulis: ", "").replace("\u2019", "'").replace(", dkk.", "")
                authors = book_author.split(", ")
                isbn.append(None)
                break
        elif (not contain_author) :
            if ("ISBN: " in i.get_text()) :
                book_isbn = i.get_text().replace("ISBN: ", "")
                isbn.append(book_isbn)
                break
        elif (contain_isbn and contain_author) :
            if ("Penulis: " in i.get_text()) :
                book_author = i.get_text().replace("Penulis: ", "").replace("\u2019", "'").replace(", dkk.", "")
                authors = book_author.split(", ")
            elif ("ISBN: " in i.get_text()) :
                book_isbn = i.get_text().replace("ISBN: ", "")
                isbn.append(book_isbn)

    # If the book have information about the author, add it to the author_df
    if authors != [] :
        for a in authors :
            new_row = [book_id, a]
            author_df.loc[len(author_df)] = new_row
    
    return response

# Declare variable to count how many books in the catalogue
count = 0

# KKPK product catalogue consist of 11 web pages
for i in range (11) :
    if i == 0 :
        url = "https://kecilkecilpunyakarya.com/shop/"
    else :
        url = "https://kecilkecilpunyakarya.com/shop/page/" + str(i+1) + "/"

    response = requests.get(url, headers = headers)
    soup = BeautifulSoup(response.content, "html.parser")

    # Every information of the product is stored in a div with class "woocommerce-product-inner"
    produk = soup.find_all("div", "woocommerce-product-inner")

    for p in produk :
        # There might be a product that has one or more genres
        genres = []

        book_title = p.find('h3', 'woocommerce-product-title').get_text().replace("\n", "").replace("\u2019", "'")
        book_genres = p.find('div', 'woocommerce-product-category').get_text().replace("\n", "").replace(" ", "")
        book_price = p.find('span', 'price').get_text().replace("Rp", "").replace(".", "")

        genres = book_genres.split(",")

        title.append(book_title)
        price.append(int(book_price))

        count += 1
        if (count < 10) :
            book_id = "BOOK00" + str(count)
        else :
            book_id = "BOOK0" + str(count)
        id.append(book_id)

        book_url = adjustment(book_title)
        item_response = get_item(book_url, book_id)
        print(f"{item_response} : Scraped {book_title}")


        # If the book have information about the genre, add it to the genre_df
        for g in genres :
            new_row = [book_id, g]
            genre_df.loc[len(genre_df)] = new_row
    
    print(f"{response} : Done scraping from page {i + 1}")

product_dict = {
    "Book ID" : id,
    "Book Title" : title,
    "Price" : price,
    "ISBN" : isbn
}

book_df = pd.DataFrame(product_dict, columns = ["Book ID", "Book Title", "Price", "ISBN"])

book_df.sort_values("Book ID", ascending = True)
genre_df.sort_values("Book ID", ascending = True)
author_df.sort_values("Book ID", ascending = True)
# print(len(book_df))
# print(len(genre_df))
# print(len(author_df))

dir = os.getcwd()

book_df.to_json(dir[:-3] + 'data\\book_details.json', orient = 'records', indent = 2)
genre_df.to_json(dir[:-3] + 'data\\book_genre.json', orient = 'records', indent = 2)
author_df.to_json(dir[:-3] + 'data\\book_author.json', orient = 'records', indent = 2)