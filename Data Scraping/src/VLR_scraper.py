# Written by Kean Nafis Santang - 18221148
# Use this script to get data from VLR.gg
# This script is made to gather data from the VLR page that shows information regarding Valorant's VCT Masters Tokyo 2023

from bs4 import BeautifulSoup
import requests

# -------------------------------------------------------------------------------------------------
# FUNCTION TO RETURN PLAYER DATA FROM THE 'STATS' TAB
def scrape_players():
    # initializing a dictionary to contain all the player data
    player_dict = {
        "players": [

        ]
    }
    # URL for the players statistics page
    url_players = 'https://www.vlr.gg/event/stats/1494/champions-tour-2023-masters-tokyo'
    players_html = requests.get(url_players).text
    # initiate soup
    soup = BeautifulSoup(players_html, 'lxml')

    # This tab only contains one table, find_all not required to search all the tables
    # This variable contains the html text for the table that contains player statistics
    player_table = soup.find('table', class_="wf-table mod-stats mod-scroll")


    # finding the body of the table, skips the header part
    table_body = player_table.find("tbody")
    # iterating through every row inside of the table's body
    # each row represents a player and their statistics in the tournament
    table_rows = table_body.find_all("tr")
    # for loop to go through each player one by one
    for row in table_rows:
        # player_cell is the cell that contains the player name, team, and nationality in one <td> tag
        player_cell = row.find("td", class_="mod-player mod-a")
        # getting the player name
        name = player_cell.find("div", class_="text-of").text
        # getting the player's team name
        team_name= player_cell.find("div", class_="stats-player-country").text
        # end of accessing player_cell
        # --------------------------------------

        #getting the player's rounds played
        rounds_played = int(row.find("td", class_="mod-rnd").text)                         # Represents how many rounds this player has played in the tournament

        # getting all the data from sources that use the same class (in order)
        colored_squares = row.find_all("td", class_="mod-color-sq")
        # getting player variables that use the same td class
        rating = float(colored_squares[0].find("div", class_="color-sq").span.text)    # VLR Overall Rating
        acs = float(colored_squares[1].find("div", class_="color-sq").span.text)       # Player's average combat score
        kd = float(colored_squares[2].find("div", class_="color-sq").span.text)        # Player's kill/death ratio
        kast = colored_squares[3].find("div", class_="color-sq").span.text             # Player's kills, assist, kurvive, krade kercentage
        kast = kast.replace('%', '')
        kast = float(kast)/100                                                         # Turn into float value
        adr = float(colored_squares[4].find("div", class_="color-sq").span.text)       # Player's average damage per round
        kpr = float(colored_squares[5].find("div", class_="color-sq").span.text)       # Player's kill per round
        apr = float(colored_squares[6].find("div", class_="color-sq").span.text)       # Player's assists per round
        fkpr = float(colored_squares[7].find("div", class_="color-sq").span.text)      # Player's first kills per round
        fdpr = float(colored_squares[8].find("div", class_="color-sq").span.text)      # Player's first death per round
        hs = colored_squares[9].find("div", class_="color-sq").span.text                # Player's headshot percentage
        hs = hs.replace('%', '')
        hs = float(hs)/100                                                              # Turn into float value
        cl = colored_squares[10].find("div", class_="color-sq").span.text               # Player's clutch win percentage (CAN BE NULL)
        # DATA CLEANING for players who were never in a clutch scenario -> Null value
        if (cl == ''):
            cl = None                                                                   # Null value
        else:
            cl = cl.replace('%', '')
            cl = float(cl)/100                                                          # Turn into float value

        # getting the player's maximum kills in a single map
        kmax_cell = row.find("td", class_='mod-a mod-kmax')
        kmax = kmax_cell.a.contents[0]                                                 # Player's maximum kills in a single map
        # data celaning of KMAX content
        kmax = kmax.replace('\n', '')
        kmax = kmax.replace('\t', '')
        kmax = int(kmax)

        # getting the last four statistic points -> THESE DON'T HAVE A CLASS TAG SO USE find_next to iterate
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
        # Loop goes to the next player on the table

    return player_dict

# # DEBUGGING
# player_dict = scrape_players()
# for i in player_dict["players"]:
#         print(f"{i}")

# Function that returns data from the 'Agents' tab
def map_agent_scraper():
    # Initialzie a dictionary to keep data results in
    map_agents_dict = {
        "Map_Agent_Pickrates": [

        ]
    }

    url_agents = 'https://www.vlr.gg/event/agents/1494/champions-tour-2023-masters-tokyo'
    agents_html = requests.get(url_agents).text
    # initiates the soup
    soup = BeautifulSoup(agents_html, 'lxml')

    # accesses the table that contains the overall agent pick rates
    agent_table = soup.find('table', class_='wf-table mod-pr-global')
    # ignore the top row because we only need the agent statistics for each map
    all_maps = agent_table.find_all('tr', class_='pr-global-row')[1:]

    for map in all_maps:
        # Find the map name
        map_name = map.find("td", style='white-space: nowrap; padding-top: 0; padding-bottom: 0;').text
        # map name has a <span> that contains elements i don't want -> i have to remove it
        map_name_span = map.find('span', class_='map-pseudo-icon').text
        # map name without the span part
        final_map_name = map_name[2*len(map_name_span):].strip()

        # Determine the amount of times the map was played
        amt_cell = map.find('td', class_='mod-right')           # cell that contains the amount of times each map is played
        amount_played = int(amt_cell.text)                      # the value of how many times each map is played

        # Determine the attacker and defender win rate for each map
        # attacker and defender win rates are placed as a <td> right after the amount of played part
        atk_cell = amt_cell.find_next('td')                     # cell that contains the attacker win rate
        atk_win = atk_cell.text                                 # value of attacker win rate
        atk_win = atk_win.replace('\n', '')                     # CLEANUP
        atk_win = atk_win.replace('\t', '')
        atk_win = atk_win.replace('%', '')
        atk_win = float(atk_win)/100                            # cast into float
        def_cell = atk_cell.find_next('td')                     # cell that contains the defender win rate
        def_win = def_cell.text                                 # value of defender win rate
        def_win = def_win.replace('\n', '')                     # CLEANUP
        def_win = def_win.replace('\t', '')
        def_win = def_win.replace('%', '')
        def_win = float(def_win)/100                            # cast into float

        # Determine the agent pick rates of each map
        # inner function to automate accessing their pick rate
        def agent_automater(agent_cell):
            # This function automates the process of cleaning up the span text and then cast the result into a float value
            agent_pick = agent_cell.find('div', class_='color-sq').span.string
            agent_pick = agent_pick.replace('\t', '')
            agent_pick = agent_pick.replace('\n', '')
            agent_pick = agent_pick.replace('%', '')
            agent_pick = float(agent_pick)/100
            return agent_pick

        skye_cell = map.find("td", class_="mod-color-sq")                   # cell that contains Skye's pick rate
        skye_pick = agent_automater(skye_cell)                              # value of Skye's pick rate
        # After Skye, the other agents can be accesed using find_next
        killjoy_cell = skye_cell.find_next("td", class_="mod-color-sq")     # cell that contains KJ's pick rate
        killjoy_pick = agent_automater(killjoy_cell)                        # value of KJ's pick rate
        jett_cell = killjoy_cell.find_next("td", class_="mod-color-sq")     # cell that contains Jett's pick rate
        jett_pick = agent_automater(jett_cell)                              # value of Jett's pick rate
        raze_cell = jett_cell.find_next("td", class_="mod-color-sq")        # cell that contains Raze's pick rate
        raze_pick = agent_automater(raze_cell)                              # value of Raze's pick rate
        viper_cell = raze_cell.find_next("td", class_="mod-color-sq")       # cell that contains Viper's pick rate
        viper_pick = agent_automater(viper_cell)                            # value of Viper's pick rate
        omen_cell = viper_cell.find_next("td", class_="mod-color-sq")       # cell that contains Omen's pick rate
        omen_pick = agent_automater(omen_cell)                              # value of Omen's pick rate
        breach_cell = omen_cell.find_next("td", class_="mod-color-sq")      # cell that contains Breach's pick rate
        breach_pick = agent_automater(breach_cell)                          # value of Breach's pick rate
        brim_cell = breach_cell.find_next("td", class_="mod-color-sq")      # cell that contains Brimstone's pick rate
        brim_pick = agent_automater(brim_cell)                              # value of Brimstone's pick rate
        sova_cell = brim_cell.find_next("td", class_="mod-color-sq")        # cell that contains Sova's pick rate
        sova_pick = agent_automater(sova_cell)                              # value of Sova's pick rate
        kayo_cell = sova_cell.find_next("td", class_="mod-color-sq")        # cell that contains Kay/O's pick rate
        kayo_pick = agent_automater(kayo_cell)                              # value of Kay/O's pick rate
        cypher_cell = kayo_cell.find_next("td", class_="mod-color-sq")      # cell that contains Cypher's pick rate
        cypher_pick = agent_automater(cypher_cell)                          # value of Cypher's pick rate
        astra_cell = cypher_cell.find_next("td", class_="mod-color-sq")     # cell that contains Astra's pick rate
        astra_pick = agent_automater(astra_cell)                            # value of Astra's pick rate
        harbor_cell = astra_cell.find_next("td", class_="mod-color-sq")     # cell that contains Harbor's pick rate
        harbor_pick = agent_automater(harbor_cell)                          # value of Harbor's pick rate
        fade_cell = harbor_cell.find_next("td", class_="mod-color-sq")      # cell that contains Fade's pick rate
        fade_pick = agent_automater(fade_cell)                              # value of Fade's pick rate
        neon_cell = fade_cell.find_next("td", class_="mod-color-sq")        # cell that contains Neon's pick rate
        neon_pick = agent_automater(neon_cell)                              # value of Neon's pick rate
        gekko_cell = neon_cell.find_next("td", class_="mod-color-sq")       # cell that contains Gekko's pick rate
        gekko_pick = agent_automater(gekko_cell)                            # value of Gekko's pick rate
        sage_cell = gekko_cell.find_next("td", class_="mod-color-sq")       # cell that contains Sage's pick rate
        sage_pick = agent_automater(sage_cell)                              # value of Sage's pick rate
        phoenix_cell = sage_cell.find_next("td", class_="mod-color-sq")     # cell that contains Phoenix's pick rate
        phoenix_pick = agent_automater(phoenix_cell)                        # value of Phoenix's pick rate
        chamber_cell = phoenix_cell.find_next("td", class_="mod-color-sq")  # cell that contains Chamber's pick rate
        chamber_pick = agent_automater(chamber_cell)                        # value of Chamber's pick rate
        reyna_cell = chamber_cell.find_next("td", class_="mod-color-sq")    # cell that contains Reyna's pick rate
        reyna_pick = agent_automater(reyna_cell)                            # value of Reyna's pick rate
        yoru_cell = reyna_cell.find_next("td", class_="mod-color-sq")       # cell that contains Yoru's pick rate
        yoru_pick = agent_automater(yoru_cell)  # value of Gekko's pick rate



        map_agents_dict["Map_Agent_Pickrates"].append(
            {
                "Map Name": final_map_name,
                "Amount Played": amount_played,
                "ATK Winrate": atk_win,
                "DEF Winrate": def_win,
                "Skye Pick": skye_pick,
                "Killjoy Pick": killjoy_pick,
                "Jett Pick": jett_pick,
                "Raze Pick": raze_pick,
                "Viper Pick": viper_pick,
                "Omen Pick": omen_pick,
                "Breach Pick": breach_pick,
                "Brimstone Pick": brim_pick,
                "Sova Pick": sova_pick,
                "Kayo Pick": kayo_pick,
                "Cypher Pick": cypher_pick,
                "Astra Pick": astra_pick,
                "Harbor Pick": harbor_pick,
                "Fade Pick": fade_pick,
                "Neon Pick": neon_pick,
                "Gekko pick": gekko_pick,
                "Sage pick": sage_pick,
                "Phoenix pick": phoenix_pick,
                "Chamber pick": chamber_pick,
                "Reyna pick": reyna_pick,
                "Yoru pick": yoru_pick
            }
        )
        # Loop goes to next map
    return map_agents_dict



# # Debugging
# for i in map_agents_dict["Map_Agent_Pickrates"]:
#     print(i)


# FUNCTION FOR SCRAPING MATCH RESULTS
def match_scraper():
    # Initialzie a dictionary to keep data results in
    matches_dict = {
        "Matches": [

        ]
    }

    url_matches = 'https://www.vlr.gg/event/matches/1494/champions-tour-2023-masters-tokyo/?series_id=all'
    matches_html = requests.get(url_matches).text
    # initiates the soup
    soup = BeautifulSoup(matches_html, 'lxml')

    # accessing all the dates of match days
    all_dates = soup.find_all('div', class_='wf-label mod-large')
    arr_dates = []
    for date in all_dates:
        date_num = date.string.strip()[10:12]
        # Turning it into an SQL date format
        date_string = f"2023-06-{date_num}"
        arr_dates.append(date_string)

    # index used for implementing dates in the dictionary
    idx = 0
    # Boolean for detecting the matches
    found = False

    # accessing the cards that contain all matches within each day
    daily_cards = soup.find_all('div', class_='wf-card')
    for card in daily_cards:
        cur_date = arr_dates[idx]
        # The first match of every date is held in a seperate class to the other matches (idk why honestly)
        first_matches = card.find_all('a', class_='wf-module-item match-item mod-color mod-left mod-bg-after-striped_purple mod-first')
        # Scraping the data from every match
        for match in first_matches:
            # Acquiring the name of the first team in the match
            team1_cell = match.find('div', class_='text-of')
            team1_name = team1_cell.text.strip()
            # Acquiring the name of the second team in the match
            team2_cell = team1_cell.find_next('div', class_='text-of')
            team2_name = team2_cell.text.strip()
            # Transforming the team name into team code
            team_code = ""
            if (team1_name == "FNATIC"):
                team_code = "FNC"
            elif (team1_name == "LOUD"):
                team_code = "LOUD"
            elif (team1_name == "Team Liquid"):
                team_code = "TL"
            elif (team1_name == "Paper Rex"):
                team_code = "PRX"
            elif (team1_name == "Evil Geniuses"):
                team_code = "EG"
            elif (team1_name == "NRG Esports"):
                team_code = "NRG"
            elif (team1_name == "DRX"):
                team_code = "DRX"
            elif (team1_name == "EDward Gaming"):
                team_code = "EDG"
            elif (team1_name == "FUT Esports"):
                team_code = "FUT"
            elif (team1_name == "Natus Vincere"):
                team_code = "NAVI"
            elif (team1_name == "T1"):
                team_code = "T1"
            elif (team1_name == "Attacking Soul Esports"):
                team_code = "ASE"
            # Circumventing a hidden card that contains no match information
            if (team1_name != None):
                found = True
                # Finding the container for the match results
                score1_cell = match.find('div', class_='match-item-vs-team-score')
                score1 = int(score1_cell.text.strip())                              # Team 1's score
                score2_cell = score1_cell.find_next('div', class_='match-item-vs-team-score')
                score2 = int(score2_cell.text.strip())                              # Team 2's score
                # Adding all the information into the dictionary
                matches_dict["Matches"].append({
                    "Team Code": team_code,
                    "Date": cur_date,
                    "Team": team1_name,
                    "Opponent": team2_name,
                    "Team Score": score1,
                    "Opponent Score": score2,
                })
            else:
                # Index is not incremented in this instance
                found = False


        # Finding the data for the rest of the matches for the day
        other_matches = card.find_all('a', class_='wf-module-item match-item mod-color mod-left mod-bg-after-striped_purple')
        for match in other_matches:
            # Determining the name of the 1st team
            team1_cell = match.find('div', class_='text-of')
            team1_name = team1_cell.text.strip()
            # Determining the name of the 2nd team
            team2_cell = team1_cell.find_next('div', class_='text-of')
            team2_name = team2_cell.text.strip()
            # Determining the score of the 1st team
            score1_cell = match.find('div', class_='match-item-vs-team-score')
            score1 = int(score1_cell.text)
            # Determining the score of the 2nd team
            score2_cell = score1_cell.find_next('div', class_='match-item-vs-team-score')
            score2 = int(score2_cell.text)
            # Transforming the team name into team code
            team_code = ""
            if (team1_name == "FNATIC"):
                team_code = "FNC"
            elif (team1_name == "LOUD"):
                team_code = "LOUD"
            elif (team1_name == "Team Liquid"):
                team_code = "TL"
            elif (team1_name == "Paper Rex"):
                team_code = "PRX"
            elif (team1_name == "Evil Geniuses"):
                team_code = "EG"
            elif (team1_name == "NRG Esports"):
                team_code = "NRG"
            elif (team1_name == "DRX"):
                team_code = "DRX"
            elif (team1_name == "EDward Gaming"):
                team_code = "EDG"
            elif (team1_name == "FUT Esports"):
                team_code = "FUT"
            elif (team1_name == "Natus Vincere"):
                team_code = "NAVI"
            elif (team1_name == "T1"):
                team_code = "T1"
            elif (team1_name == "Attacking Soul Esports"):
                team_code = "ASE"
            # Adding all the variables into the dictionary
            matches_dict["Matches"].append({
                "Team Code": team_code,
                "Date": cur_date,
                "Team": team1_name,
                "Opponent": team2_name,
                "Team Score": score1,
                "Opponent Score": score2,
            })
        if (found):
            # If a day for a match is found, the next date is chosen for the next loop iteration
            idx += 1

    return matches_dict













