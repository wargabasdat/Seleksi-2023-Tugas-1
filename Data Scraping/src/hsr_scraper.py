from bs4 import BeautifulSoup
import requests

def character_stats_scraper():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/character-stats/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    character_stats_dict = {
        "character_stats": []
    }

    #Melakukan pencarian terhadap stats karakter pada tabel (tag yang digunakan oleh website adalah 'div')
    characters = soup.find_all('div', class_ = 'rt-tr-group')

    #Melakukan iterasi terhadap seluruh data karakter pada tabel
    for cd in characters:
        detail = cd.find_all('div', class_='rt-td')     #Mencari seluruh data stats dari tiap karakter
        arr = ['' for i in range(6)]                    #Menyimpan data stats dalam sebuah array
        i = 0                                           #Inisialisasi index yang akan digunakan untuk menyimpan data pada array
        for d in detail:                                #Melakukan iterasi data stats pada 1 row tabel
            arr[i] = d                                  #Menyimpan data tiap kolom ke dalam array
            i += 1                                      #Melakukan increment untuk mengakses indeks array selanjutnya
    
        #Memperoleh nama karakter dari tabel
        character_name = cd.find('h2', class_ = 'character-name').text
        
        #Mengakses halaman detail karakter
        character_detailed_info_url = 'https://genshin.gg/star-rail/characters/' + character_name.replace(' ','')+ '/'  #Membuat url baru untuk redirect ke halaman detail karakter
        character_info_web = requests.get(character_detailed_info_url).text
        character_info_soup = BeautifulSoup(character_info_web, 'lxml')
        
        #Memperoleh elemen dari karakter
        find_element = character_info_soup.find('img', class_ = 'character-info-element')
        character_element = find_element['alt']     #Menyimpan rarity character ke dalam variabel

        #Memperoleh rarity karakter
        find_rarity = arr[0].find('img', class_ = 'character-icon')
        character_rarity = find_rarity['class'][1].replace('rarity-','') + ' star'

        #Memperoleh path dari karakter
        character_path = character_info_soup.find('div', class_ = 'character-info-path').text

        #Menyimpan data stats karakter dari array ke dalam variabel
        character_hp = int(arr[1].text)         #Melakukan casting menjadi integer
        character_atk = int(arr[2].text)        #Melakukan casting menjadi integer
        character_def = int(arr[3].text)        #Melakukan casting menjadi integer
        character_speed = int(arr[4].text)      #Melakukan casting menjadi integer
        character_taunt = int(arr[5].text)      #Melakukan casting menjadi integer

        #Memasukkan data yang diperoleh ke dalam dictionary
        character_stats_dict['character_stats'].append(
            {
                "name": character_name,
                "rarity": character_rarity,
                "element": character_element,
                "path": character_path,
                "hp": character_hp,
                "attack": character_atk,
                "defense": character_def,
                "speed": character_speed,
                "taunt": character_taunt
            }
        )
        #Proses berulang hingga data semua karakter dalam tabel diperoleh
    return character_stats_dict

def character_materials_scraper():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/character-stats/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    character_materials_dict = {
        "character_materials": []
    }

    #Melakukan pencarian karakter yang akan dicari materials yang dibutuhkan oleh karakter tersebut (berbentuk tabel)
    characters = soup.find_all('div', class_ = 'rt-tr-group')

    #Melakukan iterasi pada setiap row tabel
    for cd in characters:
        character_name = cd.find('h2', class_ = 'character-name').text  #Melakukan pencarian nama karakter

        #Menggabungkan nama karakter untuk mendapatkan url baru untuk redirect ke halaman detail karakter
        character_detailed_info_url = 'https://genshin.gg/star-rail/characters/' + character_name.replace(' ','')+ '/'
        character_info_web = requests.get(character_detailed_info_url).text
        character_info_soup = BeautifulSoup(character_info_web, 'lxml')

        #Melakukan pencarian materials yang dibutuhkan oleh karakter
        character_materials = character_info_soup.find_all('div', class_ = 'character-info-materials-name')
        for mat in character_materials:                                                                         #Melakukan iterasi pada setiap materials
            character_materials_dict['character_materials'].append(                                             #Memasukkan data materials yang diperoleh ke dalam dictionary
                {
                    "name": character_name,
                    "material": mat.text
                }
            )
            #Proses berulang hingga data materials semua karakter diperoleh
    return character_materials_dict

def light_cones_scraper():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/light-cone-stats/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    light_cones_dict = {
        "light_cones": []
    }
    
    #Melakukan pencarian semua light cones yang tersedia (berbentuk tabel)
    lightCones = soup.find_all('div', class_ = 'rt-tr-group')

    #Melakukan iterasi pada setiap light cones yang tersedia
    for lc in lightCones:
        detail = lc.find_all('div', class_='rt-td')     #Mencari seluruh data stats dari tiap light cone
        arr = ['' for i in range(5)]                    #Menyimpan seluruh data stats light cone pada array
        i = 0                                           #Inisialisasi index untuk yang akan digunakan untuk menyimpan data pada array
        for d in detail:                                #Melakukan iterasi data stats pada 1 row tabel
            arr[i] = d                                  #Menyimpan stats yang diperoleh ke dalam array
            i += 1                                      #Melakukan increment index array untuk mengakses index array selanjutnya

        #Membuka url baru untuk mendapatkan detail tiap light cones
        light_cone_detail_url = requests.get('https://genshin.gg/star-rail/light-cones/').text
        light_cone_detail_soup = BeautifulSoup(light_cone_detail_url, 'lxml')
        light_cone_detail = light_cone_detail_soup.find_all('div', class_ = 'light-cones-item')
        
        #Melakukan iterasi pada setiap light cones yang tersedia
        for lcd in light_cone_detail:
            temp = lcd.find('div', class_ = 'light-cones-name')         #Menyimpan sementara nama light cone
            if temp.text == arr[0].text:                                #Kondisi bila nama light cone yang diperoleh pada url pertama sama dengan nama light cone yang diperoleh pada url kedua
                find_rarity = lcd.find('img', class_ = 'light-cones-image')                 #Mencari rarity light cone
                light_cone_rarity = find_rarity['class'][1].replace('rarity-', '') + ' star'    #Menyimpan rarity light cone ke dalam variabel
                
                arr[4] = lcd.find('div', class_ = 'light-cones-path')   #Mengisi array index ke-4 dengan path dari light cone
                break                                                   #Menghentikan loop
        
        #Menyimpan stats yang diperoleh ke dalam variabel
        light_cone_name = arr[0].text
        light_cone_path = arr[4].text
        light_cone_hp = int(arr[1].text)
        light_cone_atk = int(arr[2].text)
        light_cone_def = int(arr[3].text)

        #Memasukkan data yang diperoleh ke dalam dictionary
        light_cones_dict['light_cones'].append(
            {
                "name": light_cone_name,
                "rarity": light_cone_rarity,
                "path": light_cone_path,
                "hp": light_cone_hp,
                "attack": light_cone_atk,
                "defense": light_cone_def
            }
        )
        #Proses berulang hingga stats seluruh light cone diperoleh
    return light_cones_dict

def paths_scraper():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    paths_dict = {
        "paths": []
    }
    
    output = []

    #Melakukan pencarian paths berdasarkan filter yang tersedia
    paths = soup.find_all('img', class_ = 'filters-item')

    #Melakukan iterasi pada filter
    for p in paths:
        if "path" in p["src"]:              #Kondisi apabila terdapat string "path" pada source link
            path_name = p["filter"]         #Menyimpan nama path ke dalam variabel
            paths_dict['paths'].append(     #Memasukkan path ke dalam dictionary
                {
                    "name": path_name
                }
            )                   
            #Proses berulang hingga seluruh filter diiterasi
    return paths_dict

def elements_scraper():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    elements_dict = {
        "elements": []
    }

    #Melakukan pencarian elements berdasarkan filter yang tersedia
    elements = soup.find_all('img', class_ = 'filters-item')

    #Melakukan iterasi pada filter
    for e in elements:
        if "element" in e["src"]:               #Kondisi apabila terdapat string "element" pada source link
            element_name = e["filter"]          #Menyimpan nama element ke dalam variabel
            elements_dict['elements'].append(   #Memasukkan path ke dalam dictionary
                {
                    "name": element_name
                }
            )
            #Proses berulang hingga seluruh filter diiterasi
    return elements_dict

def prefered_pair():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/character-stats/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    prefered_light_cones_dict = {
        "prefered_light_cones": []
    }

    #Melakukan pencarian karakter yang akan dicari light cone yang paling cocok untuk karakter tersebut (berbentuk tabel)
    characters = soup.find_all('div', class_ = 'rt-tr-group')

    #Melakukan iterasi pada setiap row tabel
    for cd in characters:
        character_name = cd.find('h2', class_ = 'character-name').text  #Melakukan pencarian nama karakter

        #Menggabungkan nama karakter untuk mendapatkan url baru untuk redirect ke halaman detail karakter
        character_detailed_info_url = 'https://genshin.gg/star-rail/characters/' + character_name.replace(' ','')+ '/'
        character_info_web = requests.get(character_detailed_info_url).text
        character_info_soup = BeautifulSoup(character_info_web, 'lxml')

        #Mencari seluruh light cones yang cocok untuk sebuah karakter
        light_cone_section = character_info_soup.find_all('div', class_ = 'character-info-build-section third')
        for section in light_cone_section:
            if "Light Cone" in section.find('h2', class_ = 'character-info-build-section-title').text:  #Kondisi bila section yang dilihat mengandung string "Light Cone"
                light_cones_preferences = section.find_all('div', class_ = 'character-info-weapon')     #Membaca seluruh preferensi light cone
                for slc in light_cones_preferences:
                    light_cone_name = slc.find('div', class_ = 'character-info-weapon-name').text       #Memasukkan light cone ke dalam variabel
                    prefered_light_cones_dict['prefered_light_cones'].append(                           #Memasukkan preferensi light cone ke dalam dictionary
                        {
                            "character_name": character_name,
                            "light_cone_name": light_cone_name
                        }
                    )
                    #Proses berulang hingga seluruh prefered light cones untuk tiap karakter didapatkan
    return prefered_light_cones_dict

def materials_scraper():
    #url halaman website yang akan diperoleh datanya
    web = requests.get('https://genshin.gg/star-rail/farming/').text
    soup = BeautifulSoup(web, 'lxml')

    #Inisialisasi dictionary untuk menyimpan data
    materials_dict = {
        "materials": []
    }

    #Melakukan pencarian nama material (berbentuk tabel)
    materials = soup.find_all('div', class_ = 'rt-tr-group')

    #Melakukan iterasi pada setiap row tabel
    for mat in materials:
        material_name = mat.find('div', class_ = 'rt-td').text    #Menyimpan nama material ke dalam variabel
        materials_dict['materials'].append(     #Memasukkan nama material ke dalam dictionary
            {
                "name": material_name
            }
        )
        #Proses berulang hingga semua material didapatkan
    return materials_dict
