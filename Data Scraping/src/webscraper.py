from bs4 import BeautifulSoup
import requests
import pandas as pd
import numpy as np
import json

import urllib3

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
    df.drop(df.columns[[0, 6]], axis=1, inplace=True)

    df['Driver'] = df['Driver'].replace('\n', ' ', regex=True)
    df['Driver'] = df['Driver'].str.lstrip()
    df['Driver'] = df['Driver'].str[:-6]

    df['Car'] = df['Car'].replace('\n', ' ', regex=True)
    df['Car'] = df['Car'].str.strip()

    df['Year'] = year

    return df

def get_races(year):
    """
    Receives a year (can be string or int) and returns the races in a season that year.
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
    df['Location'] = np.nan

    # get row values
    for j in table.find_all('tr')[1:]:

        row_data = j.find_all('td')
        row = [i.text for i in row_data]

        link = j.find('a')
        if link is not None:
            link = link.get('href')
        race_id = link.split('/')[5]
        race_location = link.split('/')[6]
        row.append(race_id)
        row.append(race_location)

        length = len(df)
        df.loc[length] = row

    # cleaning data
    df['Grand Prix'] = df['Grand Prix'].replace('\n', ' ', regex=True)
    df['Grand Prix'] = df['Grand Prix'].str.strip()

    df['Winner'] = df['Winner'].replace('\n', ' ', regex=True)
    df['Winner'] = df['Winner'].str.lstrip()
    df['Winner'] = df['Winner'].str[:-5]
    df = df.drop(['Winner', 'Car', 'Laps', 'Time'], axis=1)
    df['Year'] = year

    return df

def get_race_results(year, location, race_id):
    """
    Receives a year (can be string or int), country, and race_id (can be seen using get_season_results())
    and returns the race results.

    """
    fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
    year = fcn(year)
    race_id = fcn(race_id)

    source = f'https://www.formula1.com/en/results.html/{year}/races/{race_id}/{location}/race-result.html'
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

    #cleaning data
    df['Driver'] = df['Driver'].replace('\n', ' ', regex=True)
    df['Driver'] = df['Driver'].str.lstrip()
    df['Driver'] = df['Driver'].str[:-5]

    df['Race ID'] = race_id

    return df

def get_season_ids_location(year):
    """
    Receives a year and returns AN ARRAY of the race IDs and location of the races
    that year for use in the F1 website.
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
    df['Location'] = np.nan

    # get row values
    for j in table.find_all('tr')[1:]:
        row_data = j.find_all('td')
        row = [i.text for i in row_data]

        link = j.find('a')
        if link is not None:
            link = link.get('href')
        race_id = link.split('/')[5]
        race_location = link.split('/')[6]
        row.append(race_id)
        row.append(race_location)

        length = len(df)
        df.loc[length] = row

    df = df[df.columns[-2:]]
    array_ids_location = [df.values]

    return array_ids_location

# get driver from range of year (xx....xx)
# scrape from driver standings aja
# if driver already included in dataframe already then do not masukkin

def get_drivers(range_of_years):
    """
    Returns all the drivers that competed in a given year. The parameter year can be a list
    or a single year.
    """

    if type(range_of_years) != list:
        years = [range_of_years]
    else:
        years = range_of_years
        
    years_df = pd.DataFrame(columns=['Driver', 'Nationality'])
    temp_df = pd.DataFrame(columns=['Driver', 'Nationality'])

    for year in years:
        fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
        year = fcn(year)

        driver_df = get_drivers_standings(year)
        temp_df = driver_df[['Driver', 'Nationality']]
        years_df = pd.concat([temp_df, years_df])
        years_df = years_df.drop_duplicates()

    return years_df

def get_seasons():
    """
    Returns all the seasons currently available in the Formula One website.
    """
    source = 'https://www.formula1.com/en/results.html/2021/races.html'
    page = requests.get(source, timeout=5)
    content = BeautifulSoup(page.content, "html.parser")

    # parser-lxml : change HTML to Python friendly format
    # obtain page's information
    soup = BeautifulSoup(page.text, 'lxml')
    vals = soup.find_all('a', {'data-name':'year'})
    years = []
    for val in vals:
        year = val.get('data-value')
        years.append(year)

    df = pd.DataFrame(data={'Year': years})
    return df