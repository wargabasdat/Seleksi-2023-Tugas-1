# main.py berisi program utama untuk melakukan scraping data dari eventbrite.com

import scrape_function as sf
import json

# list category untuk dijadikan url
categories_url = [ 'business--events', 'food-and-drink--events', 'health--events', 'music--events', 'auto-boat-and-air--events', 'charity-and-causes--events', 'community--events', 'family-and-education--events', 'fashion--events', 'film-and-media--events', 'hobbies--events', 'home-and-lifestyle--events', 'arts--events', 'government--events', 'spirituality--events', 'school-activities--events', 'science-and-tech--events', 'holiday--events','sports-and-fitness--events','travel-and-outdoor--events','other--events']
# code category
categories_code = ['B','FD','H','M','ABA','CC','C','FE','F','FM','H','HL','A','G','S','SA','ST','Hl','SF','TO','O']
# list kosong untuk ditulis ke json
organizers = []
events = []
locations = []
categories = []
ID_event = 1
url = 'https://www.eventbrite.com/d/indonesia/{category}/?page={i}&cur=USD'
# scrape data tiap category
for category in categories_url:
    ct = {
        'ID_category' : categories_code[categories_url.index(category)],
        'Name' : sf.replace_hyphens_with_spaces(category),
    }
    categories.append(ct)
    i = 1
    max_retries = 20
    retries = 0
    max_page = sf.get_max_page(sf.create_soup(sf.load_page_source(url.format(category=category, i=i))))
    if max_page is None:
        print('Nothing to scrape in category {}.'.format(category))
        continue
    for it in range(1, max_page+1):
        # scrape 1 page
        while retries < max_retries:
            try:
                url_page = url.format(category=category, i=it)
                html = sf.load_page_source(url_page)
                print('Scraping page {} in category {}...'.format(it, category))
                soup = sf.create_soup(html)
                if sf.get_name(soup,0) != None:
                    test1 = sf.get_elm_page(soup,0)  
                x = 0
                break
            except Exception as e:
                print(e)
                retries += 1
                print("Retrying...")
        while (sf.get_name(soup,x)!=None):
            # scrape tiap event
            name = sf.get_name(soup,x)
            print(f"Scraping event {x+1} ({name})...")
            price= sf.get_price(soup,x)
            order_link = sf.get_event_url(soup,x)
            print(order_link)
            # link event bermasalah
            if (order_link==None or order_link == "https://www.eventbrite.com/e/cerdas-mengenali-dan-menghindari-investasi-bodong-tickets-674947264437?aff=ebdssbdestsearch" or order_link == "https://www.eventbrite.com/e/jakarta-leadership-overcome-anxiety-with-discipline-and-termination-tickets-449164582357?aff=ebdssbdestsearch" or order_link == "https://www.eventbrite.com/e/bising-bising-tetangga-5-tickets-670126946737?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/counseling-and-parenting-education-pekanbaru-tickets-654726644017?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/2-day-workshop-handstand-and-flexibility-fundamentals-tickets-639064919377?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/nirvana-strength-training-camp-tickets-676424201997?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/5-day-handstand-intensive-training-with-sainaa-tickets-675708952667?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/altheas-bali-healing-retreat-registration-424196652607?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/psikoanalisis-trading-atasi-bahaya-mc-tickets-676494923527?aff=ebdssbdestsearch" or order_link=="https://www.eventbrite.com/e/luxurious-wellness-retreat-designed-to-renew-revive-you-tickets-652543002687?aff=ebdssbdestsearch"):
                x += 1
                continue
            html = sf.load_page_event(order_link)
            # page event return none (element atau class tertentu tidak ditemukan)
            if html == None:
                x += 1
                continue
            soup2 = sf.create_soup(html)
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
            if event['Name'] not in [e['Name'] for e in events]:
                events.append(event)
            else:
                x += 1
                continue
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
    print('Scraping page {} in category {} done.'.format(it, category))  
print('Scraping is finished')







            


        