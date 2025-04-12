#   Bookstore Database Project Documentation

##   I. Project Overview

* **Project Title:** Bookstore Database
* **Project Goal:** To design and implement a relational database in MySQL to manage data for a bookstore's operations.
* **Key Features:**
    * Storage and management of information about books, authors, customers, orders, and shipping.
    * Efficient data retrieval and analysis.
    * User access control with different roles and privileges.
* **Tools and Technologies:**
    * MySQL: Relational Database Management System (RDBMS)
    * Draw.io: Database schema visualization (Optional but recommended)

##   II. Database Schema

* **Entity Relationship Diagram (ERD):**
    * (Ideally, an ERD would be included here as an image or a diagram created with Draw.io)
* **Table Descriptions:**

    ###   book

    * **Purpose:** Stores information about books.
    * **Columns:**
        * `book_id` INT PRIMARY KEY AUTO_INCREMENT - Unique identifier for each book.
        * `title` VARCHAR(255) NOT NULL - The title of the book.
        * `isbn` VARCHAR(20) UNIQUE NOT NULL - International Standard Book Number.
        * `language_id` INT FOREIGN KEY referencing book_language(language_id) - Language of the book.
        * `publisher_id` INT FOREIGN KEY referencing publisher(publisher_id) - Publisher of the book.
        * `publication_date` DATE - Date when the book was published.
        * `price` DECIMAL(10, 2) - Price of the book.
        * `page_count` INT - Number of pages in the book.

    ###   author

    * **Purpose:** Stores information about authors.
    * **Columns:**
        * `author_id` INT PRIMARY KEY AUTO_INCREMENT
        * `first_name` VARCHAR(100) NOT NULL
        * `last_name` VARCHAR(100) NOT NULL
        * `biography` TEXT

    ###   book_author

    * **Purpose:** Manages the many-to-many relationship between books and authors.
    * **Columns:**
        * `book_id` INT, FOREIGN KEY referencing book(book_id)
        * `author_id` INT, FOREIGN KEY referencing author(author_id)
        * PRIMARY KEY (book_id, author_id) - Composite primary key

    ###   book_language

    * **Purpose:** Stores a list of possible languages for books.
    * **Columns:**
        * `language_id` INT PRIMARY KEY AUTO_INCREMENT
        * `language_name` VARCHAR(50) NOT NULL UNIQUE

    ###   publisher

    * **Purpose:** Stores information about publishers.
    * **Columns:**
        * `publisher_id` INT PRIMARY KEY AUTO_INCREMENT
        * `publisher_name` VARCHAR(255) NOT NULL

    ###   Customer

    * **Purpose:** Stores information about customers.
    * **Columns:**
        * `customer_id` INT PRIMARY KEY AUTO_INCREMENT
        * `first_name` VARCHAR(100) NOT NULL
        * `last_name` VARCHAR(100) NOT NULL
        * `email` VARCHAR(255) UNIQUE NOT NULL
        * `phone_number` VARCHAR(20)

    ###   address_status

    * **Purpose:** Stores statuses for addresses (e.g., "current", "old").
    * **Columns:**
        * `address_status_id` INT PRIMARY KEY AUTO_INCREMENT
        * `status_name` VARCHAR(50) NOT NULL UNIQUE

    ###   country

    * **Purpose:** Stores a list of countries.
    * **Columns:**
        * `country_id` INT PRIMARY KEY AUTO_INCREMENT
        * `country_name` VARCHAR(100) NOT NULL UNIQUE

    ###   address

    * **Purpose:** Stores address information.
    * **Columns:**
        * `address_id` INT PRIMARY KEY AUTO_INCREMENT
        * `street_address` VARCHAR(255) NOT NULL
        * `city` VARCHAR(100) NOT NULL
        * `country_id` INT, FOREIGN KEY referencing country(country_id)
        * `postal_code` VARCHAR(20)

    ###   customer_address

    * **Purpose:** Links customers to their addresses and stores address status.
    * **Columns:**
        * `customer_id` INT, FOREIGN KEY referencing Customer(customer_id)
        * `address_id` INT, FOREIGN KEY referencing address(address_id)
        * `address_status_id` INT, FOREIGN KEY referencing address_status(address_status_id)
        * PRIMARY KEY (customer_id, address_id)

    ###   shipping_method

    * **Purpose:** Stores information about shipping methods.
    * **Columns:**
        * `shipping_method_id` INT PRIMARY KEY AUTO_INCREMENT
        * `method_name` VARCHAR(50) NOT NULL UNIQUE
        * `shipping_cost` DECIMAL(10, 2)

    ###   order_status

    * **Purpose:** Stores possible statuses for orders.
    * **Columns:**
        * `order_status_id` INT PRIMARY KEY AUTO_INCREMENT
        * `status_name` VARCHAR(50) NOT NULL UNIQUE

    ###   cust_order

    * **Purpose:** Stores information about customer orders.
    * **Columns:**
        * `order_id` INT PRIMARY KEY AUTO_INCREMENT
        * `customer_id` INT, FOREIGN KEY referencing Customer(customer_id)
        * `order_date` DATETIME NOT NULL
        * `shipping_method_id` INT, FOREIGN KEY referencing shipping_method(shipping_method_id)
        * `order_status_id` INT, FOREIGN KEY referencing order_status(order_status_id)

    ###   order_line

    * **Purpose:** Stores information about the books that are part of each order.
    * **Columns:**
        * `order_id` INT, FOREIGN KEY referencing cust_order(order_id)
        * `book_id` INT, FOREIGN KEY referencing book(book_id)
        * `quantity` INT NOT NULL
        * `unit_price` DECIMAL(10, 2) NOT NULL
        * PRIMARY KEY (order_id, book_id)

    ###   order_history

    * **Purpose:** Stores the history of order statuses.
    * **Columns:**
        * `order_history_id` INT PRIMARY KEY AUTO_INCREMENT
        * `order_id` INT, FOREIGN KEY referencing cust_order(order_id)
        * `order_status_id` INT, FOREIGN KEY referencing order_status(order_status_id)
        * `status_date` DATETIME NOT NULL

* **Table Relationships (Textual Description):**
    * The `book` table is related to the `author` table through the `book_author` table (many-to-many relationship).
    * The `book` table is related to the `book_language` and `publisher` tables through foreign keys.
    * The `Customer` table has a one-to-many relationship with the `cust_order` table.
    * The `cust_order` table is related to the `order_line`, `order_status`, and `shipping_method` tables through foreign keys.
    * The `customer_address` table links `Customer` to `address` and uses `address_status` to track address types.
    * The `address` table is related to the `country` table through a foreign key.
    * The `order_history` table tracks the history of orders by referencing `cust_order` and `order_status`.

##   III. User Roles and Privileges

* **User Roles:**
    * Administrator
    * Order Manager
    * Inventory Specialist
    * Customer Service Representative
* **Role Descriptions:**

    ###   Administrator

    * **Purpose:** Full control over the database.
    * **Privileges:** ALL PRIVILEGES
    * **Tables Accessed:** All tables

    ###   Order Manager

    * **Purpose:** Manages order processing and fulfillment.
    * **Privileges:**
        * SELECT, INSERT, UPDATE on `Customer`, `cust_order`, `order_line`
        * SELECT on `shipping_method`, `order_status`, `order_history`
    * **Tables Accessed:** `Customer`, `cust_order`, `order_line`, `shipping_method`, `order_status`, `order_history`

    ###   Inventory Specialist

    * **Purpose:** Manages book inventory.
    * **Privileges:** SELECT, INSERT, UPDATE, DELETE on `book`, `book_author`, `author`, `book_language`, `publisher`
    * **Tables Accessed:** `book`, `book_author`, `author`, `book_language`, `publisher`

    ###   Customer Service Representative

    * **Purpose:** Handles customer inquiries and support.
    * **Privileges:** SELECT on `Customer`, `cust_order`, `order_line`, `order_history`
    * **Tables Accessed:** `Customer`, `cust_order`, `order_line`, `order_history`

##   IV. Database Creation Script

```sql
--   CREATING DB
CREATE DATABASE bookstore_db;

--   USING DB
USE bookstore_db;

--   CREATING TABLES
--   1. BOOKS
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    language_id INT,   --   FOREIGN KEY to book_language
    publisher_id INT,  --   FOREIGN KEY to publisher
    publication_date DATE,
    price DECIMAL(10, 2),
    page_count INT
);

--   2. AUTHORS
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT
);

--   3. AUTHOR_BOOK
CREATE TABLE book_author (
    book_id INT,   --   FOREIGN KEY to book
    author_id INT, --   FOREIGN KEY to author
    PRIMARY KEY (book_id, author_id), --   Composite primary key
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

--   4. Book language
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

--   5. PUBLISHER
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) NOT NULL
);

--   6. customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

--   7. address_status
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

--   8. country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL UNIQUE
);

--   9.address
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country_id INT,   --   FOREIGN KEY to country
    postal_code VARCHAR(20),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

--   10.customer_address
CREATE TABLE customer_address (
    customer_id INT,  --   FOREIGN KEY to Customer
    address_id INT,   --   FOREIGN KEY to address
    address_status_id INT, --   FOREIGN KEY to address_status
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

--   11.shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    shipping_cost DECIMAL(10, 2)
);

--   12.order_status
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

--   13.cust_order
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,  --   FOREIGN KEY to Customer
    order_date DATETIME NOT NULL,
    shipping_method_id INT, --   FOREIGN KEY to shipping_method
    order_status_id INT,   --   FOREIGN KEY to order_status
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

--   14.order_line
CREATE TABLE order_line (
    order_id INT,  --   FOREIGN KEY to cust_order
    book_id INT,   --   FOREIGN KEY to book
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

--   15.order_history
CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,            --   FOREIGN KEY to cust_order
    order_status_id INT,   --   FOREIGN KEY to order_status
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);
