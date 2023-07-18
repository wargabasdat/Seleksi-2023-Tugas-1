import json

from jsonToPostgre import parseJsonToPostgre
from jsonToPostgre import createTables
from preprocessData import preprocessData
from getPokemonData import getPokemonInfo
from getUrlList import getUrlList

if (__name__ == "__main__"):
    BASE_URL = "https://www.pokemon.com/us/pokedex"

    # GET ALL URL FOR EACH POKEMON
    # note : when the webpage is opened, scroll down till the very end of list
    result = getUrlList(BASE_URL)

    json_object = json.dumps(result, indent=4)

    with open("./Data Scraping/data/url_list.json","w") as file:
        file.write(json_object)
    

    # GET ALL POKEMON DATA FROM URL LIST
    with open("./Data Scraping/data/url_list.json","r") as file:
            url_pokemon = json.load(file)
    
    for url in url_pokemon:
        pokemon_data = False
        while(pokemon_data == False):
            pokemon_data = getPokemonInfo(url)

        with open("./Data Scraping/data/pokedex.json","r") as file:
            existing_data = json.load(file)

        existing_data.append(pokemon_data)
        json_object = json.dumps(existing_data, indent=4)

        with open("./Data Scraping/data/pokedex.json","w") as file:
            file.write(json_object)
    
    # PREPROCESS THE DATA
    preprocessData()

    # CREATE DATABASES IN POSTGRE
    createTables()
    parseJsonToPostgre()