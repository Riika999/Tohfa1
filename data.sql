-- Create Users Database
CREATE DATABASE UsersDB;
USE UsersDB;

-- Create Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Gifts Database
CREATE DATABASE GiftsDB;
USE GiftsDB;

-- Create Gifts Table
CREATE TABLE Gifts (
    gift_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    budget DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Occasions Table
CREATE TABLE Occasions (
    occasion_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Keywords Table
CREATE TABLE Keywords (
    keyword_id INT AUTO_INCREMENT PRIMARY KEY,
    keyword VARCHAR(50) NOT NULL UNIQUE
);

-- Create GiftOccasions Table (Many-to-Many Relationship)
CREATE TABLE GiftOccasions (
    gift_id INT,
    occasion_id INT,
    PRIMARY KEY (gift_id, occasion_id),
    FOREIGN KEY (gift_id) REFERENCES Gifts(gift_id) ON DELETE CASCADE,
    FOREIGN KEY (occasion_id) REFERENCES Occasions(occasion_id) ON DELETE CASCADE
);

-- Create GiftKeywords Table (Many-to-Many Relationship)
CREATE TABLE GiftKeywords (
    gift_id INT,
    keyword_id INT,
    PRIMARY KEY (gift_id, keyword_id),
    FOREIGN KEY (gift_id) REFERENCES Gifts(gift_id) ON DELETE CASCADE,
    FOREIGN KEY (keyword_id) REFERENCES Keywords(keyword_id) ON DELETE CASCADE
);

-- Create Orders Database (optional, if you want to track orders separately)
CREATE DATABASE OrdersDB;
USE OrdersDB;

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES UsersDB.Users(user_id) ON DELETE CASCADE
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    gift_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (gift_id) REFERENCES GiftsDB.Gifts(gift_id) ON DELETE CASCADE
);

-- Create Reviews Database (optional, if you want to track reviews separately)
CREATE DATABASE ReviewsDB;
USE ReviewsDB;

-- Create Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    gift_id INT,
    user_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (gift_id) REFERENCES GiftsDB.Gifts(gift_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES UsersDB.Users(user_id) ON DELETE CASCADE
);