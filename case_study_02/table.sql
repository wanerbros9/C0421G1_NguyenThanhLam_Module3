DROP DATABASE IF EXISTS furama_resort_01;

CREATE DATABASE furama_resort_01;

USE furama_resort_01;

CREATE TABLE `position`(
	position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name VARCHAR(45)
);

CREATE TABLE education_degree(
	education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
    education_degree_name VARCHAR(45)
);

CREATE TABLE division(
	division_id INT PRIMARY KEY AUTO_INCREMENT,
    division_name VARCHAR(45)
);

CREATE TABLE `role`(
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255)
);

CREATE TABLE `user`(
	user_name VARCHAR(255) PRIMARY KEY,
    `password` VARCHAR(255)
);

CREATE TABLE user_role(
	role_id INT,
    user_name VARCHAR(255),
    FOREIGN KEY (role_id) REFERENCES `role`(role_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (user_name) REFERENCES `user`(user_name)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE employee(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    employee_birthday DATE,
    employee_id_card VARCHAR(45),
    employee_salary VARCHAR(45),
    employee_phone VARCHAR(45),
    employee_email VARCHAR(45),
    employee_address VARCHAR(45),
    user_name VARCHAR(255),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (education_degree_id) REFERENCES education_degree(education_degree_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (division_id) REFERENCES division(division_id) 
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (user_name) REFERENCES `user`(user_name)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE customer_type(
	customer_type_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_type_name VARCHAR(45)
);

CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_type_id INT,
    customer_name VARCHAR(45),
    customer_birthday DATE,
    customer_gender BOOLEAN,
    customer_id_card VARCHAR(45),
    customer_phone VARCHAR(45),
    customer_email VARCHAR(45),
    customer_address VARCHAR(45),
    FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE rent_type(
	rent_type_id INT PRIMARY KEY AUTO_INCREMENT,
    rent_type_name VARCHAR(45),
    rent_type_cost INT
);

CREATE TABLE service_type(
	service_type_id INT PRIMARY KEY AUTO_INCREMENT,
    service_type_name VARCHAR(45)
);

CREATE TABLE service(
	service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(45),
    service_area INT,
    service_cost VARCHAR(45),-- chi phi thue
    service_max_people VARCHAR(45),
    rent_type_id INT,
    service_type_id INT,
    standard_room VARCHAR(45),
    description_other_convinience VARCHAR(45),
    pool_area INT,
    number_of_floors INT,
    FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE contract(
	contract_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    customer_id INT,
    service_id INT,
    contract_start_date DATE,
    contract_end_date DATE,
    contract_deposit INT,
    contract_total_money INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (service_id) REFERENCES service(service_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE attach_service(
	attach_service_id INT PRIMARY KEY AUTO_INCREMENT,
    attach_service_name VARCHAR(45),
    attach_service_cost INT,
    attach_service_unit VARCHAR(45),
    attach_service_status VARCHAR(45)
);

CREATE TABLE contract_detail(
	contract_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    contract_id INT,
    attach_service_id INT,
    quantity INT,
    FOREIGN KEY (contract_id) REFERENCES contract(contract_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (attach_service_id) REFERENCES attach_service(attach_service_id)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

INSERT INTO `position`(position_name)
VALUES ('Lễ tân'),
		('Phục vụ'),
        ('Chuyên viên'),
        ('Giám sát'),
        ('Quản lý'),
        ('Giám đốc');
        
INSERT INTO education_degree(education_degree_name)
VALUES ('Trung cấp'),
		('Cao đẳng'),
		('Đại học'),
		('Sau đại học');
        
INSERT INTO division(division_name)
VALUES ('Sale-Marketing'),
		('Hành chính'),
		('Phục vụ'),
		('Quản lý');

INSERT INTO employee(employee_name, position_id, education_degree_id, division_id, employee_birthday,employee_id_card, employee_salary, employee_phone, employee_email, employee_address)
VALUES ('Lâm', 2, 3, 3, '1998-10-16', 201757954, 10000, 0825161098, 'lam@gmail.com', 'Đà Nẵng'),
		('Khoa', 1, 1, 3, '2000-05-11', 201751546, 5000, 0917657904, 'khoa@gmail.com', 'Huế'),
		('Tùng', 5, 4, 4, '1992-03-18', 201718628, 35000, 0818467035, 'tung@gmail.com', 'Vinh'),
		('Huy', 6, 4, 2, '1991-12-12', 201792127, 50000, 0818467035, 'thanh@gmail.com', 'Quảng Trị');

INSERT INTO customer_type(customer_type_name)
VALUES ('Diamond'),
		('Platinium'),
        ('Gold'),
        ('Silver'),
        ('Member');

INSERT INTO customer(customer_type_id, customer_name, customer_birthday, customer_id_card, customer_phone, customer_email, customer_address)
VALUES (5, 'Minh', '2020-10-06', 201562744, 0843670087, 'minh@gmail.com', 'Đà Nẵng'),
		(1, 'Danh', '1997-08-22', 201684297, 0394581627, 'danh@gmail.com', 'Huế'),
		(1, 'Toàn', '1994-11-11', 201251983, 0871555364, 'toan@gmail.com', 'Vinh'),
		(2, 'Uyên', '1996-01-28', 201523799, 0177646469, 'uyen@gmail.com', 'Quảng Trị'),
		(4, 'Hiền', '1997-07-17', 201588114, 0111346999, 'hien@gmail.com', 'Đà Nẵng'),
		(1, 'Tiến', '1993-09-17', 201599988, 0111312999, 'tien@gmail.com', 'Đà Nẵng');
        
INSERT INTO service_type(service_type_name)
VALUES ('Villa'),
		('House'),
        ('Room');

INSERT INTO rent_type(rent_type_name, rent_type_cost)
VALUES ('Năm',50000),
		('Tháng',30000),
        ('Ngày',10000),
        ('Giờ',5000);
        
INSERT INTO service(service_name, service_area,service_cost, service_max_people, rent_type_id, service_type_id, standard_room, description_other_convinience, pool_area, number_of_floors)
VALUES ('Ocean Villa', 100, 5000000, 10, 2, 1, 'VVIP', 'Mạng riêng tư', 40, 3),
		('Sand Room', 30, 60000, 2, 1, 3,NULL, 'Nước miễn phí', NULL, NULL),
        ('Wind House', 80, 3000000, 4, 3, 2, 'FAMILY', 'Giường nhỏ', NULL, 2);

INSERT INTO attach_service(attach_service_name, attach_service_cost, attach_service_unit, attach_service_status)
VALUES ('Massage', 100000, 'Lượt', 'Khả dụng'),
		('Karaoke', 250000, 'Giờ', 'Khả dụng'),
        ('Thức ăn', 50000, 'Dĩa', 'Khả dụng'),
        ('Nước uống', 10000, 'Chai', 'Khả dụng'),
        ('Thuê xe tham quan resort', 150000, 'Xe', 'Khả dụng');
        
INSERT INTO contract(employee_id, customer_id, service_id, contract_start_date, contract_end_date, contract_deposit)
VALUES (2, 2, 3, '2021-07-14', '2021-08-11', 50000),
		(1, 2, 1, '2021-01-24', '2021-09-02', 50000),
		(4, 6, 1, '2019-04-30', '2019-09-02', 50000),
		(3, 1, 1, '2018-06-29', '2018-12-19', 70000),
		(4, 3, 2, '2021-03-17', '2021-10-16', 90000);
        
INSERT INTO contract_detail(contract_id, attach_service_id, quantity)
VALUES (1, 3, 5),
		(2, 1, 2),
        (3, 5, 3),
        (5, 4, 2);

        
        
        
        