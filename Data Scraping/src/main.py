from selenium.webdriver import Chrome
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import json

url = 'https://www.dbl.id/match/schedule?season_year=2022&series_id=2&region_id=1&date=2022-09-10'
service = Service('Downloads/chromedriver_win32 (1)/chromedriver.exe')
options = Options()
options.add_argument('User-Agent: Chrome/114.0.5735.199 (Windows NT 10.0; Win64; x64)')
driver = Chrome(service=service, options=options)
driver.get(url)
list_url_game = []
list_url_school = []
player_stats = [[] for _ in range(0)] 
match_info = [[] for _ in range(0)] 
official_role = [[] for _ in range(0)] 
school = [[] for _ in range(0)] 

def get_url_game():
    rows = driver.find_elements(By.CSS_SELECTOR, '.row.my-3.bg-light')
    for row in rows:
        url_game = row.find_element(By.CSS_SELECTOR, 'a').get_attribute('href')
        if not redundant(url_game, list_url_game):
            list_url_game.append(url_game)

def player_stats_data(rows, team_name, date_time):
    i = 0
    j = len(player_stats)
    for row in rows:
        if row.find_elements(By.TAG_NAME, 'thead'):
            continue

        columns = row.find_elements(By.TAG_NAME, 'td')
        for column in columns:
            if i == 0:
                player_stats.append([date_time, column.text, team_name])
            else:
                player_stats[j].append(column.text)

            i += 1
            if i == 6:
                j += 1
                i = 0

def officials_data(team_name, type):
    data = player_stats[-1][6].split("\n")
    for official in data:
        name, role = official.split(" ( ")
        role = role.strip(" )")
        if (not redundant([name, team_name, type, role], official_role)):
            found = False
            for i in range(len(official_role)):
                if (official_role[i][0] == name and official_role[i][1] == team_name):
                    if len(official_role[i]) < 5:
                        official_role[i].append(type)
                        official_role[i].append(role)
                    
                    found = True
                    break
            if not found:
                official_role.append([name, team_name, type, role])

    player_stats.pop()

def redundant(value, data):
    found = False
    for i in range(len(data)):
        if (data[i] == value):
            found = True
            break
    return found

def clean(data, i):
    return [row for row in data if row[i] != ''] 

for i in range(9):
    get_url_game()
    original_link = driver.find_element(By.XPATH, f'//a[contains(@href, "{url}")]')
    next_link = original_link.find_element(By.XPATH, f'following-sibling::a[contains(@class, "slick-slide slick-active")]')
    url = next_link.get_attribute('href')
    driver.get(url)

get_url_game()

# game data
for i in range(len(list_url_game)):
    driver.get(list_url_game[i])
    # match info
    game_details = driver.find_element(By.XPATH, '//div[@class="row match-detail"]')
    game_detail = game_details.text.splitlines()
    if int(game_detail[4]) > int(game_detail[5]):
        game_detail.append(game_detail[0])
    else:
        game_detail.append(game_detail[6])
    
    match_info.append(game_detail)

    url_school = game_details.find_elements(By.TAG_NAME, 'a')
    for url in url_school:
        link = url.get_attribute('href')
        if (not redundant(link, list_url_school)):
            list_url_school.append(link)

    # summary
    table = driver.find_elements(By.CLASS_NAME, 'table-bordered')
    rows = table[1].find_elements(By.TAG_NAME, 'tr')
    k = 0
    j = len(match_info)
    for row in rows[1:]:
        column = row.find_elements(By. TAG_NAME, 'td')
        i = 0
        for score in column:
            if i != 1:
                if k < 4:
                    num, percentage = score.text.split(" (")
                    percentage = percentage.strip("% )")
                    match_info[j-1].append(num)
                    match_info[j-1].append(percentage)
                else:
                    match_info[j-1].append(score.text)
            i += 1
        k += 1

    # team A
    boxscore_button = driver.find_element(By.CSS_SELECTOR, 'a#pills-boxscore-tab')
    boxscore_button.click()
    table = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div#pills-boxscore table#boxscore')))
    rows = table.find_elements(By.TAG_NAME, 'tr')
    player_stats_data(rows, game_detail[0], game_detail[3])
    officials_data(game_detail[0], game_detail[1])

    # team B
    other_button = driver.find_element(By.XPATH, '//a[contains(text(), "' + game_detail[6] + '")]')
    WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, '//a[contains(text(), "' + game_detail[6] + '")]')))
    other_button.click()
    rows = driver.find_elements(By.TAG_NAME, 'tr')
    rows = rows[30:]
    player_stats_data(rows, game_detail[6], game_detail[3])
    officials_data(game_detail[6], game_detail[1])

player_stats = clean(player_stats, 1)

# school data
for i in range(len(list_url_school)):
    driver.get(list_url_school[i])
    school_name = driver.find_element(By.CSS_SELECTOR,'.mt-2.mb-0.text-center')
    school.append([school_name.text])

    tables = driver.find_elements(By.CSS_SELECTOR, '.table.table.table-striped.table-bordered')
    rows = tables[0].find_elements(By.TAG_NAME, 'tr')
    for j in range(len(rows)-4):
        td_element = rows[j].find_element(By.TAG_NAME, 'td')
        school[len(school)-1].append(td_element.text)

# export to json file
json_match_info = []
for i in range(len(match_info)):
    match = {"team_A": match_info[i][0], "type": match_info[i][1], "venue": match_info[i][2], "date_time": match_info[i][3], "score_A": match_info[i][4], "score_B": match_info[i][5], "team_B": match_info[i][6], "winner": match_info[i][7], "field_goal_A": match_info[i][8], "field_goal_pct_A": match_info[i][9], "field_goal_B": match_info[i][10], "field_goal_pct_B": match_info[i][11], "2pts_A": match_info[i][12], "2pts_pct_A": match_info[i][13], "2pts_B": match_info[i][14], "2pts_pct_B": match_info[i][15], "3pts_A": match_info[i][16], "3pts_pct_A": match_info[i][17], "3pts_B": match_info[i][18], "3pts_pct_B": match_info[i][19], "free_throw_A": match_info[i][20], "free_throw_pct_A": match_info[i][21], "free_throw_B": match_info[i][22], "free_throw_pct_B": match_info[i][23], "rebound(O/D)_A": match_info[i][24], "rebound(O/D)_B": match_info[i][25], "assist_A": match_info[i][26], "assist_B": match_info[i][27], "steal_A": match_info[i][28], "steal_B": match_info[i][29], "block_A": match_info[i][30], "block_B": match_info[i][31], "turnover_A": match_info[i][32], "turnover_B": match_info[i][33], "foul_A": match_info[i][34], "foul_B": match_info[i][35], "pts_off_turnover_A": match_info[i][36], "pts_off_turnover_B": match_info[i][37]}
    json_match_info.append(match)

json_player_stats = []
for i in range(len(player_stats)):
    stats = {"date_time": player_stats[i][0], "name": player_stats[i][1], "school": player_stats[i][2], "position": player_stats[i][3], "minute": player_stats[i][4], "points": player_stats[i][5], "assists": player_stats[i][6], "rebound": player_stats[i][7]}
    json_player_stats.append(stats)

json_official = []
for i in range(len(official_role)):
    if (len(official_role[i]) < 5):
        data = {"name": official_role[i][0],  "school": official_role[i][1], "type": official_role[i][2], "role": official_role[i][3]}
    else:
        data = {"name": official_role[i][0],  "school": official_role[i][1], "type": official_role[i][2], "role": official_role[i][3], "type2": official_role[i][4], "role2": official_role[i][5]}
    json_official.append(data)

json_school = []
for i in range(len(school)):
    data = {"name": school[i][0], "street": school[i][1], "subdistrict": school[i][2], "city": school[i][3]}
    json_school.append(data)

json_data = {"match_info": json_match_info, "player_stats": json_player_stats, "official": json_official, "school": json_school}
path = "Seleksi-2023-Tugas-1/Data Scraping/data/data.json"
with open(path, "w") as file:
    json.dump(json_data, file)

driver.quit()