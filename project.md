# Bookstore Database Project Documentation

## I. Project Overview

* **Project Title:** Bookstore Database
* **Project Goal:** To design and implement a relational database in MySQL to manage data for a bookstore's operations.
* **Key Features:**
    * Storage and management of information about books, authors, customers, orders, and shipping. [cite: 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
    * Efficient data retrieval and analysis. [cite: 5]
    * User access control with different roles and privileges. [cite: 4]
* **Tools and Technologies:**
    * MySQL: Relational Database Management System (RDBMS) [cite: 4]
    * Draw.io: Database schema visualization (Optional but recommended) [cite: 4]

## II. Database Schema

* **Entity Relationship Diagram (ERD):**
    * (Ideally, an ERD would be included here as an image or a diagram created with Draw.io)
* **Table Descriptions:**

    ### book

    * **Purpose:** Stores information about books. [cite: 8]
    * **Columns:**
        * `book_id` INT PRIMARY KEY AUTO_INCREMENT - Unique identifier for each book.
        * `title` VARCHAR(255) NOT NULL - The title of the book.
        * `isbn` VARCHAR(20) UNIQUE NOT NULL - International Standard Book Number.
        * `language_id` INT FOREIGN KEY referencing book_language(language_id) - Language of the book. [cite: 10]
        * `publisher_id` INT FOREIGN KEY referencing publisher(publisher_id) - Publisher of the book. [cite: 10]
        * `publication_date` DATE - Date when the book was published.
        * `price` DECIMAL(10, 2) - Price of the book.
        * `page_count` INT - Number of pages in the book.

    ### book_author

    * **Purpose:** Manages the many-to-many relationship between books and authors. [cite: 9]
    * **Columns:**
        * `book_id` INT, FOREIGN KEY referencing book(book_id)
        * `author_id` INT, FOREIGN KEY referencing author(author_id)
        * PRIMARY KEY (book_id, author_id) - Composite primary key

    ### author

    * **Purpose:** Stores information about authors. [cite: 9]
    * **Columns:**
        * `author_id` INT PRIMARY KEY AUTO_INCREMENT
        * `first_name` VARCHAR(100) NOT NULL
        * `last_name` VARCHAR(100) NOT NULL
        * `biography` TEXT

    ### book_language

    * **Purpose:** Stores a list of possible languages for books. [cite: 10]
    * **Columns:**
        * `language_id` INT PRIMARY KEY AUTO_INCREMENT
        * `language_name` VARCHAR(50) NOT NULL UNIQUE

    ### publisher

    * **Purpose:** Stores information about publishers. [cite: 10]
    * **Columns:**
        * `publisher_id` INT PRIMARY KEY AUTO_INCREMENT
        * `publisher_name` VARCHAR(255) NOT NULL
        * `city` VARCHAR(100)
        * `country` VARCHAR(100)

    ### Customer

    * **Purpose:** Stores information about customers. [cite: 11]
    * **Columns:**
        * `customer_id` INT PRIMARY KEY AUTO_INCREMENT
        * `first_name` VARCHAR(100) NOT NULL
        * `last_name` VARCHAR(100) NOT NULL
        * `email` VARCHAR(255) UNIQUE NOT NULL
        * `phone_number` VARCHAR(20)

    ### customer_address

    * **Purpose:** Links customers to their addresses and stores address status. [cite: 11, 12]
    * **Columns:**
        * `customer_id` INT, FOREIGN KEY referencing Customer(customer_id)
        * `address_id` INT, FOREIGN KEY referencing address(address_id) [cite: 13]
        * `address_status_id` INT, FOREIGN KEY referencing address_status(address_status_id) [cite: 12]
        * PRIMARY KEY (customer_id, address_id)

    ### address_status

    * **Purpose:** Stores statuses for addresses (e.g., "current", "old"). [cite: 12]
    * **Columns:**
        * `address_status_id` INT PRIMARY KEY AUTO_INCREMENT
        * `status_name` VARCHAR(50) NOT NULL UNIQUE

    ### address

    * **Purpose:** Stores address information. [cite: 13]
    * **Columns:**
        * `address_id` INT PRIMARY KEY AUTO_INCREMENT
        * `street_address` VARCHAR(255) NOT NULL
        * `city` VARCHAR(100) NOT NULL
        * `country_id` INT, FOREIGN KEY referencing country(country_id) [cite: 14]
        * `postal_code` VARCHAR(20)

    ### country

    * **Purpose:** Stores a list of countries. [cite: 14]
    * **Columns:**
        * `country_id` INT PRIMARY KEY AUTO_INCREMENT
        * `country_name` VARCHAR(100) NOT NULL UNIQUE

    ### cust_order

    * **Purpose:** Stores information about customer orders. [cite: 14]
    * **Columns:**
        * `order_id` INT PRIMARY KEY AUTO_INCREMENT
        * `customer_id` INT, FOREIGN KEY referencing Customer(customer_id) [cite: 11]
        * `order_date` DATETIME NOT NULL
        * `shipping_method_id` INT, FOREIGN KEY referencing shipping_method(shipping_method_id) [cite: 16]
        * `order_status_id` INT, FOREIGN KEY referencing order_status(order_status_id) [cite: 18]

    ### order_line

    * **Purpose:** Stores information about the books that are part of each order. [cite: 15]
    * **Columns:**
        * `order_id` INT, FOREIGN KEY referencing cust_order(order_id) [cite: 14]
        * `book_id` INT, FOREIGN KEY referencing book(book_id) [cite: 8]
        * `quantity` INT NOT NULL
        * `unit_price` DECIMAL(10, 2) NOT NULL
        * PRIMARY KEY (order_id, book_id)

    ### shipping_method

    * **Purpose:** Stores information about shipping methods. [cite: 16]
    * **Columns:**
        * `shipping_method_id` INT PRIMARY KEY AUTO_INCREMENT
        * `method_name` VARCHAR(50) NOT NULL UNIQUE
        * `shipping_cost` DECIMAL(10, 2)

    ### order_history

    * **Purpose:** Stores the history of order statuses. [cite: 17]
    * **Columns:**
        * `order_history_id` INT PRIMARY KEY AUTO_INCREMENT
        * `order_id` INT, FOREIGN KEY referencing cust_order(order_id) [cite: 14]
        * `order_status_id` INT, FOREIGN KEY referencing order_status(order_status_id) [cite: 18]
        * `status_date` DATETIME NOT NULL

    ### order_status

    * **Purpose:** Stores possible statuses for orders. [cite: 18]
    * **Columns:**
        * `order_status_id` INT PRIMARY KEY AUTO_INCREMENT
        * `status_name` VARCHAR(50) NOT NULL UNIQUE

* **Table Relationships (Textual Description):**
    * The `book` table is related to the `author` table through the `book_author` table (many-to-many relationship). [cite: 9]
    * The `book` table is related to the `book_language` and `publisher` tables through foreign keys. [cite: 10]
    * The `Customer` table has a one-to-many relationship with the `cust_order` table. [cite: 11, 14]
    * The `cust_order` table is related to the `order_line`, `order_status`, and `shipping_method` tables through foreign keys. [cite: 14, 15, 16, 18]
    * The `customer_address` table links `Customer` to `address` and uses `address_status` to track address types. [cite: 11, 12, 13]
    * The `address` table is related to the `country` table through a foreign key. [cite: 13, 14]
    * The `order_history` table tracks the history of orders by referencing `cust_order` and `order_status`. [cite: 14, 17, 18]

## III. User Roles and Privileges

* **User Roles:**
    * Administrator
    * Order Manager
    * Inventory Specialist
    * Customer Service Representative
* **Role Descriptions:**

    ### Administrator

    * **Purpose:** Full control over the database.
    * **Privileges:** ALL PRIVILEGES
    * **Tables Accessed:** All tables

    ### Order Manager

    * **Purpose:** Manages order processing and fulfillment.
    * **Privileges:**
        * SELECT, INSERT, UPDATE on `Customer`, `cust_order`, `order_line`
        * SELECT on `shipping_method`, `order_status`, `order_history`
    * **Tables Accessed:** `Customer`, `cust_order`, `order_line`, `shipping_method`, `order_status`, `order_history`

    ### Inventory Specialist

    * **Purpose:** Manages book inventory.
    * **Privileges:** SELECT, INSERT, UPDATE, DELETE on `book`, `book_author`, `author`, `book_language`, `publisher`
    * **Tables Accessed:** `book`, `book_author`, `author`, `book_language`, `publisher`

    ### Customer Service Representative

    * **Purpose:** Handles customer inquiries and support.
    * **Privileges:** SELECT on `Customer`, `cust_order`, `order_line`, `order_history`
    * **Tables Accessed:** `Customer`, `cust_order`, `order_line`, `order_history`

## IV. Database Creation Script

```sql
CREATE DATABASE bookstore_db;

USE bookstore_db;

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

CREATE TABLE book_author (
    book_id INT,   -- FOREIGN KEY to book
    author_id INT, -- FOREIGN KEY to author
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT
);

CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

CREATE TABLE customer_address (
    customer_id INT,  -- FOREIGN KEY to Customer
    address_id INT,   -- FOREIGN KEY to address
    address_status_id INT, -- FOREIGN KEY to address_status
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country_id INT,  -- FOREIGN KEY to country
    postal_code VARCHAR(20),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL UNIQUE
);

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

CREATE TABLE order_line (
    order_id INT,  -- FOREIGN KEY to cust_order
    book_id INT,   -- FOREIGN KEY to book
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    shipping_cost DECIMAL(10, 2)
);

CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,          -- FOREIGN KEY to cust_order
    order_status_id INT,   -- FOREIGN KEY to order_status
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);