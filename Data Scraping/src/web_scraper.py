from bs4 import BeautifulSoup
from selenium.webdriver import Chrome
from models import *
from typing import Tuple, List
from uuid import uuid4

BASE_URL = "https://www.speedrun.com"


def scrape_records(
    driver: Chrome, game_id: str, level_id: str, leaderboard_id: str
) -> Tuple[List[Record], List[RecordVerifier], List[str]]:
    leaderboard_soup = BeautifulSoup(driver.page_source, "html.parser")

    record_list: List[Record] = []
    comment_list: List[Comment] = []
    record_verifier_list: List[RecordVerifier] = []
    user_id_list: List[str] = []

    # Get row elements
    row_list = leaderboard_soup.find_all("table")[0].select("tbody tr")
    for idx, row in enumerate(row_list):
        if idx == 4:
            break

        # Get record id
        record_id = row.find_all("a")[0].get("href").split("?")[0].split("/")[-1]

        table_data_list = row.find_all("td")

        submitter_id = table_data_list[1].find_all("a")[0].get("href").split("/")[-1]
        user_id_list.append(submitter_id)
        rank = idx + 1

        lrt_time = table_data_list[3].get_text()
        rta_time = table_data_list[4].get_text()
        build = table_data_list[6].get_text()

        driver.get(BASE_URL + "/" + game_id + "/runs/" + record_id)
        record_soup = BeautifulSoup(driver.page_source, "html.parser")

        platform_container = record_soup.find_all("span", string="Platform")[
            0
        ].parent.next_sibling
        platform = platform_container.get_text()

        verify_container = record_soup.find_all("span", string="Submitted")[
            0
        ].parent.next_sibling
        verifier_id = (
            verify_container.find("a").get("href").split("?")[0].split("/")[-1]
        )
        user_id_list.append(verifier_id)

        record_list.append(
            Record(
                record_id,
                submitter_id,
                leaderboard_id,
                rank,
                platform,
                lrt_time,
                rta_time,
                build,
            )
        )
        record_verifier_list.append(RecordVerifier(record_id, verifier_id))

        want_to_join_text = record_soup.find_all(
            "p", string="Want to join the conversation?"
        )

        if len(want_to_join_text) > 0:
            comment_container: BeautifulSoup = want_to_join_text[0].parent.parent.parent

            if len(comment_container.contents) > 2:
                comment_elmt_list = comment_container.contents[1:-1]

                for comment_elmt in comment_elmt_list:
                    comment_id = str(uuid4())
                    commenter_id = comment_elmt.find("a").get("href").split("/")[-1]
                    user_id_list.append(commenter_id)
                    content = comment_elmt.find_all("div", class_="x-markdown")[
                        0
                    ].get_text()

                    comment_list.append(
                        Comment(comment_id, record_id, commenter_id, content)
                    )

    return record_list, comment_list, record_verifier_list, user_id_list


def scrape_leaderboard(
    driver: Chrome, game_id: str, level_id: str
) -> List[Leaderboard]:
    soup = BeautifulSoup(driver.page_source, "html.parser")
    leaderboard_list = []

    # Get category name
    category_name = soup.select("button.bg-primary-600")[0].get_text()

    # Iterate through subcategories if exists
    if level_id == "full_game":
        subcategory_radio_group = soup.find_all("div", {"role": "radiogroup"})[0]
        for subcategory_link in subcategory_radio_group.find_all("a"):
            leaderboard_id = subcategory_link.get("href").split("=")[-1]
            leaderboard_list.append(
                Leaderboard(
                    game_id,
                    level_id,
                    leaderboard_id,
                    category_name,
                    subcategory_link.get_text(),
                )
            )
    else:
        leaderboard_id = driver.current_url.split("=")[-1]
        leaderboard_list.append(
            Leaderboard(
                game_id,
                level_id,
                leaderboard_id,
                category_name,
                None,
            )
        )

    return leaderboard_list


def scrape_level(driver: Chrome, game_id: str, level_id: str) -> Tuple[Level, str]:
    soup = BeautifulSoup(driver.page_source, "html.parser")

    # Get level_name from page
    level_leaderboard_elmt: BeautifulSoup = soup.find_all("div", string="Level")[0]
    level_name = level_leaderboard_elmt.next_sibling.get_text()

    # Get categories
    category_container_elmt = soup.select("button.bg-primary-600")[0].parent.parent
    category_links = [
        category_link.get("href")
        for category_link in category_container_elmt.find_all("a")
    ]

    return Level(game_id, level_id, level_name), category_links


def scrape_full_game(driver: Chrome, game_id: str) -> Level:
    soup = BeautifulSoup(driver.page_source, "html.parser")

    # Get categories
    category_container_elmt = soup.select("button.bg-primary-600")[0].parent.parent
    category_links = [
        category_link.get("href")
        for category_link in category_container_elmt.find_all("a")
    ]

    return Level(game_id, "full_game", "Full game"), category_links


def scrape_user(driver: Chrome) -> User:
    soup = BeautifulSoup(driver.page_source, features="html.parser")

    # Get user_id from url
    url = driver.current_url
    user_id = url.split("/")[-1]

    # Get details element
    details_container = soup.find_all("span", string=user_id)[
        0
    ].parent.parent.next_sibling
    pronouns = None
    country = None

    if len(details_container) > 0:
        # Get pronouns
        pronouns_elmt = details_container.find_all("div")[0]
        if (
            pronouns_elmt.has_attr("class")
            and "inline-flex" not in pronouns_elmt["class"]
        ):
            pronouns = pronouns_elmt.get_text()

        # Get country
        country_elmt = details_container.find_all("div")[-1]
        if pronouns == None or len(details_container.find_all("div")) > 1:
            country = country_elmt.get_text()

    return User(user_id, pronouns, country)


def scrape_game(driver: Chrome) -> Tuple[Game, str, List[str]]:
    soup = BeautifulSoup(driver.page_source, features="html.parser")

    # Get game_id from url
    url = driver.current_url
    base_url = url.split("?", 1)[0]
    game_id = base_url.split("/")[-1]

    # Get game name from page
    widget_title_elmt: BeautifulSoup = soup.find("a", {"class": "x-link"}).parent
    game_name = widget_title_elmt.find("a").get_text()
    widget_title_text = widget_title_elmt.get_text()
    release_year = widget_title_text.split("(")[1][:-1]
    # Get 2004 from HALF-LIFE 2 (2004)

    # Get game platform
    game_platform_elmt: BeautifulSoup = soup.select("a.x-tag-badge")[0]
    platform = game_platform_elmt.get_text()

    # Get game series id
    game_series_elmt: BeautifulSoup = soup.select("a.x-focus-outline-offset")[0]
    if "series" in game_series_elmt.get("href").split("/"):
        game_series_id = game_series_elmt.get("href").split("/")[-1]
    else:
        game_series_id = None

    # Get list of moderators
    mod_widget_body: BeautifulSoup = soup.find("div", string="Moderators").parent.parent
    mod_ids = [
        mod_link.get("href").split("/")[-1]
        for mod_link in mod_widget_body.find_all("a")
    ]

    # Get list of levels
    driver.get(base_url + "/levels")
    soup = BeautifulSoup(driver.page_source, "html.parser")
    level_rows: BeautifulSoup = soup.select("table.x-table tbody tr th")
    level_links = []
    for level_row in level_rows:
        level_links.append(level_row.find("a").get("href"))

    return (
        Game(game_id, game_name, release_year, platform),
        game_series_id,
        mod_ids,
        level_links,
    )


def scrape_series(driver: Chrome) -> Tuple[Series, List[str], List[str]]:
    soup = BeautifulSoup(driver.page_source, features="html.parser")

    # Get series_id from url
    url = driver.current_url
    series_id = url.split("/")[-1]

    # Get series name from page
    series_name = soup.select("a.x-link")[0].get_text()

    # Get list of moderators
    mod_widget_body: BeautifulSoup = soup.find("div", string="Moderators").parent.parent
    mod_ids = [
        mod_link.get("href").split("/")[-1]
        for mod_link in mod_widget_body.find_all("a")
    ]

    return Series(series_id, series_name), mod_ids
