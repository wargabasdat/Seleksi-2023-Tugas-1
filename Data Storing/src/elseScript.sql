CREATE TABLE IF NOT EXISTS store (
    storeid VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS storestock (
    storeid VARCHAR(5) NOT NULL REFERENCES store(storeid),
    isbn VARCHAR(13) NOT NULL REFERENCES book(isbn),
    stock INT NOT NULL CHECK(stock > 0),
    PRIMARY KEY (storeid, isbn)
);

CREATE TABLE IF NOT EXISTS customer (
    customerid VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL,
    name VARCHAR(40) NOT NULL,
    birthdate DATE NOT NULL,
    gender VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS savedaddress (
    addressnum SERIAL NOT NULL,
    customerid VARCHAR(5) NOT NULL REFERENCES customer(customerid),
    receivername VARCHAR(40) NOT NULL,
    receiverphone VARCHAR(20) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    postalcode VARCHAR(60) NOT NULL,
    PRIMARY KEY (addressnum, customerid)
);

CREATE TABLE IF NOT EXISTS orders (
    invoicenum VARCHAR(10) PRIMARY KEY UNIQUE NOT NULL,
    customerid VARCHAR(5) NOT NULL,
    orderdate DATE NOT NULL,
    addressnum SERIAL NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (addressnum, customerid) REFERENCES savedaddress(addressnum, customerid)
);

CREATE TABLE IF NOT EXISTS orderdetails (
    itemlinenumber INT NOT NULL,
    invoicenum VARCHAR(10) NOT NULL REFERENCES orders(invoicenum),
    isbn VARCHAR(13) NOT NULL REFERENCES book(isbn),
    quantity INT NOT NULL,
    discount REAL,
    PRIMARY KEY (itemlinenumber, invoicenum)
);

CREATE TABLE IF NOT EXISTS shoppingcart (
    customerid VARCHAR(5) NOT NULL REFERENCES customer(customerid),
    isbn VARCHAR(13) NOT NULL REFERENCES book(isbn),
    quantity INT NOT NULL,
    PRIMARY KEY (customerid, isbn)
);

CREATE TABLE IF NOT EXISTS payment (
    paymentid VARCHAR(5) PRIMARY KEY NOT NULL,
    amount INT NOT NULL,
    method VARCHAR(20) NOT NULL,
    customerid VARCHAR(5) NOT NULL REFERENCES customer(customerid),
    invoicenum VARCHAR(10) NOT NULL REFERENCES orders(invoicenum)
);

