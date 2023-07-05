import json
import webscraper as ws
import pandas as pd
import os.path

df = pd.DataFrame()

print("Welcome to the Formula 1 Data Web Scraper!")

def print_commands():
    print("""
Available commands:
0. See available commands
1. Get driver standings of a season
2. Get teams standings of a season
3. Get the winners of a season
4. Get race results (requires race IDs on the F1 website)
5. Get quali results (requires race IDs on the F1 website)
6. Get race IDs in a season
7. Save last dataframe to JSON
99. Exit the program""")

print_commands()
print(" ")
command = int(input("Enter your command here: "))

while (1):
    if (command == 0):
        print_commands()

    elif (command == 1):
        year = input("Enter season/year: ")
        df = ws.get_drivers_standings(year)
        print(df)

    elif (command == 2):
        year = input("Enter season/year: ")
        df = ws.get_teams_standings(year)
        print(df)

    elif (command == 3):
        year = input("Enter season/year: ")
        df = ws.get_race_winners(year)
        print(df)

    elif (command == 4):
        year, location, race_id = [x for x in input("Enter race year, location, and ID separated by commas: ").split(', ')]
        if (" " in location):
            location.replace(" ", "-")

        df = ws.get_race_results(year, location, race_id)
        print(df)

    elif (command == 5):
        year, location, race_id = [x for x in input("Enter race year, location, and ID separated by commas: ").split(', ')]
        df = ws.get_quali_results(year, location, race_id)
        print(df)

    elif (command == 6):
        year = input("Enter season/year: ")
        arr = ws.get_season_ids_location(year)
        for i in range(len(arr)):
            print(arr)

    elif (command == 7 or command == 'save'):
        if df.empty:
            print("No dataframes detected.")
        else:
            print(df)
            print(" ")
            print("This is the table that you will save. Saving will overwrite any tables with the same name.")
            table_name = input("Enter name for the table above: ")
            
            json_string = df.to_json(orient='records', indent=2)

            current_directory = os.path.dirname(os.path.abspath(__file__))
            data_directory = os.path.join(current_directory, "..", "data")
            data_file_path = os.path.join(data_directory, table_name + ".json")

            with open(data_file_path, "w+") as file:
                file.write(json_string)

    elif (command == 99 or str(command) == 'exit'):
        print("Are you sure you want to exit?")
        inp = input()

        if (inp == 'yes' or inp == 'y'):
            print("Bye bye ...")
            exit(1)
        else: 
            command = int(input("Enter your command here: "))
    
    else:
        print("Command invalid.")
        
    print(" ")
    command = int(input("Enter your command here: "))