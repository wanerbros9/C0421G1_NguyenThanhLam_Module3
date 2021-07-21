drop database IF EXISTS quan_ly_ban_hang;

CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE Customer(
	customer_id int PRIMARY KEY auto_increment,
    customer_name varchar(50),
    customer_age int
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY auto_increment,
    customer_id INT,
    order_date DATETIME,
    order_total_price INT ,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(25),
    product_price INT
);

CREATE TABLE order_detail(
	order_id INT,
    product_id INT,
    order_detail_qty INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

insert into customer(customer_name, customer_age)
values ('Minh Quan', 10),('Ngoc Oanh',20),('Hoang Ha',50);

insert into `order`(customer_id, order_date)
values (1,'2006-3-21'),(2,'2006-3-23'),(1,'2006-3-16');

INSERT INTO product(product_name, product_price)
VALUES ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

INSERT INTO Order_Detail(order_id,product_id,order_detail_qty)
VALUES (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);