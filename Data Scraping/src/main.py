import json
import VLR_scraper as vlr

# calls the function from the VLR_scraper to get data regarding the players
player_dict = vlr.scrape_players()

# opens a file to keep player data in
with open('players.json', 'w') as f:
    # dumps the result of the player data into a json file, indent is used to prettify the file
    json.dump(player_dict, f, indent=2)

# calls the function from the VLR_scraper to get data regarding map and agent pick rates
map_agent_dict = vlr.map_agent_scraper()

# opens a file to keep map and agent pick rate data in
with open('map_agents.json', 'w') as f:
    # dumps the result of the map-agent data into a json file, indent is used to prettify the file
    json.dump(map_agent_dict, f, indent=2)