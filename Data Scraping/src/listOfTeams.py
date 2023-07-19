# All NBA teams and abbreviations
teams = [
    "atlanta-hawks",
    "boston-celtics",
    "brooklyn-nets",
    "charlotte-hornets",
    "chicago-bulls",
    "cleveland-cavaliers",
    "dallas-mavericks",
    "denver-nuggets",
    "detroit-pistons",
    "golden-state-warriors",
    "houston-rockets",
    "indiana-pacers",
    "los-angeles-clippers",
    "los-angeles-lakers",
    "memphis-grizzlies",
    "miami-heat",
    "milwaukee-bucks",
    "minnesota-timberwolves",
    "new-orleans-pelicans",
    "new-york-knicks",
    "oklahoma-city-thunder",
    "orlando-magic",
    "philadelphia-76ers",
    "phoenix-suns",
    "portland-trail-blazers",
    "sacramento-kings",
    "san-antonio-spurs",
    "toronto-raptors",
    "utah-jazz",
    "washington-wizards"
]

teams_Abbr = [
    "ATL",
    "BOS",
    "BKN",
    "CHA",
    "CHI",
    "CLE",
    "DAL",
    "DEN",
    "DET",
    "GSW",
    "HOU",
    "IND",
    "LAC",
    "LAL",
    "MEM",
    "MIA",
    "MIL",
    "MIN",
    "NOP",
    "NYK",
    "OKC",
    "ORL",
    "PHI",
    "PHX",
    "POR",
    "SAC",
    "SAS",
    "TOR",
    "UTA",
    "WAS"
]

def storingTeams() -> list:
    """
    Storing teams from teams and teams_Abbr in a list

    Returns
    -------
    arrTeam : list
        list of teams in form of dict
    """
    print('Storing teams...')
    arrTeam = []

    # iterate through teams
    for i in range(len(teams)):
        teamName = teams[i].replace('-', ' ').title()
        homeBase = teamName.split(' ')

        # finding homeBase with some special cases for Portland and Golden State
        if len(homeBase) == 3:
            if homeBase[0] == 'Portland':
                homeBase = homeBase[0]
            elif homeBase[0] == 'Golden':
                homeBase = 'San Francisco'
            else:
                homeBase = homeBase[0] + ' ' + homeBase[1]
        else:
            homeBase = homeBase[0]

        # adding team to array
        team = dict(teamID=teams_Abbr[i], teamName=teamName, homeBase=homeBase)
        arrTeam.append(team)

    return arrTeam