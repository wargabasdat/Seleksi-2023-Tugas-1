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
data_folder = os.path.join(parent_dir,"data")

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

def insert_single_statistics(file_name):
    """Insert data into singlestatistics file"""
    path = os.path.join(data_folder,file_name)
    raw = open(path,encoding="UTF-8")

    data = json.load(raw)
    for item in data :
        values = item["points"],item["rank"],item["id"],item["type"]
        if item["type"] == "women_single":
            query = '''
            INSERT INTO womensinglestatistics(points, rank, playerId, type)
            VALUES (%s, %s, %s, %s)
            '''
            cur.execute(query,(values))
        else:
            query = '''
                INSERT INTO mensinglestatistics(points, rank, playerId, type)
                VALUES (%s, %s, %s, %s)
            '''
            cur.execute(query,(values))


def insert_double_statistics(file_name):
    """Insert into doublestatistics table"""
    path = os.path.join(data_folder,file_name)
    raw = open(path,encoding="UTF-8")

    data = json.load(raw)
    for item in data :
        values = item["points"],item["rank"],item["firstPlayerId"],item["secondPlayerId"],item["type"]
        if item["type"] == "men_double":
            query = '''
                INSERT INTO mendoublestatistics (points, rank, firstPlayerId, secondPlayerId, type)
                VALUES (%s,%s, %s, %s, %s)
            '''
        elif item["type"] == "women_double":
            query = '''
                INSERT INTO womendoublestatistics (points, rank, firstPlayerId, secondPlayerId, type)
                VALUES (%s,%s, %s, %s, %s)
            '''
        else:
            query = '''
                INSERT INTO mixeddoublestatistics (points, rank, firstPlayerId, secondPlayerId, type)
                VALUES (%s,%s, %s, %s, %s)
            '''
        cur.execute(query,(values))

def main():
    """Main function to insert data into database"""
    insert_players("players.json")
    insert_double_statistics("double_statistics.json")
    insert_single_statistics("single_statistics.json")
main()
conn.close()
