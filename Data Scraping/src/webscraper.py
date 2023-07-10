from bs4 import BeautifulSoup
import requests
import pandas as pd
import numpy as np

# lambda function to convert to string if integer
fcn = lambda y: str(y) if type(y) == int else y

def get_drivers_standings(year):
    """
    Receives a year (can be string or int) and returns the driver's standings for that year.
    """
    year = fcn(year)
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT x64); Ilmagita N/18221101@std.stei.itb.ac.id'
    }
    source = f'https://www.formula1.com/en/results.html/{year}/drivers.html'
    page = requests.get(source, headers=headers, timeout=5)
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

def get_multiple_drivers_standings(range_of_years):   
    if type(range_of_years) != list:
        years = [range_of_years]
    else:
        years = range_of_years

    years_df = pd.DataFrame()
    temp_df = pd.DataFrame()
    
    for year in years:
        fcn = lambda y: str(y) if type(y) == int else y # covert to string if integer
        year = fcn(year)

        driver_df = get_drivers_standings(year)
        temp_df = driver_df
        years_df = pd.concat([temp_df, years_df], ignore_index=True)
    
    years_df = years_df.drop_duplicates()
    return years_df

def get_races(year):
    """
    Receives a year (can be string or int) and returns the races in a season that year.
    """
    year = fcn(year)
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT x64); Ilmagita N/18221101@std.stei.itb.ac.id'
    }
    source = f'https://www.formula1.com/en/results.html/{year}/races.html'
    page = requests.get(source, timeout=5, headers=headers)
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

    df.rename(columns={'Race ID': 'Race-ID', 'Grand Prix': 'Grand-Prix'}, inplace=True)
    df.columns = df.columns.str.strip()

    duplicates = df.columns[df.columns.duplicated()]
    for column in duplicates:
        df.rename(columns={column: f"{column}_duplicate"}, inplace=True)

    df = df.drop(columns=df.columns[df.columns.str.endswith('_duplicate')])

    return df

def get_races_in_a_range(years):
    """
    Returns all the races in a range of seasons.
    """
    races_df = pd.DataFrame()
    temp_df = pd.DataFrame()
    years_df = pd.DataFrame()

    for year in years:
        year = fcn(year)

        races_df = get_races(year)
        temp_df = years_df
        years_df = pd.concat([temp_df, races_df], ignore_index=True)

    return years_df

def get_race_results(year, location, race_id):
    """
    Receives a year (can be string or int), country, and race_id (can be seen using get_season_results())
    and returns the race results.

    """
    year = fcn(year)
    race_id = fcn(race_id)
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT x64); Ilmagita N/18221101@std.stei.itb.ac.id'
    }

    source = f'https://www.formula1.com/en/results.html/{year}/races/{race_id}/{location}/race-result.html'
    page = requests.get(source, timeout=5, headers=headers)
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

    df.rename(columns={'Race ID': 'Race-ID'}, inplace=True)
    df.columns = df.columns.str.strip()

    duplicates = df.columns[df.columns.duplicated()]
    for column in duplicates:
        df.rename(columns={column: f"{column}_duplicate"}, inplace=True)

    df = df.drop(columns=df.columns[df.columns.str.endswith('_duplicate')])

    return df

def get_multiple_race_results(arr):
    """
    Takes an array of multiple race ids, location, and years and returns the results into one dataframe.
    """
    final_df = pd.DataFrame()
    temp_df = pd.DataFrame()
    
    for val in arr:
        temp_df = get_race_results(val[2], val[1], val[0])
        final_df = pd.concat([temp_df, final_df], ignore_index=True)
        temp_df = final_df

    return final_df

def get_race_ids_location(year):
    """
    Receives a year and returns AN ARRAY of the race IDs and location of the races
    that year for use in the F1 website.
    """
    year = fcn(year)
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT x64); Ilmagita N/18221101@std.stei.itb.ac.id'
    }

    source = f'https://www.formula1.com/en/results.html/{year}/races.html'
    page = requests.get(source, timeout=5, headers=headers)
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
    df['Year'] = np.nan

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
        row.append(year)

        length = len(df)
        df.loc[length] = row

    df = df[df.columns[-3:]]
    array_ids_location = df.values

    return array_ids_location

def get_multiple_race_ids_location(years):
    """
    Returns all the race IDs and locations in a range of seasons in a two-dimensional array.
    """
    results = []

    for year in years:
        year = fcn(year)
        temp_arr = get_race_ids_location(year)
        results.append(temp_arr)

    final_ids = np.concatenate(results, axis=0)
    final_ids = final_ids.tolist()
    return final_ids

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
    print('|'.join(years_df.columns))
    return years_df

def get_seasons():
    """
    Returns all the seasons currently available in the Formula One website.
    """
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT x64); Ilmagita N/18221101@std.stei.itb.ac.id'
    }
    source = 'https://www.formula1.com/en/results.html/2021/races.html'
    page = requests.get(source, headers=headers, timeout=5)
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

