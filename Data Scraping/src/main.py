import scrape_function as sf
import json

# categories_url = ['business--events', 'food-and-drink--events', 'health--events', 'music--events', 'auto-boat-and-air--events', 'charity-and-causes--events', 'community--events', 'family-and-education--events', 'fashion--events', 'film-and-media--events', 'hobbies--events', 'home-and-lifestyle--events', 'arts--events', 'government--events', 'spirituality--events', 'school-activities--events', 'science-and-tech--events', 'holiday--events','sports-and-fitness--events','travel-and-outdoor--events', 'other--events']
categories_url = ['business--events']
categories_code = ['B','FD','H','M','ABA','CC','C','FE','F','FM','H','HL','A','G','S','SA','ST','Hl','SF','TO','O']
max_page = 3
organizers = []
events = []
locations = []
categories = []
ID_event = 1
ID_organizer = 1
url = 'https://www.eventbrite.com/d/indonesia/{category}/?page={i}&cur=USD'
for category in categories_url:
    ct = {
        'ID_category' : categories_code[categories_url.index(category)],
        'Name' : sf.replace_hyphens_with_spaces(category),
    }
    categories.append(ct)
    for i in range(1, max_page+1):
        url_page = url.format(category=category, i=i)
        html = sf.load_page_source(url_page)
        print('Scraping page {} in category {}...'.format(i, category))
        soup = sf.create_soup(html)
        x = 0
        while (sf.get_name(soup,x)!=None):
            name = sf.get_name(soup,x)
            print(f"Scraping event {x+1} ({name})...")
            price= sf.get_price(soup,x)
            order_link = sf.get_event_url(soup,x)
            print(order_link)
            soup2 = sf.create_soup(sf.load_page_event(order_link))
            address = sf.get_address(soup2)
            date = sf.get_date(soup2)
            time = sf.get_time(soup2)
            latitude = sf.get_lattitude(soup2)
            longitude = sf.get_longitude(soup2)
            duration = sf.get_duration(soup2)
            organizer = sf.get_organizer(soup2)
            totalfollowersorganizer = sf.get_totalfollowersorganizer(soup2)
            organizerpage = sf.get_organizerpage(soup2)
            # menyimpan ke dalam json
            event = {
                'ID_event': ID_event,
                'Name': name,
                'Price': price,
                'Date': date,
                'Start_time': time,
                'Duration': duration,
                'Order_link': order_link,
                'Address': address,
                'Organizer': organizerpage,
                'Category': categories_code[categories_url.index(category)],
            }
            organizer = {
                'Name' : organizer,
                'Total_followers' : totalfollowersorganizer,
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
            with open('..\data\events.json', 'w') as json_file:
                json.dump(events, json_file)
            with open('..\data\organizers.json', 'w') as json_file:
                json.dump(organizers, json_file)
            with open('..\data\locations.json', 'w') as json_file:
                json.dump(locations, json_file)
            with open('..\data\categories.json', 'w') as json_file:
                json.dump(categories, json_file)
            ID_event += 1
            x += 1
        print('Scraping page {} in category {} done.'.format(i, category))
        # print('Saving to json...')
        # with open('..\data\events.json', 'w') as json_file:
        #     json.dump(events, json_file)
        # with open('..\data\organizers.json', 'w') as json_file:
        #     json.dump(organizers, json_file)
        # with open('..\data\locations.json', 'w') as json_file:
        #     json.dump(locations, json_file)
        # with open('..\data\categories.json', 'w') as json_file:
        #     json.dump(categories, json_file)   
print('Scraping is finished')







            


        