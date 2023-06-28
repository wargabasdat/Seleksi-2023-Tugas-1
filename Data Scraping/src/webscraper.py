from bs4 import BeautifulSoup
import requests
import pandas as pd
import numpy as np
import json

def get_drivers_standings(year):
    """
    Receives a year (can be string or int) and returns the driver's standings for that year.
    """
    fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
    year = fcn(year)

    source = f'https://www.formula1.com/en/results.html/{year}/drivers.html'
    page = requests.get(source, timeout=5)
    content = BeautifulSoup(page.content, "html.parser")

    # parser-lxml : change HTML to Python friendly format
    # obtain page's information
    soup = BeautifulSoup(page.text, 'lxml')
    table = soup.find_all('table')[0]

    # get column names
    headers = []
    for i in table.find_all('th'):
        title = i.text
        headers.append(title)

    # create a dataframe
    df = pd.DataFrame(columns = headers)

    # get row values
    for j in table.find_all('tr')[1:]:
        row_data = j.find_all('td')
        row = [i.text for i in row_data]
        length = len(df)
        df.loc[length] = row

    # cleaning data
    df['Driver'] = df['Driver'].replace('\n', ' ', regex=True)
    df['Driver'] = df['Driver'].str.lstrip()
    df['Driver'] = df['Driver'].str[:-6]

    df['Car'] = df['Car'].replace('\n', ' ', regex=True)
    df['Car'] = df['Car'].str.strip()

    return df

def get_teams_standings(year):
    """
    Receives a year (can be string or int) and returns the consturctor's standings for that year.
    """
    fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
    year = fcn(year)

    source = f'https://www.formula1.com/en/results.html/{year}/team.html'
    page = requests.get(source, timeout=5)
    content = BeautifulSoup(page.content, "html.parser")

    # parser-lxml : change HTML to Python friendly format
    # obtain page's information
    soup = BeautifulSoup(page.text, 'lxml')
    table = soup.find_all('table')[0]

    # get column names
    headers = []
    for i in table.find_all('th'):
        title = i.text
        headers.append(title)

    # create a dataframe
    df = pd.DataFrame(columns = headers)

    # get row values
    for j in table.find_all('tr')[1:]:
        row_data = j.find_all('td')
        row = [i.text for i in row_data]
        length = len(df)
        df.loc[length] = row

    # cleaning data
    df['Team'] = df['Team'].replace('\n', ' ', regex=True)
    df['Team'] = df['Team'].str.strip()

    return df

def get_season_results(year):
    """
    Receives a year (can be string or int) and returns the results for each races in a season that year.
    """
    fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
    year = fcn(year)

    source = f'https://www.formula1.com/en/results.html/{year}/races.html'
    page = requests.get(source, timeout=5)
    content = BeautifulSoup(page.content, "html.parser")

    # parser-lxml : change HTML to Python friendly format
    # obtain page's information
    soup = BeautifulSoup(page.text, 'lxml')
    table = soup.find_all('table')[0]

    # get column names
    headers = []
    for i in table.find_all('th'):
        title = i.text
        headers.append(title)

    # create a dataframe
    df = pd.DataFrame(columns = headers)
    df['Race ID'] = np.nan

    # get row values
    for j in table.find_all('tr')[1:]:

        row_data = j.find_all('td')
        row = [i.text for i in row_data]

        link = j.find('a')
        if link is not None:
            race_id = link.get('href')
        race_id = race_id.split('/')[5]
        row.append(race_id)

        length = len(df)
        df.loc[length] = row

    # cleaning data
    df['Grand Prix'] = df['Grand Prix'].replace('\n', ' ', regex=True)
    df['Grand Prix'] = df['Grand Prix'].str.strip()

    df['Winner'] = df['Winner'].replace('\n', ' ', regex=True)
    df['Winner'] = df['Winner'].str.lstrip()
    df['Winner'] = df['Winner'].str[:-5]

    return df

def get_race_results(year, country, race_id):
    """
    Receives a year (can be string or int), country, and race_id (can be seen using get_season_results())
    and returns the race results.

    """
    fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
    year = fcn(year)
    race_id = fcn(race_id)

    source = f'https://www.formula1.com/en/results.html/{year}/races/{race_id}/{country}/race-result.html'
    page = requests.get(source, timeout=5)
    content = BeautifulSoup(page.content, "html.parser")
    soup = BeautifulSoup(page.text, 'lxml')
    table = soup.find_all('table')[0]

    headers = []
    for i in table.find_all('th'):
        title = i.text
        headers.append(title)

    # create a dataframe
    df = pd.DataFrame(columns = headers)

    # get row values
    for j in table.find_all('tr')[1:]:
        row_data = j.find_all('td')
        row = [i.text for i in row_data]
        length = len(df)
        df.loc[length] = row

    # cleaning data
    df['Driver'] = df['Driver'].replace('\n', ' ', regex=True)
    df['Driver'] = df['Driver'].str.lstrip()
    df['Driver'] = df['Driver'].str[:-5]

    return df

def get_quali_results(year, country, race_id):

    """
    Receives a year (can be string or int), country, and race_id (can be seen using get_season_results())
    and returns the race results.

    """ 
    year_int = year
    fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
    year = fcn(year)
    race_id = fcn(race_id)

    if (year_int > 1995):
        source = f'https://www.formula1.com/en/results.html/{year}/races/{race_id}/{country}/qualifying.html'
    else:
        source = f'https://www.formula1.com/en/results.html/{year}/races/{race_id}/{country}/qualifying-0.html'
    
    page = requests.get(source, timeout=5)
    content = BeautifulSoup(page.content, "html.parser")
    soup = BeautifulSoup(page.text, 'lxml')
    table = soup.find_all('table')[0]

    headers = []
    for i in table.find_all('th'):
        title = i.text
        headers.append(title)

    # create a dataframe
    df = pd.DataFrame(columns = headers)

    # get row values
    for j in table.find_all('tr')[1:]:
        row_data = j.find_all('td')
        row = [i.text for i in row_data]
        length = len(df)
        df.loc[length] = row

    # cleaning data
    df['Driver'] = df['Driver'].replace('\n', ' ', regex=True)
    df['Driver'] = df['Driver'].str.lstrip()
    df['Driver'] = df['Driver'].str[:-5]

    return df

# def get_season_summary(year):