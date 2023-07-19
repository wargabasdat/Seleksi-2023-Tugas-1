import mariadb
import dotenv
import os
import sys
import json
import tableCreator

line = '=' * 50


def getConn() -> tuple[mariadb.Cursor, mariadb.Connection]:
    """
    Connecting to MariaDB Platform

    Returns
    -------
    cur, conn : tuple[mariadb.Cursor, mariadb.Connection]
        tuple of cursor and connection object
    """
    dotenv.load_dotenv()
    try:
        print("Connecting to MariaDB Platform...")
        conn = mariadb.connect(
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASS'),
            host=os.getenv('DB_HOST'),
            port=int(os.getenv('DB_PORT')),
            database=os.getenv('DB_NAME')
        )
        print("Connected to MariaDB Platform")
        print(line)

    except mariadb.Error as e:
        print(f"Error connecting to MariaDB Platform: {e}")
        sys.exit(1)

    # Get Cursor
    cur = conn.cursor()
    return cur, conn


def insertTeam(cur: mariadb.Cursor, conn: mariadb.Connection, arrTeam: list):
    """
    Inserting Team Data to Database

    Parameters
    ----------
    cur : mariadb.Cursor
        cursor object
    conn : mariadb.Connection
        connection object
    arrTeam : list of dict
        list of team data
    """
    print('Inserting team data...')

    # iterate through team data
    for team in arrTeam:
        try:
            cur.execute(
                """
                INSERT INTO team (teamID, teamName, homeBase) 
                VALUES (?, ?, ?)
                """, 
                (team['teamID'], team['teamName'], team['homeBase'])
            )
        except mariadb.Error as e:
            print(f"Error inserting team {team['teamName']} data: {e}")
            sys.exit(1)
        conn.commit()

    print('Team data successfully added!')
    print(line)


def insertPosition(cur: mariadb.Cursor, conn: mariadb.Connection, arrPos: list):
    """
    Inserting Position Data to Database

    Parameters
    ----------
    cur : mariadb.Cursor
        cursor object
    conn mariadb.Connection
        connection object
    arrPos : list of dict
        list of position data
    """
    print('Inserting position data...')

    # iterate through position data
    for pos in arrPos:
        try:
            cur.execute(
                """
                INSERT INTO position (posID, posName) 
                VALUES (?, ?)
                """, 
                (pos['posAbbr'], pos['posName'])
            )
        except mariadb.Error as e:
            print(f"Error inserting position {pos['posName']} data: {e}")
            sys.exit(1)
        conn.commit()
        
    print('Position data successfully added!')
    print(line)


def insertPlayer(cur: mariadb.Cursor, conn: mariadb.Connection, arrPlayer: list):
    """
    Inserting Player Data to Database
    
    Parameters
    ----------
    cur : mariadb.Cursor
        cursor object
    conn : mariadb.Connection
        connection object
    arrPlayer : list of dict
        list of player data
    """
    print('Inserting player data...')

    # iterate through player data
    for player in arrPlayer:
        try:
            cur.execute(
                """
                INSERT INTO player (playerID, playerName, heightFeet, heightInches, overallRating, threePtRating, dunkRating, teamID) 
                VALUES (UUID(), ?, ?, ?, ?, ?, ?, ?)
                """, 
                (player['name'], player['heightFeet'], player['heightInches'], player['overall'], player['three'], player['dunk'], player['teams'])
            )
        except mariadb.Error as e:
            print(f"Error inserting player {player['name']} data: {e}")
            sys.exit(1)
        conn.commit()

    print('Player data successfully added!')
    print(line)


def insertPlayerPosition(cur: mariadb.Cursor, conn: mariadb.Connection, arrPlayer: list):
    """
    Inserting Player Position Data to Database

    Parameters
    ----------
    cur : mariadb.Cursor
        cursor object
    conn : mariadb.Connection
        connection object
    arrPlayer : list of dict
        list of players data
    """
    print('Inserting player position data...')

    # iterate through player data
    for player in arrPlayer:
        # iterate through each player's position
        for pos in player['position']:
            try:
                cur.execute(
                    """
                    INSERT INTO playerposition (playerID, posID) 
                    VALUES ((SELECT playerID FROM player WHERE playerName = ?), ?)
                    """, 
                    (player['name'], pos)
                )
            except mariadb.Error as e:
                print(f"Error inserting player position {player['name']} data: {e}")
                sys.exit(1)
            conn.commit()
            
    print('Player position data successfully added!')
    print(line)


def decodeJson() -> tuple[list, list, list]:
    """
    Decoding JSON file
    
    Returns
    -------
    players, teams, positions : tuple[list of dict, list of dict, list of dict])
        tuple of players, teams, and positions data from JSON file
    """
    with open('Data Scraping/data/database.json', 'r') as f:
        data = json.load(f)

    return data['players'], data['teams'], data['positions']


def main():
    # get connection
    cur, conn = getConn()

    # create table
    tableCreator.createTeam(cur, conn)
    tableCreator.createPosition(cur, conn)
    tableCreator.createPlayer(cur, conn)
    tableCreator.createPlayerPosition(cur, conn)

    # print data
    players, teams, positions = decodeJson()

    # insert data
    insertTeam(cur, conn, teams)
    insertPosition(cur, conn, positions)
    insertPlayer(cur, conn, players)
    insertPlayerPosition(cur, conn, players)

    # close connection
    conn.close()


if __name__ == "__main__":
    main()
    
