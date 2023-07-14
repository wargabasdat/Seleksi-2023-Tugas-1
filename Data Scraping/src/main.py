import scrape_function as sf
import json

catagories_url = ['business--events', 'food-and-drink--events', 'health--events', 'music--events', 'auto-boat-and-air--events', 'charity-and-causes--events', 'community--events', 'family-and-education--events', 'fashion--events', 'film-and-media--events', 'hobbies--events', 'home-and-lifestyle--events', 'arts--events', 'government--events', 'spirituality--events', 'school-activities--events', 'science-and-tech--events', 'holiday--events','sports-and-fitness--events','travel-and-outdoor--events', 'other--events']
catagories_code = ['B','FD','H','M','ABA','CC','C','FE','F','FM','H','HL','A','G','S','SA','ST','Hl','SF','TO','O']
max_page = 10
organizers = []
events = []
locations = []
catagories = []
ID_event = 1
ID_organizer = 1
url = 'https://www.eventbrite.com/d/indonesia/{catagory}/?page={i}/'
for catagory in catagories:
    ct = {
        'ID_catagory' : catagories_code[catagories.index(catagory)],
        'Name' : catagory,
    }
    catagories.append(ct)
    for i in range(1, max_page+1):
        url_page = url.format(catagory=catagory, i=i)
        html = sf.load_page_source(url_page)
        soup = sf.create_soup(html)
        x = 0
        while (sf.get_name(soup,x)==None):
            name = sf.get_name(soup,x)
            date,time = get_datetime(soup,x)
            lowest_price, highest_price= sf.get_price(soup,x)
            order_link = sf.get_order_link(soup,x)
            soup2 = sf.create_soup(order_link)
            address = sf.get_address(soup2)
            latitude = sf.get_lattitude(soup2)
            longitude = sf.get_longitude(soup2)
            duration = sf.get_duration(soup2)
            organizer = sf.get_organizer(soup2)
            totalfolowersorganizer = sf.get_totalfolowersorganizer(soup2)
            organizerpage = sf.get_organizerpage(soup2)
            # menyimpan ke dalam json
            event = {
                'ID_event': ID_event,
                'Name': name,
                'Lowest_price': lowest_price,
                'Highest_price': highest_price,
                'Date': date,
                'Start_time': time,
                'Duration': duration,
                'Order_link': order_link,
                'Address': address,
                'Organizer': organizerpage,
            }
            organizer = {
                'Name' : organizer,
                'Total_folowers' : totalfolowersorganizer,
                'Organizer_page' : organizerpage,
            }
            location = {
                'Address' : address,
                'Latitude' : latitude,
                'Longitude' : longitude,
            }
            events.append(event)
            if organizer not in organizers:
                organizers.append(organizer)
            if location not in locations:
                locations.append(location)
            ID_event += 1
            x += 1
        print('Scraping page {} of {} in catagory {}'.format(i, max_page, catagory))
print('Scraping is finished')

with open('events.json', 'w') as json_file:
    json.dump(events, json_file)
with open('organizers.json', 'w') as json_file:
    json.dump(organizers, json_file)
with open('locations.json', 'w') as json_file:
    json.dump(locations, json_file)
with open('catagories.json', 'w') as json_file:
    json.dump(catagories, json_file)    








            


        