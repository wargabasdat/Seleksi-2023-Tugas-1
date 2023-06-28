# Written by Kean Nafis Santang - 18221148
# Use this script to get data from VLR.gg
# This script is made to gather data from the VLR page that shows information regarding Valorant's VCT Masters Tokyo 2023

from bs4 import BeautifulSoup
import requests

# -------------------------------------------------------------------------------------------------
def scrape_players():
    # URL for the players statistics page
    url_players = 'https://www.vlr.gg/event/stats/1494/champions-tour-2023-masters-tokyo'
    players_html = requests.get(url_players).text
    # initiate soup
    soup = BeautifulSoup(players_html, 'lxml')

    # website only contains one table, find_all not required
    # This variable contains the html text for the table that contains player statistics
    player_table = soup.find('table', class_="wf-table mod-stats mod-scroll")

    # initializing a dictionary to contain all the player data
    player_dict = {
        "players": [

        ]
    }


    # finding the body of the table, skips the header part
    table_body = player_table.find("tbody")
    # iterating through every row (player stats) inside of the table's body
    table_rows = table_body.find_all("tr")
    for row in table_rows:
        # player_cell is the cell that contains the player name, team, and nationality
        player_cell = row.find("td", class_="mod-player mod-a")
        # getting the player name
        name = player_cell.find("div", class_="text-of").text
        # getting the player's team name
        team_name= player_cell.find("div", class_="stats-player-country").text
        # end of accesing player_cell
        # --------------------------------------

        #getting the player's rounds played
        rounds_played = row.find("td", class_="mod-rnd").text

        # getting all the data using the same class (in order)
        colored_squares = row.find_all("td", class_="mod-color-sq")
        # getting player variables that use the same td class
        rating = float(colored_squares[0].find("div", class_="color-sq").span.text)    # VLR Overall Rating
        acs = float(colored_squares[1].find("div", class_="color-sq").span.text)       # Player's average combat score
        kd = float(colored_squares[2].find("div", class_="color-sq").span.text)        # Player's kill/death ratio
        kast = colored_squares[3].find("div", class_="color-sq").span.text             # Player's kills, kssist, kurvive, krade kercentage
        adr = float(colored_squares[4].find("div", class_="color-sq").span.text)       # Player's average damage per round
        kpr = float(colored_squares[5].find("div", class_="color-sq").span.text)              # Player's kill per round
        apr = float(colored_squares[6].find("div", class_="color-sq").span.text)       # Player's assists per round
        fkpr = float(colored_squares[7].find("div", class_="color-sq").span.text)      # Player's first kills per round
        fdpr = float(colored_squares[8].find("div", class_="color-sq").span.text)      # Player's first death per round
        hs = colored_squares[9].find("div", class_="color-sq").span.text        # Player's headshot percentage
        cl = colored_squares[10].find("div", class_="color-sq").span.text       # Player's clutch win percentage (CAN BE NULL)
        # DATA CLEANING for players who were never in a clutch scenario
        if (cl == ''):
            cl = 'NULL'

        # getting the player's maximum kills in a single map
        kmax_cell = row.find("td", class_='mod-a mod-kmax')
        kmax = kmax_cell.a.contents[0]                                                 # Player's maximum kills in a single map
        # data celaning of KMAX content
        kmax = kmax.replace('\n', '')
        kmax = kmax.replace('\t', '')
        kmax = int(kmax)

        # getting the last four statistic points -> THESE DON'T HAVE A CLASS NAME SO USE find_next
        kills_cell = kmax_cell.find_next('td')      # cell containing total kills
        total_kills = int(kills_cell.text)               # total kills of a player
        death_cell = kills_cell.find_next('td')     # cell containing total deaths
        total_deaths = int(death_cell.text)              # total deaths of a player
        assists_cell = death_cell.find_next('td')   # cell containing assists
        assists = int(assists_cell.text)                 # total assists of a player
        fk_cell = assists_cell.find_next('td')      # cell containing first kills
        fk = int(fk_cell.text)                           # total first kills of a player
        fd_cell = fk_cell.find_next('td')           # cell containing total first deaths
        fd = int(fd_cell.text)                           # total first deaths of a player

        # adding every variable into the dictionary
        player_dict["players"].append(
            {
            "Name": name,
            "Team": team_name,
            "Rounds": rounds_played,
            "Rating": rating,
            "ACS": acs,
            "Kill/Death": kd,
            "KAST": kast,
            "Avg Damage PR": adr,
            "Kills PR": kpr,
            "Assists PR": apr,
            "FKPR": fkpr,
            "FDPR": fdpr,
            "Headshot%": hs,
            "Clutch%": cl,
            "KMAX": kmax,
            "Kills": total_kills,
            "Deaths": total_deaths,
            "Assists": assists,
            "First Kills": fk,
            "First Deaths": fd
            }
        )



    return player_dict

# # DEBUGGING
# player_dict = scrape_players()
# for i in player_dict["players"]:
#         print(f"{i}")



