import requests
from bs4 import BeautifulSoup
from url_list import url_scrapping
import pandas as pd

url_list = url_scrapping()  # list url yang ingin di scrapping
data_card = []              # menyimpan data kartu
data_monster = []           # menyimpan data kartu yang termasuk kategori monster
data_boosterpack = []       # menyimpan data boosterpack
data_card_boosterpack = []  # untuk keperluan join data kartu dengan boosterpack
data_card_pscale = []       # menyimpan data monster yang memiliki card_type pendulum
card_id = 1                 # menyimpan atribut card_id
boosterpack_id = 0          # menyimpan atribut boosterpack_id

# for loop untuk setiap url dalam list
for url in url_list:
    boosterpack_id +=1
    html_text = requests.get(url).text
    soup = BeautifulSoup(html_text, 'lxml')
    
    # scrap for data boosterpack
    boosterpack_name = soup.find("strong").text                                                                     # menyimpan atribut boosterpack_name
    target = soup.find('p',id = "previewed").text.strip().replace('\t','').replace('\r','').replace('\n','')        # mengambil data released_date pada web (format masih berantakan)
    
    # parsing and transforming
    release_date_parsed = target.split(":")[1].strip(")").split("/")                                                # parsing data released_date kedalam format yang diinginkan
    release_date = release_date_parsed[2] + "-" + release_date_parsed[0] + "-" + release_date_parsed[1]             # menyimpan atribut release date
    
    # Add the extracted data to data_boosterpack
    data_boosterpack.append({
        "boosterpack_id": boosterpack_id,
        "boosterpack_name": boosterpack_name,
        "release_date" : release_date,
        "price" : 50000,
        "quantity" : 100
    })
    
    # scrap for data card
    cards = soup.find_all("div", class_="t_row c_normal")                                                           # mengambil seluruh data kartu pada web
    
    # for loop untuk setiap kartu dalam list
    for card in cards:
        
        # scrapping
        card_name = card.find("span", class_= "card_name").text.strip()                                             # menyimpan atribut card_name
        card_attribute = card.find("span", class_="box_card_attribute").text.strip()                                # menyimpan atribut card_attribute
        card_description = card.find("dd", class_="box_card_text c_text flex_1").text.strip()
        if(card_attribute == 'SPELL'):
            target = str(card.find('span', class_="box_card_effect"))                                               # mengambil data card_type (format masih berantakan)
            
            # parsing
            list = target.split('</span>')                                                                          # parsing data card_type
            card_type = list[0].split('<span>')                                                                     # parsing data card_type
            if(len(card_type) == 1):
                card_type.append("Normal")
            
            # Add the extracted data to data_card
            data_card.append({
                "card_id": card_id,
                "card_name": card_name,
                "card_type": card_type[1] + " Spell",
                "description" : card_description
            })
            
            # Add the extracted data to data_spell
            # data_spell.append({
            #     "card_id": card_id,
            # })
            
        elif(card_attribute == 'TRAP'):
            target = str(card.find('span', class_="box_card_effect"))                                               # mengambil data card_type (format masih berantakan)
            
            # parsing
            list = target.split('</span>')                                                                          # parsing data card_type
            card_type = list[0].split('<span>')                                                                     # parsing data card_type
            if(len(card_type) == 1):
                card_type.append("Normal")
            
            # Add the extracted data to data_card
            data_card.append({
                "card_id": card_id,
                "card_name": card_name,
                "card_type": card_type[1] + " Trap",
                "description" : card_description
            })
            
            # Add the extracted data to data_trap
            # data_trap.append({
            #     "card_id": card_id,
            # })
            
        else:
            #scrapping
            info = card.find("span", class_ ="card_info_species_and_other_item").text.strip().replace('\t','').replace('\r','').replace('\n','')
            atk = card.find('span',class_='atk_power').text.strip().split(' ')[1]                                   # menyimpan atribut attack
            defend = card.find('span',class_='def_power').text.strip().split(' ')[1]                                # menyimpan atribut defend
            
            #parsing info data into type and cardType
            info_list = info.split('/')
            tipe = info_list[0].strip('[')                                                                          # menyimpan atribut type
            card_type = info_list[1].strip(']')                                                                     # menyimpan atribut card_type

            if(card_type == 'Link'):
                target = str(card.find("span", class_ = "box_card_linkmarker"))
                list = target.split('</span>')
                card_level = list[0].split('<span>')[1].split(' ')                                                  # menyimpan atribut card_level jika card_type = link
            else:
                target = str(card.find("span", class_="box_card_level_rank"))
                #parsing level/rank data
                list = target.split('</span>')
                card_level = list[0].split('<span>')[1].split(' ')                                                  # menyimpan atribut card_level selain card_type = link
                if(card_type == 'Pendulum'):
                    p_scale = card.find('span',class_='box_card_pen_scale').text.strip().split(' ')[2]              # menyimpan atribut p_scale jika card_type = pendulum
                    
                    # Add the extracted data to data_card_pscale
                    data_card_pscale.append({
                        "card_id" : card_id,
                        "p_scale" : int(p_scale) 
                    })
            
            # Add the extracted data to data_card
            data_card.append({
                "card_id": card_id,
                "card_name": card_name,
                "card_type": card_type,
                "description" : card_description
            })
            
            # Add the extracted data to data_monster
            data_monster.append({
                "card_id": card_id,
                "attribute": card_attribute,
                "type" : tipe,
                "level/rank/link": int(card_level[1]),
                "atk" : (atk),
                "def" : defend 
            })
        
        # Add the extracted data to data_card_boosterpack
        data_card_boosterpack.append({
                "boosterpack_id" : boosterpack_id,
                "card_id": card_id
            })
        card_id+=1

# membuat dataframe
df_card = pd.DataFrame(data_card)       
df_monster = pd.DataFrame(data_monster)
df_boosterpack = pd.DataFrame(data_boosterpack)
df_card_boosterpack = pd.DataFrame(data_card_boosterpack)
df_card_pscale = pd.DataFrame(data_card_pscale)

# export to json file
df_card.to_json("Data Scraping/data/card_data.json",orient="records")
df_monster.to_json("Data Scraping/data/monster_data.json",orient="records")
df_boosterpack.to_json("Data Scraping/data/boosterpack_data.json",orient="records")
df_card_boosterpack.to_json("Data Scraping/data/card_boosterpack_data.json",orient="records")
df_card_pscale.to_json("Data Scraping/data/pendulum_data.json",orient="records")

print("Scraping data berhasil dilakukan")