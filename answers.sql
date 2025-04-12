-- CREATING DB 
CREATE DATABASE bookstore_db;

-- USING DB
USE bookstore_db;

-- CREATING TABLES
--1. BOOKS
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    language_id INT,   -- FOREIGN KEY to book_language
    publisher_id INT,  -- FOREIGN KEY to publisher
    publication_date DATE,
    price DECIMAL(10, 2),
    page_count INT
);

--2. AUTHORS
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT
);

-- 3. AUTHOR_BOOK
CREATE TABLE book_author (
    book_id INT,   -- FOREIGN KEY to book
    author_id INT, -- FOREIGN KEY to author
    PRIMARY KEY (book_id, author_id), -- Composite primary key
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 4. Book language
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

-- 5. PUBLISHER
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

-- 6. customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

-- 7. address_status
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

-- 8. country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL UNIQUE
);

-- 9.address
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country_id INT,  -- FOREIGN KEY to country
    postal_code VARCHAR(20),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- 10.customer_address
CREATE TABLE customer_address (
    customer_id INT,  -- FOREIGN KEY to Customer
    address_id INT,   -- FOREIGN KEY to address
    address_status_id INT, -- FOREIGN KEY to address_status
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);


-- 11.
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    shipping_cost DECIMAL(10, 2)
);



-- 12.
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);


-- 13.
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,  -- FOREIGN KEY to Customer
    order_date DATETIME NOT NULL,
    shipping_method_id INT, -- FOREIGN KEY to shipping_method
    order_status_id INT,   -- FOREIGN KEY to order_status
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);



-- 14.
CREATE TABLE order_line (
    order_id INT,  -- FOREIGN KEY to cust_order
    book_id INT,   -- FOREIGN KEY to book
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 15.
CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,          -- FOREIGN KEY to cust_order
    order_status_id INT,   -- FOREIGN KEY to order_status
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);