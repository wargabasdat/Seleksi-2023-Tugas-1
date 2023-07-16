# positions and abbreviations
posName = [
    'Point Guard', 
    'Shooting Guard', 
    'Small Forward', 
    'Power Forward', 
    'Center'
]

posAbbr = ['PG', 'SG', 'SF', 'PF', 'C']

def storingPositions() -> list:
    """
    Finding positions from posName and posAbbr

    Returns
    -------
    arrPos : list
        list of positions
    """
    print('Storing positions...')
    arrPos = []

    # adding position to array
    for i in range(len(posName)):
        pos = dict(posName=posName[i], posAbbr=posAbbr[i])
        arrPos.append(pos)

    return arrPos