import json
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.remote.webdriver import WebDriver
from selenium.webdriver.remote.webelement import WebElement
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def isElementFound(driver: WebElement, locator):
    try:
        driver.find_element(*locator)
        return True
    except NoSuchElementException:
        return False

def isElementAvailable(driver: WebDriver, locator):
    try:
        driver.find_element(*locator)
        return True
    except NoSuchElementException:
        return False

def getPokemonInfo(URL: str):
    driverPokemon = webdriver.Chrome()
    driverPokemon.get(URL)

    # Wait for page to load
    try :
        wait = WebDriverWait(driverPokemon,2).until(EC.presence_of_element_located((By.CLASS_NAME, "pokedex-pokemon-pagination-title")))
    except TimeoutException:
        return False

    # Initialize json
    pokemon_data = {}

    # GET NAME AND ID POKEMON
    nameID = driverPokemon.find_element(By.CLASS_NAME, "pokedex-pokemon-pagination-title").text.split(" #")
    pokemon_data["name"] = nameID[0]
    pokemon_data["id"] = nameID[1]

    # GET POKEMON IMAGE
    src = driverPokemon.find_element(By.CLASS_NAME, "profile-images").find_element(By.TAG_NAME, "img").get_attribute("src")
    pokemon_data["image"] = src

    # GET DESCRIPTION
    description = driverPokemon.find_element(By.CLASS_NAME, "version-descriptions").find_element(By.CLASS_NAME, "version-x").text
    pokemon_data["description"] = description

    # GET INFO
    abilityInfoElement = driverPokemon.find_element(By.CLASS_NAME, "pokemon-ability-info")
    divInsideAbilityInfoElement = abilityInfoElement.find_elements(By.CLASS_NAME, "column-7")
    for i in range(len(divInsideAbilityInfoElement)):
        list = divInsideAbilityInfoElement[i].find_elements(By.TAG_NAME, "li")

        # dibatesin karna ada list ke-3 yang 'aneh'
        if(i == 1):
            list = list[:2]
        for info in list:
            spanInfo = info.find_elements(By.TAG_NAME, "span")
            listInfo = info.find_elements(By.TAG_NAME, "ul")
            if(len(listInfo) != 0):
                tempArray = []
                for list in listInfo:
                    tempArray.append(list.text)
                pokemon_data[spanInfo[0].text] = tempArray
            else:
                genders = spanInfo[1].find_elements(By.TAG_NAME, "i")
                if(len(genders) == 0):
                    pokemon_data[spanInfo[0].text] = spanInfo[1].text
                else :
                    tempArray = []
                    for gender in genders:
                        genderType = gender.get_attribute("class")
                        if(genderType == "icon icon_male_symbol"):
                            tempArray.append("Male")
                        else :
                            tempArray.append("Female")
                    pokemon_data[spanInfo[0].text] = tempArray
    
    # GET POKEMON TYPE
    pokemnonTypeElement = driverPokemon.find_element(By.CLASS_NAME, "dtm-type")
    typeList = pokemnonTypeElement.find_elements(By.TAG_NAME, "li")
    tempArray = []
    for pkmnType in typeList:
        tempArray.append(pkmnType.text)
    pokemon_data["type"] = tempArray

    # GET POKEMON WEAKNESS
    pokemnonWeaknessesElement = driverPokemon.find_element(By.CLASS_NAME, "dtm-weaknesses")
    weaknessesList = pokemnonWeaknessesElement.find_elements(By.TAG_NAME, "li")
    tempArray = []
    for pkmnWeaknesses in weaknessesList:
        tempArray.append(pkmnWeaknesses.text)
    pokemon_data["weaknesses"] = tempArray

    # GET POKEMON STATS
    stats_object = {}
    pokemonStatsElement = driverPokemon.find_element(By.CLASS_NAME, "pokemon-stats-info")
    statList = pokemonStatsElement.find_elements(By.TAG_NAME, "li")
    filteredStatList = [stat for stat in statList if isElementFound(stat,(By.CLASS_NAME, "gauge"))]
    for stat in filteredStatList:
        typeStat = stat.find_element(By.TAG_NAME, "span")
        valueStat = stat.find_element(By.CLASS_NAME, "meter").get_attribute("data-value")
        stats_object[typeStat.text] = valueStat
    pokemon_data["stats"] = stats_object

    driverPokemon.quit()

    return pokemon_data

def getUrlByPokedexID(BASE_URL :str,id):
    # Initialize driver
    driverSearch = webdriver.Chrome()
    driverSearch.get(BASE_URL+"/us/pokedex")

    # Find the input and fill it with pokedex id
    searchInput = driverSearch.find_element(By.ID, "searchInput")
    searchInput.send_keys(id)

    try :
        wait = WebDriverWait(driverSearch,3).until(EC.presence_of_element_located((By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1]/a""")))
        if(not isElementAvailable(driverSearch,(By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1]/a"""))):
            raise TimeoutException
        else :

        # wait2 = WebDriverWait(driverSearch,2).until(EC.presence_of_element_located((By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1]/a""")))
            url = driverSearch.find_element(By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1]/a""").get_attribute("href")
            print("URL:",url)
            return url
    except TimeoutException:
        return False
    # return driverSearch.find_element(By.CLASS_NAME,"results").find_element(By.TAG_NAME,"li").find_element(By.TAG_NAME,"a").get_attribute("href")


if (__name__ == "__main__"):
    BASE_URL = "https://www.pokemon.com/"

    
    for i in range(1,152):
        print("============================")
        url = False
        while(url == False or (i != 1 and url == "https://www.pokemon.com/us/pokedex/bulbasaur")):
            url = getUrlByPokedexID(BASE_URL,i)
        pokemonInfo = False
        while(pokemonInfo == False):
            pokemonInfo = getPokemonInfo(url)
        
        # Write data to json
        with open("./Data Scraping/data/gen1.json","r") as file:
            existing_data = json.load(file)

        existing_data.append(pokemonInfo)
        json_object = json.dumps(existing_data, indent=4)

        with open("./Data Scraping/data/gen1.json","w") as file:
            file.write(json_object)
