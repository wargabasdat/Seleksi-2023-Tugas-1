import requests
import json
from bs4 import BeautifulSoup
import VLR_scraper as vlr

player_dict = vlr.scrape_players()

with open('players.json', 'w') as f:
    json.dump(player_dict, f, indent=2)