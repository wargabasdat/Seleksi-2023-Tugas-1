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

def create_single_tables(table_name):
    """Function to create single tables statistics"""
    query = f'''
        CREATE TABLE IF NOT EXISTS {table_name}(
                
        )INHERITS(singlestatistics)
    '''
    cur.execute(query)

def create_double_tables(table_name):
    """Function to create double tables statistics"""
    query = f'''
        CREATE TABLE IF NOT EXISTS {table_name}(
        
        )INHERITS(doublestatistics)
    '''
    cur.execute(query)

def create_tournament():
    """Function to create tournament table"""
    query = '''
        CREATE TABLE IF NOT EXISTS tournament(
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL,
            country TEXT NOT NULL,
            series INT NOT NULL
        )
    '''
    cur.execute(query)

def create_participant():
    """Function to create participant table"""
    query ='''
        CREATE TABLE IF NOT EXISTS tournamentparticipants(
            id SERIAL PRIMARY KEY,
            playerId INT NOT NULL REFERENCES players(id),
            tournamentId INT NOT NULL REFERENCES tournament(id)
        )
    '''
    cur.execute(query)

def main():
    """ Main function to create all tables needed """
    create_players()
    create_single_statistics()
    create_single_tables("mensinglestatistics")
    create_single_tables("womensinglestatistics")
    create_double_statistics()
    create_double_tables("womendoublestatistics")
    create_double_tables("mendoublestatistics")
    create_double_tables("mixeddoublestatistics")
    create_tournament()
    create_participant()

main()
conn.close()
