DROP DATABASE IF EXISTS furama_resort;

CREATE DATABASE furama_resort;

USE furama_resort;

CREATE TABLE vi_tri(
	id_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do(
	id_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan(
	id_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien(
	id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ten_nhan_vien VARCHAR(45),
    id_vi_tri INT,
    id_trinh_do INT,
    id_bo_phan INT,
    ngay_sinh DATE,
    so_CMTND VARCHAR(45),
    luong VARCHAR(45),
    sdt VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_vi_tri) REFERENCES vi_tri(id_vi_tri)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (id_trinh_do) REFERENCES trinh_do(id_trinh_do)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (id_bo_phan) REFERENCES bo_phan(id_bo_phan) 
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE loai_khach(
	id_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang(
	id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    id_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_CMTND VARCHAR(45),
    sdt VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_loai_khach) REFERENCES loai_khach(id_loai_khach)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE kieu_thue(
	id_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45),
    gia INT
);

CREATE TABLE loai_dich_vu(
	id_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu(
	id_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    so_tang INT,
    so_nguoi_toi_da VARCHAR(45),
    chi_phi_thue VARCHAR(45),
    id_kieu_thue INT,
    id_loai_dich_vu INT,
    trang_thai VARCHAR(45),
    FOREIGN KEY (id_kieu_thue) REFERENCES kieu_thue(id_kieu_thue)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (id_loai_dich_vu) REFERENCES loai_dich_vu(id_loai_dich_vu)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE hop_dong(
	id_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    id_nhan_vien INT,
    id_khach_hang INT,
    id_dich_vu INT,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc INT,
    tong_tien INT,
    FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id_nhan_vien)nhan_vien
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id_khach_hang)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (id_dich_vu) REFERENCES dich_vu(id_dich_vu)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE dich_vu_di_kem(
	id_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia INT,
    don_vi VARCHAR(45),
    trang_thai_kha_dung VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet(
	id_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    id_hop_dong INT,
    id_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (id_hop_dong) REFERENCES hop_dong(id_hop_dong)
    ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (id_dich_vu_di_kem) REFERENCES dich_vu_di_kem(id_dich_vu_di_kem)
    ON DELETE CASCADE 
	ON UPDATE CASCADE
);

INSERT INTO vi_tri(ten_vi_tri)
VALUES ('Lễ tân'),
		('Phục vụ'),
        ('Chuyên viên'),
        ('Giám sát'),
        ('Quản lý'),
        ('Giám đốc');
        
INSERT INTO trinh_do(trinh_do)
VALUES ('Trung cấp'),
		('Cao đẳng'),
		('Đại học'),
		('Sau đại học');
        
INSERT INTO bo_phan(ten_bo_phan)
VALUES ('Sale-Marketing'),
		('Hành chính'),
		('Phục vụ'),
		('Quản lý');

INSERT INTO nhan_vien(ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh,so_CMTND, luong, sdt, email, dia_chi)
VALUES ('Lâm', 2, 3, 3, '1998-10-16', 201757954, 10000, 0825161098, 'lam@gmail.com', 'Đà Nẵng'),
		('Khoa', 1, 1, 3, '2000-05-11', 201751546, 5000, 0917657904, 'khoa@gmail.com', 'Huế'),
		('Tùng', 5, 4, 4, '1992-03-18', 201718628, 35000, 0818467035, 'tung@gmail.com', 'Vinh'),
		('Huy', 6, 4, 2, '1991-12-12', 201792127, 50000, 0818467035, 'thanh@gmail.com', 'Quảng Trị');

INSERT INTO loai_khach(ten_loai_khach)
VALUES ('Diamond'),
		('Platinium'),
        ('Gold'),
        ('Silver'),
        ('Member');

INSERT INTO khach_hang(id_loai_khach, ho_ten, ngay_sinh, so_CMTND, sdt, email, dia_chi)
VALUES (5, 'Minh', '2020-10-06', 201562744, 0843670087, 'minh@gmail.com', 'Đà Nẵng'),
		(1, 'Danh', '1997-08-22', 201684297, 0394581627, 'danh@gmail.com', 'Huế'),
		(1, 'Toàn', '1994-11-11', 201251983, 0871555364, 'toan@gmail.com', 'Vinh'),
		(2, 'Uyên', '1996-01-28', 201523799, 0177646469, 'uyen@gmail.com', 'Quảng Trị'),
		(4, 'Hiền', '1997-07-17', 201588114, 0111346999, 'hien@gmail.com', 'Đà Nẵng'),
		(1, 'Tiến', '1993-09-17', 201599988, 0111312999, 'tien@gmail.com', 'Đà Nẵng');
        
INSERT INTO loai_dich_vu(ten_loai_dich_vu)
VALUES ('Villa'),
		('House'),
        ('Room');

INSERT INTO kieu_thue(ten_kieu_thue)
VALUES ('Năm'),
		('Tháng'),
        ('Ngày'),
        ('Giờ');
        
INSERT INTO dich_vu(ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES ('Ocean Villa', 100, 3, 10, 5000000, 2, 1, 'Khả dụng'),
		('Sand Room', 25, NULL, 2, 600000, 3, 3, 'Khả dụng'),
        ('Wind House', 70, 2, 5, 3000000, 3, 2, 'Khả dụng');

INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES ('Massage', 100000, 'Lượt', 'Khả dụng'),
		('Karaoke', 250000, 'Giờ', 'Khả dụng'),
        ('Thức ăn', 50000, 'Dĩa', 'Khả dụng'),
        ('Nước uống', 10000, 'Chai', 'Khả dụng'),
        ('Thuê xe tham quan resort', 150000, 'Xe', 'Khả dụng');
        
INSERT INTO hop_dong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES (2, 2, 3, '2021-07-14', '2021-08-11', 50000),
		(1, 2, 1, '2021-01-24', '2021-09-02', 50000),
		(4, 6, 1, '2019-04-30', '2019-09-02', 50000),
		(3, 1, 1, '2018-06-29', '2018-12-19', 70000),
		(4, 3, 2, '2021-03-17', '2021-10-16', 90000);
        
INSERT INTO hop_dong_chi_tiet(id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES (1, 3, 5),
		(2, 1, 2),
        (3, 5, 3),
        (5, 4, 2);

        
        
        
        