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
    ho_ten VARCHAR(45),
    id_vi_tri INT,
    id_trinh_do INT,
    id_bo_phan INT,
    ngay_sinh DATE,
    so_CMTND VARCHAR(45),
    luong VARCHAR(45),
    sdt VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_vi_tri) REFERENCES vi_tri(id_vi_tri), 
    FOREIGN KEY (id_trinh_do) REFERENCES trinh_do(id_trinh_do), 
    FOREIGN KEY (id_bo_phan) REFERENCES bo_phan(id_bo_phan) 
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
    emai VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_loai_khach) REFERENCES loai_khach(id_loai_khach)
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
    FOREIGN KEY (id_kieu_thue) REFERENCES kieu_thue(id_kieu_thue),
    FOREIGN KEY (id_loai_dich_vu) REFERENCES loai_dich_vu(id_loai_dich_vu)
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
    FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id_nhan_vien),
    FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id_khach_hang),
    FOREIGN KEY (id_dich_vu) REFERENCES dich_vu(id_dich_vu)
);

CREATE TABLE dich_vu_di_kem(
	id_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia INT,
    don_vi INT,
    trang_thai_kha_dung VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet(
	id_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    id_hop_dong INT,
    id_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (id_hop_dong) REFERENCES hop_dong(id_hop_dong),
    FOREIGN KEY (id_dich_vu_di_kem) REFERENCES dich_vu_di_kem(id_dich_vu_di_kem)
);