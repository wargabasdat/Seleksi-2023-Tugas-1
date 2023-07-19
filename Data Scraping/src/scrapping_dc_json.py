import requests
import json
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import re

count = 0
url = "https://deetlist.com/dragoncity/all-dragons/" #url untuk mengambil data naga
response = requests.get(url) #mengambil data dari url
soup = BeautifulSoup(response.content, "html.parser") #mengubah data menjadi html
dragons = soup.find_all("a", class_="drag_link")
dragon_data = []


#lakukan looping untuk setiap naga
#count digunakan untuk menghitung jumlah loop yang telah dilalui
#:1584 digunakan untuk mengambil data naga dari index 0 sampai 1583
for dragon in dragons[:1584]:
    count += 1
    print("count = ", count)
    name_element = dragon.find("div", class_="drag")
    if name_element:
        name = name_element.text.strip()
        detail_link = urljoin(url, dragon["href"])

         # Scraping info naga
        try:
            detail_response = requests.get(detail_link)
            detail_soup = BeautifulSoup(detail_response.content, "html.parser")

            stats = detail_soup.find("div", class_="stat")

            dragon_info = {
                "name": name
            }

            dragon_description = detail_soup.find('div', id='self_bio')

            if(dragon_description):
                dragon_stat = dragon_description.findAll('b')
                rarity_dragon = dragon_stat[0].text.strip()
                element_dragon = dragon_stat[1].text.strip()
                dragon_info["rarity"] = rarity_dragon
                dragon_info["element"] = element_dragon



            breed_time_element = detail_soup.find('div', id='bt')
            if breed_time_element:
                breed_time_text = breed_time_element.text.strip().split(": ")[-1]
                breed_time_text = re.sub(r'\([^)]*\)', '', breed_time_text)
                dragon_info["breed_time"] = breed_time_text

            buy_price_element = detail_soup.find('div', id='bp')
            if buy_price_element:
                buy_price_element = buy_price_element.find('div', class_='dt')
                buy_price = buy_price_element.text.strip().split(" ")[0]
                buy_price = int(buy_price.replace(",", ""))
                dragon_info["buy_price"] = buy_price
            else:
                dragon_info["buy_price"] = 0

            hatch_time_element = detail_soup.find('div', id='ht')
            if hatch_time_element:
                hatch_time_element = hatch_time_element.find('div', class_='dt')
                hatch_time = hatch_time_element.text.strip().split(": ")[-1]
                hatch_time_text = re.sub(r'\([^)]*\)', '', hatch_time)
                dragon_info["hatch_time"] = hatch_time_text
            else:
                dragon_info["hatch_time"] = "Hatch Time information not found."

            breedable_element = detail_soup.find('div', id='br')
            if breedable_element:
                breedable_element = breedable_element.find('div', class_='dt')
                breedable = breedable_element.text.strip()
                dragon_info["breedable"] = breedable
            else:
                dragon_info["breedable"] = "Breedable information not found."

            hatch_xp_element = detail_soup.find('div', id='hx')
            if hatch_xp_element:
                hatch_xp_element = hatch_xp_element.find('div', class_='dt')
                hatch_xp = hatch_xp_element.text.strip().replace(",", "")
                dragon_info["hatch_xp"] = int(hatch_xp)
            else:
                dragon_info["hatch_xp"] = 0

            if dragon_description:
                description_element = dragon_description.find('b', string='Description:')
                if description_element:
                        description = description_element.next_sibling.strip()
                        description = description.replace("\u2014", "-")
                        description = description.replace("\n", "")
                        description = description.replace("\r", "")
                        dragon_info["description"] = description


                b_split_elements = detail_soup.find_all("div", class_="b_split")
                for element in b_split_elements:
                    if element.find("h2").text.strip() == "BASE MOVES":
                        moves = element.find_all("div", class_="att_hold")
                        move_data = []
                        for move in moves:
                            move_type_element = move.find("div", class_="t_attck")
                            move_name_element = move.find("div", class_="att_desc")
                            move_damage_element = move.find("span", class_="att_dmg_e")
                            if move_type_element and move_name_element and move_damage_element:
                                move_type = move_type_element.get("class")[1]
                                move_name = move_name_element.text.strip().split("\n")[0].split("Damage:")[0].strip()
                                move_damage = move_damage_element.text.strip().split("Damage:")[1].strip().split(" ")[0]
                                move_damage = int(move_damage.replace(",", ""))
                                move_info = {
                                    "type": move_type,
                                    "name": move_name,
                                    "damage": move_damage
                                }
                                move_data.append(move_info)
                            else:
                                print("Incomplete move information.")
                        dragon_info["base_moves"] = move_data

                    if element.find("h2").text.strip() == "TRAINABLE ATTACKS":
                        trainable_attacks = element.find_all("div", class_="att_hold")
                        attack_data = []
                        for attack in trainable_attacks:
                            attack_type_element = attack.find("div", class_="t_attck")
                            attack_name_element = attack.find("div", class_="att_desc")
                            attack_details_element = attack.find("span", class_="att_dmg_e")
                            if attack_type_element and attack_name_element and attack_details_element:
                                attack_type = attack_type_element.get("class")[1]
                                attack_name = attack_name_element.text.strip().split("\n")[0].split("Damage:")[0].strip()
                                attack_details = attack_details_element.text.strip().split("Damage:")[1].strip().split(" ")[0]
                                attack_details = int(attack_details.replace(",", ""))

                                attack_info = {
                                    "type": attack_type,
                                    "name": attack_name,
                                    "damage": attack_details
                                }
                                attack_data.append(attack_info)
                            else:
                                print("Incomplete attack information.")
                        dragon_info["trainable_attacks"] = attack_data

                    if element.find("h2").text.strip() == "STRENGTHS":
                        strengths = element.find("b").text.strip().split(", ")
                        dragon_info["strengths"] = strengths

                    if element.find("h2").text.strip() == "WEAKNESSES":
                        weaknesses = element.find("b").next_sibling.next_sibling.text.strip().split(", ")
                        dragon_info["weaknesses"] = weaknesses
            
                dragon_data.append(dragon_info)

        except requests.exceptions.RequestException as e:
            print("Error accessing dragon details:", str(e))

    else:
        print("Dragon name not found.")

# Menyimpan data ke dalam file JSON
with open("data/all_dragon_data.json", "w") as json_file:
    json.dump(dragon_data, json_file, indent=4)
