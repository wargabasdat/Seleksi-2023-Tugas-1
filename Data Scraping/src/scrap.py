from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import WebDriverException
import requests
import time

def player():
    print('Scraping player data...')

    data = []

    for i in range(1, 68):
        url = f'https://bwf.tournamentsoftware.com/ranking/category.aspx?id=35265&category=472&C472FOC=&p={i}&ps=25'
        response = requests.get(url).text
        soup = BeautifulSoup(response, 'lxml')
        rank_table = soup.find('table', class_='ruler')
        for row in rank_table.find_all('tr')[2:27]:
            try :
                rank = int(row.find('td', class_='rank').div.text)
                player_name = row.find_all('td')[4].a.text
                member_id = row.find_all('td')[6].text
                points = int(row.find('td', class_='right rankingpoints').text)
                tournaments = int(row.find_all('td')[8].text)
                confederation = row.find_all('td')[9].a.text

                profile = row.find_all('td')[5].a['href']
                url_profile = f'https://bwf.tournamentsoftware.com{profile}'
                response_profile = requests.get(url_profile).text
                soup_profile = BeautifulSoup(response_profile, 'lxml')
                profile_table = soup_profile.find('div', class_='content')
                nationalization = profile_table.find_all('span', class_='nav-link__value')[3].text
                personal_details = profile_table.find('div', class_='margin-bottom')
                for row in personal_details.find_all('div', class_='list__item'):
                    if row.find('dt', class_='list__label').text.strip()[0:5] == 'Date ':
                        date_of_birth = row.find('span', class_='nav-link__value').text.split('/')
                        date_of_birth = date_of_birth[1] + '/' + date_of_birth[0] + '/' + date_of_birth[2]
                        break
                history = profile_table.find('span', class_='list__value-start').text.split()
                win = int(history[0])
                lose = int(history[2])
                total_match = win + lose
                try :
                    year_prize = float(profile_table.find_all('span', class_='stats__value')[0].text[1:].replace(',', ''))
                except :
                    year_prize = 0.0
                try :
                    total_prize = float(profile_table.find_all('span', class_='stats__value')[1].text[1:].replace(',', ''))
                except :
                    total_prize = 0.0

                data.append({
                    'member_id': member_id,
                    'player_name': player_name,
                    'date_of_birth': date_of_birth,
                    'nationalization': nationalization,
                    'confederation': confederation,
                    'rank': rank,
                    'points': points,
                    'tournaments': tournaments,
                    'win': win,
                    'lose': lose,
                    'total_match': total_match,
                    'year_prize': year_prize,
                    'total_prize': total_prize
                })
            except :
                pass

        print(f'Page {i} done')

    return data

def tournament():
    print('Scraping tournament data...')

    data = []

    url = f'https://bwf.tournamentsoftware.com/find?DateFilterType=0&StartDate=2023-01-01&EndDate=2023-06-30&page=5'
    driver = webdriver.Chrome()
    driver.get(url)
    try :
        WebDriverWait(driver, 60).until(EC.presence_of_element_located((By.CLASS_NAME, 'media')))
        
        tournament_list = driver.find_element(By.CLASS_NAME, 'is-loading-element--blur')
        tournaments = tournament_list.find_elements(By.CLASS_NAME, 'media__content')
        
        i = 1
        flag = True

        for tournament in tournaments:
            try :
                tournament.find_element(By.CLASS_NAME, 'tag--soft')
                if 'Team' not in tournament.find_element(By.CLASS_NAME, 'tag--soft').text:
                    flag = True
                else :
                    flag = False
            except :
                pass
                
            if '(Cancelled)' not in tournament.find_element(By.TAG_NAME, 'h4').find_element(By.CLASS_NAME, 'nav-link__value').text and 'Team' not in tournament.find_element(By.TAG_NAME, 'h4').find_element(By.CLASS_NAME, 'nav-link__value').text and flag:
                tournament_name = tournament.find_element(By.TAG_NAME, 'h4').find_element(By.CLASS_NAME, 'nav-link__value').text
                organization = tournament.find_element(By.CLASS_NAME, 'media__subheading').find_element(By.CLASS_NAME, 'nav-link__value').text.split(' | ')[0]
                location = tournament.find_element(By.CLASS_NAME, 'media__subheading').find_element(By.CLASS_NAME, 'nav-link__value').text.split(' | ')[1].split(', ')
                city = location[0]
                country = location[1]
                start_date = tournament.find_element(By.CLASS_NAME, 'media__subheading--muted').find_element(By.TAG_NAME, 'time').text.split('/')
                start_date = start_date[1] + '/' + start_date[0] + '/' + start_date[2]
                end_date = tournament.find_element(By.CLASS_NAME, 'media__subheading--muted').find_elements(By.TAG_NAME, 'time')[1].text.split('/')
                end_date = end_date[1] + '/' + end_date[0] + '/' + end_date[2]
                try :
                    tournament.find_element(By.CLASS_NAME, 'tag--soft')
                    series = tournament.find_element(By.CLASS_NAME, 'tag--soft').text
                except :
                    series = '-'
                data_match = []

                tourn = tournament.find_element(By.TAG_NAME, 'a').get_attribute('href')
                driver_tourn = webdriver.Chrome()
                driver_tourn.get(tourn)
                if driver_tourn.find_element(By.CLASS_NAME, 'page-nav--tabs').find_elements(By.TAG_NAME, 'li')[1].text == 'Matches':
                    tab = driver_tourn.find_element(By.CLASS_NAME, 'page-nav--tabs')
                    WebDriverWait(driver_tourn, 10).until(EC.element_to_be_clickable((By.TAG_NAME, 'li')))
                    time.sleep(2)
                    tab.find_elements(By.TAG_NAME, 'li')[3].click()
                    try :
                        WebDriverWait(driver_tourn, 100).until(EC.presence_of_element_located((By.CLASS_NAME, 'ruler')))
                        try :
                            draws = driver_tourn.find_element(By.CLASS_NAME, 'ruler')
                            categories = draws.find_element(By.TAG_NAME, 'tbody').find_elements(By.TAG_NAME, 'tr')
                            for category in categories :
                                try :
                                    if category.find_element(By.TAG_NAME, 'a').text[0:2] == 'MS' :
                                        WebDriverWait(category, 10).until(EC.element_to_be_clickable((By.TAG_NAME, 'a')))
                                        time.sleep(2)
                                        category.find_element(By.TAG_NAME, 'a').click()
                                        try :
                                            draw = driver_tourn.find_element(By.ID, 'cphPage_cphPage_cphPage_tmSubMenu')
                                            WebDriverWait(draw, 10).until(EC.element_to_be_clickable((By.TAG_NAME, 'a')))
                                            time.sleep(2)
                                            draw.find_elements(By.TAG_NAME, 'a')[1].click()
                                            print('Clicked Draws')
                                            try :
                                                # print('Waiting for draws')
                                                WebDriverWait(driver_tourn, 10).until(EC.presence_of_element_located((By.TAG_NAME, 'tbody')))
                                                # print('Draws found')
                                                matches = driver_tourn.find_element(By.TAG_NAME, 'tbody').find_elements(By.TAG_NAME, 'tr')
                                                try :
                                                    for match in matches :
                                                        try :
                                                            try :
                                                                day = match.find_element(By.CLASS_NAME, 'plannedtime').text.split()[1].split('/')
                                                                day = day[1] + '/' + day[0] + '/' + day[2]
                                                            except :
                                                                day = None
                                                            player_1 = match.find_elements(By.TAG_NAME, 'td')[2].text
                                                            if '[' not in player_1 :
                                                                pass
                                                            else :
                                                                player_1 = player_1.split(' [')[0]
                                                            player_2 = match.find_elements(By.TAG_NAME, 'td')[6].text
                                                            if '[' not in player_2 :
                                                                pass
                                                            else :
                                                                player_2 = player_2.split(' [')[0]
                                                            player_1_score = 0
                                                            player_2_score = 0
                                                            scores = match.find_elements(By.TAG_NAME, 'td')[9].find_element(By.CLASS_NAME, 'score')
                                                            if scores.text != 'Walkover' :
                                                                scores = scores.find_elements(By.TAG_NAME, 'span')
                                                                for score in scores :
                                                                    if int(score.text.split('-')[0]) >= 21 and (int(score.text.split('-')[0]) - int(score.text.split('-')[1]) >= 2) :
                                                                        player_1_score += 1
                                                                    elif int(score.text.split('-')[1]) >= 21 and (int(score.text.split('-')[1]) - int(score.text.split('-')[0]) >= 2) :
                                                                        player_2_score += 1
                                                                duration = match.find_elements(By.TAG_NAME, 'td')[12].text
                                                                if ' ' not in duration :
                                                                    duration = int(duration[:-1])
                                                                else :
                                                                    duration = duration.split()
                                                                    duration = int(duration[0][:-1]) * 60 + int(duration[1][:-1])
                                                            else :
                                                                player_2 += ' (Walkover)'
                                                                duration = 0
                                                            try :
                                                                court = match.find_elements(By.TAG_NAME, 'td')[13].find_element(By.TAG_NAME, 'a').text
                                                                venue = court.split(' - ')[0]
                                                            except :
                                                                court = '-'
                                                            winner = player_1

                                                            # print(f'{day} {player_1} {player_2} {player_1_score} {player_2_score} {duration} {court} {winner}')

                                                            data_match.append({
                                                                'day' : day,
                                                                'court' : court,
                                                                'player_1' : player_1,
                                                                'player_2' : player_2,
                                                                'player_1_score' : player_1_score,
                                                                'player_2_score' : player_2_score,
                                                                'duration' : duration,
                                                                'winner' : winner
                                                            })

                                                        except :
                                                            continue
                                                except :
                                                    pass
                                            except :
                                                pass
                                        except :
                                            pass

                                            
                                        break
                                except :
                                    pass
                                    
                            data.append({
                                'tournament_name': tournament_name,
                                'organization': organization,
                                'city': city,
                                'country': country,
                                'venue': venue,
                                'start_date': start_date,
                                'end_date': end_date,
                                'series': series,
                                'match_count': len(data_match),
                                'match' : data_match
                            })

                            print(f'Tournament {i} done\n')
                            i += 1

                        except :
                            print('Ada error')
                    except :
                        print(f'Tournament {i} failed\n')
                        i += 1
                        driver_tourn.quit()
                        continue
                else :
                    driver_tourn.quit()
            else :
                continue
            driver_tourn.quit()
    finally :
        driver.quit()

    return data