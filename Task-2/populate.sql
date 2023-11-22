-- Populate Customers
INSERT INTO Customer(email, name, address, phone) VALUES
  ('john@example.com', 'John Doe', '123 Main St', '1234567890'),
  ('jane@example.com', 'Jane Doe', '456 Maple St', '2345678901'),
  ('bob@example.com', 'Bob Smith', '789 Pine St', '3456789012'),
  ('jack@example.com', 'Jack Sparrow', '333 Side Street', '112223443'),
  ('matt@example.com', 'Matt Stonie', '111 Big Street', '1111111111'),
  ('sarah@example.com', 'Sarah Johnson', '12 Elm St', '4567891230'),
  ('dave@example.com', 'Dave Peterson', '234 Oak St', '5678912341'),
  ('lisa@example.com', 'Lisa Thomas', '567 Willow St', '6789123452'),
  ('steve@example.com', 'Steve Adams', '901 Maple Ave', '7891234563'),
  ('emily@example.com', 'Emily Davis', '345 Pine Lane', '8912345674'),
  ('nick@example.com', 'Nick Miller', '678 Spruce Dr', '9123456785'),
  ('julia@example.com', 'Julia Anderson', '1021 Birch Pkwy', '1234567896'),
  ('andy@example.com', 'Andy Simmons', '456 Cedar Rd', '2345678907'),
  ('samantha@example.com', 'Samantha Bernard', '789 Palm Blvd', '3456789018'),
  ('alex@example.com', 'Alex Thompson', '1234 Fir St', '4567890129'),
  ('kate@example.com', 'Kate Martinez', '5678 Elm Ave', '5678901230'),
  ('greg@example.com', 'Greg Wilson', '9012 Oak Lane', '6789012341'),
  ('olivia@example.com', 'Olivia Hill', '3456 Willow Dr', '7890123452'),
  ('jeff@example.com', 'Jeff Jenkins', '7890 Maple Pkwy', '8901234563'),
  ('anna@example.com', 'Anna Adams', '12345 Pine Rd', '9012345674');


-- Populate Products
INSERT INTO Product(sku, name, description, price) VALUES
  ('SKU12345', 'Product 1', 'This is Product 1', 30.00),
  ('SKU23456', 'Product 2', 'This is Product 2', 40.00),
  ('SKU34567', 'Product 3', 'This is Product 3', 80.00),
  ('SKU23232',  'Product 4', 'This is Product 4', 23.00),
  ('SKU30112','Product 4', 'This is Product 4', 45.00),
  ('SKU27101','Product 5', 'This is Product 5', 37.00),
  ('SKU10235','Product 6', 'This is Product 6', 120.00),
  ('SKU88901', 'Product 7', 'This is Product 7', 542.00),
  ('SKU29051', 'Product 8', 'This is Product 8', 50.01),
  ('SKU70231','Product 9', 'This is Product 9', 67.00),
  ('SKU69690', 'Product 10', 'This is Product 10', 55.00);

-- Populate Orders
INSERT INTO Orders(date, cust_no) VALUES
  ('2023-01-01', 1),
  ('2023-02-01', 2),
  ('2023-03-01', 3),
  ('2003-11-01', 4),
  ('2009-01-10', 6),
  ('2010-08-03', 19),
  ('2014-04-21', 3),
  ('2017-07-12', 6),
  ('2000-12-06', 1),
  ('2008-04-28', 15),
  ('2011-12-14', 1),
  ('2014-10-24', 1),
  ('2016-08-05', 15),
  ('2000-04-16', 20),
  ('2005-12-22', 3),
  ('2007-11-04', 14),
  ('2008-07-10', 3),
  ('2015-07-31', 14),
  ('2001-01-03', 3),
  ('2001-04-20', 17),
  ('2006-03-16', 3),
  ('2019-11-10', 17),
  ('2020-02-09', 20),
  ('2004-10-26', 3),
  ('2014-10-18', 5),
  ('2017-04-12', 5),
  ('2017-08-09', 3),
  ('2018-07-03', 3);

-- Populate contains
INSERT INTO contains(order_no, sku, qty) VALUES
  (1, 'SKU12345', 2),
  (2, 'SKU23456', 3),
  (3, 'SKU34567', 1),
  (3, 'SKU69690', 3),
  (3, 'SKU10235', 1),
  (20, 'SKU12345', 2),
  (18, 'SKU29051', 1),
  (15, 'SKU70231', 4),
  (8, 'SKU30112', 1),
  (8, 'SKU88901', 1),
  (8, 'SKU70231', 1);


-- Populate Sale
INSERT INTO Sale(order_no) VALUES
  (1),
  (2),
  (3),
  (5),
  (6),
  (10),
  (13),
  (15),
  (20);

-- Populate pay
INSERT INTO pay(order_no, cust_no) VALUES
  (1, 1),
  (2, 2),
  (5, 6),
  (6, 19),
  (10, 15),
  (13, 15),
  (15, 3),
  (20, 17),
  (3, 3);

-- Populate Employees
INSERT INTO Employee(ssn, TIN, bdate, name) VALUES
  ('123456789', 'TIN123', '1980-01-01', 'Employee 1'),
  ('234567890', 'TIN234', '1981-02-01', 'Employee 2'),
  ('345678901', 'TIN345', '1982-03-01', 'Employee 3');

-- Populate Workplace
INSERT INTO Workplace(address, lat, long) VALUES
  ('Workplace 1', 47.123456, -122.123456),
  ('Workplace 2', 48.234567, -123.234567),
  ('Workplace 3', 49.345678, -124.345678),
  ('Workplace 4', 51.345678, -110.345678),
  ('Workplace 5', 52.345678, -118.345678),
  ('Workplace 6', 49.345678, -127.345678);

-- Populate Office
INSERT INTO Office(address) VALUES
  ('Workplace 1'),
  ('Workplace 2'),
  ('Workplace 5');

-- Populate Warehouse
INSERT INTO Warehouse(address) VALUES
  ('Workplace 2'),
  ('Workplace 3'),
  ('Workplace 4'),
  ('Workplace 6');

-- Populate Department
INSERT INTO Department(name) VALUES
  ('Department 1'),
  ('Department 2'),
  ('Department 3'),
  ('Department 5'),
  ('Department 6'),
  ('Department 7');

-- Populate works
INSERT INTO works(ssn, name, address) VALUES
  ('123456789', 'Department 1', 'Workplace 1'),
  ('234567890', 'Department 2', 'Workplace 2'),
  ('345678901', 'Department 3', 'Workplace 3');

INSERT INTO process(ssn, order_no)
SELECT ssn, 1 FROM Employee;
