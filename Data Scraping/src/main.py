import webscraper as ws

print("""
Welcome to the Formula 1 Data Web Scraper! (Working as of 2023-07-03)
Data taken from https://www.formula1.com/

Available commands:
1. Get driver standings of a season
2. Get teams standings of a season
3. Get the winners of a season
4. Get race results (requires race IDs on the F1 website)
5. Get quali results (requires race IDs on the F1 website)
6. Get race IDs in a season
7. Save last dataframe to JSON
99. Exit the program

""")

command = int(input("Enter your command here: "))
df = None

while (1):

    if (command == 1):
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
        inp = input("Do you know the race ID and location? ")
        yes = False
        while (not yes):
            if (inp == 'y' or inp == 'yes'):
                continue
            else:
                year = input("Enter season/year of the race: ")
                print(ws.get_race_winners(year))
                print(" ")
                yes = input("Did you already get the race ID of the race that you want?" )
                if (yes == 'y' or yes == 'yes'):
                    yes = True

        year, location, race_id = [x for x in input("Enter race year, location, and ID separated by commas: ").split(', ')]
        df = ws.get_race_results(year, location, race_id)

    elif (command == 5):
        inp = input("Do you know the race ID and location? ")
        yes = False
        while (not yes):
            if (inp == 'y' or inp == 'yes'):
                continue
            else:
                year = input("Enter season/year of the race: ")
                print(ws.get_race_winners(year))
                print(" ")
                yes = input("Did you already get the race ID of the race that you want?" )
                if (yes == 'y' or yes == 'yes'):
                    yes = True

        year, location, race_id = [x for x in input("Enter race year, location, and ID separated by commas: ").split(', ')]
        df = ws.get_quali_results(year, location, race_id)

    elif (command == 6):
        year = input("Enter season/year: ")
        arr = ws.get_season_ids_location(year)
        for i in range(len(arr)):
            print(arr)

    # elif (command == 7 or command == 'save'):

    elif (command == 99):
        print("Are you sure you want to exit?")
        inp = input()

        if (inp == 'yes' or inp == 'y'):
            end = True
            print("Bye bye ...")
            exit(1)
        

    command = int(input("Enter your command here: "))