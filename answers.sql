-- CREATING DB 
CREATE DATABASE bookstore_db;

-- USING DB
USE bookstore_db;

-- CREATING TABLES
-- 1. BOOKS
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

-- 2. AUTHORS
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


-- 11.shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    shipping_cost DECIMAL(10, 2)
);



-- 12.order_status
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);


-- 13.cust_order
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



-- 14.order_line
CREATE TABLE order_line (
    order_id INT,  -- FOREIGN KEY to cust_order
    book_id INT,   -- FOREIGN KEY to book
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 15.order_history
CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,          -- FOREIGN KEY to cust_order
    order_status_id INT,   -- FOREIGN KEY to order_status
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);


-- LOADING DATA

-- 1. loading countries
INSERT INTO country (country_name) VALUES
('USA'),
('Canada'),
('UK'),
('Germany'),
('France'),
('Japan'),
('Australia'),
('Brazil'),
('India'),
('Mexico');


-- 2. loading languages
INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('Spanish'),
('German'),
('Japanese'),
('Italian'),
('Chinese'),
('Russian'),
('Portuguese'),
('Hindi');


-- 3. loading address_status
INSERT INTO address_status (status_name) VALUES
('Current'),
('Old'),
('Vacation'),
('Business'),
('Previous'),
('Temporary'),
('Billing'),
('Shipping'),
('Main'),
('Secondary');

-- 4. loading authors
INSERT INTO author (first_name, last_name, biography) VALUES
('Stephen', 'King', 'Master of horror.'),
('J.K.', 'Rowling', 'Author of the Harry Potter series.'),
('George R.R.', 'Martin', 'Known for A Song of Ice and Fire.'),
('Jane', 'Austen', 'Classic novelist.'),
('Haruki', 'Murakami', 'Japanese contemporary writer.'),
('Agatha', 'Christie', 'Queen of Mystery.'),
('Ernest', 'Hemingway', 'American novelist and journalist.'),
('Gabriel Garcia', 'Marquez', 'Colombian Nobel laureate.'),
('Toni', 'Morrison', 'American author, Nobel laureate.'),
('Salman', 'Rushdie', 'British Indian novelist and essayist.');

-- 5. loading publishers
INSERT INTO publisher (publisher_name, city, country) VALUES
('Penguin Random House', 'New York', 'USA'),
('HarperCollins', 'New York', 'USA'),
('Macmillan', 'London', 'UK'),
('Simon & Schuster', 'New York', 'USA'),
('Hachette Livre', 'Paris', 'France'),
('Shueisha', 'Tokyo', 'Japan'),
('Bloomsbury', 'London', 'UK'),
('Grupo Planeta', 'Barcelona', 'Spain'),
('Bertelsmann', 'Gütersloh', 'Germany'),
('Oxford University Press', 'Oxford', 'UK');


-- 6.loading customers
INSERT INTO Customer (first_name, last_name, email, phone_number) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
('Robert', 'Jones', 'robert.jones@example.com', '555-123-4567'),
('Emily', 'Wilson', 'emily.wilson@example.com', '111-222-3333'),
('Michael', 'Brown', 'michael.brown@example.com', '444-555-6666'),
('Jessica', 'Davis', 'jessica.davis@example.com', '777-888-9999'),
('David', 'Garcia', 'david.garcia@example.com', '101-202-3030'),
('Ashley', 'Rodriguez', 'ashley.rodriguez@example.com', '404-505-6060'),
('Christopher', 'Williams', 'christopher.williams@example.com', '707-808-9090'),
('Amanda', 'Martinez', 'amanda.martinez@example.com', '121-323-4343');


-- 7.loading addresses
INSERT INTO address (street_address, city, country_id, postal_code) VALUES
('123 Main St', 'Anytown', 1, '12345'),
('456 Oak Ave', 'Springfield', 1, '54321'),
('789 Pine Ln', 'Toronto', 2, 'M5V 2N5'),
('101 Elm Rd', 'London', 3, 'SW1A 0AA'),
('222 Maple Dr', 'Berlin', 4, '10115'),
('333 Rue de la Paix', 'Paris', 5, '75002'),
('444 Ginza', 'Tokyo', 6, '104-0061'),
('555 Wallaby Way', 'Sydney', 7, '2000'),
('666 Avenida Paulista', 'Sao Paulo', 8, '01310-930'),
('777 Rajpath', 'New Delhi', 9, '110001');

-- 8. loading books
INSERT INTO book (title, isbn, language_id, publisher_id, publication_date, price, page_count) VALUES
('The Shining', '978-0385121722', 1, 1, '1977-01-28', 15.99, 447),
('Harry Potter and the Sorcerer''s Stone', '978-0747532696', 1, 7, '1997-06-26', 19.99, 309),
('A Game of Thrones', '978-0553103540', 1, 1, '1996-08-01', 25.50, 694),
('Pride and Prejudice', '978-0141439518', 1, 10, '1813-01-28', 12.00, 432),
('Norwegian Wood', '978-0375704024', 1, 1, '1987-09-10', 18.75, 296),
('Murder on the Orient Express', '978-0002310637', 1, 3, '1934-01-01', 14.25, 256),
('The Old Man and the Sea', '978-0684801223', 1, 4, '1952-09-01', 10.99, 127),
('One Hundred Years of Solitude', '978-0061120067', 3, 2, '1967-05-30', 21.00, 417),
('Beloved', '978-0307275539', 1, 1, '1987-10-07', 16.30, 324),
('Midnight''s Children', '978-0140062691', 1, 1, '1981-09-30', 17.49, 448);

-- 9. loading shipping methods
INSERT INTO shipping_method (method_name, shipping_cost) VALUES
('Standard', 5.99),
('Express', 12.50),
('Overnight', 25.00),
(' ground', 7.50),
(' international', 20.00),
(' expedited', 15.00),
(' priority', 10.00),
(' economy', 4.00),
(' local', 3.00),
(' freight', 30.00);

-- 10.loading order status
INSERT INTO order_status (status_name) VALUES
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled'),
('Returned'),
('Refunded'),
('On Hold'),
('Completed'),
('Disputed');

-- 11. loading orders
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_status_id) VALUES
(1, '2024-01-15 10:00:00', 1, 4),
(2, '2024-02-20 14:30:00', 2, 3),
(3, '2024-03-25 09:15:00', 1, 1),
(4, '2024-04-01 16:00:00', 3, 4),
(5, '2024-05-10 11:45:00', 2, 2),
(6, '2024-06-12 13:00:00', 1, 3),
(7, '2024-07-18 10:30:00', 3, 1),
(8, '2024-08-22 15:00:00', 2, 4),
(9, '2024-09-29 08:00:00', 1, 2),
(10, '2024-10-31 12:00:00', 3, 3);

-- 12. loading book_authors
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- 13. loading customer_addresses
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 3),
(6, 6, 1),
(7, 7, 4),
(8, 8, 1),
(9, 9, 5),
(10, 10, 1);

-- 14. loading order_lines
INSERT INTO order_line (order_id, book_id, quantity, unit_price) VALUES
(1, 1, 1, 15.99),
(2, 2, 2, 19.99),
(3, 3, 1, 25.50),
(4, 4, 3, 12.00),
(5, 5, 1, 18.75),
(6, 6, 2, 14.25),
(7, 7, 1, 10.99),
(8, 8, 1, 21.00),
(9, 9, 2, 16.30),
(10, 10, 1, 17.49);

-- 15. loading order_history
INSERT INTO order_history (order_id, order_status_id, status_date) VALUES
(1, 4, '2024-01-15 12:00:00'),
(2, 3, '2024-02-21 10:00:00'),
(3, 1, '2024-03-25 09:30:00'),
(4, 4, '2024-04-02 14:00:00'),
(5, 2, '2024-05-11 18:00:00'),
(6, 3, '2024-06-13 09:00:00'),
(7, 1, '2024-07-19 11:00:00'),
(8, 4, '2024-08-23 16:00:00'),
(9, 2, '2024-09-30 10:00:00'),
(10, 3, '2024-11-01 13:00:00');

