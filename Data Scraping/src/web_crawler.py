from selenium.webdriver import Chrome
from models import *
from web_scraper import *
from typing import List, Dict


def crawl_leaderboard(
    driver: Chrome,
    game_id: str,
    level_id: str,
    category_link: str,
    leaderboard_list: List[Leaderboard],
    record_list: List[Record],
    record_verifier_list: List[RecordVerifier],
    user_dict: Dict[str, User],
    comment_list: List[Comment],
):
    driver.get(url=category_link)
    level_leaderboard_list = scrape_leaderboard(driver, game_id, level_id)
    leaderboard_list.extend(level_leaderboard_list)

    for idx, leaderboard in enumerate(level_leaderboard_list):
        if idx > 0:
            leaderboard_url = (
                BASE_URL + "/" + game_id + "?x=" + leaderboard.leaderboard_id
            )
            driver.get(url=leaderboard_url)

        (
            leaderboard_record_list,
            leaderboard_comment_list,
            leaderboard_rv_list,
            leaderboard_user_list,
        ) = scrape_records(driver, game_id, level_id, leaderboard.leaderboard_id)

        record_list.extend(leaderboard_record_list)
        record_verifier_list.extend(leaderboard_rv_list)
        comment_list.extend(leaderboard_comment_list)
        crawl_user_ids(driver, leaderboard_user_list, user_dict)


def crawl_level(
    driver: Chrome,
    game_id: str,
    level_url: str,
    is_level: bool,
    level_list: List[Level],
    leaderboard_list: List[Leaderboard],
    record_list: List[Record],
    record_verifier_list: List[RecordVerifier],
    user_dict: Dict[str, User],
    comment_list: List[Comment],
):
    if is_level:
        driver.get(BASE_URL + level_url)
        level_id = level_url.split("=")[-1].split("-")[0]
        level, category_links = scrape_level(driver, game_id, level_id)
    else:
        level_id = "full_game"
        driver.get(level_url)
        level, category_links = scrape_full_game(driver, game_id)

    level_list.append(level)

    for category_link in category_links:
        crawl_leaderboard(
            driver,
            game_id,
            level_id,
            BASE_URL + category_link,
            leaderboard_list,
            record_list,
            record_verifier_list,
            user_dict,
            comment_list,
        )


def crawl_user_ids(driver: Chrome, user_list: List[str], user_dict: Dict[str, User]):
    for user_id in user_list:
        if user_id in user_dict:
            continue

        driver.get(url=BASE_URL + "/user/" + user_id)
        user_dict[user_id] = scrape_user(driver)


def crawl_series(
    driver: Chrome,
    series_url: str,
    series_list: List[Series],
    series_moderator_list: List[SeriesModerator],
    user_dict: Dict[str, User],
) -> None:
    driver.get(url=series_url)
    series, mod_ids = scrape_series(driver)
    series_list.append(series)

    # Crawl moderators and add to dict if not yet crawled
    crawl_user_ids(driver, mod_ids, user_dict)

    # Add series_moderator relation
    for mod_id in mod_ids:
        series_moderator = SeriesModerator(series_id=series.series_id, user_id=mod_id)
        series_moderator_list.append(series_moderator)


def crawl_game(
    driver: Chrome,
    game_url: str,
    game_list: List[Game],
    level_list: List[Level],
    leaderboard_list: List[Leaderboard],
    record_list: List[Record],
    comment_list: List[Comment],
    record_verifier_list: List[RecordVerifier],
    series_game_list: List[SeriesGame],
    series_list: List[Series],
    series_moderator_list: List[SeriesModerator],
    game_moderator_list: List[GameModerator],
    user_dict: Dict[str, User],
):
    driver.get(url=game_url)

    # Scrape game
    game, series_id, mod_ids, level_links = scrape_game(driver)
    series_url = BASE_URL + "/series/" + series_id
    game_list.append(game)

    # Crawl moderators and add to dict if not yet crawled
    crawl_user_ids(driver, mod_ids, user_dict)

    # Add game_moderator relation
    for mod_id in mod_ids:
        game_moderator = GameModerator(game_id=game.game_id, user_id=mod_id)
        game_moderator_list.append(game_moderator)

    # Scrape series
    crawl_series(
        driver=driver,
        series_url=series_url,
        series_list=series_list,
        series_moderator_list=series_moderator_list,
        user_dict=user_dict,
    )

    # Add series_game relation
    series_game = SeriesGame(game.game_id, series_list[-1].series_id)
    series_game_list.append(series_game)

    # Scrape full game level
    crawl_level(
        driver=driver,
        game_id=game.game_id,
        level_url=game_url,
        is_level=False,
        level_list=level_list,
        leaderboard_list=leaderboard_list,
        record_list=record_list,
        record_verifier_list=record_verifier_list,
        user_dict=user_dict,
        comment_list=comment_list,
    )

    # Scrape levels
    for idx, level_url in enumerate(level_links):
        if idx == 3:
            break

        crawl_level(
            driver=driver,
            game_id=game.game_id,
            level_url=level_url,
            is_level=True,
            level_list=level_list,
            leaderboard_list=leaderboard_list,
            record_list=record_list,
            record_verifier_list=record_verifier_list,
            user_dict=user_dict,
            comment_list=comment_list,
        )
