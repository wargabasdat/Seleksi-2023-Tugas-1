import mariadb
import sys

line = '=' * 50

def createTeam(cur: mariadb.Cursor, conn: mariadb.Connection):
    """
    Creating Team Table
    """
    print('Creating team table...')

    # create table
    try:
        cur.execute(
            """
            CREATE TABLE IF NOT EXISTS team (
                teamID CHAR(3),
                teamName VARCHAR(64) NOT NULL,
                homeBase VARCHAR(64) NOT NULL,

                PRIMARY KEY (teamID)
            );
            """
        )
    except mariadb.Error as e:
        print(f"Error creating team table: {e}")
        sys.exit(1)
    conn.commit()

    print('Team table successfully created!')
    print(line)


def createPosition(cur: mariadb.Cursor, conn: mariadb.Connection):
    """
    Creating Position Table
    """
    print('Creating position table...')

    # create table
    try:
        cur.execute(
            """
            CREATE TABLE IF NOT EXISTS position (
                posID ENUM('PG', 'SG', 'SF', 'PF', 'C'),
                posName ENUM('Point Guard', 'Shooting Guard', 'Small Forward', 'Power Forward', 'Center') NOT NULL,

                PRIMARY KEY (posID)
            )
            """
        )
    except mariadb.Error as e:
        print(f"Error creating position table: {e}")
        sys.exit(1)
    conn.commit()

    print('Position table successfully created!')
    print(line)


def createPlayer(cur: mariadb.Cursor, conn: mariadb.Connection):
    """
    Creating Player Table
    """
    print('Creating player table...')

    # create table
    try:
        cur.execute(
            """
            CREATE TABLE IF NOT EXISTS player (
                playerID UUID,
                playerName VARCHAR(64) NOT NULL,
                heightFeet TINYINT NOT NULL,
                heightInches TINYINT NOT NULL,
                overallRating TINYINT NOT NULL,
                threePtRating TINYINT NOT NULL,
                dunkRating TINYINT NOT NULL,
                teamID CHAR(3) NOT NULL,

                PRIMARY KEY (playerID),
                FOREIGN KEY (teamID) REFERENCES team(teamID)
            )
            """
        )
    except mariadb.Error as e:
        print(f"Error creating player table: {e}")
        sys.exit(1)
    conn.commit()

    print('Player table successfully created!')
    print(line)


def createPlayerPosition(cur: mariadb.Cursor, conn: mariadb.Connection):
    """
    Creating Player Position Table
    """
    print('Creating player position table...')

    # create table
    try:
        cur.execute(
            """
            CREATE TABLE IF NOT EXISTS playerposition (
                playerID UUID,
                posID ENUM('PG', 'SG', 'SF', 'PF', 'C'),

                PRIMARY KEY (playerID, posID),
                FOREIGN KEY (playerID) REFERENCES player(playerID),
                FOREIGN KEY (posID) REFERENCES `position`(posID)
            )
            """
        )
    except mariadb.Error as e:
        print(f"Error creating player position table: {e}")
        sys.exit(1)
    conn.commit()

    print('Player position table successfully created!')
    print(line)