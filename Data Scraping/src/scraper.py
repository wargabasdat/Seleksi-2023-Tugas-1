from selenium import webdriver
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import time
import json
import re

# Set up the Selenium driver
driver = webdriver.Chrome()
url = "https://www.uniqlo.com/id/id/men/tops/short-sleeve-t-shirts"
driver.get(url)
time.sleep(0.25)

# Get the HTML source after the page is fully loaded
html = driver.page_source

# Parse the HTML with Beautiful Soup
soup = BeautifulSoup(html, "html.parser")

# Find the <ul> element with class "fr-list mb-m"
product_list = soup.find("ul", class_= "fr-list mb-m")

# Find all the <a> elements within the <ul> element
urls = product_list.find_all("a", href = True)

# Find the name of the category
category_containers = product_list.find_all("span", class_ = "fr-accordion-head-text")

# Find the name of the sub-category of clothing
sub_containers = product_list.find_all("span", class_ = "inner")

# Create a list to store the category and subcategory informations
categories = []
subcategories = []

# Define the base ID for the categories
category_id = 1
for container in category_containers:
    # Extract the category name
    category = container.text.strip().capitalize()

    # Create a dictionary for the category
    category_data = {
        "category_id": category_id,
        "category": category
    }

    # Add the category to the list
    categories.append(category_data)
    category_id += 1

# Define the base ID for the subcategories
subcategory_id = 1
for container in sub_containers:
    # Extract the subcategory name and checks if "Koleksi" exists in string
    # We would like to skip "Koleksi" because it lists every item
    # without filtering by their respective categories
    subcategory = str(container.text.strip())
    if (subcategory == "Koleksi Atasan" or 
        subcategory == "Koleksi Luaran" or
        subcategory == "Koleksi Bawahan" or 
        subcategory == "Koleksi Dalaman" or
        subcategory == "Koleksi Loungewear" or 
        subcategory == "Koleksi Aksesoris"
    ): continue

    # Create a dictionary for the subcategory
    subcategory_data = {
        "subcategory_id": subcategory_id,
        "subcategory": subcategory
    }

    # Add the subcategory to the list
    subcategories.append(subcategory_data)
    subcategory_id += 1

# This is the scroll step
scroll_step = 50

# Create a list to store the product information
products = []
product_colors = []
product_sizes = []

# Initialize the product id, category id, and subcategory id
product_id = 1
category = 1
subcategory = 1
prev_category = "tops"

# Define the base URL to obation other URLs
base_url = "https://www.uniqlo.com"
for url in urls:
    # Continue if the URL leads to a collection of category
    if re.search(r'collection', url["href"], re.IGNORECASE): continue
        
    # Get the URL of the product page
    full_url = urljoin(base_url, url["href"])

    # Extract the category from the url
    curr_category = full_url.split("/")[-2]

    # Check if the category has changed
    if curr_category != prev_category:
        category += 1
        prev_category = curr_category

    # Go to another URL
    driver.get(full_url)
    time.sleep(2)

    while True:
        # Get the current scroll position
        current_scroll_position = driver.execute_script("return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0")

        # Scroll by the step size
        driver.execute_script(f"window.scrollBy(0, {scroll_step});")
        time.sleep(0.05)  # This is the delay

        # Get the new scroll position after scrolling to the bottom
        new_scroll_position = driver.execute_script("return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0")
        
        # Check if the scroll position has not changed, indicating that the bottom of the page has been reached
        if new_scroll_position == current_scroll_position:
            break

        # Check if the button is available
        try:
            element = driver.find_element(By.CLASS_NAME, "fr-load-more")
            if element.is_displayed():
                element.click()
                time.sleep(2)
                pass
        except:
            pass

    # Making sure the website is fully loaded
    product_grid = None
    while product_grid == None:
        # Get the fully loaded HTML source
        html = driver.page_source

        # Parse the HTML with Beautiful Soup
        soup = BeautifulSoup(html, "html.parser")

        # Finding the product grid container
        product_grid = soup.find("div", class_ = "fr-product-grid row")

        # Finding the header2 for a high traffic status page
        high_traffic = soup.find("h2", class_ = "fr-wrapper mb-xxxl")

        # Define the action if the page returned a high traffic value
        if high_traffic: 
            driver.get(full_url)
            time.sleep(2)
            product_grid = None
            continue

    # Finding all the product containers
    product_containers = product_grid.find_all("article", class_="fr-grid-item w4")

    # Extract the product name, price, rating, and review count from each container
    for container in product_containers:
        # Find the name of the product
        name_element = container.find("h2", class_ = "description decscription-text fr-no-uppercase")
        if name_element:
            name = name_element.text.strip()
        else:
            name = None

        # Extract the price value from "price-original" or "dual-price-original" element
        price_original_span = container.find("span", class_= "price-original")
        dual_price_original_div = container.find("div", class_ = "dual-price-original")
        price_element = price_original_span or dual_price_original_div
        
        # Convert the price into an integer
        if price_element:
            price_text = price_element.text.strip().replace("Rp", "").replace(".", "").replace(",", "")
            price = int(price_text)
        else:
            price = None

        # Extract the rating value
        rating_span = container.find(
            "em", 
            class_="fr-implicit")
        if rating_span:
            # Format the rating value and converting the rating into a float
            rating_unformatted = rating_span.text.strip() 
            rating = float("{:.2f}".format(float(rating_unformatted.split()[0])))
        else:
            rating = None

        # Extract the review count value
        review_count_span = container.find(
            "span", 
            class_="fr-review-count")
        
        # Convert the review count into an integer
        if review_count_span:
            review_count_text = review_count_span.text.strip().replace("(", "").replace(")", "").replace("+", "")
            review_count = int(review_count_text)
        else:
            review_count = None

        # Find the URL for the product
        product_url = container.find("a", href = True)

        # Get the full URL for the product
        full_url = urljoin(base_url, product_url["href"])

        # Go to the product URL
        driver.get(full_url)

         # Making sure the website is fully loaded while keeping track of retries
        product_accordion = None
        tries = 1
        while product_accordion == None:
            # Refresh the page if number of tries is multiples of 3
            if tries % 3 == 0:
                driver.get(full_url)

             # Get the HTML source after the page is fully loaded
            product_html = driver.page_source

            # Parse the HTML with Beautiful Soup
            product_soup = BeautifulSoup(product_html, "html.parser")

            # Finding the product information section
            product_accordion = product_soup.find("section", class_ = "a11y-focus-section")

            # Finding the header2 for a high traffic status page
            high_traffic = product_soup.find("div", class_ = "fr-wrapper mb-xxxl")

            # Define the action if the page returned a high traffic value
            if high_traffic: continue

            # Define the action if the page returned the desired value
            if product_accordion: break

            # Counting the retries
            time.sleep(1.5)
            tries += 1

        # Finding the description element
        desc_element = product_soup.find("div", class_ = "_1URc1zKHxrJET2Rk1HoPMG")

        # Extract the description of the product
        if desc_element:
            # Format the decsription to handle escape sequences
            description = desc_element.text.strip().replace("\u00ae", "").replace("\u201c", "").replace("\u201d", "").replace("\u00e9", "e").replace("\u00b7","").replace("\u2018", "'").replace("\u2019", "'").replace('\"', "")
        else:
            description = None

        # Extract the product colors
        color_picker = product_soup.find("div", "color-picker-wrapper")
        colors = color_picker.find_all("div", class_ = "fr-chip-wrapper")
        for color in colors:
            # Create a dictionary for the color
            color_data = {
                "product_id": product_id,
                "color": color.text.strip()
            }

            # Add the color to the list
            if color_data not in product_colors:
                product_colors.append(color_data)

        # Extract the product sizes
        size_picker = product_soup.find("div", "size-picker-wrapper")
        if size_picker:
            sizes = size_picker.find_all("div", class_ = "fr-chip-wrapper")
            for size in sizes:
                # Create a dictionary for the size
                size_data = {
                    "product_id": product_id,
                    "size": size.text.strip()
                }

                # Add the size to the list
                product_sizes.append(size_data)
            
        # Create a dictionary for the product
        product_data = {
            "product_id": product_id,
            "name": name,
            "price": price,
            "description": description,
            "rating": rating,
            "review_count": review_count,
            "category_id": category,
            "subcategory_id": subcategory
        }

        # To handle a product name that is None
        if name is None: continue

        # Add the product to the list
        products.append(product_data)

        # Change the product ID
        product_id += 1

    # Change the subcategory
    subcategory += 1

# Close the Selenium driver
driver.quit()

# Save the product, colors, sizes, categories, and subcategories information as JSON
with open("../data/products.json", "w") as file:
    json.dump(products, file, indent = 2)

with open("../data/products_colors.json", "w") as file:
    json.dump(product_colors, file, indent = 2)

with open("../data/products_sizes.json", "w") as file:
    json.dump(product_sizes, file, indent = 2)

with open("../data/categories.json", "w") as file:
    json.dump(categories, file, indent = 2)

with open("../data/subcategories.json", "w") as file:
    json.dump(subcategories, file, indent = 2)

print("Data saved to JSON file successfully.")