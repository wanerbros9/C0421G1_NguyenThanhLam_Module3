DROP DATABASE IF EXISTS demo;

CREATE DATABASE demo;

USE demo;

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(50),
    product_code VARCHAR(50),
    product_price FLOAT,
    product_amount int,
    product_description VARCHAR (50),
    product_status BOOLEAN
);

INSERT INTO product (product_name, product_code, product_price, product_amount, product_description, product_status)
VALUES ('egg', 'egg-111', 1000, 4, 'trung ga tuoi', 1),
		('meat', 'meat-222', 4500, 2, 'thit heo', 1),
		('fish', 'fish-333', 9000, 5, 'ca tuoi', 1);

ALTER TABLE product ADD INDEX idx_product(product_name, product_price);
ALTER TABLE product ADD INDEX idx_products(product_code);
EXPLAIN SELECT * FROM product WHERE product_name = 'egg';
EXPLAIN SELECT * FROM product WHERE product_code = 'egg-111';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

CREATE VIEW new_view
AS
SELECT product_code, product_name, product_price, product_status
FROM product;

CREATE OR REPLACE VIEW new_view AS
SELECT product_price,product_name
FROM products
WHERE product_price > 200; 

DROP VIEW new_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

DELIMITER //
CREATE PROCEDURE get_all()
BEGIN
SELECT *
FROM product;
END;
// DELIMITER ;

CALL get_all();

-- Tạo store procedure thêm một sản phẩm mới

DELIMITER //
CREATE PROCEDURE add_new(
new_product_name VARCHAR(50),
    new_product_code VARCHAR(50),
    new_product_price FLOAT,
    new_product_amount int,
    new_product_description VARCHAR (50),
    new_product_status BOOLEAN
)
BEGIN
INSERT INTO products (product_name,product_code,product_price,product_amount,product_description,product_status)
VALUES (new_product_name,new_product_code,new_product_price,new_product_amount,new_product_description,new_product_status);
END;
// DELIMITER ;
CALL add_new ('Lam', 'lam-123', 90000, 3, 'lam', 1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
CREATE PROCEDURE edit_by_id (
	id_test INT,
    new_product_name VARCHAR(50),
    new_product_code VARCHAR(50),
    new_product_price FLOAT,
    new_product_amount INT,
    new_product_description VARCHAR (50),
    new_product_status BOOLEAN
)
BEGIN
UPDATE products
SET product_name = new_product_name, product_code = new_product_code, product_price = new_product_price,
product_price = new_product_price, product_amount = new_product_amount , product_description = new_product_description,
product_status = product_status
WHERE id = id_test;
END;
// DELIMITER ;

CALL edit_by_id(4,'test','test123','test-111',2,'test',1);
CALL get_all();

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product_by_id (id_input INT )
BEGIN
DELETE FROM products 
WHERE id = id_input;
END;
// DELIMITER ;
call delete_product_by_id (4);
call get_all_profile();