import json
import scrap

player = scrap.player()
tournament = scrap.tournament()

with open('../data/player.json', 'w+', encoding='utf-8') as json_file:
    json.dump(player, json_file, indent=4, ensure_ascii=False)

print('Player data saved to player.json\n')

with open('../data/tournament.json', 'w+', encoding='utf-8') as json_file:
    json.dump(tournament, json_file, indent=4, ensure_ascii=False)

print('Tournament data saved to tournament.json\n')

print('All data saved successfully!')