"""Command for creating database and table"""
import psycopg2

conn = psycopg2.connect(
    database="badminton",
    user="postgres",
    password="",
    host="localhost",
    port=5432,
)

conn.autocommit = True
cur = conn.cursor()

def create_players():
    """Function to create mixed_double_players table"""
    cur.execute('''
        CREATE TABLE players (
            id SERIAL PRIMARY KEY,
            firstName TEXT NOT NULL,
            lastName TEXT NOT NULL,
            country TEXT NOT NULL,
            gender TEXT NOT NULL
        )
    ''')

def create_single_statistics():
    '''Procedure to create single men table'''
    cur.execute(
        '''
            CREATE TABLE IF NOT EXISTS singleStatistics(
                id SERIAL PRIMARY KEY,
                points INT NOT NULL,
                rank INT NOT NULL,
                playerId INT NOT NULL REFERENCES players(id),
                type TEXT NOT NULL
            ) 
        '''
    )

def create_double_statistics():
    """Function to create single_women_players table"""
    cur.execute(
        '''
            CREATE TABLE IF NOT EXISTS doubleStatistics(
                id SERIAL PRIMARY KEY,
                points INT NOT NULL,
                rank INT NOT NULL,
                firstPlayerId INT NOT NULL REFERENCES players(id),
                secondPlayerId INT NOT NULL  REFERENCES players(id),
                type TEXT NOT NULL
            ) 
        '''
    )

create_single_statistics()
create_double_statistics()
conn.close()
