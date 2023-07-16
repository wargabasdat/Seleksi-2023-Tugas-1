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
        return "not found"
    
    allInfo = ""

    # GET NAME AND ID POKEMON
    nameIDElement = driverPokemon.find_element(By.CLASS_NAME, "pokedex-pokemon-pagination-title")
    nameID = nameIDElement.text.split(" #")
    allInfo += "Name: " + nameID[0] + "\n"
    allInfo += "ID: " + nameID[1] + "\n"

    # GET POKEMON IMAGE
    imgElement = driverPokemon.find_element(By.CLASS_NAME, "profile-images")
    src = imgElement.find_element(By.TAG_NAME, "img").get_attribute("src")
    allInfo += "Image Path: "+ src + "\n"

    # GET DESCRIPTION
    descriptionElement = driverPokemon.find_element(By.CLASS_NAME, "version-descriptions")
    # descVersionY = descriptionElement.find_element(By.CLASS_NAME, "version-y")
    descVersionX = descriptionElement.find_element(By.CLASS_NAME, "version-x")
    # allInfo += "Description Y:", descVersionY.text)
    allInfo += "Description: "+ descVersionX.text + "\n"

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
                allInfo += spanInfo[0].text+ ": "
                for list in listInfo:
                    allInfo += list.text + " "
                allInfo += "\n"
            else:
                genders = spanInfo[1].find_elements(By.TAG_NAME, "i")
                if(len(genders) == 0):
                    allInfo += spanInfo[0].text+": "+spanInfo[1].text + "\n"
                else :
                    allInfo += spanInfo[0].text+": "
                    for gender in genders:
                        genderType = gender.get_attribute("class")
                        if(genderType == "icon icon_male_symbol"):
                            allInfo += "Male "
                        else :
                            allInfo += "Female "
                    allInfo += "\n"
    
    # GET POKEMON TYPE
    pokemnonTypeElement = driverPokemon.find_element(By.CLASS_NAME, "dtm-type")
    typeList = pokemnonTypeElement.find_elements(By.TAG_NAME, "li")
    allInfo += "Type: "
    for pkmnType in typeList:
        allInfo += pkmnType.text + " "
    allInfo += "\n"

    # GET POKEMON WEAKNESS
    pokemnonWeaknessesElement = driverPokemon.find_element(By.CLASS_NAME, "dtm-weaknesses")
    weaknessesList = pokemnonWeaknessesElement.find_elements(By.TAG_NAME, "li")
    allInfo += "Weaknesses: "
    for pkmnWeaknesses in weaknessesList:
        allInfo += pkmnWeaknesses.text + " "
    allInfo += "\n"

    # GET POKEMON STATS
    allInfo += "Stats: " + "\n"
    pokemonStatsElement = driverPokemon.find_element(By.CLASS_NAME, "pokemon-stats-info")
    statList = pokemonStatsElement.find_elements(By.TAG_NAME, "li")
    filteredStatList = [stat for stat in statList if isElementFound(stat,(By.CLASS_NAME, "gauge"))]
    for stat in filteredStatList:
        typeStat = stat.find_element(By.TAG_NAME, "span")
        valueStat = stat.find_element(By.CLASS_NAME, "meter").get_attribute("data-value")
        allInfo += typeStat.text+": "+valueStat + "\n"

    driverPokemon.quit()

    return allInfo

def getUrlByPokedexID(BASE_URL :str,id):
    # Initialize driver
    driverSearch = webdriver.Chrome()
    driverSearch.get(BASE_URL+"/us/pokedex")

    # Find the input and fill it with pokedex id
    searchInput = driverSearch.find_element(By.ID, "searchInput")
    searchInput.send_keys(id)

    try :
        wait = WebDriverWait(driverSearch,3).until(EC.presence_of_element_located((By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1]/a""")))
        url = driverSearch.find_element(By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1]/a""").get_attribute("href")
        print("URL:",url)
        return url
    except TimeoutException:
        return False
    # return driverSearch.find_element(By.CLASS_NAME,"results").find_element(By.TAG_NAME,"li").find_element(By.TAG_NAME,"a").get_attribute("href")


if (__name__ == "__main__"):
    BASE_URL = "https://www.pokemon.com/"

    file = open("./data1.txt", "a")
    for i in range(28,152):
        print("============================")
        url = getUrlByPokedexID(BASE_URL,i)
        while(url == False or (i != 1 and url == "https://www.pokemon.com/us/pokedex/bulbasaur")):
            url = getUrlByPokedexID(BASE_URL,i)
        pokemonInfo = getPokemonInfo(url)
        file.write(pokemonInfo)
    
    file.close()