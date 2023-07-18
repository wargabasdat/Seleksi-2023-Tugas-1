import json
import psycopg2
import os
from dotenv import load_dotenv

def createTables():
    load_dotenv()
    conn = psycopg2.connect(host="localhost", dbname="postgres", user="postgres", password=os.getenv("PASSWORD"), port=5432)

    cursor = conn.cursor()

    cursor.execute("""CREATE TABLE IF NOT EXISTS pokemon (
        id VARCHAR(4) PRIMARY KEY,
        name VARCHAR(255),
        image VARCHAR(225),
        description VARCHAR(500),
        page VARCHAR(225),
        height VARCHAR(50),
        weight VARCHAR(50),
        category VARCHAR(50)
    );
    """)

    cursor.execute("""CREATE TABLE IF NOT EXISTS evolution (
        initial_id VARCHAR(4),
        evolution_id VARCHAR(4),
        PRIMARY KEY (initial_id, evolution_id),
        FOREIGN KEY (initial_id) REFERENCES pokemon(id),
        FOREIGN KEY (evolution_id) REFERENCES pokemon(id)
    );
    """)

    cursor.execute("""CREATE TABLE IF NOT EXISTS stat (
        pokemon_id VARCHAR(4),
        hp INT,
        attack INT,
        defense INT,
        special_attack INT,
        special_defense INT,
        speed INT,
        PRIMARY KEY (pokemon_id),
        FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
    );
    """)

    cursor.execute("""CREATE TABLE IF NOT EXISTS type (
        pokemon_id VARCHAR(4),
        type_name VARCHAR(50),
        PRIMARY KEY (pokemon_id, type_name),
        FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
    );
    """)

    cursor.execute("""CREATE TABLE IF NOT EXISTS weaknesses (
        pokemon_id VARCHAR(4),
        type_name VARCHAR(50),
        PRIMARY KEY (pokemon_id, type_name),
        FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
    );
    """)

    cursor.execute("""CREATE TABLE IF NOT EXISTS abilities (
        pokemon_id VARCHAR(4),
        ability_name VARCHAR(50),
        PRIMARY KEY (pokemon_id, ability_name),
        FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
    );
    """)

    cursor.execute("""CREATE TABLE IF NOT EXISTS gender (
        pokemon_id VARCHAR(4),
        gender VARCHAR(50),
        PRIMARY KEY (pokemon_id, gender),
        FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
    );
    """)

    conn.commit()

    cursor.close()
    conn.close()

def insertPokemonData(pokemon_data):
    load_dotenv()
    conn = psycopg2.connect(host="localhost", dbname="postgres", user="postgres", password=os.getenv("PASSWORD"), port=5432)

    cursor = conn.cursor()
    id = pokemon_data["id"]
    name = pokemon_data["name"]
    image = pokemon_data["image"]
    description = pokemon_data["description"]
    page = pokemon_data["page"]
    Height = pokemon_data["Height"]
    Weight = pokemon_data["Weight"]
    Category = pokemon_data["Category"]
    cursor.execute("""INSERT INTO pokemon (id, name, image, description, page, height, weight, category) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);""",
        (id, name, image, description, page, Height, Weight, Category))
    
    conn.commit()

    cursor.close()
    conn.close()

def insertPokemonStat(cursor, pokemon_data):
     stats = pokemon_data["stats"]
     id = pokemon_data["id"]
     hp = stats["HP"]
     attack = stats["Attack"]
     defense = stats["Defense"]
     sa = stats["Special Attack"]
     sd = stats["Special Defense"]
     s = stats["Speed"]
     cursor.execute("""INSERT INTO stat (pokemon_id, hp, attack, defense, special_attack, special_defense, speed) VALUES (%s, %s, %s, %s, %s, %s, %s); """,
            (id, hp, attack, defense, sa, sd ,s));
     
def insertPokemonType(cursor, pokemon_data):
     types = pokemon_data["type"]
     for typee in types:     
        cursor.execute("""INSERT INTO type (pokemon_id, type_name) VALUES (%s, %s); """,
                (pokemon_data["id"], typee))

def insertPokemonWeaknesses(cursor, pokemon_data):
     weaknesses = pokemon_data["weaknesses"]
     for weakness in weaknesses:     
        cursor.execute("""INSERT INTO weaknesses (pokemon_id, type_name) VALUES (%s, %s); """,
                (pokemon_data["id"], weakness))

def insertPokemonAbility(cursor, pokemon_data):
     abilities = pokemon_data["Abilities"]
     for ability in abilities:     
        cursor.execute("""INSERT INTO abilities (pokemon_id, ability_name) VALUES (%s, %s); """,
                (pokemon_data["id"], ability))

def insertPokemonGender(cursor, pokemon_data):
    genders = pokemon_data["Gender"]
    if( genders == "Unknown"):
        cursor.execute("""INSERT INTO gender (pokemon_id, gender) VALUES (%s, %s); """,
            (pokemon_data["id"], genders))
    else: 
        for gender in genders:     
            cursor.execute("""INSERT INTO gender (pokemon_id, gender) VALUES (%s, %s); """,
                    (pokemon_data["id"], gender))

def insertPokemonEvolution(cursor, intial, evolution):
    cursor.execute("""INSERT INTO evolution (initial_id, evolution_id) VALUES (%s, %s); """,
            (intial, evolution))

def parseJsonToPostgre():
    with open("./Data Scraping/data/pokedex.json","r") as file:
            existing_data = json.load(file)

    for pokemon_data in existing_data:
        insertPokemonData(pokemon_data)
        
        load_dotenv()
        conn = psycopg2.connect(host="localhost", dbname="postgres", user="postgres", password=os.getenv("PASSWORD"), port=5432)
        cursor = conn.cursor()

        insertPokemonStat(cursor, pokemon_data)
        insertPokemonType(cursor, pokemon_data)
        insertPokemonWeaknesses(cursor, pokemon_data)
        insertPokemonAbility(cursor, pokemon_data)
        insertPokemonGender(cursor, pokemon_data)

        conn.commit()
        cursor.close()
        conn.close()
    
    with open("./Data Scraping/data/evolution.json","r") as file:
            evolution_data = json.load(file)

    for evolution in evolution_data:
        load_dotenv()
        conn = psycopg2.connect(host="localhost", dbname="postgres", user="postgres", password=os.getenv("PASSWORD"), port=5432)
        cursor = conn.cursor()

        insertPokemonEvolution(cursor, evolution["initial"],evolution["evolution"])

        conn.commit()
        cursor.close()
        conn.close()