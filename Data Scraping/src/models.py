class Comment:
    def __init__(self, comment_id, record_id, commenter_id, content) -> None:
        self.comment_id = comment_id
        self.record_id = record_id
        self.commenter_id = commenter_id
        self.content = content


class Game:
    def __init__(self, game_id, game_name, release_year, platform) -> None:
        self.game_id = game_id
        self.game_name = game_name
        self.release_year = release_year
        self.platform = platform


class GameModerator:
    def __init__(self, game_id, user_id) -> None:
        self.game_id = game_id
        self.user_id = user_id


class Leaderboard:
    def __init__(
        self, game_id, level_id, leaderboard_id, category_name, subcategory_name
    ) -> None:
        self.game_id = game_id
        self.level_id = level_id
        self.leaderboard_id = leaderboard_id
        self.category_name = category_name
        self.subcategory_name = subcategory_name


class Level:
    def __init__(self, game_id, level_id, level_name) -> None:
        self.game_id = game_id
        self.level_id = level_id
        self.level_name = level_name


class Record:
    def __init__(
        self,
        record_id: str,
        submitter_id,
        leaderboard_id,
        rank,
        platform,
        lrt_time,
        rta_time,
        build,
    ) -> None:
        self.record_id = record_id
        self.submitter_id = submitter_id
        self.leaderboard_id = leaderboard_id
        self.rank = rank
        self.platform = platform
        self.lrt_time = lrt_time
        self.rta_time = rta_time
        self.build = build


class RecordVerifier:
    def __init__(self, record_id, user_id) -> None:
        self.record_id = record_id
        self.user_id = user_id


class Series:
    def __init__(self, series_id, series_name) -> None:
        self.series_id = series_id
        self.series_name = series_name


class SeriesGame:
    def __init__(self, game_id, series_id) -> None:
        self.game_id = game_id
        self.series_id = series_id


class SeriesModerator:
    def __init__(self, series_id, user_id) -> None:
        self.series_id = series_id
        self.user_id = user_id


class User:
    def __init__(self, user_id, pronouns, country) -> None:
        self.user_id = user_id
        self.pronouns = pronouns
        self.country = country
