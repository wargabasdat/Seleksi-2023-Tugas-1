import sys
import json
from urllib import request
from bs4 import BeautifulSoup

from listOfTeams import teams, teams_Abbr, storingTeams
from listOfPositions import storingPositions


# base url and header for request
base_url = "https://www.2kratings.com/teams/"
hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64)'}

# initiate array for players
arrPlayer = []


def reqEntries(team: str) -> list:
    """
    Requesting html from url and parsing it to find entries
    
    Parameters
    ----------
    team : str
        team name for url
        
    Returns
    -------
    entries : list
        list of html entries
    """
    # opening url
    try:
        req = request.Request(base_url + team, headers=hdr)
        text = request.urlopen(req).read().decode('utf8')
    except Exception as e:
        print(f"Error opening {team} url: {e}")
        sys.exit(1)

    # parsing html
    soup = BeautifulSoup(text, 'html.parser')

    # searching for entries
    entries = soup.find('table', 'table table-striped table-sm table-hover mb-0').find_all('tr')
    entries.remove(entries[0])
    return entries


def findPlayers(entries: list, team_abbr: str):
    """
    Finding players from entries. 

    Parameters
    ----------
    entries : list
        list of html entries
    team_abbr : str
        team abbreviation
    """
    for e in entries:
        title = e.findChildren('td')
        if title != [] and len(title) > 1:
            # 'subtext' will be used to find position and height
            subtext = title[1].find('span', 'entry-subtext-font crop-subtext-font').get_text().replace('\t', '').split('|')

            # cleaning 'subtext'
            for i in range(len(subtext)):
                subtext[i] = subtext[i].strip()

            pos = subtext[0].split(' / ')
            height = subtext[1].replace("\"", "").split("'")
            heightFeet = int(height[0])
            heightInch = int(height[1])

            # finding name, overall, three point rating, and dunk rating
            name = title[1].find('span', 'entry-font').get_text().strip()
            ovr = title[2].get_text().strip()
            three = title[3].get_text().strip()
            dunk = title[4].get_text().strip()
            
            # adding player to array
            player = dict(name=name, teams=team_abbr, position=pos, heightFeet=heightFeet, heightInches=heightInch, overall=ovr, three=three, dunk=dunk)
            arrPlayer.append(player)


def writeToFile():
    """
    Writing data to json file
    """
    # create json object
    data = dict(players=arrPlayer, teams=storingTeams(), positions=storingPositions())
    
    # convert to json
    json_obj = json.dumps(data, indent=4)

    # save to json file
    with open('Data Scraping/data/database.json', 'w') as outfile:
        outfile.write(json_obj)


def main():
    # scraping data from each team
    for i in range(len(teams)):
        print(f"Scraping {teams[i].replace('-', ' ').title()}...")
        entries = reqEntries(teams[i])
        findPlayers(entries, teams_Abbr[i])
        print("=" * 50)

    writeToFile()


if __name__ == "__main__":
    main()


