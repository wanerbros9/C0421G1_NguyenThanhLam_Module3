drop DATABASE IF EXISTS final;

CREATE DATABASE final;

use final;

CREATE table product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    product_price INT,
    product_quantity INT,
    product_color VARCHAR(255)
);

CREATE TABLE category(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(55)
);
