DROP DATABASE demo;

CREATE DATABASE demo;
use demo;
CREATE TABLE users(
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);


insert into users(`name`, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(`name`, email, country) values('Lam','lam@gmail.com','Viet Nam');
insert into users(`name`, email, country) values('Quan','quan@gmail.com','Thai Lan');
insert into users(`name`, email, country) values('Danh','danh@codegym.vn','Trung Quoc');
insert into users(`name`, email, country) values('Kante','kante@che.uk','Kenia');

SELECT id,`name`, email, country from users;

INSERT INTO users VALUE (`name`, email, country);

SELECT `name`, email FROM users WHERE country = ?;

SELECT id,`name`, email, country from users ORDER BY `name`;