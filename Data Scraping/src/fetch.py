"""File containing several functions to save .json into postgresql"""
import os
import json
import psycopg2

conn = psycopg2.connect(
    database="badminton",
    user="postgres",
    password="",
    host="localhost",
    port=5432,
)
parent_dir = os.getcwd()
data_folder = os.path.join(parent_dir,"Data Scraping","data")

conn.autocommit = True
cur = conn.cursor()

def insert_players(file_json):
    """Fetch data based on file_name"""
    path = os.path.join(data_folder,file_json)
    raw = open(path,encoding="UTF-8")
    data = json.load(raw)
    query = '''
            INSERT INTO players (id, firstname, lastname, country,gender)
            VALUES (%s, %s, %s, %s, %s)
    '''

    for item in data :
        values = item["id"], item["firstName"],item["lastName"],item["country"], item["gender"]
        cur.execute(query,(values))
    cur.close()
    conn.close()

def insert_single_statistics(file_name):
    """Insert data into singlestatistics file"""
    path = os.path.join(data_folder,file_name)
    raw = open(path,encoding="UTF-8")

    data = json.load(raw)
    query = '''
            INSERT INTO singlestatistics (points, rank, playerId, type)
            VALUES (%s, %s, %s, %s)
        '''
    for item in data :
        values = item["points"],item["rank"],item["id"],item["type"]
        cur.execute(query,(values))
    cur.close()
    conn.close()

def insert_double_statistics(file_name):
    """Insert into doublestatistics table"""
    path = os.path.join(data_folder,file_name)
    raw = open(path,encoding="UTF-8")

    data = json.load(raw)
    query = '''
            INSERT INTO doublestatistics (points, rank, firstPlayerId, secondPlayerId, type)
            VALUES (%s,%s, %s, %s, %s)
        '''
    for item in data :
        values = item["points"],item["rank"],item["firstPlayerId"],item["secondPlayerId"],item["type"]
        cur.execute(query,(values))
    cur.close()
    conn.close()

insert_double_statistics("double_statistics.json")
