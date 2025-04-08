--Create Table Products
Drop Table if Exists Products
CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(100),
 brand VARCHAR(50),
 category VARCHAR(50),
 procurement_cost_per_unit INT,
 mrp INT
);

INSERT INTO products VALUES
(12345, 'HP XYZ Mouse', 'HP', 'mouse', 650, 1500),
(12346, 'HP 241H HP', 'laptop', 'HP', 45000, 80000),
(12347, 'HP 8GB Pendrive', 'HP', 'pendrive', 350, 800),
(12348, 'Dell ABC Mouse', 'Dell', 'mouse', 350, 1100),
(12349, 'Dell AX420', 'Dell', 'laptop', 30000, 75000),
(12350, 'Dell 8GB Pendrive', 'Dell', 'pendrive', 250, 850);

Select *
From Products


--Create Table Customers
Drop Table if Exists Customers
CREATE TABLE customers (
    cust_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    primary_pincode INT,
    gender VARCHAR(10),
    dob DATE,
    joining_date DATE
);

INSERT INTO customers VALUES
(10000001, 'Rahul', 'Gupta', 'rahul.gupta@email.com', '8960722319', 110001, 'male', '1977-11-02', '2016-02-19'),
(10000002, 'Abhinav', 'Sharma', 'abhinav.sharma@gmail.com', '8987582863', 400001, 'male', '1995-09-26', '2018-10-12'),
(10000003, 'Anubhav', 'Patel', 'anubhav.patel@gmail.com', '8492146048', 560001, 'male', '1986-12-26', '2016-10-14'),
(10000004, 'Neha', 'Verma', 'neha.verma@gmail.com', '8631861914', 600001, 'female', '1986-01-20', '2017-05-05'),
(10000005, 'John', 'Bernard', 'john.bernard@gmail.com', '8215391844', 500001, 'male', '1980-02-12', '2019-03-13'),
(10000006, 'Muhammad', 'Ali', 'muhammad.ali@gmail.com', '8317878411', 700001, 'male', '1968-12-29', '2019-03-13'),
(10000007, 'Ahmed', 'Khan', 'ahmed.khan@gmail.com', '8279227825', 410001, 'male', '1999-01-14', '2018-07-13'),
(10000008, 'Paras', 'Rana', 'paras.rana@gmail.com', '8134672373', 400091, 'male', '1985-02-16', '2020-02-23'),
(10000009, 'Priyanka', 'Reddy', 'priyanka.reddy@yahoo.com', '8186127747', 560001, 'female', '1992-08-26', '2010-11-24'),
(10000010, 'Amit', 'Vikram', 'amit.vikram@yahoo.com', '8204474821', 600001, 'male', '1996-04-14', '2009-08-23'),
(10000011, 'Sandhya', 'Anwar', 'sandhya.anwar@outlook.com', '8701866147', 500001, 'female', '2002-11-11', '2010-04-12'),
(10000012, 'Robert', 'Smith', 'robert.smith@outlook.com', '8932312347', 710001, 'male', '1980-01-16', '2009-11-30'),
(10000013, 'Christina', 'Smith', 'christina.smith@outlook.com', '8861486811', 400001, 'female', '1980-01-16', '2008-08-29'),
(10000014, 'Amanpreet', 'Singh', 'amanpreet.singh@yahoo.com', '8151596539', 110001, 'male', '1980-03-10', '1980-03-10');
  
Select *
From Customers

--Create DeliveryPerson
Drop Table if Exists DeliveryPerson
CREATE TABLE deliveryperson (
    delivery_person_id INT,
    name VARCHAR(100),
    joining_date DATE,
    pincode INT
);

INSERT INTO deliveryperson VALUES
(1000008, 'Indranoor Singh', '2007-03-08', 110001),
(1000002, 'Simon Williams', '2007-02-23', 400001),
(1000004, 'Anubhav Tyagi', '2007-11-16', 400001),
(1000006, 'Aviral Vats', '2007-11-16', 400001),
(1000009, 'Rocky Tiwari', '2007-11-16', 400001),
(1000003, 'Robert Langdon', '2007-07-18', 500001),
(1000001, 'Vivek Gandhi', '2007-03-13', 560001),
(1000010, 'Sanjay Krishnan', '2007-11-24', 600001),
(1000005, 'Saurabh Ganguly', '2007-10-01', 700001),
(1000007, 'Qutub Mohammad', '2007-10-01', 700001);

Select *
From  DeliveryPerson


--Create Table Pincode
Drop Table if Exists Pincode
CREATE TABLE Pincode (
    Pincode INT,
    City VARCHAR(50),
    State VARCHAR(50)
);

INSERT INTO Pincode (Pincode, City, State) VALUES
(110001, 'New Delhi', 'New Delhi'),
(400001, 'Mumbai', 'Maharastra'),
(560001, 'Bangalore', 'Karnataka'),
(600001, 'Chennai', 'Tamil Nadu'),
(500001, 'Hyderabad', 'Telangana'),
(700001, 'Kolkata', 'West Bengal');

Select *
From Pincode


--Create Table Orders
Drop Table if Exists Orders
CREATE TABLE Orders (
    order_id INT,
    order_type VARCHAR(10),
    cust_id BIGINT,
    order_date DATE,
    delivery_date DATE,
    tot_units INT,
    displayed_selling_price_per_unit DECIMAL(10, 2),
    total_amount_paid DECIMAL(12, 2),
    product_id BIGINT,
    delivery_person_id BIGINT,
    payment_type VARCHAR(20),
    delivery_pincode INT
);

Select *
From Orders