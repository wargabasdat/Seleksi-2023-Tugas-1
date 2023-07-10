# imports
import json
import psycopg2
import os

# get directories
current_directory = os.path.dirname(os.path.abspath(__file__))
data_directory = os.path.join(current_directory, "..", "data")

# connecting to postgreSQL database - update according to your settings
conn = psycopg2.connect(database='formula1', user='postgres', password='password', host='localhost', port='5432')
cursor = conn.cursor()

# creating tables
## table seasons
command = """
CREATE TABLE seasons (
    year INT PRIMARY KEY
    )"""

cursor.execute(command)

## table races
command = """
CREATE TABLE races (
    raceID INT PRIMARY KEY,
    year INT,
    grandPrixName VARCHAR,
    date VARCHAR,
    location VARCHAR,
    FOREIGN KEY (year) REFERENCES seasons(year)
    )"""

cursor.execute(command)

## table drivers
command = """
CREATE TABLE drivers (
    name VARCHAR PRIMARY KEY,
    nationality VARCHAR
    )"""

cursor.execute(command)

## table driverstandings
command = """
CREATE TABLE driverStandings (
    driverStandingsID SERIAL PRIMARY KEY,
    year INT,
    driver VARCHAR,
    car VARCHAR,
    position VARCHAR,
    points FLOAT,
    FOREIGN KEY (year) REFERENCES seasons(year),
    FOREIGN KEY (driver) REFERENCES drivers(name)
    )"""

cursor.execute(command)

## table raceresults
command = """
CREATE TABLE raceResults (
    resultsID SERIAL PRIMARY KEY,
    raceID INT,
    driver VARCHAR,
    driverNo INT,
    position VARCHAR,
    car VARCHAR,
    laps VARCHAR,
    timeRetired VARCHAR,
    points FLOAT,
    FOREIGN KEY (raceID) REFERENCES races(raceID),
    FOREIGN KEY (driver) REFERENCES drivers(name)
    )"""

cursor.execute(command)

# inserting values from json to tables
## seasons.json
data_path = os.path.join(data_directory, 'seasons.json')
with open(data_path) as file:
    data = json.load(file)

for entry in data:
    year = entry['Year']
    cursor.execute('INSERT INTO seasons (year) VALUES (%s)', (year,))


## races.json
data_path = os.path.join(data_directory, 'races.json')
with open(data_path) as file:
    data = json.load(file)

for entry in data:
    grandPrixName = entry['Grand-Prix']
    date = entry['Date']
    raceID = entry['Race-ID']
    location = entry['Location']
    year = entry['Year']
    cursor.execute('INSERT INTO races (raceID, year, grandPrixName, date, location) VALUES (%s, %s, %s, %s, %s)',
                   (raceID, year, grandPrixName, date, location))

## drivers.json
data_path = os.path.join(data_directory, 'drivers.json')
with open(data_path) as file:
    data = json.load(file)

for entry in data:
    driver = entry['Driver']
    nationality = entry['Nationality']
    cursor.execute('INSERT INTO drivers (name, nationality) VALUES (%s, %s)', (driver, nationality))

## drivers-standings.json
data_path = os.path.join(data_directory, 'drivers-standings.json')
with open(data_path) as file:
    data = json.load(file)

for entry in data:
    pos = entry['Pos']
    driver = entry['Driver']
    car = entry['Car']
    points = entry['PTS']
    year = entry['Year']
    cursor.execute('INSERT INTO driverStandings (year, driver, car, position, points) VALUES (%s, %s, %s, %s, %s)',
                   (year, driver, car, pos, points))
    
## table raceresults
def insert_raceresults(filename):
    data_path = os.path.join(data_directory, filename)
    with open(data_path) as file:
        data = json.load(file)

    for entry in data:
        position = entry['Pos']
        driverNo = entry['No']
        driver = entry['Driver']
        car = entry['Car']
        laps = entry['Laps']
        timeRetired = entry['Time/Retired']
        points = entry['PTS']
        raceID = entry['Race-ID']
        cursor.execute('INSERT INTO drivers (name) VALUES (%s) ON CONFLICT DO NOTHING', (driver,))
        cursor.execute('INSERT INTO raceResults (raceID, driver, driverNo, position, car, laps, timeRetired, points) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                        (raceID, driver, driverNo, position, car, laps, timeRetired, points))

insert_raceresults('results-50s.json')
insert_raceresults('results-60s.json')
insert_raceresults('results-70s.json')
insert_raceresults('results-80s.json')
insert_raceresults('results-90s.json')
insert_raceresults('results-00s.json')
insert_raceresults('results-10s.json')
insert_raceresults('results-20s.json')
    
# commit the changes and close connection
print('Inserting to databases done.')
conn.commit()
cursor.close()
conn.close()