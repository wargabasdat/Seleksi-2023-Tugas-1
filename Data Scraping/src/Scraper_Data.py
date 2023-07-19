import requests
import time
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import re
import json
from datetime import datetime

headers = {'user-agent': 'Mozilla/5.0 (X11; Linux x86_64)'}

# Send a GET request to the web page
url = "https://www.goodreads.com/list/show/1381.Best_Series"
response = None

while response is None:
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
    except requests.exceptions.RequestException:
        print("Failed to get the response. Retrying...")
        time.sleep(5)  # Wait for 5 seconds before retrying

# Create a BeautifulSoup object to parse the HTML content
soup = BeautifulSoup(response.content, 'html.parser')

# Find the book entries on the page
book_entries = soup.find_all('tr', {'itemtype': 'http://schema.org/Book'})

books_data = []
authors_data = []

# Iterate over the book entries and extract the name, author, and details
for entry in book_entries:
    # Extract the book title
    name_element = entry.find('a', {'class': 'bookTitle'})
    name = name_element.text.strip()

    # Extract the book author
    author_element = entry.find('a', {'class': 'authorName'})
    author = author_element.text.strip()

    #Extract the book rank
    rank_element = entry.find('td', class_= 'number')
    rank = int(rank_element.text.strip())

    # Get the book URL and make a request
    book_url = urljoin(url, name_element['href'])
    book_response = requests.get(book_url, headers=headers)

    time.sleep(2)
    book_soup = BeautifulSoup(book_response.content, 'html.parser')

    # Find and extract the book description
    book_description_element = book_soup.find('div', class_='BookPageMetadataSection__description')
    book_detail = "N/A"
    retries = 1
    while book_detail == "N/A":
        if (retries % 5 == 0):
            book_response = requests.get(book_url, headers=headers)
            time.sleep(2)
            book_soup = BeautifulSoup(book_response.content, 'html.parser')
            book_description_element = book_soup.find('div', class_='BookPageMetadataSection__description')
        if book_description_element: 
            book_detail_element = book_description_element.find('span', {'class': 'Formatted'})
            if book_detail_element:
                book_detail = book_detail_element.text.strip()
        retries += 1
        print('Retrying...')
        time.sleep(1)

    # Find and extract the book rating
    book_rating_element = book_soup.find('div', class_='RatingStatistics__rating')
    book_rating = "N/A"
    if book_rating_element:
        book_rating = float(book_rating_element.text.strip())

    # Find and extract the book pages
    pages_element = book_soup.find('p', {'data-testid': 'pagesFormat'})
    book_pages = "N/A"
    if pages_element:
        text = pages_element.text.strip()
        book_pages = int(text.split()[0])

    # Find and extract published date
    published_element = book_soup.find('p', {'data-testid': 'publicationInfo'})
    published = "N/A"
    if published_element:
        text = published_element.text.strip()
        published_list = text.split(' ')[-3:]
        published = ' '.join(published_list)
        published_format = '%B %d, %Y'
        published_date = datetime.strptime(published, published_format)

    # Find and extract the book genres
    genres = []
    i = 0
    genre_container = book_soup.find_all('span', class_='BookPageMetadataSection__genreButton')
    for container in genre_container:
        if i > 2:
            break
        genres.append(container.text.strip())
        i += 1

    # Creating a dictionary for json
    book_data = {
        'Rank': rank,
        'Book_Name': name,
        'Author': author,
        'Details': book_detail,
        'Pages' : book_pages,
        'Ratings': book_rating,
        'Published': published,
        'Genres': genres
    }

    books_data.append(book_data)

    name_element = entry.find('a', {'class': 'bookTitle'})
    author_element = entry.find('a', {'class': 'authorName'})

    author = author_element.text.strip()

    # Find and extract authors' description
    author_description_element = book_soup.find('div', class_='PageSection')
    author_detail = "N/A"
    if author_description_element: 
        author_detail_element = author_description_element.find('div', class_='DetailsLayoutRightParagraph__widthConstrained')
        if author_detail_element:
            author_detail = author_detail_element.text.strip()

    # Find and extract authors' book written
    author_book_element = book_soup.find('div', class_='FeaturedPerson__infoPrimary')
    author_total_books = "N/A"
    if author_book_element: 
        author_total_books_element = author_book_element.find('span', class_='Text Text__body3 Text__subdued')
        if author_total_books_element:
            # Get the text content of the span element
            text_content = author_total_books_element.get_text(strip=True)

            # Remove commas
            number_of_books = text_content.replace(',', '')

            # Extract only the number
            number_of_books = int(re.search(r'\d+', number_of_books).group())

            author_data = {
                'Author_Name': author,
                'Author\'s Description': author_detail,
                'Author\'s Books Written': number_of_books
            }

            authors_data.append(author_data)

data = {
    'Books': books_data,
    'Authors': authors_data
}

with open('goodreads.json', 'w') as json_file:
    json.dump(data, json_file, indent=4)

print("Saved successfully.")