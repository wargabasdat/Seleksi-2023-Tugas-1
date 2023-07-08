"""Main algorithm for scraping website """
import time
import json
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import ElementClickInterceptedException
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

#Get directory to save data
parent_dir = os.getcwd()
data_folder = os.path.join(parent_dir,"Data Scraping","data")

# Algorithm to load website by using selenium
driver = webdriver.Chrome(service= Service(ChromeDriverManager().install()))
driver.get("https://bwfbadminton.com/rankings/")

#Timer to make sure website is loaded
time.sleep(3)

# Button to make table contains 100 datas (by default, it only contains 10)
buttons = driver.find_element(By.XPATH,"//div[@class='table-search-row-right']")
dropdown = buttons.find_element(By.XPATH,"//div[@class='select'][3]")
dropdownButton = dropdown.find_element(By.TAG_NAME,"i")
dropdownButton.click()
options = driver.find_element(By.CLASS_NAME, value="v-menu__content")
option = options.find_element(By.CLASS_NAME,value="v-select-list")
testing = option.find_element(By.ID,"list-item-56-3")
testing.click()

def fetch_data(file_player,file_statistics,amount,gender,match_type):
    """Common algorithm for fetching single players data"""

    # Load single players
    try:
        raw = open(file_player,encoding='UTF-8')
        players = json.load(raw)

        # Load single player statistics
        raw = open(file_statistics,encoding='UTF-8')
        player_statistics = json.load(raw)
    except FileNotFoundError:
        players =[]
        player_statistics = []

    # Determine id
    player_id = len(players)
    for _ in range(amount):
        # Access table on page
        body = driver.find_element(by = By.TAG_NAME, value="tbody")
        rows = body.find_elements(by = By.TAG_NAME,value="tr")
        next_button = driver.find_element(By.XPATH,"//nav[@class='pagination']")
        button = next_button.find_element(By.XPATH,
                                          "//i[contains(@class, 'fas fa-lg fa-chevron-right')]")
        rank = ""
        for data in rows :
            try :
                # Find all data that was needed
                first_name = data.find_element(by=By.CLASS_NAME,
                                            value="name-1").get_attribute("innerHTML")
                last_name = data.find_element(by=By.CLASS_NAME,
                                            value="name-2").get_attribute("innerHTML")
                rank = int(data.find_element(by=By.CLASS_NAME,
                                        value="rank-value").get_attribute("innerHTML"))
                flag = data.find_element(by=By.TAG_NAME,value="img")
                country = flag.get_attribute("title")
                string_points = data.find_element(by=By.TAG_NAME,
                                                value="strong").get_attribute("innerHTML")
                points = int(string_points.replace(",",""))
                win1252_first_name = first_name.encode('cp1252', 'ignore').decode('cp1252')
                win1252_last_name = last_name.encode('cp1252', 'ignore').decode('cp1252')
                player = {
                    "id" : player_id,
                    "firstName" : win1252_first_name,
                    "lastName" : win1252_last_name,
                    "country" : country,
                    "gender" : gender
                }
                player_statistic = {
                    "points" : points,
                    "rank" : rank,
                    "id" : player_id,
                    "type" : match_type
                }
                player_id += 1
                players.append(player)
                player_statistics.append(player_statistic)
            except NoSuchElementException:
                first_name = ""
                last_name = ""
                rank = ""
        try :
            button.click()
            time.sleep(2)
        except ElementClickInterceptedException:
            break
    return players,player_statistics

def fetch_double_data(file_player,file_statistics,amount,first_gender,second_gender,match_type):
    """Function to fetch all double's categories"""

    # Load players data
    try:
        raw = open(file_player,encoding="UTF-8")
        players = json.load(raw)
    except FileNotFoundError :
        players = []
    try:
        raw = open(file_statistics,encoding="UTF-8")
        double_player_statistics = json.load(raw)
    except FileNotFoundError :
        double_player_statistics =[]

    # Determine id
    player_id = len(players)
    player_strings = [f"{player['firstName']} {player['lastName']} {player['country']}"
                      for player in players]
    # Loop based on the amount of pagination
    for _ in range (amount):
        body = driver.find_element(by = By.TAG_NAME, value="tbody")
        rows = body.find_elements(by = By.TAG_NAME,value="tr")
        next_button = driver.find_element(By.XPATH,"//nav[@class='pagination']")
        button = next_button.find_element(By.XPATH,
                                          "//i[contains(@class, 'fas fa-lg fa-chevron-right')]")
        rank = ""
        first_id= 0
        second_id = 0
        for data in rows :
            # Access data on table's row
            try :
                player_first_names = data.find_elements(By.CLASS_NAME,"name-1")
                if len(player_first_names) > 1:
                    first_player_first_name = data.find_elements(By.CLASS_NAME,
                                                                "name-1")[0].get_attribute(
                                                                                "innerHTML")
                    first_player_last_name = data.find_elements(By.CLASS_NAME,
                                                                "name-2")[0].get_attribute(
                                                                                "innerHTML")
                    second_player_first_name = data.find_elements(By.CLASS_NAME,
                                                                "name-1")[1].get_attribute(
                                                                                "innerHTML")
                    second_player_second_name = data.find_elements(By.CLASS_NAME,
                                                                "name-2")[1].get_attribute(
                                                                                "innerHTML")
                    rank = int (data.find_element(by=By.CLASS_NAME,
                                        value="rank-value").get_attribute("innerHTML"))
                    flag = data.find_element(by=By.TAG_NAME,value="img")
                    country = flag.get_attribute("title")
                    string_points = data.find_element(by=By.TAG_NAME,
                                                    value="strong").get_attribute("innerHTML")
                    points = int(string_points.replace(",",""))
                    first_player = f"{first_player_first_name} {first_player_last_name} {country}"
                    second_player = f'{second_player_first_name} {second_player_second_name} {country}'

                    # Make sure that player hasn't saved beforen and encode it to WIN1252
                    if first_player not in player_strings:
                        new_player = {
                            "id" : player_id,
                            "firstName" : first_player_first_name
                                            .encode('cp1252', 'ignore')
                                            .decode('cp1252'),
                            "lastName" : first_player_last_name
                                            .encode('cp1252', 'ignore')
                                            .decode('cp1252'),
                            "country" : country,
                            "gender" : first_gender
                        }
                        first_id = player_id
                        players.append(new_player)
                        player_id+=1
                    else :
                        # If player has been saved before, get it's id
                        existing_id = player_strings.index(first_player)
                        first_id = players[existing_id]["id"]
                    if second_player not in player_strings:
                        new_player = {
                            "id" : player_id,
                            "firstName" : second_player_first_name
                                            .encode('cp1252', 'ignore').decode('cp1252'),
                            "lastName" : second_player_second_name
                                            .encode('cp1252', 'ignore').decode('cp1252'),
                            "country" : country,
                            "gender" : second_gender
                        }
                        second_id = player_id
                        players.append(new_player)
                        player_id+=1
                    else :
                        existing_id = player_strings.index(second_player)
                        second_id = players[existing_id]["id"]

                    statistic = {
                        "firstPlayerId" : first_id,
                        "secondPlayerId" : second_id,
                        "rank" : rank,
                        "points" : points,
                        "type" : match_type
                    }
                    double_player_statistics.append(statistic)
            except NoSuchElementException:
                break
        try :
            button.click()
            time.sleep(2)
        except ElementClickInterceptedException:
            break
    return players, double_player_statistics

def scrape_single_men_players():
    """Function to scrape and write single men players data"""
    player_file = os.path.join(data_folder,"players.json")
    statistic_file = os.path.join(data_folder,"single_statistics.json")
    men_players, men_players_statistics = fetch_data(
                                            player_file,statistic_file,17,
                                            "male","men_single")
    with open(player_file,"w",encoding="UTF-8") as write_file :
        json.dump(men_players,write_file)
    with open(statistic_file,"w",encoding="UTF-8") as write_file :
        json.dump(men_players_statistics,write_file)

def scrape_single_women_players():
    """Function to scrape and write women single's players into .json file"""
    rangking_tabs = driver.find_elements(By.XPATH,"//span[@class='ranking-tab-desktop']")
    women_rangking_tabs = rangking_tabs[1]
    women_rangking_tabs.click()
    time.sleep(3)
    player_file = os.path.join(data_folder,"playerss.json")
    statistic_file = os.path.join(data_folder,"single_statisticss.json")
    women_single_players,women_single_statistics = fetch_data(
                                                    player_file,statistic_file,
                                                        12,"female","women_single")
    with open(player_file,"w",encoding="UTF-8") as write_file:
        json.dump(women_single_players,write_file)
    with open(statistic_file,"w",encoding="UTF-8") as write_file :
        json.dump(women_single_statistics,write_file)

def scrape_men_double():
    """Function to scrape and write men's double players into .json file"""
    rangking_tabs = driver.find_elements(By.XPATH,"//span[@class='ranking-tab-desktop']")
    men_double_rangking_tabs = rangking_tabs[2]
    men_double_rangking_tabs.click()
    player_file = os.path.join(data_folder,"players.json")
    statistic_file = os.path.join(data_folder,"double_statistics.json")
    time.sleep(3)
    men_double_players, men_double_statistics = fetch_double_data(
                                                    player_file,statistic_file,13,
                                                    "male","male","men_double")
    with open(player_file,"w",encoding="UTF-8") as write_file :
        json.dump(men_double_players,write_file)
    with open(statistic_file,"w",encoding="UTF-8") as write_file :
        json.dump(men_double_statistics,write_file)

def scrape_women_double():
    """Function to scrape and write women's double players into .json file"""

    # Click women_double on tabs
    rangking_tabs = driver.find_elements(By.XPATH,"//span[@class='ranking-tab-desktop']")
    women_double_rangking_tabs = rangking_tabs[3]
    women_double_rangking_tabs.click()
    player_file = os.path.join(data_folder,"players.json")
    statistic_file = os.path.join(data_folder,"double_statistics.json")
    time.sleep(3)
    women_double_players,women_double_statistics = fetch_double_data(
                                                        player_file,statistic_file,10,
                                                        "female","female","women_double")
    # Write player's data to players.json
    with open(player_file,"w",encoding="UTF-8") as write_file :
        json.dump(women_double_players,write_file)
    # Write women doubles's statistics to double_statistocs.json
    with open(statistic_file,"w",encoding="UTF-8") as write_file :
        json.dump(women_double_statistics,write_file)

def scrape_mixed_double():
    """Function to scrape and write mixed double's players into .json file"""
    rangking_tabs = driver.find_elements(By.XPATH,"//span[@class='ranking-tab-desktop']")
    mixed_double_rangking_tabs = rangking_tabs[4]
    mixed_double_rangking_tabs.click()
    player_file = os.path.join(data_folder,"players.json")
    statistic_file = os.path.join(data_folder,"double_statistics.json")
    time.sleep(3)
    mixed_double_players,mixed_double_statistics = fetch_double_data(
                                                        player_file,statistic_file,14,
                                                        "male","female","mixed_double")
    # Write player's data to players.json
    with open(player_file,"w",encoding="UTF-8") as write_file :
        json.dump(mixed_double_players,write_file)
    # Write mixed doubles's statistics to double_statistocs.json
    with open(statistic_file,"w",encoding="UTF-8") as write_file :
        json.dump(mixed_double_statistics,write_file)

scrape_single_men_players()
scrape_single_women_players()
scrape_men_double()
scrape_women_double()
scrape_mixed_double()
