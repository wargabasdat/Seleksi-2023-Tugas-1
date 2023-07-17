import json

def changeAbilitiesNewLine():
    with open("./Data Scraping/data/pokedex.json","r") as file:
        existing_data = json.load(file)
    
    for pokemonData in existing_data:
        tempAbilities = []
        for ability in pokemonData["Abilities"]:
            for abilitySplitted in ability.split("\n"):
                 tempAbilities.append(abilitySplitted)
        pokemonData["Abilities"] = tempAbilities
            
        
    
    json_object = json.dumps(existing_data, indent=4)
    with open("./Data Scraping/data/pokedex.json","w") as file:
            file.write(json_object)

# Transform evolution to a separated file
def getEvolution():
    with open("./Data Scraping/data/pokedex.json","r") as file:
        existing_data = json.load(file)
    
    with open("./Data Scraping/data/evolution.json","r") as file:
        existing_evolution = json.load(file)

    for pokemonData in existing_data:
        evolution = pokemonData["evolution"]
        firstEvolution = evolution["first"]
        middleEvolution = evolution["middle"]
        lastEvolution = evolution["last"]
        if(middleEvolution != []):
            for first in firstEvolution:
                for middle in middleEvolution:
                    if(not checkEvolutionExist(existing_evolution, first, middle)):
                        evolution_data = {}
                        evolution_data["initial"] = first
                        evolution_data["evolution"] = middle
                        existing_evolution.append(evolution_data)
            if(lastEvolution != []):
                for middle in middleEvolution:
                    for last in lastEvolution:
                        if(not checkEvolutionExist(existing_evolution, middle, last)):
                            evolution_data = {}
                            evolution_data["initial"] = middle
                            evolution_data["evolution"] = last
                            existing_evolution.append(evolution_data)
        else:
            if(lastEvolution != []):
                for first in firstEvolution:
                    for last in lastEvolution:
                        if(not checkEvolutionExist(existing_evolution, first, last)):
                            evolution_data = {}
                            evolution_data["initial"] = first
                            evolution_data["evolution"] = last
                            existing_evolution.append(evolution_data)
    
    json_object = json.dumps(existing_evolution, indent=4)
    with open("./Data Scraping/data/evolution.json","w") as file:
        file.write(json_object)

def checkEvolutionExist(existing_evolution, initial, evolution):
    for evo in existing_evolution:
        if(evo["initial"] == initial and evo["evolution"] == evolution):
            return True
    return False

def preprocessData():
       changeAbilitiesNewLine()
       getEvolution()