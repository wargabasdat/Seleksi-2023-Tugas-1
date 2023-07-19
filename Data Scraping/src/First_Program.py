# Import the necessary libraries
import time
from selenium import webdriver
from bs4 import BeautifulSoup
from urllib.parse import urljoin

# Open the driver using Selenium
driver = webdriver.Chrome()
driver.get('https://fonts.google.com')
time.sleep(2)  # Wait for 2 seconds for the web to open
scroll_pause_time = 1  # Can be changed to whatever you want, but 1 second is enough
screen_height = driver.execute_script("return window.screen.height;")  # Get the screen height
i = 1

unique_lines = set()  # Initialize a Set to store the font names

while True:
    # Scroll one screen height each time
    driver.execute_script("window.scrollTo(0, {screen_height}*{i});".format(screen_height=screen_height, i=i))
    i += 1 # This value dictates how far you scroll, higher value may results in less duplicates but at the risk of missing data
    time.sleep(scroll_pause_time)
    # Update scroll height each time after scrolled, as the scroll height can change after we scrolled the page
    scroll_height = driver.execute_script("return document.body.scrollHeight;")
    # Break the loop when the height we need to scroll to is larger than the total scroll height

    # Parse the web as we scroll
    soup = BeautifulSoup(driver.page_source, "html.parser")
    for parent in soup.find_all('h1', class_='mat-text--title'):
        line = parent.text.strip()
        if line not in unique_lines: # Check whether the line is already in the set
            unique_lines.add(line)

    # Stop the program once it reaches the bottom of the page
    if (screen_height) * i > scroll_height:
        break

# Write the set into a text file
with open('fonts.txt', 'w', encoding='utf-8') as file:
    file.write('\n'.join(unique_lines))
driver.quit()  # Close the web driver