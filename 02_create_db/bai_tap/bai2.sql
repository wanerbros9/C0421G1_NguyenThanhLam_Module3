CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer(
	cID int PRIMARY KEY,
    cName varchar(50),
    cAge int
);

CREATE TABLE `Order`(
	oID INT PRIMARY KEY,
    cID INT,
    oDate DATE,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product(
	pID INT PRIMARY KEY,
    pName VARCHAR(50),
    pPrice INT
);

CREATE TABLE OrderDetail(
	oID INT,
    pID INT,
    odQTY INT,
    FOREIGN KEY (pID) REFERENCES Product(pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID)
);