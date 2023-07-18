import psycopg2
import json

def insert_to_postgre(host,port,user,password,database) :
    
    #create connection to PostgreSQL
    conn = psycopg2.connect(
        host= host,
        port= port,
        user= user,
        password= password,
        database= database
    )

    #create cursor object 
    cur = conn.cursor()

    #executing query to create product table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS product(
        id_product SERIAL PRIMARY KEY,
        product_name VARCHAR(255),
        status VARCHAR(20) ,
        normal_price FLOAT,
        sale_price FLOAT,
        ratings FLOAT,
        count_reviews int,
        CHECK (status IN ('Sold out', 'Sale', 'Not sale')))      
                
                ''')


    #executing query to create customer table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS customer(
        id_customer INT PRIMARY KEY,
        first_name VARCHAR(255) ,
        last_name VARCHAR(255) ,
        email VARCHAR(255) ,
        password VARCHAR(255) ,
        country VARCHAR(255) ,
        state VARCHAR(255) ,
        city VARCHAR(255) ,
        address VARCHAR(255) ,
        postcode VARCHAR(20))       
                
                ''')

    #executing query to create customer_phone table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS customer_phone (
        id_customer SERIAL PRIMARY KEY,
        phone_number VARCHAR(20),
        FOREIGN KEY (id_customer) REFERENCES customer (id_customer));
                
                ''')

    #executing query to create shopping_cart table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS shopping_cart (
        id_shopping_cart SERIAL PRIMARY KEY,
        id_customer INTEGER,
        note VARCHAR(255),
        cart_status VARCHAR(20),
        date TIMESTAMP,
        FOREIGN KEY (id_customer) REFERENCES customer (id_customer))
                
                ''')

    #executing query to create fill_up table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS fill_up (
        id_shopping_cart INTEGER,
        id_product INTEGER,
        quantity INTEGER,
        PRIMARY KEY (id_shopping_cart, id_product),
        FOREIGN KEY (id_shopping_cart) REFERENCES shopping_cart (id_shopping_cart),
        FOREIGN KEY (id_product) REFERENCES product (id_product))
                
                ''')

    #executing query to create voucher table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS voucher (
        id_voucher SERIAL PRIMARY KEY,
        voucher_name VARCHAR(255),
        voucher_exp DATE,
        id_customer INT,
        FOREIGN KEY (id_customer) REFERENCES customer (id_customer))
                
                ''')

    #executing query to create payment table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS payment (
        id_payment SERIAL PRIMARY KEY,
        id_shopping_cart INTEGER,
        id_voucher INTEGER,
        total_amount FLOAT,
        price_off FLOAT,
        payment_date TIMESTAMP,
        payment_status BOOLEAN,
        payment_method VARCHAR(20),
        FOREIGN KEY (id_shopping_cart) REFERENCES shopping_cart (id_shopping_cart),
        FOREIGN KEY (id_voucher) REFERENCES voucher (id_voucher),
        CHECK (payment_method IN ('paypal', 'credit_card')))
            
                ''')

    #executing query to create paypal table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS paypal (
        id_payment SERIAL PRIMARY KEY,
        paypal_number VARCHAR(255),
        FOREIGN KEY (id_payment) REFERENCES payment (id_payment))
                
                ''')

    #executing query to create credit_cart table
    cur.execute('''
        CREATE TABLE IF NOT EXISTS credit_card (
        id_payment SERIAL PRIMARY KEY,
        card_number VARCHAR(255),
        name_on_card VARCHAR(255),
        exp_date DATE,
        FOREIGN KEY (id_payment) REFERENCES payment (id_payment))
                
                ''')

    #load JSON file from data scraping
    with open('Data Scraping/data/Kokoro_Best_Sellers.json') as file:
        records = json.load(file)

    
    i = 1      #creating id_product with increment
    
    #load data from json file and inserting record from json file to product table
    for record in records:
        id_product = i
        Product_name = record['Product_name'].replace("'","")
        status = record['status']
        normal_price = record['normal_price']
        sale_price = record['sale_price']
        ratings = record['ratings']
        count_reviews = record['count_reviews']
        
        #executing query to insert loaded data to product table
        cur.execute("INSERT INTO product VALUES('{}','{}', '{}','{}','{}','{}','{}')".format(id_product,Product_name,status,normal_price,sale_price,ratings,count_reviews))
        i+=1
        
    # Commit all changes
    conn.commit()

    # Close the cursor and database connection
    cur.close()
    conn.close()
    
    print("Done Inserting data product on database PostgreSQL")

insert_to_postgre("localhost","5432","postgres","admin","kokoro_database")





