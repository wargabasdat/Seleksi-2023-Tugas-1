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

    # OFFICIAL PAGE
    pokemon_data["page"] = URL

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

    # GET POKEMON EVOLUTION PHASE
    evolution = {}
    evolutionLine = driverPokemon.find_element(By.CLASS_NAME, "evolution-profile")

    # First evolution
    firstEvolutions = evolutionLine.find_element(By.CLASS_NAME, "first").find_elements(By.TAG_NAME, "a")
    firstEvolutionList = [evolution.find_element(By.TAG_NAME, "h3").text.split(" #")[1] for evolution in firstEvolutions ]
    evolution["first"] = firstEvolutionList

    # Middle evolution
    if(isElementFound(evolutionLine,(By.CLASS_NAME, "middle"))):
        middleEvolutions = evolutionLine.find_element(By.CLASS_NAME, "middle").find_elements(By.TAG_NAME, "a")
        middleEvolutionList = [evolution.find_element(By.TAG_NAME, "h3").text.split(" #")[1] for evolution in middleEvolutions ]
        evolution["middle"] = middleEvolutionList
    else :
        evolution["middle"] = []
    
    # Last evolution
    if(isElementFound(evolutionLine,(By.CLASS_NAME, "last"))):
        lastEvolutions = evolutionLine.find_element(By.CLASS_NAME, "last").find_elements(By.TAG_NAME, "a")
        lastEvolutionList = [evolution.find_element(By.TAG_NAME, "h3").text.split(" #")[1] for evolution in lastEvolutions ]
        evolution["last"] = lastEvolutionList
    else :
        evolution["last"] = []
    
    pokemon_data["evolution"] = evolution

    driverPokemon.quit()

    return pokemon_data


if (__name__ == "__main__"):
    BASE_URL = "https://www.pokemon.com/"

    with open("./Data Scraping/data/url_list.json","r") as file:
            url_pokemon = json.load(file)
    
    for i in range(733, 1010):
        pokemon_data = False
        while(pokemon_data == False):
            pokemon_data = getPokemonInfo(url_pokemon[i])

        with open("./Data Scraping/data/pokedex.json","r") as file:
            existing_data = json.load(file)

        existing_data.append(pokemon_data)
        json_object = json.dumps(existing_data, indent=4)

        with open("./Data Scraping/data/pokedex.json","w") as file:
            file.write(json_object)