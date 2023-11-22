DO $$ DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;

CREATE TABLE Customer(
  cust_no SERIAL PRIMARY KEY,
  email VARCHAR(254) NOT NULL,
  name VARCHAR(80) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  UNIQUE(email),
  CHECK(LENGTH(email) >= 6),
  CHECK(LENGTH(phone) >= 3)
);

CREATE TABLE Orders(
  order_no SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  cust_no INT NOT NULL,
  FOREIGN KEY(cust_no) REFERENCES Customer(cust_no)
);

CREATE TABLE Sale(
  order_no INT PRIMARY KEY,
  FOREIGN KEY(order_no) REFERENCES Orders(order_no)
);

-- Customers can only pay for sales they have ordered.
-- pay(order_no, cust_no) can only exist if there is an order/sale with cust_no attribute
CREATE TABLE pay(
  order_no INT PRIMARY KEY,
  cust_no INT NOT NULL,
  FOREIGN KEY(order_no) REFERENCES Sale(order_no),
  FOREIGN KEY(cust_no) REFERENCES Customer(cust_no)
);

CREATE TABLE Department(
  name VARCHAR(200) PRIMARY KEY
);

CREATE TABLE Employee(
  ssn VARCHAR(9) PRIMARY KEY,
  TIN VARCHAR(20) NOT NULL,
  bdate DATE NOT NULL,
  name VARCHAR(80) NOT NULL,
  UNIQUE(TIN),
  CHECK(LENGTH(TIN) >= 1)
);

CREATE TABLE process(
  ssn VARCHAR(9),
  order_no INT,
  PRIMARY KEY(ssn, order_no),
  FOREIGN KEY(ssn) REFERENCES Employee(ssn),
  FOREIGN KEY(order_no) REFERENCES Orders(order_no)
);

CREATE TABLE Workplace(
  address VARCHAR(255) PRIMARY KEY,
  lat NUMERIC(8,6) NOT NULL,
  long NUMERIC(9,6) NOT NULL,
  UNIQUE(lat, long)
);

CREATE TABLE Office(
  address VARCHAR(255) PRIMARY KEY,
  FOREIGN KEY(address) REFERENCES Workplace(address)
);

CREATE TABLE Warehouse (
  address VARCHAR(255) PRIMARY KEY,
  FOREIGN KEY(address) REFERENCES Workplace(address)
);

CREATE TABLE works (
  ssn VARCHAR(9),
  name VARCHAR(200),
  address VARCHAR(255),
  PRIMARY KEY(ssn, name, address),
  FOREIGN KEY(ssn) REFERENCES Employee(ssn),
  FOREIGN KEY(name) REFERENCES Department(name),
  FOREIGN KEY(address) REFERENCES Workplace(address)
);

CREATE TABLE Product (
  sku VARCHAR(8) PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  description VARCHAR(255) NOT NULL,
  price NUMERIC(16,4) NOT NULL
);

CREATE TABLE EAN_Product (
  sku VARCHAR(8) PRIMARY KEY,
  ean VARCHAR(13) NOT NULL,
  FOREIGN KEY(sku) REFERENCES Product(sku)
);

CREATE TABLE contains (
  order_no INT,
  sku VARCHAR(8),
  qty INT NOT NULL,
  PRIMARY KEY(order_no, sku),
  FOREIGN KEY(order_no) REFERENCES Orders(order_no),
  FOREIGN KEY(sku) REFERENCES Product(sku)
);

CREATE TABLE supplier (
  TIN VARCHAR(20) PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  address VARCHAR(255) NOT NULL,
  product_sku VARCHAR(8) NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (product_sku) REFERENCES Product(sku),
  CHECK(LENGTH(TIN) >= 1)
);

CREATE TABLE delivery (
  address VARCHAR(255),
  TIN VARCHAR(20),
  PRIMARY KEY(address, TIN),
  FOREIGN KEY (address) REFERENCES Warehouse(address),
  FOREIGN KEY (TIN) REFERENCES supplier(TIN),
  CHECK(LENGTH(TIN) >= 1)
);