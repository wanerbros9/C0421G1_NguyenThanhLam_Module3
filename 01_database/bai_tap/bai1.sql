create database `student-management`;
use `student-management`;
create table student (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(45),
    `age` INT,
    `country` VARCHAR(45)
);

create table class (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(45)
);

create table teacher (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(45),
    `age` INT,
    `country` VARCHAR(45)
);

INSERT INTO teacher (`name`,`age`,`country`)
VALUES('tung',44,'Ha Noi');

INSERT INTO class (`name`)
VALUES('xxx');

INSERT INTO student (`name`,`age`,`country`)
VALUES ('lam',18,'Da Nang');

drop TABLE student;
TRUNCATE TABLE student;