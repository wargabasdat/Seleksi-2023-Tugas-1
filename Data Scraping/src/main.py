# imports
import json
import webscraper as ws
import pandas as pd
import os.path

# save directories
current_directory = os.path.dirname(os.path.abspath(__file__))
data_directory = os.path.join(current_directory, "..", "data")
df = pd.DataFrame()

def populate_seasons():
    years_df = ws.get_seasons()
    years_string = years_df.to_json(orient='records', indent=2)   
    data_file_path = os.path.join(data_directory, "seasons.json")

    with open(data_file_path, "w+") as file:
        file.write(years_string)

def print_commands():
    print("""
Available commands:
0. See available commands
1. Get driver standings of a season
2. Get the races of a season
3. Get race results (requires race IDs on the F1 website)
4. Get the drivers that raced in a range of seasons
5. Save last dataframe to JSON
6. Exit the program""")

# main program
populate_seasons()
print("Welcome to the Formula 1 Data Web Scraper!")

print_commands()
print(" ")
command = int(input("Enter your command here: "))

while (1):
    if (command == 0):
        print_commands()

    elif (command == 1):
        year = input("Enter season/year: ")
        df = ws.get_drivers_standings(year)
        df = df.drop(columns='Nationality')
        print(df)

    elif (command == 2):
        year = input("Enter season/year: ")
        df = ws.get_races(year)
        print(df)

    elif (command == 3):
        year, location, race_id = [x for x in input("Enter race year, location, and ID separated by commas: ").split(', ')]
        if (" " in location):
            location.replace(" ", "-")

        df = ws.get_race_results(year, location, race_id)
        print(df)

    elif (command == 4):
        years = [year for year in input("Enter years, separated by comma: ".split(', '))]
        
        df = ws.get_drivers(years)
        print(df)

    elif (command == 5 or command == 'save'):
        if df.empty:
            print("You have not scraped any data.")

        else:
            print(df.head())
            print(" ")
            print("(Showing the first 5 rows only)")
            print("Saving will overwrite any tables with the same name.")

            file_names = os.listdir(data_directory)

            # printing the file names available
            i = 1
            for file_name in file_names:
                if file_name == 'seasons.json':
                    print(f'{i}. {file_name} - DO NOT OVERWRITE')
                else:
                    print(f'{i}. {file_name}')
                i = i + 1

            print(" ")
            table_name = input("Enter name for the table you want to save: ")
            
            json_string = df.to_json(orient='records', indent=2)
            data_file_path = os.path.join(data_directory, table_name + ".json")

            with open(data_file_path, "w+") as file:
                file.write(json_string)

    elif (command == 6 or str(command) == 'exit'):
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
