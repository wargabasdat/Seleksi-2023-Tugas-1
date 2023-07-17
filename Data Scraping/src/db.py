import json
import psycopg2

hostname = 'localhost'
database = 'seleksi_basdat'
username = 'postgres'
pwd = 'admin'
port_id = 5432
connection = None
cur = None


def buildingSchema(_hostname, _database, _username, _pwd, _port_id, cur, connection):
    try:
        connection = psycopg2.connect(
            host=_hostname,
            dbname=_database,
            user=_username,
            password=_pwd,
            port=_port_id
        )
        cur = connection.cursor()

        # Create Customer Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Customer(
        Customer_ID SERIAL PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        Street VARCHAR(50) NOT NULL, 
        Ward VARCHAR(30) NOT NULL,
        Subdistrict VARCHAR(30) NOT NULL,
        City VARCHAR(30) NOT NULL,
        Province VARCHAR(30) NOT NULL,
        Postal_Code VARCHAR(10) NOT NULL,
        Telephone_Number VARCHAR(15) NOT NULL
        )

                    ''')

        # Create Product Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Product(
        Product_Code VARCHAR(20) PRIMARY KEY,
        Product_Name VARCHAR(100) NOT NULL,
        Image_Link VARCHAR(200) NOT NULL,
        Color VARCHAR(15) NOT NULL,
        Price INT NOT NULL,
        Details TEXT
        )

                    ''')

        # Create Cart Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Cart(
        Cart_ID SERIAL PRIMARY KEY,
        Customer_ID SERIAL REFERENCES Customer(Customer_ID),
        Order_Status VARCHAR(100) NOT NULL
        )
    ''')

        # Create Cart_Product Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Cart_Product(
        Order_Number SERIAL,
        Cart_ID SERIAL REFERENCES Cart(Cart_ID),
        Product_Code VARCHAR(20) NOT NULL REFERENCES Product(Product_Code),
        Quantity INT NOT NULL,
        Size VARCHAR(4) NOT NULL,
        PRIMARY KEY(Order_Number, Cart_ID)
        
        )

                    ''')

        # Create Payment Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Payment(
        Payment_ID SERIAL PRIMARY KEY,
        Cart_ID SERIAL NOT NULL REFERENCES Cart(Cart_ID),
        Payment_Date TIMESTAMP NOT NULL
        )

                    ''')

        # Create Credit_Card Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Credit_Card(
        Payment_ID SERIAL PRIMARY KEY REFERENCES Payment(Payment_ID),
        Credit_Card_Number VARCHAR(20) NOT NULL
        )

                    ''')
        # Create E_Wallet Tabel
        cur.execute('''
        CREATE TABLE IF NOT EXISTS E_Wallet(
        Payment_ID SERIAL PRIMARY KEY REFERENCES Payment(Payment_ID),
        Telephone_Number VARCHAR(15) NOT NULL
        )

                    ''')

        # Create Bank_Transfer Table
        cur.execute('''
        CREATE TABLE IF NOT EXISTS Bank_Transfer(
        Payment_ID SERIAL PRIMARY KEY REFERENCES Payment(Payment_ID),
        Account_Number VARCHAR(30) NOT NULL
        )
                    ''')

        # Add some constraint

        # Order status on Cart Table only has 3 allowed values : unpaid, on delivery, or delivered
        cur.execute(
            '''
                ALTER TABLE Cart
                ADD CONSTRAINT Order_Status
                CHECK (Order_Status IN ('unpaid', 'on delivery', 'delivered'))
            '''
        )

        # Size on Cart_Product only has 5 allowed values: XS, S, M, L, XL
        cur.execute(
            '''
                ALTER TABLE Cart_Product
                ADD CONSTRAINT Size
                CHECK(Size IN ('XS', 'S', 'M', 'L', 'XL'))
            '''
        )

        # Trigger function  adding a payment record
        # Before adding payment record, it will check whether the order_status is unpaid
        # We can add payment record iff the order status is unpaid
        cur.execute(
            '''
                CREATE FUNCTION check_order_status()
                RETURNS TRIGGER AS $$
                BEGIN
                    IF EXISTS(
                        SELECT *
                        FROM Cart
                        WHERE Cart.Cart_ID = NEW.Cart_ID
                        AND Cart.Order_Status = 'unpaid'

                    ) THEN
                        RETURN NEW;
                    ELSE
                        RAISE EXCEPTION 'Cannot insert new payment record! It was paid!';
                    END IF;
                END;
                $$ LANGUAGE plpgsql;

            '''
        )

        # Trigger function
        # After adding payment, update order_status from unpaid to on delivery
        cur.execute('''
            CREATE TRIGGER payment_trigger
            BEFORE INSERT ON Payment
            FOR EACH ROW
            EXECUTE FUNCTION check_order_status();

                    ''')
        cur.execute(
            '''
                CREATE FUNCTION update_unpaid_status_function()
                RETURNS TRIGGER AS $$
                BEGIN
                        UPDATE Cart
                        SET Order_Status = 'on delivery'
                        WHERE Cart_ID = NEW.Cart_ID;
                        RETURN NEW;
                END;
                $$ LANGUAGE plpgsql;

            '''
        )

        cur.execute(
            '''
                CREATE TRIGGER update_status_trigger
                AFTER INSERT ON Payment
                FOR EACH ROW
                EXECUTE FUNCTION update_unpaid_status_function();

            '''
        )

        cur.execute(
            '''
                CREATE FUNCTION check_payment()
                RETURNS TRIGGER AS $$
                    BEGIN
                        IF NOT EXISTS(
                            SELECT 1 
                            FROM Payment
                            WHERE Payment.Cart_ID = NEW.Cart_ID 
                            
                        ) AND NEW.Order_Status != 'unpaid' 
                        THEN
                            RAISE EXCEPTION 'You havent paid! Failed to insert or update data!';

                        ELSE
                            RETURN NEW;
                        END IF;

                    END;

                $$ LANGUAGE plpgsql;

            '''
        )

        cur.execute(
            '''
                CREATE TRIGGER check_payment_trigger
                BEFORE INSERT OR UPDATE ON Cart
                FOR EACH ROW
                EXECUTE FUNCTION check_payment();

            '''
        )

        connection.commit()

    except Exception as error:
        print(error)
    finally:
        if cur != None:
            cur.close()
        if connection != None:
            connection.close()


def insertProductsRecord(_hostname, _database, _username, _pwd, _port_id, cur, connection):
    try:
        connection = psycopg2.connect(
            host=_hostname,
            dbname=_database,
            user=_username,
            password=_pwd,
            port=_port_id
        )
        cur = connection.cursor()
        with open('Data Scraping/data/products.json', 'r') as file:
            json_data = file.read()
            data = json.loads(json_data)
            products = data['products']
            for product in products:
                product_code = product['Product_Code']
                product_name = product['Product_Name'].replace("'", "")
                image_link = product['Image_Link']
                color = product['Color']
                price = product['Price']
                details = product['Details'].replace("'", '')
                insert_query = "INSERT INTO Product VALUES ('{}', '{}', '{}', '{}', {}, '{}')".format(
                    product_code, product_name, image_link, color, price, details)
                print(insert_query)
                cur.execute(insert_query)
            connection.commit()
    except Exception as error:
        raise error
    finally:
        if cur is not None:
            cur.close()
        if connection is not None:
            connection.close()


# MAIN
buildingSchema(hostname, database, username, pwd, port_id, cur, connection)
insertProductsRecord(hostname, database, username,
                     pwd, port_id, cur, connection)
