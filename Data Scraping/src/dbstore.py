import json, sys
from psycopg2 import connect, Error
from psycopg2.extras import Json

def create_tables(sql_command):
    conn = None
    try:
        # connect to the PostgreSQL server
        conn = connect(
            dbname = "jamtangancom", 
            user = "postgres", 
            password = "naoefal0953", 
            connect_timeout = 3)
        cur = conn.cursor()
        cur.execute(sql_command)

        cur.close()
        conn.commit()

    except (Exception, Error) as err:
        print ("\n==============Connecting Error==============\n", err)

    finally:
        if conn is not None:
            conn.close()
            print('The table has been created.')

def store_json_to_db(table_name, sql_command, fields):
    # create tables to store the data
    create_tables(sql_command);

    # open the json file and load it into the record_list variable
    try:
        with open(f'../data/processed/{table_name}.json', 'r', encoding='utf-8') as json_data:
            record_list = json.load(json_data)
    except FileNotFoundError:
        print("File not found.")
        sys.exit()

    # convert the list of dictionaries to a list of tuples
    data = [list(item.values()) for item in record_list]

    # declare a new PostgreSQL connection object
    conn = None
    try:
        # connect to the PostgreSQL server
        conn = connect(
            dbname = "jamtangancom",
            user = "postgres",
            password = "<password>",
            connect_timeout = 3
        )
        cur = conn.cursor()

        values = ""
        for record in data:
            values_list = []
        
            # append each value to a new list of values
            for val in record:
                if type(val) == str: val = str(Json(val)).replace('"', '')
                values_list += [str(val)]

            # give parenthesis in left and right of each record
            values += "(" + ', '.join(values_list) + "),\n"

        # cut the last comma and newline character from string, then add a semicolon
        values = values[:-2] + ";"

        # concatenate the SQL command with the table name and the list of fields
        table_name = table_name
        data_sql_command = "INSERT INTO %s (%s)\nVALUES %s" % (table_name, ', '.join(fields), values)

        # insert values stored in data_sql_command and commit to the database
        cur.execute(data_sql_command)
        conn.commit()

    except (Exception, Error) as error:
            print("Storing Error:", error)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    product_sql_command = (
        """CREATE TABLE IF NOT EXISTS product (
        brand VARCHAR(255),
        model_number VARCHAR(255),
        series VARCHAR(255),
        gender VARCHAR(50),
        colour VARCHAR(50),
        luminous VARCHAR(50),
        calendar VARCHAR(255),
        water_resistant VARCHAR(255),
        case_diameter_mm NUMERIC,
        strap_material VARCHAR(255),
        PRIMARY KEY (brand, model_number)
        );"""
    )
    fields = ["brand", "model_number", "series", "gender", "colour", "luminous", 
              "calendar", "water_resistant", "case_diameter_mm", "strap_material"]
    store_json_to_db("product", product_sql_command, fields)

    sales_sql_command = (
        """CREATE TABLE IF NOT EXISTS sales (
        product_name VARCHAR(255) PRIMARY KEY,
        brand VARCHAR(255),
        model VARCHAR(255),
        normal_price NUMERIC,
        discounted_price NUMERIC,
        discount_percentage NUMERIC,
        num_seen INTEGER,
        num_sold INTEGER,
        online_stock_status VARCHAR(50),
        offline_stock_status VARCHAR(50),
        FOREIGN KEY (brand, model) REFERENCES product(brand, model_number)
        );"""
    )
    fields = ["product_name", "brand", "model", "normal_price", "discounted_price", "discount_percentage", 
              "num_seen", "num_sold", "online_stock_status", "offline_stock_status"]
    store_json_to_db("sales", sales_sql_command, fields)

    customer_sql_command = (
        """CREATE TABLE IF NOT EXISTS customer (
        email VARCHAR(255) PRIMARY KEY,
        name VARCHAR(255),
        member_status VARCHAR(50)
        );"""
    )
    fields = ["email", "name", "member_status"]
    store_json_to_db("customer", customer_sql_command, fields)

    review_sql_command = (
        """CREATE TABLE IF NOT EXISTS review (
        id_review SERIAL PRIMARY KEY,
        product_name VARCHAR(255),
        email VARCHAR(255),
        date DATE,
        time TIME,
        rating INTEGER,
        delivery_review TEXT,
        product_review TEXT,
        FOREIGN KEY (product_name) REFERENCES sales(product_name),
        FOREIGN KEY (email) REFERENCES customer(email)
        );"""
    )
    fields = ["product_name", "email", "date", "time", "rating", "delivery_review", "product_review"]
    store_json_to_db("review", review_sql_command, fields) 

    print("\n\nData Storing Finished\n\n")   
