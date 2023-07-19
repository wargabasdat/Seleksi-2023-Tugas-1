import os
from pathlib import Path
from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from web_crawler import crawl_game
from web_scraper import *
from typing import List, Dict
import json


def dump_to_file(object_list: List, filename: str):
    # Serializing json
    dict_list = [vars(obj) for obj in object_list]
    json_object = json.dumps({filename: dict_list}, indent=2)

    # Get the base directory path
    base_path = os.path.dirname(os.path.abspath(__file__))

    # Construct the file path in the adjacent directory
    file_path = os.path.join(base_path, "..", "data", filename + ".json")

    # Writing to sample.json
    with open(file_path, "w") as outfile:
        outfile.write(json_object)


if __name__ == "__main__":
    options = webdriver.ChromeOptions()

    # options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1920x1080")
    options.add_argument("--disable-extensions")

    driver = webdriver.Chrome(
        service=Service(ChromeDriverManager().install()), options=options
    )

    url = "https://www.speedrun.com/hl2"

    # Object lists
    game_list: List[Game] = []
    level_list: List[Level] = []
    leaderboard_list: List[Leaderboard] = []
    record_list: List[Record] = []
    comment_list: List[Comment] = []
    record_verifier_list: List[RecordVerifier] = []
    series_game_list: List[SeriesGame] = []
    series_list: List[Series] = []
    series_moderator_list: List[SeriesModerator] = []
    game_moderator_list: List[GameModerator] = []
    user_dict: Dict[str, User] = {}

    crawl_game(
        driver=driver,
        game_url=url,
        game_list=game_list,
        level_list=level_list,
        leaderboard_list=leaderboard_list,
        record_list=record_list,
        comment_list=comment_list,
        record_verifier_list=record_verifier_list,
        series_game_list=series_game_list,
        series_list=series_list,
        series_moderator_list=series_moderator_list,
        game_moderator_list=game_moderator_list,
        user_dict=user_dict,
    )

    user_list = [value for value in user_dict.values()]

    # dump_to_file(game_list, "games")
    # dump_to_file(level_list, "levels")
    # dump_to_file(leaderboard_list, "leaderboards")
    # dump_to_file(record_list, "records")
    # dump_to_file(comment_list, "comments")
    # dump_to_file(record_verifier_list, "record_verifiers")
    # dump_to_file(series_game_list, "series_games")
    # dump_to_file(series_list, "series")
    # dump_to_file(series_moderator_list, "series_moderators")
    # dump_to_file(game_moderator_list, "game_moderators")
    # dump_to_file(user_list, "users")

    driver.quit()
